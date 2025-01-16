package action.user;

import action.Action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RegisterAction implements Action {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        String userId = request.getParameter("userId");
        String userName = request.getParameter("userName");
        String userPassword = request.getParameter("userPassword");
        String userPhone = request.getParameter("userPhone");


        return "Controller";
    }
}
