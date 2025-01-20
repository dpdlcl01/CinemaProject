package util.SMTP;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.time.Duration;
import java.time.LocalDateTime;
import javax.servlet.annotation.WebServlet;

@WebServlet("/VerifyCodeServlet")

public class VerifyCodeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=utf-8");

        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=utf-8");

        String inputCode = request.getParameter("authCode");
        HttpSession session = request.getSession();

        String correctCode = (String) session.getAttribute("authCode");

        LocalDateTime generatedTime = (LocalDateTime) session.getAttribute("authCodeGeneratedTime");

        if(correctCode == null || generatedTime == null) {
            response.getWriter().write("인증번호가 만료되었거나 일치하지 않습니다.");

            return;
        }
            LocalDateTime now = LocalDateTime.now();
            Duration duration = Duration.between(generatedTime, now);

            if(duration.toMinutes() > 5) {
                session.removeAttribute("authCode");
                session.removeAttribute("authCodeGeneratedTime");
                response.getWriter().write("5분이 지나 인증번호가 만료되었습니다.");
                return;
            }

            if(correctCode.equals(inputCode)) {
                response.getWriter().write("인증 성공!");
            } else {
                response.getWriter().write("인증 실패!");
            }
    }
}
