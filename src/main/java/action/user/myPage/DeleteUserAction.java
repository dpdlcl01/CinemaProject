package action.user.myPage;

import action.Action;
import mybatis.vo.UserVO;
import util.SessionUtil;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class DeleteUserAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
        UserVO uservo = SessionUtil.getLoginUser(request);

        if (uservo == null) {
            return "/UserController?type=main";
        }

        return "/jsp/user/myPage/deleteAccount.jsp";
    }
}
