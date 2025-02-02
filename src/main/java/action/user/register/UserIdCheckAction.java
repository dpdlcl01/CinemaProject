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
        response.setContentType("application/json;charset=utf-8");
        response.setCharacterEncoding("UTF-8");

        String userId = request.getParameter("userId");
        System.out.println("userId : " + userId);

        RegisterDAO dao = new RegisterDAO();
        boolean isExist = dao.UserIdCheck(userId);
        System.out.println("isExist : " + isExist);

        try {
            Map<String, Object> resultMap = new HashMap<>();
            resultMap.put("result", isExist);

            ObjectMapper mapper = new ObjectMapper();
            String jsonResponse = mapper.writeValueAsString(resultMap);

            response.getWriter().write(jsonResponse);
            response.getWriter().flush();
            response.getWriter().close();  // 스트림을 닫아 명확히 종료
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "서버 내부 오류 발생");
        }
        return ""; // 명확한 종료 처리
    }
}