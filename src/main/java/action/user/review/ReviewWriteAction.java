package action.user.review;

import action.Action;
import mybatis.dao.ReviewDAO;
import org.json.JSONObject;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;

public class ReviewWriteAction implements Action {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        String userIdx = request.getParameter("userIdx");
        String movieIdx = request.getParameter("movieIdx");
        String reviewRating = request.getParameter("reviewRating");
        String reviewContent = request.getParameter("reviewContent");

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        JSONObject result = new JSONObject();

        try {
            // 리뷰 작성
            int cnt = ReviewDAO.writeReview(userIdx, movieIdx, reviewRating, reviewContent);

            if (cnt > 0) {
                result.put("success", true);
                result.put("message", "관람평이 성공적으로 등록되었습니다.");
            } else {
                result.put("success", false);
                result.put("message", "관람평 등록에 실패했습니다.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            result.put("success", false);
            result.put("message", "서버 오류가 발생했습니다.");
        }

        try (PrintWriter out = response.getWriter()) {
            out.print(result.toString()); // JSON 응답 반환
        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }
}
