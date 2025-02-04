package action.admin.login;

import action.Action;
import mybatis.dao.LoginDAO;
import mybatis.vo.AdminVO;
import mybatis.vo.UserVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

public class AdminLoginAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

        HttpSession session = request.getSession();

        // 로그인 처리
        String adminId = request.getParameter("adminId");
        String adminPassword = request.getParameter("adminPassword");

        boolean adminCheck = LoginDAO.adminCheck(adminId, adminPassword);

        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        if (adminCheck) {
            AdminVO adminVO = LoginDAO.getAdminInfo(adminId);  // 관리자 정보 가져오기
            session.setAttribute("adminvo", adminVO);  // 세션에 관리자 정보 저장
            out.write("{\"success\": true}");
        } else {
            out.write("{\"success\": false, \"message\": \"로그인 실패! 관리자 아이디와 비밀번호를 확인하세요.\"}");
        }

        out.flush();
        out.close();
        return null;  // 다른 페이지로 이동하지 않고 JSON 응답만 반환
    }
}