package action.user.myPage;

import action.Action;
import mybatis.dao.MyMovieStoryDAO;
import mybatis.dao.MyPageDAO;
import mybatis.vo.FavoritemovieVO;
import mybatis.vo.ReservationVO;
import mybatis.vo.ReviewVO;
import mybatis.vo.UserVO;
import util.SessionUtil;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class MyMovieStroyAction implements Action {
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        try {
            UserVO uservo = SessionUtil.getLoginUser(request);
            if (uservo == null) {
                return "UserController?type=main";
            }

            String idx = uservo.getUserIdx();

            ReviewVO[] rvo = MyMovieStoryDAO.getReview(idx);
            FavoritemovieVO[] fvo = MyMovieStoryDAO.getFavoritemovie(idx);
            ReservationVO[] reserveVO = MyPageDAO.getReservation(idx);




            request.setAttribute("rvo", rvo);
            request.setAttribute("reserveVO", reserveVO);
            request.setAttribute("fvo", fvo);


            return "/jsp/user/myPage/myMovieStory.jsp";
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "서버 오류 발생");
            return "/jsp/error/errorPage.jsp";
        }
    }


}
