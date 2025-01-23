package action.user.myinfo;

import action.Action;
import mybatis.dao.MyInfoDAO;
import mybatis.vo.ReservationVO;
import mybatis.vo.UserVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MyInfoAction implements Action {
    public String execute(HttpServletRequest request, HttpServletResponse response) {

        HttpSession session = request.getSession();
        String id = (String) session.getAttribute("id");
        String idx = (String) session.getAttribute("idx");


        UserVO uvo = MyInfoDAO.getUser(id);
        String[] far=MyInfoDAO.getFavorite(idx);
        int rNum = MyInfoDAO.reviewNum(idx);
        int fNum = MyInfoDAO.favoriteNum(idx);
        int wNum = MyInfoDAO.watchMovieNum(idx);
        ReservationVO[] rvo = MyInfoDAO.getReservation(idx);
        int total = MyInfoDAO.getTotalPoint(idx);
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


        return "/jsp/user/myInfo/myInfoMain.jsp";
    }
}
