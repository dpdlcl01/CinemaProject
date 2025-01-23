package action.admin.movie;

import action.Action;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybatis.dao.MovieDAO;
import mybatis.vo.MovieVO;
import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.time.Duration;
import java.util.ArrayList;
import java.util.List;

public class DbMovieAction implements Action {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {

        // 1. 실시간 예매율 순위를 제공하는 KOBIS에서 크롤링하여 영화 예매율 순위와 예매율, 영화코드를 가져오기 위해
        // WebDriver 설정
        // chromedriver.exe의 경로를 상대 경로로 설정
        String driverPath = getClass().getClassLoader().getResource("util/chromedriver.exe").getPath();

        // WebDriver 설정
        System.setProperty("webdriver.chrome.driver", driverPath);
        WebDriver driver = new ChromeDriver();


        try {
            // 2. WebDriver를 통한 URL 접속
            driver.get("https://www.kobis.or.kr/kobis/business/stat/boxs/findRealTicketList.do");
            driver.manage().window().maximize();


            // 3. JavaScript 실행으로 체크박스 모두 선택
            JavascriptExecutor js = (JavascriptExecutor) driver;
            js.executeScript(
                    "document.getElementById('repNationChk').checked = true;" +
                            "document.getElementById('wideareaAll').checked = true;" +
                            "document.getElementById('sNomal').checked = true;" +
                            "document.getElementById('sMulti').checked = true;" +
                            "document.getElementById('sIndie').checked = true;" +
                            "chkform('search');" // 검색 버튼 실행
            );


            // 4. 결과 대기
            //Thread.sleep(2000); // 페이지 로드 대기
            // 4. WebDriverWait로 결과 대기
            WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(10));
            wait.until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector("table.tbl_comm tbody tr")));


            // 5. 테이블 데이터 가져오기
            List<WebElement> rows = driver.findElements(By.cssSelector("table.tbl_comm tbody tr"));

            List<MovieVO> movieList = new ArrayList<>();
            int maxMovies = 80; // 가져올 영화 데이터 최대 개수
            int count = 0;

            for (WebElement row : rows) {
                if (count >= maxMovies)
                    break; // 최대 80개까지만 처리

                // 현재 행(row)에서 "td" 태그로 구성된 열(column) 데이터를 가져옴
                List<WebElement> tdList = row.findElements(By.tagName("td"));

                if (!tdList.isEmpty()) {
                    // 영화 데이터 추출
                    String movieCd = tdList.get(1).findElement(By.tagName("a"))
                            .getAttribute("onclick").split("'")[3]; // 영화코드 --> 오픈 API에 영화 검색시 사용
                    String movieTitle = tdList.get(1).getText(); // 영화 제목

                    // 특정 영화 제외 조건
                    if (movieTitle.contains("아이돌리쉬 세븐") || movieTitle.contains("캐롤")) {
                        System.out.println("제외된 영화: " + movieTitle);
                        continue; // 해당 영화 건너뛰기
                    }


                    String movieRank = tdList.get(0).getText(); // 예매 순위
                    String reservationRate = tdList.get(3).getText().replace("%", "").trim(); // 예매율: % 기호 제거
                    String movieTotalAudience = tdList.get(7).getText().replace(",", "").trim(); // 누적 관객수: , 제거

                    // ---------------------------------- KOFIC OPEN API ---------------------------------------

                    // 상세 정보 API 호출을 위한 URL 구성
                    StringBuffer koficSb = new StringBuffer("https://kobis.or.kr/kobisopenapi/webservice/rest/");
                    koficSb.append("movie/searchMovieInfo.json?"); // 영화 상세 정보를 조회하는 API 엔드포인트 추가
                    koficSb.append("key=bd3c4ba69fc811ea1666684d81dff7e5&"); // KOFIC API 키 추가
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
                            watchGradeNm == null || watchGradeNm.trim().isEmpty()) {
                        System.out.println("필수 데이터 누락: "+ movieNm + " 영화 제외");
                        continue;
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

                    // TMDB API 호출로 추가 데이터 설정
                    fetchTmdbData(mvo);

                    // movieList에 VO 객체 추가 (DB 저장 준비)
                    movieList.add(mvo);

                    // DB 저장 메서드 호출 ------------------------------------------ 최초 1번 수행하는 로직 (API 호출 확인시에는 주석처리)
                    int cnt = MovieDAO.addNewMovie(mvo);

                    count++;
                }
            }

            request.setAttribute("movieList", movieList);

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // 6. WebDriver 종료
            driver.quit();
        }

        return "/jsp/admin/movie/dbMovie.jsp";
    }




    private void fetchTmdbData(MovieVO mvo) {
        try {
            String apiKey = "8b259fc8ed83e644b26793b12795b088";
            String tmdbBaseUrl = "https://api.themoviedb.org/3/search/movie";
            ObjectMapper mapper = new ObjectMapper();

            JsonNode movieData = null;

            // 1. 한국어 제목으로 검색
            if (mvo.getMovieTitle() != null) {
                String query = URLEncoder.encode(mvo.getMovieTitle().trim(), "UTF-8");
                String tmdbUrl = tmdbBaseUrl + "?api_key=" + apiKey + "&query=" + query + "&language=ko-KR";

                movieData = searchTmdb(tmdbUrl, mapper, mvo); // 검색 결과
            }

            // 2. 영어 제목으로 검색 (한국어 검색 실패 시)
            if (movieData == null && mvo.getMovieTitleEn() != null) {
                String query = URLEncoder.encode(mvo.getMovieTitleEn().trim(), "UTF-8");
                String tmdbUrl = tmdbBaseUrl + "?api_key=" + apiKey + "&query=" + query + "&language=en-US";

                movieData = searchTmdb(tmdbUrl, mapper, mvo);
            }

            // 3. 검색 결과 유효성 검증 및 설정
            if (movieData != null) {
                int movieId = movieData.get("id").asInt();
                JsonNode detailedData = fetchMovieDetails(movieId, mapper);

                // 데이터 검증: 줄거리와 포스터가 없으면 mvo에 설정하지 않음
                if (detailedData != null && validateTmdbData(detailedData)) {
                    setTmdbDataToVO(mvo, detailedData);
                } else {
                    System.out.println("TMDB 데이터 유효하지 않음, mvo에 설정하지 않음: " + mvo.getMovieTitle());
                }
            }

        } catch (Exception e) {
            System.out.println("TMDB API 호출 실패: " + e.getMessage());
            e.printStackTrace();
        }
    }

    private boolean validateTmdbData(JsonNode detailedData) {
        String posterPath = detailedData.has("poster_path") ? detailedData.get("poster_path").asText() : null;
        String overview = detailedData.has("overview") ? detailedData.get("overview").asText() : null;

        // 포스터와 줄거리가 모두 있는 경우에만 유효하다고 판단
        return posterPath != null && !posterPath.isEmpty() && overview != null && !overview.isEmpty();
    }



    // TMDB 데이터 상세 호출
    private JsonNode fetchMovieDetails(int movieId, ObjectMapper mapper) {
        try {
            String detailUrl = "https://api.themoviedb.org/3/movie/" + movieId
                    + "?api_key=8b259fc8ed83e644b26793b12795b088&language=ko-KR";
            HttpURLConnection conn = (HttpURLConnection) new URL(detailUrl).openConnection();
            conn.setRequestMethod("GET");
            conn.setRequestProperty("Content-Type", "application/json");
            return mapper.readTree(conn.getInputStream());
        } catch (Exception e) {
            System.out.println("TMDB 상세 호출 실패: " + e.getMessage());
            return null;
        }
    }

    // TMDB API 검색 결과 처리
    private JsonNode searchTmdb(String url, ObjectMapper mapper, MovieVO mvo) {
        try {
            HttpURLConnection conn = (HttpURLConnection) new URL(url).openConnection();
            conn.setRequestMethod("GET");
            conn.setRequestProperty("Content-Type", "application/json");
            JsonNode root = mapper.readTree(conn.getInputStream());
            JsonNode results = root.get("results");

            JsonNode bestMatch = null;
            int highestScore = -1;

            if (results != null && results.size() > 0) {
                for (JsonNode result : results) {
                    int score = 0;

                    String title = result.get("title").asText();
                    String releaseDate = result.has("release_date") ? result.get("release_date").asText() : null;
                    JsonNode productionCountries = result.get("production_countries");

                    // 1. 제목 유사성 (점수: 10점)
                    if (title.equalsIgnoreCase(mvo.getMovieTitle()) || title.contains(mvo.getMovieTitle())) {
                        score += 10;
                    }

                    // 2. 개봉 연도 유사성 (점수: 5점)
                    if (releaseDate != null && mvo.getMovieDate() != null) {
                        String movieYear = mvo.getMovieDate().substring(0, 4);
                        String releaseYear = releaseDate.substring(0, 4);
                        if (movieYear.equals(releaseYear)) {
                            score += 5;
                        }
                    }

                    // 3. 국가 조건 (점수: 3점)
                    boolean isCountryMatch = false;
                    if (productionCountries != null && productionCountries.isArray()) {
                        for (JsonNode country : productionCountries) {
                            if ("KR".equalsIgnoreCase(country.get("iso_3166_1").asText())) {
                                isCountryMatch = true;
                                break;
                            }
                        }
                    }
                    if (isCountryMatch) {
                        score += 3;
                    }

                    // 가장 높은 점수를 가진 결과를 선택
                    if (score > highestScore) {
                        highestScore = score;
                        bestMatch = result;
                    }
                }
            }

            return bestMatch; // 최적의 결과 반환
        } catch (Exception e) {
            System.out.println("TMDB 검색 실패: " + e.getMessage());
        }
        return null;
    }



    // TMDB 데이터 VO 설정
    private void setTmdbDataToVO(MovieVO mvo, JsonNode movieData) {
        try {
            String posterPath = movieData.get("poster_path").asText();
            String tagline = movieData.has("tagline") ? movieData.get("tagline").asText() : null;
            String overview = movieData.get("overview").asText();

            String movieInfo = null;
            if (tagline != null && !tagline.isEmpty()) {
                movieInfo = tagline + "\n\n" + overview; // 두 내용을 줄바꿈으로 구분
            } else {
                movieInfo = "\n\n" + overview; // tagline이 없을 경우 overview만 사용
            }

            movieInfo = movieInfo.replace("\n", "<br>");

            mvo.setMoviePosterUrl("https://image.tmdb.org/t/p/w500" + posterPath); // 포스터 URL 설정
            mvo.setMovieInfo(movieInfo); // 줄거리 설정
        } catch (Exception e) {
            System.out.println("TMDB 데이터 설정 실패: " + e.getMessage());
        }
    }
}