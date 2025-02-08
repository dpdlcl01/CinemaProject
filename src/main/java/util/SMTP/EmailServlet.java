package util.SMTP;

import mybatis.dao.RegisterDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
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
        response.setContentType("application/json; charset=utf-8");

        String actionType = request.getParameter("actionType");
        String email = request.getParameter("email");
        String userName = request.getParameter("userName");
        String userId = request.getParameter("userId");
        String userPassword = request.getParameter("userPassword");
        System.out.println("password input : " + userPassword);

        PrintWriter out = response.getWriter();

        // 필수 값 검증
        if (actionType == null || email == null || email.isEmpty()) {
            out.write("{\"status\":\"error\", \"message\":\"필수 값이 누락되었습니다.\"}");
            return;
        }

        // DAO 객체 생성
        RegisterDAO dao = new RegisterDAO();

        try {
            switch (actionType) {
                case "validateUser": // 회원가입 - 이메일 중복 확인
                    if (dao.getEmailIfExists(email)) {
                        out.write("{\"status\":\"error\", \"message\":\"이미 사용 중인 이메일입니다.\"}");
                    } else {
                        sendVerificationEmail(email, request);
                        out.write("{\"status\":\"success\", \"message\":\"이메일 인증번호가 전송되었습니다.\"}");
                    }
                    break;

                case "findId": // 아이디 찾기 - 이메일과 이름 검증
                    if (!dao.isUserValid(userName, email)) {
                        out.write("{\"status\":\"error\", \"message\":\"일치하는 값이 없습니다.\"}");
                    } else {
                        sendVerificationEmail(email, request);
                        out.write("{\"status\":\"success\", \"message\":\"인증번호가 전송되었습니다.\"}");
                    }
                    break;

                case "findPassword": // 비밀번호 찾기 - 이메일, 이름, 아이디 검증
                    if (!dao.validateUserForPasswordReset(userName, email, userId)) {
                        out.write("{\"status\":\"error\", \"message\":\"일치하는 값이 없습니다.\"}");
                    } else {
                        sendVerificationEmail(email, request);
                        out.write("{\"status\":\"success\", \"message\":\"인증번호가 전송되었습니다.\"}");
                    }
                    break;

                case "deleteAccount": // 회원탈퇴 - 이메일과 비밀번호 검증
                    if (!dao.isPasswordValid(email, userPassword)) {
                        System.out.println("deleteAccount entry");
                        System.out.println(email);
                        System.out.println(userPassword);
                        out.write("{\"status\":\"error\", \"message\":\"비밀번호와 이메일을 확인해주세요.\"}");
                    } else {
                        sendVerificationEmail(email, request);
                        out.write("{\"status\":\"success\", \"message\":\"회원탈퇴 인증번호가 전송되었습니다.\"}");
                    }
                    break;

                default:
                    out.write("{\"status\":\"error\", \"message\":\"잘못된 요청입니다.\"}");
            }
        } catch (Exception e) {
            e.printStackTrace();
            out.write("{\"status\":\"error\", \"message\":\"서버 오류가 발생했습니다.\"}");
        }
    }

    private void sendVerificationEmail(String email, HttpServletRequest request) throws Exception {
        String authCode = generateAuthCode();
        MailSender.sendEmail(email, "이메일 인증", "인증코드: " + authCode);

        HttpSession session = request.getSession();
        session.setAttribute("authCode", authCode);
        session.setAttribute("authCodeGeneratedTime", LocalDateTime.now());
    }

    private String generateAuthCode() {
        return String.valueOf((int) ((Math.random() * 900000) + 100000)); // 6자리 인증코드 생성
    }
}