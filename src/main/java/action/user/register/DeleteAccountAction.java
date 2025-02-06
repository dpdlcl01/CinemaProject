package action.user.register;

import action.Action;
import mybatis.dao.UserDAO;
import mybatis.vo.UserVO;
import util.SessionUtil;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class DeleteAccountAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

        // 로그인 여부 확인 및 사용자 정보 가져오기
        UserVO uservo = SessionUtil.getLoginUser(request);
        if (uservo == null) {
            return "UserController?type=main";
        }

        String userId = uservo.getUserId();
        String userPassword = request.getParameter("userPassword");

        System.out.println("entry");
        boolean isPasswordCorrect = UserDAO.checkPassword(userId, userPassword);
        System.out.println("isPasswordCorrect : " + isPasswordCorrect);
        if (isPasswordCorrect) {
            boolean isDeleted = UserDAO.updateUserStatus(userId);
            if (isDeleted) {
                request.getSession().invalidate();
                response.sendRedirect("UserController?type=main");
                return null;
            } else {
                request.setAttribute("error", "회원탈퇴에 실패했습니다.");
                return "./jsp/user/common/error.jsp";
            }
        } else {
            request.setAttribute("error", "비밀번호가 일치하지 않습니다.");
            return "./jsp/user/common/error.jsp";
        }
    }
}