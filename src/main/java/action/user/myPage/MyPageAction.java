package action.user.myPage;

import action.Action;
import mybatis.dao.MyPageDAO;
import mybatis.vo.FavoriteTheaterVO;
import mybatis.vo.FavoritemovieVO;
import mybatis.vo.ReservationVO;
import mybatis.vo.UserVO;
import util.SessionUtil;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class MyPageAction implements Action {
    public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

        // 로그인 여부 확인 및 사용자 정보 가져오기
        UserVO uservo = SessionUtil.getLoginUser(request);
        
        // uservo가 null이면 로그인하지 않은 경우, userStatus가 null이면 비회원 로그인한 경우 - 마이페이지 전체 접근 불가능
        if (uservo == null || uservo.getUserStatus() == null) {
            return "UserController?type=main";
        }

        // 이후 로그인된 사용자 정보 활용
        String id = uservo.getUserId();
        String idx = uservo.getUserIdx();


        UserVO uvo = MyPageDAO.getUser(id);
        FavoriteTheaterVO[] fvo= MyPageDAO.getFavoriteTheater(idx);
        FavoriteTheaterVO[] far= MyPageDAO.getFavorite(idx);
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
        request.setAttribute("fvo", fvo);


        return "/jsp/user/myPage/myPageMain.jsp";
    }
}
