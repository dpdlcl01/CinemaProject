package action.user.login;

import action.Action;
import mybatis.dao.LoginDAO;
import mybatis.vo.UserVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

public class LoginAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

        HttpSession session = request.getSession();

        // 로그인 처리
        String userId = request.getParameter("userId");
        String userPassword = request.getParameter("userPassword");

        boolean usercheck = LoginDAO.usercheck(userId, userPassword);

        response.setContentType("application/json");
        PrintWriter out = response.getWriter();

        if (usercheck) {
            UserVO uservo = LoginDAO.getUserInfo(userId);
            session.setAttribute("uservo", uservo);  // 세션에 사용자 정보 저장
            System.out.println(uservo.getUserId());
            out.write("{\"success\": true}");
        } else {
            out.write("{\"success\": false, \"message\": \"로그인 실패! 아이디와 비밀번호를 확인하세요.\"}");
        }

        out.flush();
        out.close();
        return null;
    }
}