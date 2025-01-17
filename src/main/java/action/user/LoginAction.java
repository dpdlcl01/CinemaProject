package action.user;

import action.Action;
import dao.UserDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {

        String userId = request.getParameter("userId");
        String userPassword = request.getParameter("userPassword");

        System.out.println("유저아이디: " + userId);
        System.out.println("비밀번호: " + userPassword);

        UserDAO userDAO = new UserDAO();
        boolean usercheck = userDAO.usercheck(userId, userPassword);

        if (usercheck) {
            return "./jsp/user/common/main.jsp";
        } else {
            request.setAttribute("message", "로그인 실패! 아이디와 비밀번호를 확인하세요.");
            return "./jsp/user/login/memberLoginModal.jsp";
        }
    }
}
