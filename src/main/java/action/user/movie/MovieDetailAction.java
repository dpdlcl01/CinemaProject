package action.user.movie;

import action.Action;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import mybatis.dao.MovieDAO;
import mybatis.dao.ReviewDAO;
import mybatis.vo.MovieVO;
import mybatis.vo.ReviewVO;
import util.Paging;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class MovieDetailAction implements Action {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

        // movieIdx 파라미터 받기
        String movieIdx = request.getParameter("movieIdx");

        // movieIdx값으로 해당 영화 검색
        MovieVO mvo = MovieDAO.getMovieByIdx(movieIdx);

        // movieIdx값으로 순위 검색
        int rank = MovieDAO.calculateRank(movieIdx);

        String movieDate = mvo.getMovieDate();
        LocalDate openDt = LocalDate.parse(movieDate); // Date 형식으로 변경
        String openDate = openDt.format(DateTimeFormatter.ofPattern("yyyy.MM.dd"));

        // 상영 예정 (movieStatus가 1) 영화인 경우 디데이 설정
        if(mvo.getMovieStatus().equals("1")) {
            LocalDate today = LocalDate.now(); // 디데이 계산을 위한 오늘 날짜
            long dDay = ChronoUnit.DAYS.between(today, openDt); // 디데이 계산
            request.setAttribute("dDay", dDay);
        }

        // 관람 등급 문자열로 변환
        String movieGradeText = null;
        switch (mvo.getMovieGrade()) {
            case "ALL":
                movieGradeText = "전체 관람가";
                break;
            case "12":
                movieGradeText = "12세 이상 관람가";
                break;
            case "15":
                movieGradeText = "15세 이상 관람가";
                break;
            case "19":
                movieGradeText = "청소년 관람 불가";
                break;
        }

        request.setAttribute("mvo", mvo);
        request.setAttribute("rank", rank);
        request.setAttribute("openDate", openDate);
        request.setAttribute("movieGradeText", movieGradeText);

        // 페이징 처리를 위한 객체생성
        Paging page = new Paging(10,10);

        // 총 게시물의 수를 구한다.
        int totalCount = ReviewDAO.getTotalCount(movieIdx);
        // 페이징 객체안에 총 게시물의 수를 저장하면서 전체페이지 수를 구한다.
        page.setTotalRecord(totalCount);// 이때 전체페이지수(totalPage)가 구해진다.
        // 현재페이지 값을 파라미터로 받아보자!
        String cPage = request.getParameter("cPage");

        if(cPage == null)
            page.setNowPage(1);
        else {
            int nowPage = Integer.parseInt(cPage);// "2" --> 2
            page.setNowPage(nowPage);// 이때 !!!!
            // 게시물을 추출할 때 사용되는 begin과 end가 구해지고,
            // 더불어 시작페이지와 끝페이지 값도 구해진다.
        }

        // 리뷰 데이터 가져오기
        ReviewVO[] reviewArray = ReviewDAO.getAllList(movieIdx, page.getBegin(), page.getEnd());
        request.setAttribute("reviewArray", reviewArray);
        request.setAttribute("page", page);

        // 리뷰 평점 평균 계산
        float totalRating = 0;
        float averageRating = 0;

        if(reviewArray != null && reviewArray.length > 0) {
            for(ReviewVO rvo : reviewArray) {
                float rating = Float.parseFloat(rvo.getReviewRating()); // 형변환
                totalRating += rating;
            }
            averageRating = totalRating / reviewArray.length;
        }
        request.setAttribute("averageRating", averageRating);


        // **TMDB 예고편 데이터 가져오기**
        String tmdbApiKey = "8b259fc8ed83e644b26793b12795b088"; // TMDB API 키
        String movieTmdbId = mvo.getMovieTmdbId(); // TMDB ID 가져오기

        // movieTmdbId가 없는 경우 예외 처리
        if (movieTmdbId == null || movieTmdbId.trim().isEmpty()) {
            request.setAttribute("tmdbTrailers", null);
            request.setAttribute("errorMessage", "이 영화에 대한 예고편 정보가 없습니다.");
            return "/jsp/user/movie/movieDetail.jsp";
        }

        // TMDB 예고편 API 호출 URL 구성
        String tmdbApiUrl = "https://api.themoviedb.org/3/movie/" + movieTmdbId + "/videos?api_key=" + tmdbApiKey + "&language=ko-KR";

        // TMDB API 호출
        URL tmdbUrl = new URL(tmdbApiUrl);
        HttpURLConnection tmdbConn = (HttpURLConnection) tmdbUrl.openConnection();
        tmdbConn.setRequestMethod("GET");
        tmdbConn.setRequestProperty("Content-Type", "application/json");

        // JSON 파싱
        ObjectMapper mapper = new ObjectMapper();
        JsonNode tmdbRoot = mapper.readTree(tmdbConn.getInputStream());
        JsonNode videos = tmdbRoot.get("results");

        // TMDB 데이터 추출 (YouTube 예고편만 필터링)
        List<Map<String, String>> trailerList = new ArrayList<>(); // 예고편 데이터를 저장할 리스트
        Map<String, String> mainTrailer = null; // 메인 예고편 저장

        for (JsonNode video : videos) {
            if ("YouTube".equals(video.get("site").asText())) {
                String videoKey = video.get("key").asText();
                String videoName = video.get("name").asText();
                String videoType = video.get("type").asText();

                Map<String, String> trailer = new HashMap<>();
                trailer.put("videoKey", videoKey);
                trailer.put("videoName", videoName);
                trailer.put("videoType", videoType);

                // "메인"이 포함된 경우 우선적으로 메인 예고편 설정
                if (mainTrailer == null && videoName.contains("메인")) {
                    mainTrailer = trailer;
                }

                // 메인 예고편이 설정되지 않았고 타입이 "Trailer"인 경우
                if (mainTrailer == null && "Trailer".equals(videoType)) {
                    mainTrailer = trailer;
                }

                trailerList.add(trailer);
            }
        }

        // 메인 예고편이 없으면 리스트의 첫 번째 동영상을 기본값으로 설정
        if (mainTrailer == null && !trailerList.isEmpty()) {
            mainTrailer = trailerList.get(0);
        }

        // JSP로 메인 예고편과 전체 예고편 리스트 전달
        request.setAttribute("mainTrailer", mainTrailer);
        request.setAttribute("tmdbTrailers", trailerList);


        // 추가: activeTab 값 처리
        String activeTab = request.getParameter("activeTab");
        if (activeTab == null || activeTab.isEmpty()) {
            activeTab = "all"; // 기본값 설정
        }
        request.setAttribute("activeTab", activeTab); // JSP에서 사용할 수 있도록 설정


        return "/jsp/user/movie/movieDetail.jsp";
    }
}
