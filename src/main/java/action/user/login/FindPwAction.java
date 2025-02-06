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
        String newPassword = request.getParameter("newPassword"); // 새 비밀번호 입력받음

        String userEmail = emailPart1 + "@" + emailPart2;

        HashMap<String, String> params = new HashMap<>();
        params.put("userIdx", userIdx);
        params.put("userId", userId);
        params.put("userName", userName);
        params.put("userEmail", userEmail);

        try {
            // 사용자 검증
            boolean isUserValid = RegisterDAO.validateUserForPasswordReset(params);
            if (isUserValid) {
                // 새 비밀번호 설정
                params.put("userPw", newPassword); // 새 비밀번호 추가
                int updateResult = RegisterDAO.updatePassword(params);

                if (updateResult > 0) {
                    request.setAttribute("success", "비밀번호가 성공적으로 변경되었습니다.");
                    return "/jsp/user/login/result/pwFind_success.jsp";
                } else {
                    request.setAttribute("error", "비밀번호 변경에 실패했습니다.");
                    return "./jsp/user/common/error.jsp";
                }
            } else {
                request.setAttribute("error", "사용자를 찾을 수 없습니다.");
                return "./jsp/user/common/error.jsp";
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "오류가 발생하였습니다. 관리자에게 문의하세요.");
            return "./jsp/user/common/error.jsp";
        }
    }
}