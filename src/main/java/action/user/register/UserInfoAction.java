package action.user.register;

import action.Action;
import dao.UserDAO;
import mybatis.service.FactoryService;
import org.apache.ibatis.session.SqlSession;
import vo.UserVO;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class UserInfoAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
        System.out.println("UserInfoAction 실행");

        // 1. 세션에서 유저 정보 가져오기
        HttpSession session = request.getSession();
        UserVO sessionUser = (UserVO) session.getAttribute("user");

        if (sessionUser == null) {
            System.out.println("no session");
            return "/login.jsp"; // 로그인 페이지로 이동
        }

        String userId = sessionUser.getUserId();
        System.out.println("getseesion userId: " + userId);

        // 2. DAO를 통해 유저 정보 조회
        UserDAO userDAO = new UserDAO();
        UserVO user = userDAO.getUserById(userId);

        if (user == null) {
            System.out.println("no user info.");
            request.setAttribute("message", "유저 정보를 찾을 수 없습니다.");
            return "/jsp/user/myInfo/error.jsp"; // 에러 페이지로 이동
        }

        // 3. 조회된 유저 정보를 request 객체에 저장
        request.setAttribute("user", user);
        System.out.println("userinfo load success: " + user);

        // 4. 개인정보 수정 페이지로 이동
        return "/jsp/user/myInfo/editMyInfo.jsp";
    }
}