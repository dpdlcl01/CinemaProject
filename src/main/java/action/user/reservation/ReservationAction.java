package action.user.reservation;

import action.Action;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import mybatis.dao.ReservationDAO;
import mybatis.vo.MovieVO;
import mybatis.vo.TheaterVO;
import mybatis.vo.TimetableVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
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

            // ✅ URL에서 `movieIdx`, `date` 가져오기 (없으면 `null` 또는 `""`)
            String userMain_selectedMovieIdx = request.getParameter("movieIdx");
            String userMain_selectedDate = request.getParameter("date");

            // ✅ JSP에서 사용할 수 있도록 변수명 변경하여 저장
            request.setAttribute("userMain_selectedMovieIdx", userMain_selectedMovieIdx);
            request.setAttribute("userMain_selectedDate", userMain_selectedDate);

            // ✅ `movieIdx`가 있을 경우에만 `availableTheaters` 실행
            if (userMain_selectedMovieIdx != null && !userMain_selectedDate.isEmpty()) {
                List<TimetableVO> availableTheaters = ReservationDAO.getAvailableTheaters(userMain_selectedMovieIdx, userMain_selectedDate);
                request.setAttribute("availableTheaters", availableTheaters);
            }

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
            return null;
        }else if ("availableTheaters".equals(type)) {
            String movieIdx = request.getParameter("movieIdx");
            String targetDate = request.getParameter("targetDate");

            Map<String, Object> params = new HashMap<>();
            params.put("movieIdx", movieIdx);
            params.put("targetDate", targetDate);

            // `targetDate`가 없으면 오늘 날짜로 설정
            if (targetDate == null || targetDate.isEmpty()) {
                LocalDate today = LocalDate.now();
                targetDate = today.toString(); // "yyyy-MM-dd" 형식
            }

            List<TimetableVO> timetableVOList = ReservationDAO.getAvailableTheaters(movieIdx, targetDate);

            try {
                System.out.println("🔍 반환된 극장 리스트: " + new ObjectMapper().writeValueAsString(timetableVOList));
            } catch (JsonProcessingException e) {
                throw new RuntimeException(e);
            }

            // JSON 형식으로 응답 반환
            response.setContentType("application/json;charset=utf-8");
            try {
                PrintWriter out = response.getWriter();
                ObjectMapper mapper = new ObjectMapper();
                mapper.writeValue(out, timetableVOList); // JSON으로 응답
                return null;
            } catch (Exception e) {
                e.printStackTrace();
            }
            return null;

        }else if ("timetable".equals(type)) {
            String theaterIdx = request.getParameter("theaterIdx");
            String movieIdx = request.getParameter("movieIdx");
            String targetDate = request.getParameter("targetDate");

            // DAO 호출
            TimetableVO[] timetables = ReservationDAO.allTimetable(theaterIdx, movieIdx, targetDate);
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
        } else if ("quickReservation".equals(type)) {
            // 영화 데이터를 DAO에서 가져옴
            MovieVO[] movies = ReservationDAO.movieList();
            request.setAttribute("movies", movies);

            // 전체 극장 리스트 가져오기
            Map<String, Integer> theaters = ReservationDAO.theaterRegion();
            request.setAttribute("theaters", theaters);

            // ✅ URL에서 `movieIdx`, `date` 가져오기 (없으면 `null` 또는 `""`)
            String userMain_selectedMovieIdx = request.getParameter("movieIdx");
            String userMain_selectedDate = request.getParameter("date");

            // ✅ JSP에서 사용할 수 있도록 변수명 변경하여 저장
            request.setAttribute("userMain_selectedMovieIdx", userMain_selectedMovieIdx);
            request.setAttribute("userMain_selectedDate", userMain_selectedDate);

            // ✅ `movieIdx`가 있을 경우에만 `availableTheaters` 실행
            if (userMain_selectedMovieIdx != null && !userMain_selectedDate.isEmpty()) {
                List<TimetableVO> availableTheaters = ReservationDAO.getAvailableTheaters(userMain_selectedMovieIdx, userMain_selectedDate);
                request.setAttribute("availableTheaters", availableTheaters);
            }
        }
        return null;
    }
}
