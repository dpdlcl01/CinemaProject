package action.user.register;

import action.Action;
import mybatis.dao.UserDAO;
import mybatis.vo.UserVO;
import util.LogUtil;
import util.SessionUtil;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class DeleteAccountAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
        System.out.println("deleteAccountAction entry..");

        // 로그인 여부 확인 및 사용자 정보 가져오기
        UserVO uservo = SessionUtil.getLoginUser(request);

        if (uservo == null) {
            return "/UserController?type=main";
        }

        String userId = uservo.getUserId();
        System.out.println("userID = " + userId);
        String userPassword = request.getParameter("userPassword11");
        System.out.println("userPassword = " + userPassword);

//        RequestDispatcher dispatcher = request.getRequestDispatcher("./jsp/user/mypage/deleteAccount.jsp");
//        try {
//            dispatcher.forward(request, response);
//        } catch (ServletException e) {
//            throw new RuntimeException(e);
//        }

        // 비밀번호 검증
        boolean isPasswordCorrect = UserDAO.checkPassword(userId, userPassword);
        System.out.println("isPasswordCorrect : " + isPasswordCorrect);


        if (isPasswordCorrect) {

            // 사용자 상태 업데이트
            boolean isDeleted = UserDAO.updateUserStatus(userId);

            String logType = "1";
            String userIdx = uservo.getUserIdx();
            if (isDeleted) {
                System.out.println("LogUtil entry..");
                LogUtil.logChanges(
                        logType,
                        null,
                        "userIdx : " + userIdx,
                        "회원 탈퇴",
                        null,
                        null
                );
                System.out.println("LogUtil exit..");

                request.getSession().invalidate(); // 세션 무효화

                return null;
            } else {
                request.setAttribute("error", "회원탈퇴에 실패했습니다.");
                return null;
            }
        } else {
            request.setAttribute("error", "비밀번호가 일치하지 않습니다.");
            return null;
        }
    }
}