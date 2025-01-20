package action.user;

import action.Action;
import dao.registerDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;

public class RegisterAction implements Action {
    private static final String register_form = "./jsp/user/register/register.jsp";
    private static final String register_suc = "./jsp/user/register/reg_Result/registerSuccess.jsp";
    private static final String register_fail = "./jsp/user/register/reg_Result/registerFail.jsp";
    private static final String register_error = "./jsp/user/register/reg_Result/registerError.jsp";
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {

        if(!"POST".equalsIgnoreCase(request.getMethod())){
            return register_form;
        }

        String userName = request.getParameter("userName");
        String userId = request.getParameter("userId");
        String userPassword = request.getParameter("userPassword");
        String userEmail = request.getParameter("userEmail");
        String userPhone = request.getParameter("userPhone");

        String userPoint = "0";
        String userGrade = "Basic";
        String userStatus = "0";

        HashMap<String, Object> map = new HashMap<>();
        map.put("userName", userName);
        map.put("userId", userId);
        map.put("userPassword", userPassword);
        map.put("userEmail", userEmail);
        map.put("userPhone", userPhone);
        map.put("userPoint", userPoint);
        map.put("userGrade", userGrade);
        map.put("userStatus", Integer.parseInt(userStatus));

        try{
            int result = registerDAO.userInsert(map);

            if(result > 0){
                request.setAttribute("userName", userName);
                return register_suc;
            } else {
                return register_fail;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return register_error;
        }
    }

}

