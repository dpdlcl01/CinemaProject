package action.user.login;

import action.Action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

public class LogoutAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // 세션에서 사용자 정보 삭제 (로그아웃 처리)
        HttpSession session = request.getSession();
        session.invalidate();  // 세션 무효화

        // 응답 타입을 JSON으로 설정
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();

        // 로그아웃 성공 메시지
        out.write("{\"success\": true, \"message\": \"로그아웃 되었습니다.\"}");
        out.flush();
        out.close();

        return null;
    }
}