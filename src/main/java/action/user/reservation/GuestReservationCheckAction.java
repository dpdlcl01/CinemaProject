package action.user.reservation;

import action.Action;
import mybatis.dao.user.GuestDAO;
import mybatis.vo.ReservationDetailVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

public class GuestReservationCheckAction implements Action {
  @Override
  public String execute(HttpServletRequest request, HttpServletResponse response) {

    String type = request.getParameter("type");

    if (type.equals("guestReservationCheck")) {

      return "./jsp/user/login/guestReservationCheckModal.jsp";

    } else if (type.equals("NonmemberReservationCheck")) {

      String userName = request.getParameter("userName");
      String userEmail = request.getParameter("userEmail");
      String userAuthPassword = request.getParameter("userAuthPassword");
      //System.out.println(userName + " " + userBirth + " " + userEmail + " " + userAuthPassword);

      int guestIdx = GuestDAO.getSearchGuest(userName, userEmail, userAuthPassword);
      System.out.println(guestIdx);

      if (guestIdx == 0) {
        // 비회원 정보가 틀린 경우 처리
        request.setAttribute("error", "입력한 비회원 정보가 잘못되었습니다.");
        return "/jsp/user/login/guestReservationCheckModal.jsp";
      } else {

        System.out.println(guestIdx); // 값 검증 완료

        List<ReservationDetailVO> guestReservationList = GuestDAO.getReservationDetail(guestIdx);

        if (guestReservationList == null || guestReservationList.isEmpty()) {
          // 비회원 예약 내역이 없는 경우 처리
          request.setAttribute("error", "예약 내역이 없습니다.");
          return "/jsp/user/login/guestReservationCheckModal.jsp";
        } else {
          // 예약 내역이 있을 경우 처리
          System.out.println(guestReservationList);

          request.setAttribute("guestReservationList", guestReservationList);

          System.out.println(guestReservationList.get(0).getMovieTitle());

          return "/jsp/user/reservation/reservationSuccess.jsp";
        }
      }
    }
    return null;
  }
}