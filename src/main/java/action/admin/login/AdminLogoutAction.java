package action.admin.login;

import action.Action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

public class AdminLogoutAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

        // 세션에서 관리자 정보 삭제 (로그아웃 처리)
        HttpSession session = request.getSession();
        session.invalidate();  // 세션 무효화

        // 관리자 로그인 화면 경로 반환
        return "./jsp/admin/common/adminLogin.jsp";
    }
}