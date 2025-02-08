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

public class NonMemberLoginAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

        HttpSession session = request.getSession();

        // 비회원 로그인 처리
        String userName = request.getParameter("userName");
        String userEmail = request.getParameter("userEmail");
        String userAuthPassword = request.getParameter("userAuthPassword");

        /*비밀번호 암호화*/
        String hashPassword = BCrypt.hashpw(userAuthPassword, BCrypt.gensalt(12));

        System.out.println(userName + userEmail + userAuthPassword);

        // 비회원 정보 DB에 추가
        boolean addResult = LoginDAO.addNonMember(userName, userEmail, hashPassword);

        response.setContentType("application/json");
        PrintWriter out = response.getWriter();

        // 추가가 성공했으면 DB에서 해당 정보를 불러와 세션에 저장
        if (addResult) {
            UserVO uservo = LoginDAO.nonMembercheck(userName, userEmail);
            System.out.println("유저idx:"+uservo.getUserIdx());
            System.out.println("유저이름"+uservo.getUserName());
            System.out.println("유저이메일"+uservo.getUserEmail());
//            uservo.setUserIdx(userIdx);
//            uservo.setUserName(userName);
//            uservo.setUserEmail(userEmail);
            session.setAttribute("uservo", uservo);  // 세션에 비회원 정보 저장

            out.write("{\"success\": true}");
        } else {
            out.write("{\"success\": false, \"message\": \"비회원 로그인 실패! 입력한 정보를 확인하세요.\"}");
        }

        out.flush();
        out.close();
        return null;
    }
}