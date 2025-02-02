package action.user.myPage;

import action.Action;
import mybatis.dao.MyPageDAO;
import mybatis.vo.UserVO;
import util.SessionUtil;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class RemoveFavoriteTheaterAction implements Action {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
        UserVO uservo = SessionUtil.getLoginUser(request);
        if (uservo == null) {
            return "UserController?type=main";
        }
        // 이후 로그인된 사용자 정보 활용
        String id = uservo.getUserId();
        String idx = uservo.getUserIdx();
        String theaterId = request.getParameter("favoriteTheaterId");

        System.out.println("RemoveFavoriteTheaterAction" + theaterId);

        int cnt = MyPageDAO.deleteFavoriteTheater(idx,theaterId);




        // JSON 응답 반환 (AJAX 응답 처리)
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        try {
            if (cnt > 0) {
                response.getWriter().write("{\"success\": true}");
            } else {
                response.getWriter().write("{\"success\": false, \"message\": \"삭제할 극장을 찾을 수 없습니다.\"}");
            }
            response.getWriter().flush(); // 즉시 응답 보내기
            response.getWriter().close(); // 스트림 닫기
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }
}
