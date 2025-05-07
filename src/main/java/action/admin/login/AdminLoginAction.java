package action.admin.login;

import action.Action;
import mybatis.dao.LoginDAO;
import mybatis.vo.AdminVO;
import mybatis.vo.UserVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class AdminLoginAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

        // 로그인 아이디, 비밀번호 검증 후 관리자 대시보드로 연결
        HttpSession session = request.getSession();

        // 로그인 처리
        String adminId = request.getParameter("adminId");
        String adminPassword = request.getParameter("adminPassword");

        boolean adminCheck = LoginDAO.adminCheck(adminId, adminPassword);

        String viewPath = null;

        if (adminCheck) {
            AdminVO adminvo = LoginDAO.getAdminInfo(adminId);
            session.setAttribute("adminvo", adminvo);  // 세션에 관리자 정보 저장
            // main 화면 경로 반환
            // 로그인 성공 시 `AdminController?type=dashboard`로 리다이렉트
          return "AdminController?type=dashboard";
        } else {
            // 추후 ajax로 모달 띄우기 구현해도 됨

            // 관리자 로그인 화면 경로 반환
            viewPath = "./jsp/admin/common/adminLogin.jsp";
        }

        return viewPath;
    }
}
