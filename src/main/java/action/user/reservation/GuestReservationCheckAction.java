package action.user.reservation;

import action.Action;
import mybatis.dao.GuestDAO;
import mybatis.dao.LoginDAO;
import mybatis.vo.ReservationDetailVO;
import mybatis.vo.UserVO;
import org.mindrot.jbcrypt.BCrypt;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

public class GuestReservationCheckAction implements Action {
  @Override
  public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

    String type = request.getParameter("type");

    if (type.equals("guestReservationCheck")) {

      return "./jsp/user/login/guestReservationCheck.jsp";

    } else if (type.equals("NonmemberReservationCheck")) {

//      HttpSession session = request.getSession();

      String userName = request.getParameter("userName");
      String userEmail = request.getParameter("userEmail");
      String userAuthPassword = request.getParameter("userAuthPassword");

      UserVO uservo = LoginDAO.getNonUserInfo(userEmail);

      if (uservo == null) {
        request.setAttribute("error", "입력한 비회원 정보가 잘못되었습니다.");
        return "/jsp/user/login/guestReservationCheck.jsp";
      }

      String hashedPassword = uservo.getUserAuthPassword();

      // 비밀번호가 평문인지 또는 잘못된 해시인지 확인
      if (hashedPassword == null || !hashedPassword.startsWith("$2a$")) {
        request.setAttribute("error", "입력한 비회원 정보가 잘못되었습니다.");
        return "/jsp/user/login/guestReservationCheck.jsp";
      }


      if (uservo != null) {
        boolean passwordMatch = BCrypt.checkpw(userAuthPassword, uservo.getUserAuthPassword());
        System.out.println("password"+userAuthPassword+"hashPassword:"+uservo.getUserAuthPassword());
        if (passwordMatch) {
//          session.setAttribute("uservo", uservo);  // 세션에 사용자 정보 저장
          int guestIdx = GuestDAO.getSearchGuest(userName, userEmail, uservo.getUserAuthPassword());

          List<ReservationDetailVO> guestReservationList = GuestDAO.getReservationDetail(guestIdx);
//          System.out.println("List size: " + (guestReservationList != null ? guestReservationList.size() : "null"));
          if (guestReservationList == null || guestReservationList.isEmpty()) {
          // 비회원 예약 내역이 없는 경우 처리
          request.setAttribute("error", "예약 내역이 없습니다.");
          return "/jsp/user/login/guestReservationCheck.jsp";
        } else {
          // 예약 내역이 있을 경우 처리
          System.out.println(guestReservationList);

          request.setAttribute("guestReservationList", guestReservationList);

          System.out.println(guestReservationList.get(0).getMovieTitle());

          return "/jsp/user/reservation/reservationSuccess.jsp";
        }
        } else {
          request.setAttribute("error", "입력한 비회원 정보가 잘못되었습니다.");
          return "/jsp/user/login/guestReservationCheck.jsp";
        }
      }
      return null;
    }
    return null;
  }
  }
