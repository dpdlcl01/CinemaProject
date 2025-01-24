package action.user.register;

import action.Action;
import dao.UserDAO;
import dao.registerDAO;
import org.json.JSONObject;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.IOException;

public class UserIdCheckAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response)
        throws IOException {
        String userId = request.getParameter("userId");

        registerDAO registerdao = new registerDAO();

        int result = registerdao.UserIdCheck(userId);

        response.setContentType("text/plain");
        response.getWriter().write(String.valueOf(result));

        return null;
    }
}
