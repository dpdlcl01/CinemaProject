package action.user;

import action.Action;
import mybatis.dao.ReviewDAO;
import mybatis.vo.ReviewVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ReviewAction implements Action {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {

        String userIdx = request.getParameter("userIdx");
        String movieIdx = request.getParameter("movieIdx");
        String reviewRating = request.getParameter("reviewRating");
        String reviewContent = request.getParameter("reviewContent");

        // 리뷰 작성
        int cnt = ReviewDAO.writeReview(userIdx, movieIdx, reviewRating, reviewContent);



        return "/jsp/user/movie/movieDetail.jsp";
    }
}
