package action.user.login;

import action.Action;
import dao.LoginDAO;
import vo.UserVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

public class LoginAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {


        // 로그인 처리
        String userId = request.getParameter("userId");
        String userPassword = request.getParameter("userPassword");

        LoginDAO loginDAO = new LoginDAO();
        boolean usercheck = loginDAO.usercheck(userId, userPassword);

        response.setContentType("application/json");
        PrintWriter out = response.getWriter();

        if (usercheck) {
            UserVO userVO = loginDAO.getUserInfo(userId);
            HttpSession session = request.getSession();
            session.setAttribute("user", userVO);  // 세션에 사용자 정보 저장

            out.write("{\"success\": true}");
        } else {
            out.write("{\"success\": false, \"message\": \"로그인 실패! 아이디와 비밀번호를 확인하세요.\"}");
        }

        out.flush();
        out.close();
        return null;
    }
}