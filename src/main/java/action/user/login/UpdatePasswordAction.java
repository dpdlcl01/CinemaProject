package action.user.login;

import action.Action;
import mybatis.dao.RegisterDAO;
import org.mindrot.jbcrypt.BCrypt;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;

public class UpdatePasswordAction implements Action {
    private RegisterDAO registerDAO;

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String userId = request.getParameter("userId");
        String newPassword = BCrypt.hashpw(request.getParameter("newPassword"), BCrypt.gensalt());

        HashMap<String, String> params = new HashMap<>();
        params.put("userId", userId);
        params.put("newPassword", newPassword);

        int result = RegisterDAO.updatePassword(params);
        if (result > 0) {
            return "/jsp/user/login/pw_reset_success.jsp";
        } else {
            request.setAttribute("error", "비밀번호 변경 실패");
            return "/jsp/user/login/pw_reset_failed.jsp";
        }
    }
}
