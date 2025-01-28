package action.user.review;

import action.Action;
import mybatis.dao.ReviewDAO;
import org.json.JSONObject;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;

public class ReviewCheckAction implements Action {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        String type = request.getParameter("type"); // 타입 값 가져오기
        String userIdx = request.getParameter("userIdx");
        String movieIdx = request.getParameter("movieIdx");

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        JSONObject result = new JSONObject();

        try {
            if ("reviewCheckWatchedMovie".equals(type)) {
                // 관람 여부 확인
                boolean watched = ReviewDAO.checkWatchedMovie(userIdx, movieIdx);
                result.put("watched", watched);
            } else if ("reviewCheckWritten".equals(type)) {
                // 관람평 작성 여부 확인
                boolean reviewWritten = ReviewDAO.checkReviewWritten(userIdx, movieIdx);
                result.put("reviewWritten", reviewWritten);
            } else {
                // 잘못된 요청 처리
                result.put("error", "Invalid type parameter.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            result.put("error", "An error occurred while processing your request.");
        }

        try (PrintWriter out = response.getWriter()) {
            out.print(result.toString()); // JSON 응답 반환
        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }
}
