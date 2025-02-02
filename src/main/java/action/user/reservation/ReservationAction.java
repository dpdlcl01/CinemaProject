package action.user.reservation;

import action.Action;
import com.fasterxml.jackson.databind.ObjectMapper;
import mybatis.dao.ReservationDAO;
import mybatis.vo.MovieVO;
import mybatis.vo.TheaterVO;
import mybatis.vo.TimetableVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.util.Map;

public class ReservationAction implements Action {

  @Override
  public String execute(HttpServletRequest request, HttpServletResponse response) {

    String type = request.getParameter("type"); // reservation은 GET 파라미터로 처리
    System.out.println("Action 호출됨: type=" + request.getParameter("type"));

    if (type.equals("reservation")) {
      // 영화 데이터를 DAO에서 가져옴
      MovieVO[] movies = ReservationDAO.movieList();
      request.setAttribute("movies", movies);

      // 전체 극장 리스트 가져오기
      Map<String, Integer> theaters = ReservationDAO.theaterRegion();
      request.setAttribute("theaters", theaters);

      // 빠른 예매 화면 경로 반환
      return "./jsp/user/reservation/reservationMain.jsp";
    } else if ("subregions".equals(type)) {
      // GET 요청에서 'region' 파라미터 값 읽기
      String region = request.getParameter("region");
      System.out.println("Received Region: " + region);

      // DAO 호출하여 지역 데이터 가져오기
      TheaterVO[] ar = ReservationDAO.theaterName(region);
      System.out.println("Received Theater: " + ar);

      // 응답을 JSON 형식으로 반환
      response.setContentType("application/json;charset=utf-8");
      try {
        PrintWriter out = response.getWriter();

        ObjectMapper mapper = new ObjectMapper();
        mapper.writeValue(out, ar); // JSON으로 변환하여 응답
        return null;
      } catch (Exception e) {
        e.printStackTrace();
      }
      return null; // 추가적인 리다이렉션이나 포워딩 없이 종료
    }else if ("timetable".equals(type)) {
      String theaterIdx = request.getParameter("theaterIdx");
      String movieIdx = request.getParameter("movieIdx");
      String targetDate = request.getParameter("targetDate");

      // DAO 호출
      TimetableVO[] timetables = ReservationDAO.allTimetable(theaterIdx, movieIdx, targetDate);
      System.out.println("DAO에서 반환된 timetables: " + timetables);

      // JSON 형식으로 응답 반환
      response.setContentType("application/json;charset=utf-8");
      try {
        PrintWriter out = response.getWriter();
        ObjectMapper mapper = new ObjectMapper();
        System.out.println(new ObjectMapper().writeValueAsString(timetables));
        mapper.writeValue(out, timetables); // JSON으로 응답
        return null;
      } catch (Exception e) {
        e.printStackTrace();
      }
      return null;
    }
    return null;
  }
}