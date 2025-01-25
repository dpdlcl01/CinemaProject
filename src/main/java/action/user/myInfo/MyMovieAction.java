package action.user.myInfo;

import action.Action;
import mybatis.dao.MovieStoryDAO;
import mybatis.dao.MyInfoDAO;
import mybatis.vo.FavoritemovieVO;
import mybatis.vo.ReservationVO;
import mybatis.vo.ReviewVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MyMovieAction implements Action {
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        String idx = (String) session.getAttribute("idx");


        ReviewVO[] rvo = MovieStoryDAO.getReview(idx);
        FavoritemovieVO[] fvo = MovieStoryDAO.getFavoritemovie(idx);
        ReservationVO[] reserveVO = MyInfoDAO.getReservation(idx);


        request.setAttribute("rvo", rvo);
        request.setAttribute("reservVO", reserveVO);
        request.setAttribute("fvo", fvo);
        System.out.println("myMovie"+fvo.length);

       return "/jsp/user/myInfo/myMovieStoryV2.jsp";
    }
}
