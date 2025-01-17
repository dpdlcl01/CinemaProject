package util.SMTP;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
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
        String inputCode = request.getParameter("authCode");

        HttpSession session = request.getSession();
        String correctCode = (String) session.getAttribute("authCode");

        if(correctCode != null && correctCode.equals(inputCode)) {
            response.getWriter().write("인증 성공!");
        } else {
            response.getWriter().write("인증 실패!");
        }
    }
}
