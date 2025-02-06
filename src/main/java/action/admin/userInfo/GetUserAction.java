package action.admin.userInfo;

import action.Action;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import mybatis.dao.AdminDAO;
import mybatis.vo.AdminVO;
import mybatis.vo.UserVO;
import util.SessionUtil;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class GetUserAction implements Action {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

        // 로그인 여부 확인 및 관리자 정보 가져오기
        AdminVO adminvo = SessionUtil.getLoginAdmin(request);

        // adminvo가 null이면 로그인하지 않은 경우 - 관리자 페이지 전체 접근 불가능하므로 로그인 페이지로 전환
        if (adminvo == null) {
            return "AdminController?type=admin";
        }

        String userIdx = request.getParameter("userIdx");

        AdminDAO adminDAO = new AdminDAO();
        UserVO user = adminDAO.getUserById(userIdx);

        // Jackson을 사용하여 JSON 변환
        ObjectMapper mapper = new ObjectMapper();
        String json = mapper.writeValueAsString(user);

        // 응답 헤더 및 JSON 전송 설정
        response.setContentType("application/json; charset=UTF-8");
        response.getWriter().write(json);

        return null;  // 비동기 요청이므로 JSP로 포워딩하지 않음
    }
}
