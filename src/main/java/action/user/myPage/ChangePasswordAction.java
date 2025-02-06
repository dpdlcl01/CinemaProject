package action.user.myPage;

import action.Action;
import com.google.gson.Gson;
import mybatis.dao.AdminDAO;
import mybatis.dao.MyPageDAO;
import mybatis.vo.LogVO;
import mybatis.vo.UserVO;
import org.mindrot.jbcrypt.BCrypt;
import util.LogUtil;
import util.SessionUtil;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

public class ChangePasswordAction implements Action {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        System.out.println("ChangePwAction entry..");

        Gson gson = new Gson();
        Map<String, Object> result = new HashMap<>();

        UserVO user = SessionUtil.getLoginUser(request);

        if (user == null) {
            System.out.println("need login..");
            request.setAttribute("status", "unauthorized");
            request.setAttribute("message", "로그인이 필요합니다.");
            return "./jsp/user/myPage/ajax/ajaxResponse.jsp";
        }

        String userId = user.getUserId();
        String userIdx = user.getUserIdx();
        String currentPassword = request.getParameter("currentPassword");
        String newPassword = request.getParameter("newPassword");


        boolean isPasswordValid = MyPageDAO.checkPassword(userId, currentPassword);
        System.out.println(isPasswordValid);
        if (!isPasswordValid) {
            System.out.println("not same nowpassword.");
            request.setAttribute("status", "invalid_password");
            request.setAttribute("message", "현재 비밀번호가 일치하지 않습니다.");
            return "./jsp/user/myPage/ajax/ajaxResponse.jsp";
        }

        String hashedPassword = BCrypt.hashpw(newPassword, BCrypt.gensalt());
        System.out.println(hashedPassword);
        boolean isUpdated = MyPageDAO.updatePassword(userId, hashedPassword);
        System.out.println(isUpdated);


        if (isUpdated) {
            String logType = "1";
            String logTarget = "userIdx : "+ userIdx;

            System.out.println("Logutil entry.");
            LogUtil.logChanges(
                    logType,
                    null,
                    "userIdx : " + userIdx,
                    "비밀번호 변경",
                    null,
                    null
            );
            System.out.println("LogUtil exit");

            System.out.println("success");
            request.setAttribute("status", "success");
            request.setAttribute("message", "비밀번호가 성공적으로 변경되었습니다.");

        } else {
            System.out.println("failed");
            request.setAttribute("status", "fail");
            request.setAttribute("message", "비밀번호 변경에 실패하였습니다.");
        }

        return "./jsp/user/myPage/ajax/ajaxResponse.jsp";
    }
}