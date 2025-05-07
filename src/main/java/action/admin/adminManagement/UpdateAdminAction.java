package action.admin.adminManagement;

import action.Action;
import mybatis.dao.AdminManagementDAO;
import mybatis.vo.AdminVO;
import util.LogUtil;
import util.SessionUtil;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class UpdateAdminAction implements Action {

  @Override
  public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

    // 로그인 여부 확인 및 관리자 정보 가져오기
    AdminVO adminvo = SessionUtil.getLoginAdmin(request);

    // adminvo가 null이면 로그인하지 않은 경우 - 관리자 페이지 전체 접근 불가능하므로 로그인 페이지로 전환
    if (adminvo == null) {
      return "AdminController?type=admin";
    }
    System.out.println("UpdateAdminAction");

    String adminIdx = request.getParameter("adminIdx");
    String adminId = request.getParameter("adminId");
    String adminLevel = request.getParameter("adminLevel");
    String adminStatus = request.getParameter("adminStatus");
    System.out.println(adminIdx);
    System.out.println(adminId);
    System.out.println(adminLevel);
    System.out.println(adminStatus);

    AdminVO adminVO = new AdminVO();
    adminVO.setAdminIdx(adminIdx);
    adminVO.setAdminId(adminId);
    adminVO.setAdminLevel(adminLevel);
    adminVO.setAdminStatus(adminStatus);

    boolean isUpdated = AdminManagementDAO.updateAdmin(adminVO);

    if (isUpdated) {
      String logType = "0"; // 관리자 관련 로그 0
      String logTarget = "adminIdx:" + adminIdx; // 로그 대상 Idx
      String superAdminIdx = adminvo.getAdminIdx();

      LogUtil.logChanges(logType, superAdminIdx, logTarget, "adminId 수정", adminVO.getAdminId(), adminId);
      LogUtil.logChanges(logType, superAdminIdx, logTarget, "adminLevel 수정", adminVO.getAdminId(), adminLevel);
      LogUtil.logChanges(logType, superAdminIdx, logTarget, "adminStatus 수정", adminVO.getAdminStatus(), adminStatus);

      response.setStatus(HttpServletResponse.SC_OK);
      response.getWriter().write("{\"message\": \"admin updated successfully\"}");
    } else {
      response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
      response.getWriter().write("{\"error\": \"Failed to update admin\"}");
    }
    return null;  // 비동기 요청이므로 JSP로 포워딩하지 않음
  }
}
