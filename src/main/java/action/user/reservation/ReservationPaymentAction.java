package action.user.reservation;

import action.Action;
import mybatis.vo.UserVO;
import util.SessionUtil;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class ReservationPaymentAction implements Action {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

        // 로그인 여부 확인 (필요 시)
        UserVO uservo = SessionUtil.getLoginUser(request);
        if (uservo == null) {
            return "UserController?type=login";
        }

        HttpSession session = request.getSession();

        String paymentTotal = request.getParameter("paymentTotal");
        String paymentDiscount = request.getParameter("paymentDiscount");
        String pointDiscount = request.getParameter("pointDiscount");
        String paymentFinal = request.getParameter("paymentFinal");
        String couponIdx = request.getParameter("couponIdx");

        System.out.println("paymentTotal:" + paymentTotal);
        System.out.println("paymentDiscount:" + paymentDiscount);
        System.out.println("pointDiscount:" + pointDiscount);
        System.out.println("paymentFinal:" + paymentFinal);
        System.out.println("couponIdx:" + couponIdx);

        // 콘솔에 출력
        System.out.println("=== [JSP] 세션 저장된 값 확인 ===");
        System.out.println("좌석배열" + session.getAttribute("seatIdxList"));
        System.out.println("극장 ID: " + session.getAttribute("theaterIdx"));
        System.out.println("상영 시간표 ID: " + session.getAttribute("timetableIdx"));
        System.out.println("스크린 번호: " + session.getAttribute("screenIdx"));
        System.out.println("성인 수: " + session.getAttribute("adultCount"));
        System.out.println("청소년 수: " + session.getAttribute("studentCount"));
        System.out.println("================================");


        return "./jsp/user/reservation/reservationPaymentSuccess.jsp";
    }
}