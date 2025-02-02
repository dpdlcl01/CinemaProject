package action.user.reservation;

import action.Action;
import mybatis.dao.ReservationDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;

public class ReservationCancelAction implements Action {
    public String execute(HttpServletRequest request, HttpServletResponse response) {

        String idx = request.getParameter("reservationIdx");

        int cnt = ReservationDAO.updateReservation(idx);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        try {
            PrintWriter out = response.getWriter();

            if (cnt > 0) { // 업데이트 성공
                out.print("{ \"success\": true, \"message\": \"예매가 성공적으로 취소되었습니다.\" }");
            } else { // 업데이트 실패
                out.print("{ \"success\": false, \"message\": \"예매 취소 실패. 다시 시도해주세요.\" }");
            }
            out.flush();
            out.close();
        } catch (Exception e) {
            e.printStackTrace();
        }



        return null;
    }
}
