package action.user.login;

import action.Action;
import mybatis.dao.MyPageDAO;
import mybatis.dao.RegisterDAO;
import mybatis.vo.UserVO;
import org.mindrot.jbcrypt.BCrypt;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;

public class UpdatePasswordAction implements Action {
    private RegisterDAO registerDAO;

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        String userId = (String) session.getAttribute("userId");
        String newPassword = request.getParameter("newPassword");

        System.out.println("userId : " + userId);
        System.out.println("newPassword : " + newPassword);

        if(userId == null || userId == ""){
            request.setAttribute("error", "비정상적인 접근입니다.");
            return "./jsp/user/common/error.jsp";
        }

        String hashedPassword = BCrypt.hashpw(newPassword, BCrypt.gensalt());

        HashMap<String, String> params = new HashMap<>();
        params.put("userId", userId);
        params.put("newPassword", hashedPassword);

        int result = RegisterDAO.updatePassword(params);



        System.out.println("result : " + result);
        if (result > 0) {
            System.out.println("UpdatePasswordAction success");
            return "/jsp/user/login/result/pwFind_Final.jsp";
        } else {
            System.out.println("UpdatePasswordAction failed");
            request.setAttribute("error", "비밀번호 변경 실패");
            return "./jsp/user/common/error.jsp";
        }
    }
}