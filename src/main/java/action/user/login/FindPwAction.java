package action.user.login;

import action.Action;
import mybatis.dao.RegisterDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;

public class FindPwAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String userIdx = request.getParameter("userIdx");
        String userId = request.getParameter("userId");
        String userName = request.getParameter("userName");
        String emailPart1 = request.getParameter("emailpart1");
        String emailPart2 = request.getParameter("emailpart2");
        System.out.println("emailpart1 : " + emailPart1);
        System.out.println("emailpart2 : " + emailPart2);

        String userEmail = emailPart1 + "@" + emailPart2;

        System.out.println("FindPwAction 입력값 확인:");
        System.out.println("userId: " + userId);
        System.out.println("userName: " + userName);
        System.out.println("userEmail: " + userEmail);

        HashMap<String, String> params = new HashMap<>();
        params.put("userIdx", userIdx);
        params.put("userId", userId);
        params.put("userName", userName);
        params.put("userEmail", userEmail);

        try {
            boolean isUserValid = RegisterDAO.validateUserForPasswordReset(params);

            if (isUserValid) {
                System.out.println("FindPwAction success");
                request.setAttribute("userId", userId);
                request.setAttribute("userName", userName);
                request.setAttribute("userEmail", userEmail);
                request.setAttribute("userIdx", userIdx);
                return "/jsp/user/login/result/pwFind_success.jsp";
            } else {
                System.out.println("FindPwAction : user not found.");
                request.setAttribute("error", "사용자를 찾을 수 없습니다.");
                return "/jsp/user/login/result/pwFind_failed.jsp";
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "오류가 발생하였습니다. 관리자에게 문의하세요.");
            return "/jsp/user/login/result/pwFind_failed.jsp";
        }
    }
}
