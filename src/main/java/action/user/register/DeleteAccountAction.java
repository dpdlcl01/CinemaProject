package action.user.register;

import action.Action;
import dao.UserDAO;
import vo.userVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class DeleteAccountAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
        System.out.println("action in 1");

        HttpSession session = request.getSession();
        userVO user = (userVO) session.getAttribute("user"); // 세션에서 userId 가져오기
        String userId = user.getUserId();

        System.out.println("userID = " + user);

        if (userId == null) {
            System.out.println("please login");
            request.setAttribute("message", "로그인이 필요합니다.");
            return "/jsp/user/register/register.jsp"; // 로그인 페이지로 이동
        }

        System.out.println("action in 2");
        String password = request.getParameter("password");
        String authCodeCheck = request.getParameter("authcodecheck");

        if (authCodeCheck == "1") {
            System.out.println("please email auth");
            request.setAttribute("message", "이메일 인증이 필요합니다.");
            return "/jsp/user/register/reg_Result/registerFail.jsp"; // 탈퇴 페이지로 이동
        }

        System.out.println("action in 3");
        UserDAO userDAO = new UserDAO();
        String storedPassword = userDAO.getPasswordById(userId);

        if (storedPassword == null || !storedPassword.equals(password)) {
            System.out.println("not match pw");
            request.setAttribute("message", "비밀번호가 일치하지 않습니다.");
            return "./main.jsp"; // 탈퇴 페이지로 이동
        }

        System.out.println("action in 4");
        boolean result = userDAO.updateUserStatus(userId);

        if (result) {
            System.out.println("result into :" + result);
            session.invalidate(); // 세션 초기화
            request.setAttribute("message", "회원탈퇴가 완료되었습니다.");
            System.out.println("s");
            return "/jsp/user/register/register.jsp"; // 메인 페이지로 이동

        } else {

            System.out.println("f");
            request.setAttribute("message", "회원탈퇴에 실패했습니다.");
            return "/jsp/user/common/404.jsp"; // 탈퇴 페이지로 이동
        }

    }

}
