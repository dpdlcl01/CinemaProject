package action.user.review;

import action.Action;
import mybatis.dao.ReviewDAO;
import mybatis.vo.ReviewVO;
import mybatis.vo.UserVO;
import org.json.JSONObject;
import util.SessionUtil;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class ReviewWriteAction implements Action {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
        UserVO uservo = SessionUtil.getLoginUser(request);

        String userIdx = uservo.getUserIdx();

        String movieIdx = request.getParameter("movieIdx");
        String reviewRating = request.getParameter("reviewRating");
        String reviewContent = request.getParameter("reviewContent");

        // 리뷰 저장 실행
        boolean isSaved = ReviewDAO.writeReview(userIdx, movieIdx, reviewRating, reviewContent);

        // 응답 전송
        response.setContentType("application/json");
        if (isSaved) {
            response.setStatus(HttpServletResponse.SC_OK);
            response.getWriter().write("{\"message\": \"Review saved successfully\"}");
        } else {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("{\"error\": \"Failed to save review\"}");
        }
        return null;
    }
}
