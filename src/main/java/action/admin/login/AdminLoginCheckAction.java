package action.admin.login;

import action.Action;
import mybatis.vo.AdminVO;
import mybatis.vo.UserVO;
import util.SessionUtil;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class AdminLoginCheckAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

        // 로그인 여부 확인
        AdminVO adminvo = SessionUtil.getLoginAdmin(request);

        // JSON 형식으로 응답 설정
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();

        // 로그인 여부에 따라 true 또는 false 반환
        if (adminvo != null) {
            out.write("{\"login\": true}");
        } else {
            out.write("{\"login\": false}");
        }

        out.flush();
        out.close();

        return null; // 비동기 요청이므로 JSP로 포워딩하지 않음
    }
}
