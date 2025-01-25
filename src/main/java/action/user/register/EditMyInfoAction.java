package action.user.register;

import action.Action;
import mybatis.vo.UserDAO;
import mybatis.vo.UserVO;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class EditMyInfoAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
        System.out.println("UserInfoAction running");

        HttpSession session = request.getSession();
        mybatis.vo.UserVO sessionUser = (UserVO) session.getAttribute("user");

        if (sessionUser == null) {
            System.out.println("no session");
            return "/login.jsp";
        }

        String userId = sessionUser.getUserId();
        System.out.println("getseesion userId: " + userId);

        UserDAO userDAO = new UserDAO();
        mybatis.vo.UserVO user = userDAO.getUserById(userId);

        if (user == null) {
            System.out.println("no user info.");
            request.setAttribute("message", "유저 정보를 찾을 수 없습니다.");
            return "/jsp/user/myPage/error.jsp"; // 에러 페이지로 이동
        }

        request.setAttribute("user", user);
        System.out.println("userinfo load success: " + user);

        return "/jsp/user/myPage/editMyInfo.jsp";
    }
}