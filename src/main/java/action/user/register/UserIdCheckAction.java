package action.user.register;

import action.Action;
import dao.registerDAO;
import org.json.JSONObject;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;

public class UserIdCheckAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {

        String userId = null;

        try {
            StringBuilder sb = new StringBuilder();
            String line;
            BufferedReader reader = request.getReader();
            while ((line = reader.readLine()) != null) {
                sb.append(line);
            }

            JSONObject jsonRequest = new JSONObject(sb.toString());
            userId = jsonRequest.getString("userId");
        } catch (Exception e) {
            e.printStackTrace();
        }

        System.out.println("입력된 userId: " + userId);

        if (userId == null || userId.trim().isEmpty()) {
            System.out.println("유효하지 않은 아이디입니다.");
            try {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid userId");
                return null;
            } catch (Exception e) {
                e.printStackTrace();
                return null;
            }
        }

        registerDAO dao = new registerDAO();
        int count = dao.UserIdCheck(userId);

        boolean isDuplicate = count > 0; // 1 이상이면 중복된 아이디
        System.out.println("중복 여부: " + isDuplicate);

        try {
            JSONObject jsonResponse = new JSONObject();
            jsonResponse.put("isDuplicate", isDuplicate);

            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(jsonResponse.toString());
        } catch (Exception e) {
            e.printStackTrace();
        }

        return null; // AJAX 요청이므로 JSP로 이동하지 않음
    }
}
