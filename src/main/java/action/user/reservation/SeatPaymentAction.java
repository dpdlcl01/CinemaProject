package action.user.reservation;

import action.Action;
import mybatis.vo.UserVO;
import util.SessionUtil;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class SeatPaymentAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

        // 로그인 여부 확인 (필요 시)
        UserVO uservo = SessionUtil.getLoginUser(request);
        if (uservo == null) {
            return "UserController?type=login";
        }

        // SeatAction에서 전달된 timetableIdx와 seatIdxList 값을 읽기
        String timetableIdx = (String) request.getAttribute("timetableIdx");
        String[] seatIdxList = (String[]) request.getAttribute("seatIdxList");

        System.out.println("SeatPaymentAction - timetableIdx: " + timetableIdx);
        if (seatIdxList != null) {
            for (String seatIdx : seatIdxList) {
                System.out.println("SeatPaymentAction - seatIdx: " + seatIdx);
            }
        } else {
            System.out.println("SeatPaymentAction - seatIdxList is null");
        }

        // 이후 결제 관련 로직을 추가하거나 payment.jsp로 포워딩
        return "./jsp/user/reservation/payment.jsp";
    }
}
