package action.user;

import action.Action;
import mybatis.dao.MovieDAO;
import mybatis.dao.ReviewDAO;
import mybatis.vo.MovieVO;
import mybatis.vo.ReviewVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;

public class MovieDetailAction implements Action {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {

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
        if ("ALL".equals(mvo.getMovieGrade())) {
            movieGradeText = "전체 관람가";
        } else if ("12".equals(mvo.getMovieGrade())) {
            movieGradeText = "12세 이상 관람가";
        } else if ("15".equals(mvo.getMovieGrade())) {
            movieGradeText = "15세 이상 관람가";
        } else if ("19".equals(mvo.getMovieGrade())) {
            movieGradeText = "청소년 관람 불가";
        }

        request.setAttribute("mvo", mvo);
        request.setAttribute("rank", rank);
        request.setAttribute("openDate", openDate);
        request.setAttribute("movieGradeText", movieGradeText);
        
        
        // 추후에 ReviewAction으로 빼거나 탭에서 따로 호출하는 코드로 변경
        ReviewVO[] reviewArray = ReviewDAO.getReviewByMovieIdx(movieIdx);
        if (reviewArray == null) {
            reviewArray = new ReviewVO[0]; // 빈 배열로 초기화
        }
        request.setAttribute("reviewArray", reviewArray);

        // 리뷰 평점 평균 계산
        float totalRating = 0;
        float averageRating = 0;
        for(ReviewVO rvo : reviewArray) {
            float rating = Float.parseFloat(rvo.getReviewRating()); // 형변환
            totalRating += rating;
        }
        averageRating = totalRating / reviewArray.length;
        request.setAttribute("averageRating", averageRating);

        return "/jsp/user/movie/movieDetail.jsp";
    }
}
