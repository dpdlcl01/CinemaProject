package action.user.login;

import action.Action;
import com.google.gson.JsonObject;
import mybatis.dao.RegisterDAO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;

public class FindPwAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        String type = request.getParameter("type");
        JsonObject jsonResponse = new JsonObject();

        if (type.equals("movefindpw")) {
            // 비밀번호 찾기 페이지를 반환하는 경우 (GET 요청)
            return "./jsp/user/login/findPw.jsp";
        } else if (type.equals("findpw")) {
            // 비밀번호 찾기 요청 (AJAX 요청)
            String userId = request.getParameter("userId");
            String userName = request.getParameter("userName");

            String emailPart1 = request.getParameter("emailpart1");
            String emailPart2 = request.getParameter("hiddenEmailPart2");
            String userEmail = emailPart1 + "@" + emailPart2;

            HashMap<String, String> params = new HashMap<>();
            params.put("userId", userId);
            params.put("userName", userName);
            params.put("userEmail", userEmail);

            try {
                RegisterDAO registerDAO = new RegisterDAO();

                // 사용자 인증 확인
                boolean isUserValid = registerDAO.validateUserForPasswordReset(userName, userEmail, userId);

                if (isUserValid) {
                    // 인증 성공, 비밀번호 변경 페이지로 리다이렉트
                    jsonResponse.addProperty("status", "success");
                    jsonResponse.addProperty("message", "사용자 인증에 성공했습니다. 비밀번호를 변경해주세요.");
                    jsonResponse.addProperty("userId", userId);  // userId 추가
                    jsonResponse.addProperty("redirect", "/jsp/user/login/resetPassword.jsp");  // 비밀번호 변경 페이지로 리다이렉트
                } else {
                    jsonResponse.addProperty("status", "error");
                    jsonResponse.addProperty("message", "사용자를 찾을 수 없습니다.");
                }
            } catch (Exception e) {
                e.printStackTrace();
                jsonResponse.addProperty("status", "error");
                jsonResponse.addProperty("message", "오류가 발생하였습니다. 관리자에게 문의하세요.");
            }
        }

        // JSON 응답 반환
        response.getWriter().write(jsonResponse.toString());
        return null;
    }
}
