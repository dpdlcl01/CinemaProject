package action.admin.theaterSeat;

import action.Action;
import mybatis.dao.TheaterManagementDAO;
import mybatis.vo.AdminVO;
import mybatis.vo.TheaterManagementVO;
import util.LogUtil;
import util.SessionUtil;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class UpdateTheaterAction implements Action {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

        // 로그인 여부 확인 및 관리자 정보 가져오기
        AdminVO adminvo = SessionUtil.getLoginAdmin(request);

        // adminvo가 null이면 로그인하지 않은 경우 - 관리자 페이지 전체 접근 불가능하므로 로그인 페이지로 전환
        if (adminvo == null) {
            return "AdminController?type=admin";
        }
        System.out.println("UpdateAdminAction");


        String theaterIdx = request.getParameter("theaterIdx");
        String screenIdx = request.getParameter("screenIdx");
        String screenStatus = request.getParameter("screenStatus");
        String originalScreenStatus = request.getParameter("originalScreenStatus");
        System.out.println(screenStatus);

        // 로그 확인 (디버깅용)
        System.out.println("Updating Theater -> theaterIdx: " + theaterIdx + ", screenIdx: " + screenIdx + ", screenStatus: " + screenStatus);

        TheaterManagementVO vo = new TheaterManagementVO();
        vo.setTheaterIdx(theaterIdx);
        vo.setScreenIdx(screenIdx);
        vo.setScreenStatus(screenStatus);

        try {
            boolean isUpdated = TheaterManagementDAO.updateTheater(vo);
            System.out.println("Update success: " + isUpdated);
        } catch (Exception e) {
            e.printStackTrace();
        }


        boolean isUpdated = TheaterManagementDAO.updateTheater(vo);

        if (isUpdated) {
            String logType = "0"; // 관리자 관련 로그 0
            String logTarget = "screenIdx" + screenIdx; // 로그 대상 Idx
            String adminIdx = adminvo.getAdminIdx();


            LogUtil.logChanges(logType, adminIdx, logTarget, "스크린 상태 변경", originalScreenStatus, screenStatus);

            response.setStatus(HttpServletResponse.SC_OK);
            response.getWriter().write("{\"message\": \"screen updated successfully\"}");
        } else {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("{\"error\": \"Failed to update screen\"}");
        }

        return null;
    }

}
