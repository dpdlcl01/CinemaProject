package action.admin.adminManagement;

import action.Action;
import mybatis.dao.AdminManagementDAO;
import mybatis.vo.AdminVO;
import util.LogUtil;
import util.SessionUtil;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class AddAdminAction implements Action {

  @Override
  public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

    // 로그인 여부 확인 및 관리자 정보 가져오기
    AdminVO adminvo = SessionUtil.getLoginAdmin(request);

    // adminvo가 null이면 로그인하지 않은 경우 - 관리자 페이지 전체 접근 불가능하므로 로그인 페이지로 전환
    if (adminvo == null) {
      return "AdminController?type=admin";
    }

    String adminIdx = request.getParameter("adminIdx");
    String adminId = request.getParameter("adminId");
    String adminPassword = request.getParameter("adminPassword");
    String adminLevel = request.getParameter("adminLevel");
    String adminStatus = request.getParameter("adminStatus");

    AdminVO adminVO = new AdminVO();
    adminVO.setAdminIdx(adminIdx);
    adminVO.setAdminId(adminId);
    adminVO.setAdminPassword(adminPassword);
    adminVO.setAdminLevel(adminLevel);
    adminVO.setAdminStatus(adminStatus);

    boolean isInserted = AdminManagementDAO.insertAdmin(adminVO);

    if (isInserted) {
      String logType = "0"; // 관리자 관련 로그 0
      String logTarget = "adminIdx:" + adminIdx;
      String superAdminIdx = adminvo.getAdminIdx();

      LogUtil.logChanges(logType, superAdminIdx, logTarget, "admin계정추가", null, null);

      response.setStatus(HttpServletResponse.SC_OK);
      response.getWriter().write("{\"message\": \"admin updated successfully\"}");
    } else {
      response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
      response.getWriter().write("{\"error\": \"Failed to update admin\"}");
    }

    return null;  // 비동기 요청이므로 JSP로 포워딩하지 않음
  }
}
