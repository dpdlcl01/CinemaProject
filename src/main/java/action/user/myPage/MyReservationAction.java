package action.user.myPage;

import action.Action;
import mybatis.dao.MyPageDAO;
import mybatis.vo.ReservationVO;
import mybatis.vo.UserVO;
import util.SessionUtil;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class MyReservationAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

        // 로그인 여부 확인 및 사용자 정보 가져오기
        UserVO uservo = SessionUtil.getLoginUser(request);
        if (uservo == null) {
            return "UserController?type=main";
        }
        String idx = uservo.getUserIdx();

        ReservationVO[] rvo = MyPageDAO.getReservation(idx);
        ReservationVO[] cvo = MyPageDAO.getCancel(idx);

        if(cvo == null){
            cvo = new ReservationVO[0];
        }

        System.out.println("rvo:"+rvo.length);
        System.out.println(cvo.length);


        request.setAttribute("rvo", rvo);
        request.setAttribute("cvo", cvo);





        return "./jsp/user/reservation/reservationCancel.jsp";
    }
}
