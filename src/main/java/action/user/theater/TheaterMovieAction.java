package action.user.theater;

import action.Action;
import mybatis.dao.TheaterDAO;
import mybatis.vo.TheaterMovieVO;
import org.json.JSONArray;
import org.json.JSONObject;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class TheaterMovieAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String theaterIdx = request.getParameter("theaterIdx");
        String targetDate = request.getParameter("targetDate"); // targetDate로 수정

//        System.out.println("theaterIdx:"+theaterIdx+"targetDate:"+targetDate);

        // 극장 영화 정보 가져오기
        TheaterMovieVO[] movieList = TheaterDAO.getMovie(theaterIdx, targetDate);
//        System.out.println(movieList.length);


        // 응답 유형 설정
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");


        JSONArray jsonArray = new JSONArray();

        for (TheaterMovieVO movie : movieList) {
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("movieTitle", movie.getMovieTitle());
            jsonObject.put("screenName", movie.getScreenName());
            jsonObject.put("remainSeat", movie.getRemainSeat());
            jsonObject.put("screenSeatCount", movie.getScreenSeatCount());
            jsonObject.put("movieTime", movie.getMovieTime());
            jsonObject.put("movieGrade", movie.getMovieGrade());
            jsonObject.put("screenType", movie.getScreenType());
            jsonObject.put("startTime", movie.getStartTime());
            jsonObject.put("screenIdx", movie.getScreenIdx());
            jsonObject.put("movieIdx", movie.getMovieIdx());
            jsonObject.put("timetableIdx", movie.getTimeTableIdx());
            jsonObject.put("timetableStartTime", movie.getTimetableStartTime());

            jsonArray.put(jsonObject);
        }

        if (jsonArray.isEmpty()) {
//            response.getWriter().write("{\"message\": \"현재 상영 중인 영화가 없습니다.\"}");
            response.getWriter().write("[]");
        } else {
            response.getWriter().write(jsonArray.toString());
            response.getWriter().flush();
        }
          response.getWriter().close();
          return null;
    }
}