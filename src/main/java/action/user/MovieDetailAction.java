package action.user;

import action.Action;
import mybatis.dao.MovieDAO;
import mybatis.vo.MovieVO;

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



        request.setAttribute("mvo", mvo);
        request.setAttribute("rank", rank);
        request.setAttribute("openDate", openDate);

        return "/jsp/user/movie/movieDetail.jsp";
    }
}
