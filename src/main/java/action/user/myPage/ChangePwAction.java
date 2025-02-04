package action.user.myPage;

import action.Action;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import mybatis.dao.MyPageDAO;
import mybatis.vo.UserVO;
import org.json.JSONObject;
import org.mindrot.jbcrypt.BCrypt;
import util.SessionUtil;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

public class ChangePwAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        Gson gson = new Gson();
        Map<String, Object> result = new HashMap<>();

        UserVO user = SessionUtil.getLoginUser(request);

        if (user == null) {
            System.out.println("unauthorized");
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            result.put("status", "unauthorized");
            response.getWriter().write(gson.toJson(result));
            return null;
        }

        String userId = user.getUserId();
        String currentPassword = request.getParameter("currentPassword");
        String newPassword = request.getParameter("newPassword");

        if (currentPassword == null || newPassword == null) {
            System.out.println("missing_data");
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            result.put("status", "missing_data");
            response.getWriter().write(gson.toJson(result));
            return null;
        }

        boolean isPasswordValid = MyPageDAO.checkPassword(userId, currentPassword);
        if (!isPasswordValid) {
            System.out.println("invalid_password");
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            result.put("status", "invalid_password");
            response.getWriter().write(gson.toJson(result));
            return null;
        }

        String hashedPassword = BCrypt.hashpw(newPassword, BCrypt.gensalt());
        boolean isUpdated = MyPageDAO.updatePassword(userId, hashedPassword);

        if (isUpdated) {
            System.out.println("success");
            result.put("status", "success");
            response.getWriter().write(gson.toJson(result));
        } else {
            System.out.println("fail");
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            result.put("status", "fail");
            response.getWriter().write(gson.toJson(result));
        }

        return null;
    }
}