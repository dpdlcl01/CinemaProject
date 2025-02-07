package action.user.reservation;

import action.Action;
import mybatis.dao.PointDAO;
import mybatis.dao.ReservationDAO;
import mybatis.dao.SeatDAO;
import mybatis.dao.UserDAO;
import mybatis.vo.UserVO;
import util.SessionUtil;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class ReservationCancelAction implements Action {
    public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

        String idx = request.getParameter("reservationIdx");

            UserVO userVO = SessionUtil.getLoginUser(request);

            String userIdx = userVO.getUserIdx();


        int cancelCnt = ReservationDAO.cancelReservation(idx);

        int cnt = ReservationDAO.updateReservation(idx);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");




        /*이 예매번호를 가지고 포인트 테이블을 찾아서 바꾸자*/

        int updatePoint = PointDAO.deletePoint(idx);
        System.out.println("updatePoint:"+updatePoint);

       /* *//*유저테이블도 바꾸자*/
        UserDAO.updatePoint(userIdx,String.valueOf(updatePoint));


        /*이 예매번호를 가지고 좌석 테이블을 찾아서 바꾸자*/
        int delSeat = SeatDAO.delSeat(idx);
        System.out.println("cancelCnt:"+cancelCnt);

        System.out.println("delSeat:"+delSeat);

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
