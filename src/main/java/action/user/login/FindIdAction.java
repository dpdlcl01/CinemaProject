package action.user.login;

import action.Action;
import com.google.gson.JsonObject;
import mybatis.dao.RegisterDAO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;

public class FindIdAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        String userName = request.getParameter("userName");
        String emailPart1 = request.getParameter("emailpart1");
        String emailPart2 = request.getParameter("hiddenEmailPart2");

        String userEmail = emailPart1 + "@" + emailPart2;

        HashMap<String, String> params = new HashMap<>();
        params.put("userName", userName);
        params.put("userEmail", userEmail);

        JsonObject jsonResponse = new JsonObject();

        try {
            String userId = RegisterDAO.UserIdFind(params);

            if (userId != null && !userId.isEmpty()) {
                jsonResponse.addProperty("status", "success");
                jsonResponse.addProperty("userId", userId);
                jsonResponse.addProperty("userName", userName);  // userName 추가
                jsonResponse.addProperty("message", "아이디 찾기가 완료되었습니다.");
            } else {
                jsonResponse.addProperty("status", "error");
                jsonResponse.addProperty("message", "사용자를 찾을 수 없습니다.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            jsonResponse.addProperty("status", "error");
            jsonResponse.addProperty("message", "오류가 발생하였습니다.");
        }

        response.getWriter().write(jsonResponse.toString());
        return null;
    }
}
