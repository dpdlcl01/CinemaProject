package util.SMTP;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import javax.servlet.annotation.WebServlet;

@WebServlet("/EmailServlet")

public class EmailServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=utf-8");

        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String authCode = generateAuthCode();

        try{
            MailSender.sendEmail(email, "이메일 인증 테스트입니다.",
                    "인증코드:" + authCode);

            HttpSession session = request.getSession();
            session.setAttribute("authCode", authCode);

            response.getWriter().write("이메일이 전송되었음.");
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().write("이메일이 전송실패했음.");
        }
    }

    private String generateAuthCode() {
        return String.valueOf((int)(Math.random()*1000000));
    }
}

