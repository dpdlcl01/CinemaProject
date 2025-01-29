package action.admin;

import action.Action;
import com.google.gson.Gson;
import mybatis.dao.AdminDAO;
import mybatis.vo.UserVO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

public class UpdateUserAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("application/json;charset=utf-8");
        response.setCharacterEncoding("UTF-8");

        PrintWriter out = response.getWriter();
        Map<String, Object> result = new HashMap<>();

        try {
            int userIdx = Integer.parseInt(request.getParameter("userIdx"));
            String userName = request.getParameter("userName");
            String userEmail = request.getParameter("userEmail");
            String userPhone = request.getParameter("userPhone");
            int userPoint = Integer.parseInt(request.getParameter("userPoint"));
            String userGrade = request.getParameter("userGrade");

            UserVO user = new UserVO();
            user.setUserIdx(String.valueOf(userIdx));
            user.setUserName(userName);
            user.setUserEmail(userEmail);
            user.setUserPhone(userPhone);
            user.setUserPoint(String.valueOf(userPoint));
            user.setUserGrade(userGrade);

            AdminDAO adminDAO = new AdminDAO();
            boolean isUpdated = adminDAO.updateUser(user);

            if (isUpdated) {
                result.put("success", true);
                result.put("message", "사용자 정보가 성공적으로 수정되었습니다.");
            } else {
                result.put("success", false);
                result.put("error", "사용자 정보 수정에 실패했습니다.");
            }

        } catch (Exception e) {
            e.printStackTrace();
            result.put("success", false);
            result.put("error", "서버 오류: " + e.getMessage());
        } finally {
            out.write(new Gson().toJson(result));
            out.flush();
            out.close();
        }

        return null;
    }
}
