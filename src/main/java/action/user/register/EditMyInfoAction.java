package action.user.register;

import action.Action;
import mybatis.dao.UserDAO;
import mybatis.vo.UserVO;
import util.SessionUtil;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class EditMyInfoAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

        UserVO uservo = SessionUtil.getLoginUser(request);
        if (uservo == null) {
            return "UserController?type=main";
        }

        String userId = uservo.getUserId();

        UserVO user = UserDAO.getUserById(userId);

        if (user == null) {
            System.out.println("no user info.");
            request.setAttribute("message", "유저 정보를 찾을 수 없습니다.");
            return "./jsp/user/common/error.jsp";
        }

        request.setAttribute("user", user);
        System.out.println("userinfo load success: " + user);

        return "/jsp/user/myPage/editMyInfo.jsp";
    }
}