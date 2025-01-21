package action.user;

import action.Action;
import dao.registerDAO;
import org.json.JSONObject;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UserIdCheckAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {

        String userId = request.getParameter("userId");

        System.out.println("입력된 userId : " + userId);

        registerDAO dao = new registerDAO();

        boolean isDuplicate = dao.UserIdCheck(userId);

        request.setAttribute("isDuplicate", isDuplicate);

        System.out.println("중복 여부 : " + isDuplicate);

        try{
            JSONObject jsonResponse = new JSONObject();
            jsonResponse.put("isDuplicate", isDuplicate);

            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(jsonResponse.toString());
        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }
}
