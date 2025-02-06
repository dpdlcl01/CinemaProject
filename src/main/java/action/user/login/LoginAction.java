package action.user.login;

import action.Action;
import mybatis.dao.LoginDAO;
import mybatis.vo.UserVO;
import org.mindrot.jbcrypt.BCrypt;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

public class LoginAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

        HttpSession session = request.getSession();

        // 로그인 처리
        String userId = request.getParameter("userId");
        String userPassword = request.getParameter("userPassword");

        // 데이터베이스에서 사용자 정보 조회
        UserVO uservo = LoginDAO.getUserInfo(userId);

        response.setContentType("application/json");
        PrintWriter out = response.getWriter();

        if (uservo != null) {
            // 암호화된 비밀번호 비교
            boolean passwordMatch = verifyPassword(userPassword, uservo.getUserPassword());

            if (passwordMatch) {
                session.setAttribute("uservo", uservo);  // 세션에 사용자 정보 저장

                out.write("{\"success\": true}");
            } else {
                out.write("{\"success\": false, \"message\": \"로그인 실패! 아이디와 비밀번호를 확인하세요.\"}");
            }
        } else {
            out.write("{\"success\": false, \"message\": \"로그인 실패! 아이디와 비밀번호를 확인하세요.\"}");
        }

        out.flush();
        out.close();
        return null;
    }

    private boolean verifyPassword(String inputPassword, String hashPassword) {
        try {
            return BCrypt.checkpw(inputPassword, hashPassword);
        } catch (IllegalArgumentException e) {
            System.out.println("Invalid password format.");
            return false;  // 잘못된 해시 형식일 경우 false 반환
        }
    }

}