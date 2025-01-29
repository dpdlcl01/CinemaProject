package action.admin.movie;

import action.Action;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import mybatis.dao.MovieDAO;
import mybatis.service.TmdbService;
import mybatis.vo.MovieVO;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import util.KobisCrawler;
import util.WebDriverUtil;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

public class DbUpdateAction implements Action {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        try {
            // `ServletContext` 가져오기
            ServletContext context = request.getServletContext();

            // `KobisCrawler`에 `ServletContext` 전달
            KobisCrawler crawler = new KobisCrawler(context);
            List<WebElement> rows = crawler.fetchMovieData();

            List<String> existingMovieCodes = MovieDAO.getAllMovieCodes(); // DB에 저장된 모든 영화 코드 가져오기
            List<String> updatedMovieCodes = new ArrayList<>(); // 이번 크롤링에서 업데이트된 영화 코드 저장
            int maxMovies = 90; // 가져올 영화 데이터 최대 개수
            int count = 0;

            for (WebElement row : rows) {
                if (count >= maxMovies)
                    break; // 최대 90개까지만 처리

                try {
                    List<WebElement> tdList = row.findElements(By.tagName("td"));

                    if (!tdList.isEmpty()) {
                        String movieCd = tdList.get(1).findElement(By.tagName("a"))
                                .getAttribute("onclick").split("'")[3]; // 영화 코드
                        String movieTitle = tdList.get(1).getText(); // 영화 제목

                        // 특정 영화 제외 조건
                        if (movieTitle.contains("아이돌리쉬 세븐") || movieTitle.contains("캐롤")) {
                            System.out.println("제외된 영화: " + movieTitle);
                            continue; // 해당 영화 건너뛰기
                        }

                        String movieRank = tdList.get(0).getText(); // 예매 순위
                        String reservationRate = tdList.get(3).getText().replace("%", "").trim(); // 예매율
                        String movieTotalAudience = tdList.get(7).getText().replace(",", "").trim(); // 누적 관객수

                        if (existingMovieCodes.contains(movieCd)) {
                            // DB에 이미 있는 경우 -> 데이터 업데이트
                            int result = MovieDAO.updateMovieReservationInfo(movieCd, movieRank, reservationRate, movieTotalAudience);
                            if (result > 0) {
                                System.out.println("영화 정보 업데이트: " + movieTitle);
                            }
                        } else {
                            // DB에 없는 경우 -> 새 데이터 추가
                            try {
                                MovieVO mvo = fetchKoficMovieData(movieCd);
                                if (mvo == null)
                                    continue;  // 필수 정보 누락 시 제외

                                mvo.setMovieRank(movieRank);
                                mvo.setMovieReservationRate(reservationRate);
                                mvo.setMovieTotalAudience(movieTotalAudience);
                                mvo.setMovieLikes("0"); // 최초 저장하는 영화 데이터의 경우 좋아요 수 0개로 설정

                                // TMDB API 호출로 추가 데이터 설정
                                if (TmdbService.fetchTmdbData(mvo)) {  // 포스터 없는 경우 제외
                                    // 새 영화 추가
                                    int result = MovieDAO.addNewMovie(mvo);
                                    if (result > 0) {
                                        System.out.println("새로운 영화 추가: " + movieTitle);
                                    }
                                } else {
                                    System.out.println("포스터 없는 영화 제외: " + movieTitle);
                                }
                            } catch (Exception apiEx) {
                                System.out.println("KOFIC API 호출 실패: " + apiEx.getMessage());
                                apiEx.printStackTrace();
                            }
                        }

                        // 업데이트된 영화 코드 리스트에 추가
                        updatedMovieCodes.add(movieCd);
                        count++;
                    }
                } catch (Exception rowEx) {
                    System.out.println("행 데이터 처리 중 오류 발생: " + rowEx.getMessage());
                    rowEx.printStackTrace();
                }
            }

            // 기존 영화 중 movieTmdbId가 없는 영화들 업데이트
            System.out.println("기존 영화들의 TMDB ID 업데이트 시작...");
            List<MovieVO> moviesWithoutTmdbId = MovieDAO.getMoviesWithoutTmdbId();

            for (MovieVO movie : moviesWithoutTmdbId) {
                if (TmdbService.fetchTmdbData(movie)) {
                    int result = MovieDAO.updateMovieTmdbId(movie.getMovieCd(), movie.getMovieTmdbId());
                    if (result > 0) {
                        System.out.println("TMDB ID 업데이트 성공: " + movie.getMovieTitle() + " → " + movie.getMovieTmdbId());
                    } else {
                        System.out.println("TMDB ID 업데이트 실패: " + movie.getMovieTitle());
                    }
                }
            }

            // 이번 크롤링에서 업데이트되지 않은 영화 처리 (예매순위, 예매율, 누적관객수 NULL 처리)
            for (String existingMovieCd : existingMovieCodes) {
                if (!updatedMovieCodes.contains(existingMovieCd)) {
                    int result = MovieDAO.nullifyMovieReservationInfo(existingMovieCd);
                    if (result > 0) {
                        System.out.println("업데이트되지 않은 영화 정보 NULL 처리: " + existingMovieCd);
                    }
                }
            }

