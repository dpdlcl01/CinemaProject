package util.SMTP;

import mybatis.dao.RegisterDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.time.LocalDateTime;
import javax.servlet.annotation.WebServlet;

@WebServlet("/EmailServlet")

public class EmailServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=utf-8");

        String email = request.getParameter("email");

        if(email == null || email.isEmpty()) {
            response.getWriter().write("이메일 값이 비어있습니다.");
            return;
        }

        String authCode = generateAuthCode();

        System.out.println("send authcode email :  " + email);
        System.out.println("authcode : "+authCode);

        try{
            MailSender.sendEmail(email, "이메일 인증 테스트입니다.",
                    "인증코드:" + authCode);

            HttpSession session = request.getSession();
            session.setAttribute("authCode", authCode);
            session.setAttribute("authCodeGeneratedTime", LocalDateTime.now());

            response.getWriter().write("이메일이 전송되었습니다.");
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().write("이메일이 전송실패했습니다!");
        }
    }

    private String generateAuthCode() {
        return String.valueOf((int)(Math.random()*1000000));
    }
}