package action.user.theater;

import action.Action;
import mybatis.dao.TheaterDAO;
import mybatis.vo.TheaterMovieVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class TheaterMovieAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

        String theaterIdx = request.getParameter("theaterIdx");
        String targetDate = request.getParameter("targetDate"); // targetDate로 수정
        System.out.println("theaterIdx:"+theaterIdx);
        System.out.println("targetDate:"+targetDate);

        // 극장 영화 정보 가져오기
        TheaterMovieVO[] movieList = TheaterDAO.getMovie(theaterIdx, targetDate);


        // 응답 유형 설정
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        if (movieList.length > 0) {
            // JSON 형식으로 영화 정보를 반환
            StringBuilder jsonResponse = new StringBuilder();
            jsonResponse.append("[");

            for (int i = 0; i < movieList.length; i++) {
                TheaterMovieVO movie = movieList[i];
                jsonResponse.append("{");
                jsonResponse.append("\"movieTitle\": \"").append(movie.getMovieTitle()).append("\", ");
                jsonResponse.append("\"screenName\": \"").append(movie.getScreenName()).append("\", ");
                jsonResponse.append("\"remainSeat\": \"").append(movie.getRemainSeat()).append("\", ");
                jsonResponse.append("\"remainSeat\": \"").append(movie.getRemainSeat()).append("\", ");
                jsonResponse.append("\"screenSeatCount\": \"").append(movie.getScreenSeatCount()).append("\", ");
                jsonResponse.append("\"movieTime\": \"").append(movie.getMovieTime()).append("\", ");
                jsonResponse.append("\"movieGrade\": \"").append(movie.getMovieGrade()).append("\", ");
                jsonResponse.append("\"screenType\": \"").append(movie.getScreenType()).append("\", ");
                jsonResponse.append("\"startTime\": \"").append(movie.getStartTime()).append("\", ");
                jsonResponse.append("\"screenIdx\": \"").append(movie.getScreenIdx()).append("\", ");
                jsonResponse.append("\"movieIdx\": \"").append(movie.getMovieIdx()).append("\", ");
                jsonResponse.append("\"timetableIdx\": \"").append(movie.getTimeTableIdx()).append("\", ");
                jsonResponse.append("\"timetableStartTime\": \"").append(movie.getTimetableStartTime()).append("\"");


                jsonResponse.append("}");

                if (i < movieList.length - 1) {
                    jsonResponse.append(", ");
                }
            }

            jsonResponse.append("]");

            response.getWriter().write(jsonResponse.toString());
        } else {
            // 영화가 없으면 메시지 반환
            response.getWriter().write("{\"message\": \"현재 상영 중인 영화가 없습니다.\"}");
        }

        response.getWriter().flush();
        response.getWriter().close();
        return null;
    }
}