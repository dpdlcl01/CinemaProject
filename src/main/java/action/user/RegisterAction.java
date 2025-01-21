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

        if (!"POST".equalsIgnoreCase(request.getMethod())) {
            return register_form; // GET 요청일 경우 폼 페이지 반환
        }

        // 입력값 가져오기
        String userName = request.getParameter("userName");
        String userId = request.getParameter("userId");
        String userPassword = request.getParameter("userPassword");
        String userEmail = request.getParameter("userEmail");
        String userPhone = request.getParameter("userPhone");

        // 필수 입력값 검증
        if (isNullOrEmpty(userName) || isNullOrEmpty(userId) || isNullOrEmpty(userPassword)
                || isNullOrEmpty(userEmail) || isNullOrEmpty(userPhone)) {
            return register_fail; // 실패 페이지 반환
        }

        // 기본값 설정
        String userPoint = "0";
        String userGrade = "Basic";
        String userStatus = "0";

        HashMap<String, Object> map = new HashMap<>();
        map.put("userName", userName);
        map.put("userId", userId);
        map.put("userPassword", userPassword);
        map.put("userEmail", userEmail);
        map.put("userPhone", userPhone);
        map.put("userPoint", Integer.valueOf(userPoint));
        map.put("userGrade", userGrade);
        map.put("userStatus", Integer.valueOf(userStatus));

        try {
            int result = registerDAO.userInsert(map);

            if (result > 0) {
                request.setAttribute("userName", userName);
                return register_suc; // 성공 페이지 반환
            } else {
                return register_fail; // 실패 페이지 반환
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "회원가입 중 오류가 발생했습니다.");
            return register_error; // 에러 페이지 반환
        }
    }

    private boolean isNullOrEmpty(String str) {
        return str == null || str.trim().isEmpty();
    }
}
