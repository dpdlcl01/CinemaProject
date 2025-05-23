package action.admin.movie;

import action.Action;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mybatis.dao.MovieDAO;
import mybatis.service.TmdbService;
import mybatis.vo.MovieVO;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import util.ConfigReader;
import util.KobisCrawler;

import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class DbMovieAction implements Action {

    private static final String SECRET_KEY = ConfigReader.getKoficMovieApiKey(); // Kofic API Key

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        try {
            // 응답 형식 설정
            response.setContentType("application/json;charset=UTF-8");
            ObjectMapper ob = new ObjectMapper();
            Map<String, Object> resultMap = new HashMap<>();

            // 세션과 상태 업데이트 객체 생성
            HttpSession session = request.getSession();
            UpdateStatusAction statusAction = new UpdateStatusAction();

            // 작업 진행 상태 메시지 초기화 (세션에 저장)
            statusAction.updateStatusMessage(session, "영화 데이터 업데이트 시작...");
            resultMap.put("status", "progress");
            resultMap.put("message", "영화 데이터 업데이트 시작...");

            // `ServletContext` 가져오기
            ServletContext context = request.getServletContext();

            // `KobisCrawler`에 `ServletContext` 전달
            KobisCrawler crawler = new KobisCrawler(context);
            List<WebElement> rows = crawler.fetchMovieData();


            List<MovieVO> movieList = new ArrayList<>();
            int maxMovies = 80; // 가져올 영화 데이터 최대 개수
            int count = 0;

            for (WebElement row : rows) {
                if (count >= maxMovies)
                    break; // 최대 80개까지만 처리

                // 현재 행(row)에서 "td" 태그로 구성된 열(column) 데이터를 가져옴
                List<WebElement> tdList = row.findElements(By.tagName("td"));

                if (!tdList.isEmpty()) {
                    String movieCd = tdList.get(1).findElement(By.tagName("a"))
                            .getAttribute("onclick").split("'")[3]; // 영화코드 --> 오픈 API에 영화 검색시 사용
                    String movieTitle = tdList.get(1).getText();

                    // 특정 영화 제외 조건
                    if (movieTitle.contains("아이돌리쉬 세븐") || movieTitle.contains("캐롤")) {
                        System.out.println("제외된 영화: " + movieTitle);
                        continue; // 해당 영화 건너뛰기
                    }

                    // 현재 진행 상태를 세션에 업데이트
                    statusAction.updateStatusMessage(session, "현재 처리 중인 영화: " + movieTitle);
                    resultMap.put("status", "progress");
                    resultMap.put("message", "현재 처리 중인 영화: " + movieTitle);

                    // 영화 정보 업데이트
                    try {
                        MovieVO mvo = fetchKoficMovieData(movieCd, tdList);  // 예매 순위, 예매율, 누적 관객수 처리
                        if (mvo != null) {
                            mvo.setMovieTitle(movieTitle);

                            // TMDB API 호출로 추가 데이터 설정
                            if (TmdbService.fetchTmdbData(mvo)) {  // 포스터 없는 경우 제외
                                // 새 영화 추가
                                int result = MovieDAO.addNewMovie(mvo);
                                if (result > 0) {
                                    System.out.println("새로운 영화 추가: " + movieTitle);
                                    movieList.add(mvo);  // 성공한 경우 movieList에 추가
                                    count++;
                                }
                            } else {
                                System.out.println("포스터 없는 영화 제외: " + movieTitle);
                            }
                        }
                    } catch (Exception e) {
                        statusAction.updateStatusMessage(session, "영화 정보 처리 중 오류 발생.");
                        resultMap.put("status", "error");
                        resultMap.put("message", "영화 정보 처리 중 오류 발생.");
                        e.printStackTrace();
                    }
                }
            }

            // 최종 완료 상태 업데이트
            String finalStatus = "영화 데이터 업데이트가 완료되었습니다. 총 " + movieList.size() + "개 영화 처리됨.";
            statusAction.updateStatusMessage(session, finalStatus);
            resultMap.put("success", true);
            resultMap.put("message", finalStatus);

            // 결과 응답
            ob.writeValue(response.getWriter(), resultMap);

            // DB 저장 로직 추가 가능
            System.out.println("총 처리된 영화 데이터 수: " + movieList.size());

        } catch (Exception e) {
            e.printStackTrace();
            Map<String, Object> resultMap = new HashMap<>();
            resultMap.put("status", "error");
            resultMap.put("message", "영화 정보 업데이트 중 오류가 발생했습니다.");
            try {
                new ObjectMapper().writeValue(response.getWriter(), resultMap);
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        } finally {
            // 크롤링에 사용한 WebDriver 종료
            // 이 부분이 누락되면 크롬 창이 계속 열려있다.
            try {
                util.WebDriverUtil.quitDriver();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return null; // JSON 응답 후 별도 페이지 이동 없음
    }


    /**
     * KOFIC API에서 영화 상세 정보를 가져오고 예매 순위, 예매율, 누적 관객수 처리
     */
    private MovieVO fetchKoficMovieData(String movieCd, List<WebElement> tdList) {
        // 영화 상세 정보를 가져오는 로직 (KOFIC API 호출)

        String movieRank = tdList.get(0).getText(); // 예매 순위
        String reservationRate = tdList.get(3).getText().replace("%", "").trim(); // 예매율
        String movieTotalAudience = tdList.get(7).getText().replace(",", "").trim(); // 누적 관객수

        // KOFIC API 호출 및 데이터 수집
        try {
            // 상세 정보 API 호출을 위한 URL 구성
            StringBuffer koficSb = new StringBuffer("https://kobis.or.kr/kobisopenapi/webservice/rest/");
            koficSb.append("movie/searchMovieInfo.json?"); // 영화 상세 정보를 조회하는 API 엔드포인트 추가
            koficSb.append("key="+SECRET_KEY+"&"); // KOFIC API 키 추가
            koficSb.append("movieCd=" + movieCd); // 영화 코드 추가 (크롤링을 통해 추출한 데이터)

            // URL 객체 생성
            URL koficUrl = new URL(koficSb.toString());

            // HTTP 연결 생성
            HttpURLConnection koficConn = (HttpURLConnection) koficUrl.openConnection();

            // 요청 방식 설정: GET 요청을 통해 데이터 조회
            koficConn.setRequestMethod("GET");

            // 요청 헤더 설정: 응답 데이터를 JSON 형식으로 수신
            koficConn.setRequestProperty("Content-Type", "application/json");

            // 응답 데이터를 JSON으로 파싱
            ObjectMapper mapper = new ObjectMapper();
            JsonNode root = mapper.readTree(koficConn.getInputStream());

            // "movieInfoResult" 객체 내부의 "movieInfo" 데이터를 추출
            JsonNode movieInfo = root.get("movieInfoResult").get("movieInfo");

            // 데이터 수집
            String movieNm = movieInfo.get("movieNm").asText(); // 영화 제목(국문)
            String movieNmEn = movieInfo.get("movieNmEn").asText(); // 영화 제목(영문)
            String showTm = movieInfo.get("showTm").asText(); // 상영 시간 (분)

            String nationNm = movieInfo.get("nations").get(0).get("nationNm").asText(); // 제작 국가 중 첫 번째만
            String genreNm = movieInfo.get("genres").get(0).get("genreNm").asText(); // 장르 중 첫 번째만

            // 제작 상태 : "개봉", "개봉예정", "기타"
            String prdtStat = movieInfo.get("prdtStatNm").asText();
            String movieStatus = "2"; // 기본값: 기타
            if (prdtStat != null) {
                if (prdtStat.equals("개봉")) {
                    movieStatus = "0"; // 개봉
                } else if (prdtStat.equals("개봉예정")) {
                    movieStatus = "1"; // 개봉예정
                } else {
                    movieStatus = "2"; // 기타
                }
            }

            // 개봉일 : "20250120" (값이 없는 경우는 null 처리)
            String openDt = movieInfo.has("openDt") ? movieInfo.get("openDt").asText() : null;
            String movieDate = null;
            if (openDt != null && openDt.length() == 8) { // YYYYMMDD 형식인지 확인
                movieDate = openDt.substring(0, 4) + "-" +
                        openDt.substring(4, 6) + "-" +
                        openDt.substring(6, 8); // YYYY-MM-DD 형식으로 변환
            }

            // 관람 등급 : 전체관람가, 12세관람가, 12세이상관람가, 15세이상관람가, 18세관람가, 청소년관람불가, 연소자관람불가
            // (값이 없는 경우는 null 처리)
            String watchGradeNm = movieInfo.get("audits").isEmpty() ? null
                    : movieInfo.get("audits").get(0).get("watchGradeNm").asText();
            String movieGrade = "ALL"; // 기본값: 전체관람가
            if (watchGradeNm != null) {
                if (watchGradeNm.contains("전체")) {
                    movieGrade = "ALL"; // 전체관람가
                } else if (watchGradeNm.contains("12")) {
                    movieGrade = "12"; // 12세 이상
                } else if (watchGradeNm.contains("15") || watchGradeNm.contains("고등학생")) {
                    movieGrade = "15"; // 15세 이상
                } else if (watchGradeNm.contains("18") || watchGradeNm.contains("청소년") || watchGradeNm.contains("연소자")) {
                    movieGrade = "19"; // 청소년 관람 불가
                } else {
                    System.out.println("기타 관람 등급: " + watchGradeNm);
                }
            }

            // 감독 중 첫 번째만 (값이 없는 경우는 null 처리)
            String movieDirector = movieInfo.get("directors").isEmpty() ? null
                    : movieInfo.get("directors").get(0).get("peopleNm").asText();

            // 배우 정보 목록
            List<String> actorList = new ArrayList<>();
            JsonNode actorNodes = movieInfo.get("actors");

            // 배우 데이터 수집
            if (actorNodes != null && actorNodes.isArray()) {
                for (JsonNode actor : actorNodes) {
                    actorList.add(actor.get("peopleNm").asText());
                }
            }

            // 상위 10명의 배우만 저장
            String movieActors = null; // 배우 정보가 없는 경우 기본값
            if (!actorList.isEmpty()) {
                List<String> topActors = actorList.size() > 10 ? actorList.subList(0, 10) : actorList; // 최대 10명까지만 추출
                movieActors = String.join(", ", topActors); // 쉼표로 구분된 문자열로 변환
            }

            // 필수 값 검증: 영어 제목, 개봉일, 관람 등급 정보가 없는 경우 제외
            if (movieNmEn == null || movieNmEn.trim().isEmpty() ||
                    movieDate == null || movieDate.trim().isEmpty() ||
                    movieGrade == null || movieGrade.trim().isEmpty()) {
                System.out.println("필수 데이터 누락: " + movieNm + " 영화 제외");
                return null; // 필수 데이터가 없으면 null 반환
            }
            // VO 객체 생성 및 데이터 설정
            MovieVO mvo = new MovieVO();

            // KOFIC API에서 가져온 데이터를 VO에 저장
            mvo.setMovieCd(movieCd);               // 영화 코드 (KOFIC 고유 식별자)
            mvo.setMovieTotalAudience(movieTotalAudience); // 누적 관객 수
            mvo.setMovieRank(movieRank);            // 예매 순위
            mvo.setMovieReservationRate(reservationRate); // 예매율
            mvo.setMovieTitle(movieNm);            // 영화 제목 (국문)
            mvo.setMovieTitleEn(movieNmEn);        // 영화 제목 (영문)
            mvo.setMovieTime(showTm);              // 상영 시간 (분 단위)
            mvo.setMovieNation(nationNm);          // 제작 국가
            mvo.setMovieGenre(genreNm);            // 영화 장르
            mvo.setMovieStatus(movieStatus);       // 제작 상태 (0: 개봉, 1: 개봉예정, 2: 기타)
            mvo.setMovieDate(movieDate);           // 개봉일 (YYYY-MM-DD 형식)
            mvo.setMovieGrade(movieGrade);        // 관람 등급 (ALL: 전체관람가, 12: 12세 이상, 15: 15세 이상, 19: 청소년 관람불가)
            mvo.setMovieDirector(movieDirector);   // 감독 정보
            mvo.setMovieActors(movieActors);       // 배우 목록 (쉼표로 구분된 문자열)

            mvo.setMovieLikes("0"); // 최초 저장하는 영화 데이터의 경우 좋아요 수 0개로 설정

            // mvo를 반환
            return mvo;

        } catch (Exception apiEx) {
            apiEx.printStackTrace();
        }

        return null;  // 예외가 발생하면 null 반환
    }

}