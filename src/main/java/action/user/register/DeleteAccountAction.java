package action.user.register;

import action.Action;
import dao.UserDAO;
import vo.UserVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class DeleteAccountAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
        System.out.println("DeleteAccountAction");

        HttpSession session = request.getSession();
        UserVO user = (UserVO) session.getAttribute("user");

        String userId = user.getUserId();
        String userPassword = request.getParameter("userPassword");

        System.out.println("get userId: " + userId);
        System.out.println("get userPassword: " + userPassword);

        UserDAO userDAO = new UserDAO();

        System.out.println("entry");
        boolean isPasswordCorrect = userDAO.checkPassword(userId, userPassword);
        System.out.println("isPasswordCorrect : " + isPasswordCorrect);
        if (isPasswordCorrect) {
            boolean isDeleted = userDAO.updateUserStatus(userId);
            if (isDeleted) {
                request.getSession().invalidate();
                return null;
            } else {
                request.setAttribute("message", "회원탈퇴에 실패했습니다.");
                return "/jsp/user/myInfo/delResult/del_fail.jsp";
            }
        } else {
            request.setAttribute("message", "비밀번호가 일치하지 않습니다.");
            return "/jsp/user/myInfo/delResult/del_error.jsp";
        }
    }
}