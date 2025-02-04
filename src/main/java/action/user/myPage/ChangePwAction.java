package action.user.myPage;

import action.Action;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import mybatis.dao.MyPageDAO;
import mybatis.dao.RegisterDAO;
import mybatis.vo.UserVO;
import org.json.JSONObject;
import util.SessionUtil;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

public class ChangePwAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String userId = (String) request.getSession().getAttribute("userId");
        String oldPassword = request.getParameter("oldpassword");
        String newPassword = request.getParameter("newPassword");

        // JSON 응답 데이터 초기화
        String jsonResponse;

        try {
            // 기존 비밀번호 확인
            boolean isValidOldPassword = MyPageDAO.checkPassword(userId, oldPassword);

            if (!isValidOldPassword) {
                jsonResponse = "{\"status\":\"fail\", \"message\":\"현재 비밀번호가 일치하지 않습니다.\"}";
            } else {
                // 새 비밀번호 업데이트
                boolean isUpdated = MyPageDAO.updatePassword(userId, newPassword);

                if (isUpdated) {
                    jsonResponse = "{\"status\":\"success\", \"message\":\"비밀번호가 성공적으로 변경되었습니다.\"}";
                } else {
                    jsonResponse = "{\"status\":\"fail\", \"message\":\"비밀번호 변경에 실패했습니다.\"}";
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            jsonResponse = "{\"status\":\"error\", \"message\":\"서버에서 오류가 발생했습니다.\"}";
        }

        // JSON 응답 작성 및 반환
        response.getWriter().write(jsonResponse);
        response.getWriter().flush();
        response.getWriter().close();

        return null; // JSP로 이동하지 않음
    }
}
