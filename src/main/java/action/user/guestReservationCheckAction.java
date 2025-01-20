package action.user;

import action.Action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class guestReservationCheckAction implements Action {
  @Override
  public String execute(HttpServletRequest request, HttpServletResponse response) {

    // main 화면 경로 반환
    return "./jsp/user/login/guestReservationCheckModal.jsp";
  }
}
