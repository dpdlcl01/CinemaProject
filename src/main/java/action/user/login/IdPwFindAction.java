package action.user.login;

import action.Action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class IdPwFindAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
        /*String type = request.getParameter("type");
        if (type == "findpw") {
            return "/jsp/user/login/findpw.jsp";
        } else if (type == "findid") {
            return "/jsp/user/login/findid.jsp";
        }
        return null;*/

        return "./jsp/user/login/findId.jsp";
    }
}
