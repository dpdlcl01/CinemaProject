package action.user;

import action.Action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ReservationAction implements Action {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        // 빠른 예매 화면 경로 반환
        return "./jsp/user/reservation/reservationMain.jsp";
    }

}
