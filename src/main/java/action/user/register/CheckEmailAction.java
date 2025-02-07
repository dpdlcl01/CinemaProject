package action.user.register;

import action.Action;
import mybatis.dao.RegisterDAO;
import util.SMTP.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;

public class CheckEmailAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        String email = request.getParameter("email");
        PrintWriter out = response.getWriter();

        if (email == null || email.isEmpty()) {
            out.write("{\"status\":\"error\", \"message\":\"이메일 값이 비어있습니다.\"}");
            return "./jsp/user/register/reg_Result/ajax.jsp";
        }

        // 이메일 중복 여부 확인
        RegisterDAO dao = new RegisterDAO();
//        String existingEmail = dao.getEmailIfExists(email);

//        System.out.println("debug existingEmail = " + existingEmail);
//
//        if (existingEmail != null && !existingEmail.isEmpty()) {
//            out.write("{\"status\":\"error\", \"message\":\"이미 사용 중인 이메일입니다.\"}");
//            return "./jsp/user/register/reg_Result/ajax.jsp";
//        }

        // 인증번호 생성 및 전송
        String authCode = generateAuthCode();
        try {
            MailSender.sendEmail(email, "이메일 인증", "인증코드: " + authCode);

            HttpSession session = request.getSession();
            session.setAttribute("authCode", authCode);
            session.setAttribute("authCodeGeneratedTime", LocalDateTime.now());

            out.write("{\"status\":\"success\", \"message\":\"인증번호가 전송되었습니다.\"}");
        } catch (Exception e) {
            e.printStackTrace();
            out.write("{\"status\":\"error\", \"message\":\"이메일 전송에 실패했습니다.\"}");
        }
        return "./jsp/user/register/reg_Result/ajax.jsp";
    }

    private String generateAuthCode() {
        return String.valueOf((int) ((Math.random() * 900000) + 100000));
    }
}