            // DB 저장 로직 추가 가능
            System.out.println("총 처리된 영화 데이터 수: " + updatedMovieCodes.size());

        } catch (Exception e) {
            System.out.println("크롤러 또는 데이터 처리 중 전체 오류 발생: " + e.getMessage());
            e.printStackTrace();
        } finally {
            // WebDriver 종료
            WebDriverUtil.quitDriver();
        }

        return "/jsp/admin/common/adminMain.jsp";
    }


    /**
     KOFIC API에서 영화 상세 정보를 가져와 MovieVO를 생성하는 메서드
     */
    private MovieVO fetchKoficMovieData(String movieCd) {
        try {
            // API URL 구성
            String koficUrl = "https://kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieInfo.json?"
                    + "key=bd3c4ba69fc811ea1666684d81dff7e5&movieCd=" + movieCd;

            // HTTP 요청
            HttpURLConnection koficConn = (HttpURLConnection) new URL(koficUrl).openConnection();
            koficConn.setRequestMethod("GET");
            koficConn.setRequestProperty("Content-Type", "application/json");

            // JSON 파싱
            ObjectMapper mapper = new ObjectMapper();
            JsonNode root = mapper.readTree(koficConn.getInputStream());
            JsonNode movieInfo = root.get("movieInfoResult").get("movieInfo");

            if (movieInfo == null) {
                System.out.println("KOFIC API 데이터 없음: " + movieCd);
                return null;
            }

            // 데이터 수집
            String movieNm = movieInfo.get("movieNm").asText();
            String movieNmEn = movieInfo.get("movieNmEn").asText();
            String showTm = movieInfo.get("showTm").asText();

            String nationNm = movieInfo.get("nations").get(0).get("nationNm").asText();
            String genreNm = movieInfo.get("genres").get(0).get("genreNm").asText();

            // 개봉 상태 설정
            String prdtStat = movieInfo.get("prdtStatNm").asText();
            String movieStatus = determineMovieStatus(prdtStat);

            // 개봉일 처리 (YYYYMMDD → YYYY-MM-DD)
            String movieDate = null;
            if (movieInfo.has("openDt")) {
                String openDt = movieInfo.get("openDt").asText();
                if (openDt.length() == 8) {
                    movieDate = openDt.substring(0, 4) + "-" + openDt.substring(4, 6) + "-" + openDt.substring(6, 8);
                }
            }

            // 관람 등급 설정
            String watchGradeNm = movieInfo.get("audits").isEmpty() ? null
                    : movieInfo.get("audits").get(0).get("watchGradeNm").asText();
            String movieGrade = determineMovieGrade(watchGradeNm);

            // 감독 정보
            String movieDirector = movieInfo.get("directors").isEmpty() ? null
                    : movieInfo.get("directors").get(0).get("peopleNm").asText();

            // 배우 정보 (최대 10명)
            List<String> actorList = new ArrayList<>();
            JsonNode actorNodes = movieInfo.get("actors");
            if (actorNodes != null && actorNodes.isArray()) {
                for (JsonNode actor : actorNodes) {
                    actorList.add(actor.get("peopleNm").asText());
                }
            }
            String movieActors = actorList.isEmpty() ? null : String.join(", ", actorList.subList(0, Math.min(10, actorList.size())));

            // 필수 데이터 검증
            if (movieNmEn == null || movieNmEn.trim().isEmpty() || movieDate == null || movieGrade == null) {
                System.out.println("필수 데이터 누락: " + movieNm);
                return null;
            }

            // MovieVO 객체 생성
            MovieVO mvo = new MovieVO();
            mvo.setMovieCd(movieCd);
            mvo.setMovieTitle(movieNm);
            mvo.setMovieTitleEn(movieNmEn);
            mvo.setMovieTime(showTm);
            mvo.setMovieNation(nationNm);
            mvo.setMovieGenre(genreNm);
            mvo.setMovieStatus(movieStatus);
            mvo.setMovieDate(movieDate);
            mvo.setMovieGrade(movieGrade);
            mvo.setMovieDirector(movieDirector);
            mvo.setMovieActors(movieActors);
            mvo.setMovieLikes("0"); // 초기 좋아요 설정

            return mvo;
        } catch (Exception e) {
            System.out.println("KOFIC API 데이터 가져오기 실패: " + e.getMessage());
            return null;
        }
    }

    /**
     KOFIC API에서 제공하는 제작 상태를 변환하는 메서드
     */
    private String determineMovieStatus(String prdtStat) {
        if ("개봉".equals(prdtStat)) {
            return "0"; // 개봉
        } else if ("개봉예정".equals(prdtStat)) {
            return "1"; // 개봉예정
        }
        return "2"; // 기타
    }

    /**
     KOFIC API에서 제공하는 관람 등급을 변환하는 메서드
     */
    private String determineMovieGrade(String watchGradeNm) {
        if (watchGradeNm == null) {
            return "ALL"; // 기본값: 전체관람가
        }
        if (watchGradeNm.contains("전체")) {
            return "ALL";
        } else if (watchGradeNm.contains("12")) {
            return "12";
        } else if (watchGradeNm.contains("15") || watchGradeNm.contains("고등학생")) {
            return "15";
        } else if (watchGradeNm.contains("18") || watchGradeNm.contains("청소년") || watchGradeNm.contains("연소자")) {
            return "19";
        }
        return "ALL";
    }


}