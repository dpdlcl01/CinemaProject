package action.user.login;

import action.Action;
import mybatis.dao.RegisterDAO;
import org.mindrot.jbcrypt.BCrypt;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;

public class UpdatePasswordAction implements Action {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // AJAX에서 전달된 파라미터를 가져옴
        String userId = request.getParameter("userId");
        String newPassword = request.getParameter("newPassword");

        // 입력 값이 제대로 전달되지 않으면 오류 처리
        if (userId == null || userId.isEmpty() || newPassword == null || newPassword.isEmpty()) {
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write("{\"status\":\"error\", \"message\":\"비정상적인 접근입니다.\"}");
            return null;
        }

        // 비밀번호 암호화
        String hashedPassword = BCrypt.hashpw(newPassword, BCrypt.gensalt());

        // 파라미터를 HashMap에 저장
        HashMap<String, String> params = new HashMap<>();
        params.put("userId", userId);
        params.put("newPassword", hashedPassword);

        try {
            // 비밀번호 업데이트
            int result = RegisterDAO.updatePassword(params);

            // 결과에 따른 응답 처리
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");

            if (result > 0) {
                // 성공 시 메시지 반환
                response.getWriter().write("{\"status\":\"success\", \"message\":\"비밀번호가 성공적으로 변경되었습니다.\"}");
            } else {
                // 실패 시 메시지 반환
                response.getWriter().write("{\"status\":\"error\", \"message\":\"비밀번호 변경에 실패했습니다.\"}");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write("{\"status\":\"error\", \"message\":\"오류가 발생하였습니다. 관리자에게 문의하세요.\"}");
        }

        return null;
    }
}
