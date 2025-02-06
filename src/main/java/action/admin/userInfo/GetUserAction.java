package action.admin.userInfo;

import action.Action;
import com.google.gson.Gson;
import mybatis.dao.AdminDAO;
import mybatis.vo.UserVO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class GetUserAction implements Action {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("application/json;charset=utf-8");
        response.setCharacterEncoding("UTF-8");

        PrintWriter out = response.getWriter();

        try {
            String userIdxParam = request.getParameter("userIdx");
            if (userIdxParam == null || !userIdxParam.matches("\\d+")) {
                out.write("{\"error\":\"잘못된 userIdx 값입니다.\"}");
                out.flush();
                return null;
            }

            int userIdx = Integer.parseInt(userIdxParam);
            AdminDAO adminDAO = new AdminDAO();
            UserVO user = adminDAO.getUserById(userIdx);

            if (user == null) {
                out.write("{\"error\":\"해당 userIdx에 대한 사용자를 찾을 수 없습니다.\"}");
            } else {
                String json = new Gson().toJson(user);
                out.write(json);
            }

        } catch (Exception e) {
            e.printStackTrace();
            out.write("{\"error\":\"서버 오류가 발생했습니다: " + e.getMessage() + "\"}");
        } finally {
            out.flush();
            out.close();
        }
        return null;
    }
}
