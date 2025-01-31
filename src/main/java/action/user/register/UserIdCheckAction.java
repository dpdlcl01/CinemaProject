package action.user.register;

import action.Action;
import com.fasterxml.jackson.databind.ObjectMapper;
import mybatis.dao.RegisterDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;

public class UserIdCheckAction implements Action {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String userId = request.getParameter("userId");
        System.out.println("userId : " + userId);

        RegisterDAO dao = new RegisterDAO();
        boolean isExist = dao.UserIdCheck(userId);
        System.out.println("isExist : " + isExist);

        // JSON 응답 생성
        response.setContentType("application/json;charset=utf-8");
        try {
            Map<String, Object> resultMap = new HashMap<>();
            resultMap.put("result", isExist);

            ObjectMapper mapper = new ObjectMapper();
            response.getWriter().write(mapper.writeValueAsString(resultMap));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}