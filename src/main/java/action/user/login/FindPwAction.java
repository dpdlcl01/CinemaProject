package action.user.login;

import action.Action;
import mybatis.dao.RegisterDAO;
import util.LogUtil;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;

public class FindPwAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String type = request.getParameter("type");

        if (type.equals("movefindpw")) {
            return "./jsp/user/login/findPw.jsp";
        } else if (type.equals("findpw")) {
            // 요청 파라미터를 HashMap에 저장
            HashMap<String, String> params = new HashMap<>();
            params.put("userIdx", request.getParameter("userIdx"));
            params.put("userId", request.getParameter("userId"));
            params.put("userName", request.getParameter("userName"));

            String emailPart1 = request.getParameter("emailpart1");  // 이메일 앞부분
            String emailPart2 = request.getParameter("emailpart2");  // 이메일 도메인
            String userEmail = emailPart1 + "@" + emailPart2;        // 이메일 조합
            params.put("userEmail", userEmail);

            // HashMap에서 값 추출
            String userName = params.get("userName");
            String userId = params.get("userId");

            try {
                // DAO 객체 생성
                RegisterDAO registerDAO = new RegisterDAO();

                // 개별 값을 전달하여 메서드 호출
                boolean isUserValid = registerDAO.validateUserForPasswordReset(userName, userEmail, userId);

                if (isUserValid) {
                    // 비밀번호 변경 로직
                    String newPassword = request.getParameter("newPassword");
                    params.put("userPw", newPassword); // 새 비밀번호 추가

                    int updateResult = RegisterDAO.updatePassword(params);

                    if (updateResult > 0) {
                        LogUtil.logChanges(
                                "1",
                                null,
                                "userId : " + userId,
                                "비밀번호 찾기",
                                null,
                                null
                        );
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
        return null;
    }
}