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

            Map<String, Object> resultMap = new HashMap<>();

            try{
                if(userId == null || userId.trim().isEmpty()){
                    resultMap.put("status", "error");
                    resultMap.put("message", "아이디를 입력해주세요.");
                } else if (userId.length() <= 7) {
                    resultMap.put("status", "error");
                    resultMap.put("message", "아이디는 8자 이상이여야 합니다.");
                } else if (userId.matches(".*[ㄱ-ㅎㅏ-ㅣ가-힣].*")) {
                    resultMap.put("status", "error");
                    resultMap.put("message", "아이디에 한글이 포함될 수 없습니다.");
                } else if (userId.matches("\\d+")) {
                    resultMap.put("status", "error");
                    resultMap.put("message", "아이디는 숫자로만 구성될 수 없습니다.");
                } else {
                    RegisterDAO dao = new RegisterDAO();
                    boolean isExist = dao.UserIdCheck(userId);
                    if(isExist){
                        resultMap.put("status", "error");
                        resultMap.put("message", "중복된 아이디입니다.");
                    } else {
                        resultMap.put("status", "success");
                        resultMap.put("message", "해당 아이디는 사용 가능합니다.");
                    }
                }
                } catch (Exception e) {
                e.printStackTrace();

                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                resultMap.put("status", "error");
                resultMap.put("message", "서버 내부 오류 발생");
            }

            ObjectMapper mapper = new ObjectMapper();
            String jsonResponse = mapper.writeValueAsString(resultMap);

            response.getWriter().write(jsonResponse);
            response.getWriter().flush();

             return null;
    }
}