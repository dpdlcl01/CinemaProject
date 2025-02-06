package action.user.myPage;

import action.Action;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import mybatis.dao.AdminDAO;
import mybatis.dao.MyPageDAO;
import mybatis.dao.RegisterDAO;
import mybatis.vo.LogVO;
import mybatis.vo.UserVO;
import org.json.JSONObject;
import org.mindrot.jbcrypt.BCrypt;
import util.SessionUtil;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
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
            System.out.println("로그인된 사용자가 아닙니다.");
            request.setAttribute("status", "unauthorized");
            request.setAttribute("message", "로그인이 필요합니다.");
            return "/WEB-INF/views/ajaxResponse.jsp";
        }

        String userId = user.getUserId();
        String currentPassword = request.getParameter("currentPassword");
        String newPassword = request.getParameter("newPassword");

        boolean isPasswordValid = MyPageDAO.checkPassword(userId, currentPassword);
        if (!isPasswordValid) {
            System.out.println("현재 비밀번호가 일치하지 않습니다.");
            request.setAttribute("status", "invalid_password");
            request.setAttribute("message", "현재 비밀번호가 일치하지 않습니다.");
            return "/WEB-INF/views/ajaxResponse.jsp";
        }

        String hashedPassword = BCrypt.hashpw(newPassword, BCrypt.gensalt());
        boolean isUpdated = MyPageDAO.updatePassword(userId, hashedPassword);

        if (isUpdated) {
            System.out.println("비밀번호 변경 성공");
            request.setAttribute("status", "success");
            request.setAttribute("message", "비밀번호가 성공적으로 변경되었습니다.");
        } else {
            System.out.println("비밀번호 변경 실패");
            request.setAttribute("status", "fail");
            request.setAttribute("message", "비밀번호 변경에 실패하였습니다.");
        }

        return "./jsp/user/myPage/ajax/ajaxResponse.jsp";

    }
}
