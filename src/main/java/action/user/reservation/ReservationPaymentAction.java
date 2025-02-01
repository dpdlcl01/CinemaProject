package action.user.reservation;

import action.Action;
import mybatis.vo.UserVO;
import util.SessionUtil;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class ReservationPaymentAction implements Action {

  @Override
  public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

    // 로그인 여부 확인 (필요 시)
    UserVO uservo = SessionUtil.getLoginUser(request);
    if (uservo == null) {
      return "UserController?type=login";
    }

    String screenIdx = request.getParameter("screenIdx");
    System.out.println("screenIdx:" + screenIdx);

    return "./jsp/user/reservation/reservationPaymentSuccess.jsp";
  }
}
