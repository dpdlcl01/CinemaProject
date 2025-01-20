package action.user;

import action.Action;
import dao.UserDAO;
import vo.userVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class LoginAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {

        // 로그아웃 처리
        String action = request.getParameter("action");
        if ("logout".equals(action)) {
            // 세션 무효화
            HttpSession session = request.getSession();
            session.invalidate();
            return null;
        }

        // 로그인 처리
        String userId = request.getParameter("userId");
        String userPassword = request.getParameter("userPassword");

        System.out.println("유저아이디: " + userId);
        System.out.println("비밀번호: " + userPassword);

        UserDAO userDAO = new UserDAO();
        boolean usercheck = userDAO.usercheck(userId, userPassword);

        if (usercheck) {
            userVO userVO = userDAO.getUserInfo(userId);

            if (userVO != null) {
                HttpSession session = request.getSession();
                session.setAttribute("user", userVO); // 세션에 사용자 정보 저장
            }
            request.setAttribute("success", "1"); // 로그인 성공 메시지
            return "/jsp/user/login/memberLoginModal.jsp"; // 로그인 성공 후 이동할 페이지

        } else {
            request.setAttribute("message", "로그인 실패! 아이디와 비밀번호를 확인하세요.");
            return "/jsp/user/login/memberLoginModal.jsp"; // 로그인 실패 후 이동할 페이지
        }
    }
}