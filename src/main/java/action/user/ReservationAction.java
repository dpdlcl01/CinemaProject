package action.user;

import action.Action;
import com.fasterxml.jackson.databind.ObjectMapper;
import mybatis.dao.ReservationDAO;
import mybatis.vo.MovieVO;
import mybatis.vo.TheaterVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.PrintWriter;
import java.util.Map;

public class ReservationAction implements Action {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        String type = request.getParameter("type"); // reservation은 GET 파라미터로 처리

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
            try {
                // 요청 본문 읽기
                BufferedReader reader = request.getReader();
                StringBuilder sb = new StringBuilder();
                String line;
                while ((line = reader.readLine()) != null) {
                    sb.append(line);
                }

                System.out.println("Request Body: " + sb);

                // JSON 파싱
                ObjectMapper mapper = new ObjectMapper();
                Map<String, String> data = mapper.readValue(sb.toString(), Map.class);
                String region = data.get("region"); // POST로 받은 지역명

                System.out.println("Received Region: " + region);

                // DAO 호출하여 지역 데이터 가져오기
                TheaterVO[] theaters = ReservationDAO.theaterName(region);

                // HTML 형태로 데이터를 반환
                response.setContentType("text/html;charset=UTF-8");
                try (PrintWriter out = response.getWriter()) {
                    if (theaters == null || theaters.length == 0) {
                        out.println("<p>선택한 지역에 극장이 없습니다.</p>");
                    } else {
                        for (TheaterVO theater : theaters) {
                            out.println("<li>");
                            out.println("<p>" + theater.getTheaterName() + " (" + theater.getTheaterScreenCount() + "개)</p>");
                            out.println("</li>");
                        }
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            // 요청 처리 완료 후 컨트롤러가 추가로 리다이렉트하지 않도록 null 반환 유지
            return null;
        }
        return null;
    }
}
