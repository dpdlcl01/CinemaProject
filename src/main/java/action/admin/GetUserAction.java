package action.admin;

import action.Action;
import com.google.gson.Gson;
import mybatis.dao.AdminDAO;
import mybatis.vo.UserVO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class GetUserAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            // 요청 파라미터 검증
            String userIdxParam = request.getParameter("userIdx");
            if (userIdxParam == null || userIdxParam.isEmpty() || !userIdxParam.matches("\\d+")) { // 숫자 검증
                throw new IllegalArgumentException("올바르지 않은 userIdx 값: " + userIdxParam);
            }
            int userIdx = Integer.parseInt(userIdxParam);

            // DAO를 통해 사용자 정보 가져오기
            AdminDAO AdminDAO = new AdminDAO();
            UserVO user = AdminDAO.getUserById(userIdx);

            if (user == null) {
                throw new IllegalArgumentException("해당 userIdx에 대한 사용자를 찾을 수 없습니다.");
            }

            // 사용자 정보를 request에 저장
            request.setAttribute("user", user);

        return "./jsp/admin/getUser.jsp";

        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("{\"error\":\"서버 오류가 발생했습니다: " + e.getMessage() + "\"}");
            return null;
        }
    }
}