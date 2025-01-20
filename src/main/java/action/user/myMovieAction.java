package action.user;

import action.Action;
import mybatis.dao.MovieStoryDAO;
import mybatis.vo.FavoritemovieVO;
import mybatis.vo.ReviewVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class myMovieAction implements Action {
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        String id = (String) session.getAttribute("idx");

        ReviewVO[] rvo = MovieStoryDAO.getReview(id);
        FavoritemovieVO[] fvo = MovieStoryDAO.getFavoritemovie(id);

        request.setAttribute("rvo", rvo);
        request.setAttribute("fvo", fvo);
        System.out.println("myMovie"+fvo.length);

       return "/jsp/user/myInfo/myMovieStoryV2.jsp";
    }
}
