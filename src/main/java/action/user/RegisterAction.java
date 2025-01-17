package action.user;

import action.Action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RegisterAction implements Action {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {

            String enc_type = request.getContentType();

            String path = null;

            if(enc_type == null) {
                path = "./jsp/user/register/register.jsp";
            }

        return path;
    }
}
