package action.user.myPage;

import action.Action;
import mybatis.dao.MyPageDAO;
import mybatis.vo.ReservationVO;
import mybatis.vo.UserVO;
import util.SessionUtil;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class MyPageAction implements Action {
    public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

/*      로그인하지 않으면 접근 자체가 되지 않는 화면의 Action에 추가!
        (마이페이지의 모든 화면, 예매 좌석 화면, 결제 화면, 장바구니 화면)
        (관리자 화면의 경우 로그인하지 않으면 어떤 화면도 접근 불가능하므로 모든 화면의 Action에 추가해야 하고,
         동일한 로직을 AdminVO, adminvo로 변경한 메서드도 존재하므로
         AdminVO adminvo = SessionUtil.requireAdminLogin(request, response); 호출)*/

        // 로그인 여부 확인 및 사용자 정보 가져오기
        UserVO uservo = SessionUtil.getLoginUser(request);
        if (uservo == null) {
            return "UserController?type=main";
        }

        // 이후 로그인된 사용자 정보 활용
        String id = uservo.getUserId();
        String idx = uservo.getUserIdx();


        UserVO uvo = MyPageDAO.getUser(id);
        String[] far= MyPageDAO.getFavorite(idx);
        int rNum = MyPageDAO.reviewNum(idx);
        int fNum = MyPageDAO.favoriteNum(idx);
        int wNum = MyPageDAO.watchMovieNum(idx);
        ReservationVO[] rvo = MyPageDAO.getReservation(idx);
        int total = MyPageDAO.getTotalPoint(idx);
        int reach = 0;
        if(total<13000){
            reach= 13000-total;
        }else if(total<20000){
            reach= 20000-total;
        }
        /*현재 여기까지 진행한 상태임 */

        request.setAttribute("total",total);
        request.setAttribute("reach",reach);


        request.setAttribute("total", total);

        /*uvo에 토탈포인트를 얻어내서 비교한 후 연산한 값을 뱉어보자 */

        request.setAttribute("rvo", rvo);
        request.setAttribute("uvo", uvo);
        request.setAttribute("far", far);

        request.setAttribute("rNum", rNum);
        request.setAttribute("fNum", fNum);
        request.setAttribute("wNum", wNum);


        return "/jsp/user/myPage/myPageMain.jsp";
    }
}
