package action.user.register;

import action.Action;
import mybatis.dao.RegisterDAO;
import org.mindrot.jbcrypt.BCrypt;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;


public class RegisterAction implements Action {
   private static final String register_form = "/jsp/user/register/register.jsp";
   private static final String register_suc = "/jsp/user/register/reg_Result/registerSuccess.jsp";
   private static final String register_fail = "/jsp/user/register/reg_Result/registerFail.jsp";
//    private static final String register_error = "/jsp/user/register/reg_Result/registerError.jsp";

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        if (!"POST".equalsIgnoreCase(request.getMethod())) {
            return register_form; // GET 요청일 경우 폼 페이지 반환
        }

//        String emailpart1 = request.getParameter("emailpart1");
//        String emailpart2 = request.getParameter("emailpart2");
//
//        System.out.println("emailpart1 : " + emailpart1);
//        System.out.println("emailpart2 : " + emailpart2);
//

        String userName = request.getParameter("userName");
        String userId = request.getParameter("userId");
        String userPassword = request.getParameter("userPassword1");
        String userEmail = request.getParameter("user_Email");
        String userPhone = request.getParameter("userPhone");

        if (isNullOrEmpty(userName) || isNullOrEmpty(userId) || isNullOrEmpty(userPassword)
                || isNullOrEmpty(userEmail) || isNullOrEmpty(userPhone)) {
            return "./jsp/user/common/error.jsp"; // 실패 페이지 반환
        }


        String hashPassword = BCrypt.hashpw(userPassword, BCrypt.gensalt(12));


        String userPoint = "0";
        String userGrade = "BASIC";
        String userStatus = "0";

        HashMap<String, Object> map = new HashMap<>();
        map.put("userName", userName);
        map.put("userId", userId);
        map.put("userPassword", hashPassword);
        map.put("userEmail", userEmail);
        map.put("userPhone", userPhone);
        map.put("userPoint", Integer.valueOf(userPoint));
        map.put("userGrade", userGrade);
        map.put("userStatus", Integer.valueOf(userStatus));

        try {
            int result = RegisterDAO.userInsert(map);
            System.out.println(result);
            if (result > 0) {
                request.setAttribute("userName", userName);
                System.out.println("s");
                return register_suc; // 성공 페이지 반환
            } else {
                System.out.println("f");
                return register_fail; // 실패 페이지 반환
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "회원가입 중 오류가 발생했습니다.");
            return "./jsp/user/common/error.jsp"; // 에러 페이지 반환
        }
    }

    private boolean isNullOrEmpty(String str) {
        return str == null || str.trim().isEmpty();
    }
}