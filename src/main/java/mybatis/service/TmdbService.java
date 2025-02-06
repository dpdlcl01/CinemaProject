package mybatis.service;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import mybatis.vo.MovieVO;

import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class TmdbService {
    private static final String apiKey = "8b259fc8ed83e644b26793b12795b088";
    private static final String tmdbMovieUrl = "https://api.themoviedb.org/3/movie/";
    private static final String tmdbBaseUrl = "https://api.themoviedb.org/3/search/movie";
    private static final ObjectMapper mapper = new ObjectMapper();


    public static boolean fetchTmdbData(MovieVO mvo) {
        try {
            String apiKey = "8b259fc8ed83e644b26793b12795b088";
            String tmdbBaseUrl = "https://api.themoviedb.org/3/search/movie";
            ObjectMapper mapper = new ObjectMapper();

            JsonNode movieData = null;

            // 1. 한국어 제목으로 검색
            if (mvo.getMovieTitle() != null) {
                String query = URLEncoder.encode(mvo.getMovieTitle().trim(), "UTF-8");
                String tmdbUrl = tmdbBaseUrl + "?api_key=" + apiKey + "&query=" + query + "&language=ko-KR";
                movieData = searchTmdb(tmdbUrl, mapper, mvo);
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

                // 포스터 없는 경우 false 반환 (목록에서 제외)
                if (detailedData == null || !validateTmdbData(detailedData)) {
                    System.out.println(" TMDB 데이터 유효하지 않음 (포스터 없음) -> 목록에서 제외: " + mvo.getMovieTitle());
                    return false;
                }

                setTmdbDataToVO(mvo, detailedData);
                return true;
            }

        } catch (Exception e) {
            System.out.println("TMDB API 호출 실패: " + e.getMessage());
            e.printStackTrace();
        }
        return false;
    }


    private static boolean validateTmdbData(JsonNode detailedData) {
        String posterPath = detailedData.has("poster_path") ? detailedData.get("poster_path").asText() : null;
        String overview = detailedData.has("overview") ? detailedData.get("overview").asText() : null;

        // 포스터와 줄거리가 모두 있는 경우에만 유효하다고 판단
        return posterPath != null && !posterPath.isEmpty() && overview != null && !overview.isEmpty();
    }


    // TMDB 데이터 상세 호출
    private static JsonNode fetchMovieDetails(int movieId, ObjectMapper mapper) {
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
    private static JsonNode searchTmdb(String url, ObjectMapper mapper, MovieVO mvo) {
        try {
            HttpURLConnection conn = (HttpURLConnection) new URL(url).openConnection();
            conn.setRequestMethod("GET");
            conn.setRequestProperty("Content-Type", "application/json");
            JsonNode root = mapper.readTree(conn.getInputStream());
            JsonNode results = root.get("results");

            JsonNode exactMatch = null;
            JsonNode bestMatch = null;
            int highestScore = -1;

            if (results != null && results.size() > 0) {
                for (JsonNode result : results) {
                    String title = result.get("title").asText();
                    String releaseDate = result.has("release_date") ? result.get("release_date").asText() : null;
                    JsonNode productionCountries = result.get("production_countries");

                    // **1. 제목과 국가가 모두 정확히 일치하는 경우** 최우선 선택
                    boolean isExactTitleMatch = title.equalsIgnoreCase(mvo.getMovieTitle());
                    boolean isExactCountryMatch = false;

                    if (productionCountries != null && productionCountries.isArray()) {
                        for (JsonNode country : productionCountries) {
                            if (mvo.getMovieNation() != null && mvo.getMovieNation().equalsIgnoreCase(country.get("iso_3166_1").asText())) {
                                isExactCountryMatch = true;
                                break;
                            }
                        }
                    }

                    if (isExactTitleMatch && isExactCountryMatch) {
                        exactMatch = result;
                        break;  // 정확히 일치하는 영화가 있으면 더 이상 탐색하지 않음
                    }

                    // **2. 점수 기반 비교** (제목, 연도, 국가)
                    int score = 0;

                    // 제목 유사성 (점수: 10점)
                    if (title.equalsIgnoreCase(mvo.getMovieTitle()) || title.contains(mvo.getMovieTitle())) {
                        score += 10;
                    }

                    // 개봉 연도 유사성 (점수: 5점)
                    if (releaseDate != null && mvo.getMovieDate() != null) {
                        String movieYear = mvo.getMovieDate().substring(0, 4);
                        String releaseYear = releaseDate.substring(0, 4);
                        if (movieYear.equals(releaseYear)) {
                            score += 5;
                        }
                    }

                    // 국가 조건 (점수: 3점)
                    if (isExactCountryMatch) {
                        score += 3;
                    }

                    // 최고 점수의 결과 선택
                    if (score > highestScore) {
                        highestScore = score;
                        bestMatch = result;
                    }
                }
            }

            // **3. 정확히 일치하는 영화가 있으면 반환, 없으면 최고 점수의 결과 반환**
            return exactMatch != null ? exactMatch : bestMatch;

        } catch (Exception e) {
            System.out.println("TMDB 검색 실패: " + e.getMessage());
        }
        return null;
    }


    // TMDB 데이터 VO 설정
    private static void setTmdbDataToVO(MovieVO mvo, JsonNode movieData) {
        try {
            // TMDB 영화 ID 추가
            int tmdbId = movieData.get("id").asInt();
            mvo.setMovieTmdbId(String.valueOf(tmdbId));  // TMDB 영화 ID 설정 (String 변환)

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


    // TMDB 예고편 데이터 조회
    public static Map<String, Object> fetchMovieTrailers(String movieTmdbId) {
        Map<String, Object> trailerData = new HashMap<>();
        List<Map<String, String>> trailerList = new ArrayList<>();
        Map<String, String> mainTrailer = null;

        try {
            if (movieTmdbId == null || movieTmdbId.trim().isEmpty()) {
                trailerData.put("errorMessage", "이 영화에 대한 예고편 정보가 없습니다.");
                return trailerData;
            }

            // TMDB 예고편 API 호출 URL
            String tmdbApiUrl = tmdbMovieUrl + movieTmdbId + "/videos?api_key=" + apiKey + "&language=ko-KR";
            HttpURLConnection conn = (HttpURLConnection) new URL(tmdbApiUrl).openConnection();
            conn.setRequestMethod("GET");
            conn.setRequestProperty("Content-Type", "application/json");

            JsonNode root = mapper.readTree(conn.getInputStream());
            JsonNode videos = root.get("results");

            for (JsonNode video : videos) {
                if ("YouTube".equals(video.get("site").asText())) {
                    String videoKey = video.get("key").asText();
                    String videoName = video.get("name").asText();
                    String videoType = video.get("type").asText();

                    Map<String, String> trailer = new HashMap<>();
                    trailer.put("videoKey", videoKey);
                    trailer.put("videoName", videoName);
                    trailer.put("videoType", videoType);

                    // "메인"이 포함된 경우 메인 예고편 우선 설정
                    if (mainTrailer == null && videoName.contains("메인")) {
                        mainTrailer = trailer;
                    }

                    // "Trailer" 타입이면서 메인 예고편이 설정되지 않은 경우
                    if (mainTrailer == null && "Trailer".equals(videoType)) {
                        mainTrailer = trailer;
                    }

                    trailerList.add(trailer);
                }
            }

            // 메인 예고편이 없으면 리스트의 첫 번째 영상 사용
            if (mainTrailer == null && !trailerList.isEmpty()) {
                mainTrailer = trailerList.get(0);
            }

            trailerData.put("mainTrailer", mainTrailer);
            trailerData.put("tmdbTrailers", trailerList);
        } catch (Exception e) {
            System.out.println("TMDB 예고편 API 호출 실패: " + e.getMessage());
            e.printStackTrace();
            trailerData.put("errorMessage", "예고편 데이터를 불러오는 중 오류가 발생했습니다.");
        }

        return trailerData;
    }
}
