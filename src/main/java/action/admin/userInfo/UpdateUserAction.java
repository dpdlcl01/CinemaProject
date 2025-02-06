package action.admin.userInfo;

import action.Action;
import com.google.gson.Gson;
import mybatis.dao.AdminDAO;
import mybatis.vo.AdminVO;
import mybatis.vo.LogVO;
import mybatis.vo.UserVO;
import util.SessionUtil;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

public class UpdateUserAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

        // 로그인 여부 확인 및 관리자 정보 가져오기
        AdminVO adminvo = SessionUtil.getLoginAdmin(request);

        // adminvo가 null이면 로그인하지 않은 경우 - 관리자 페이지 전체 접근 불가능하므로 로그인 페이지로 전환
        if (adminvo == null) {
            return "AdminController?type=admin";
        }

        String adminIdx = adminvo.getAdminIdx();

        int userIdx = Integer.parseInt(request.getParameter("userIdx"));
        String userName = request.getParameter("userName");
        String userEmail = request.getParameter("userEmail");
        String userPhone = request.getParameter("userPhone");
        String userPoint = request.getParameter("userPoint");
        String userGrade = request.getParameter("userGrade");

        AdminDAO adminDAO = new AdminDAO();
        UserVO existingUser = adminDAO.getUserById(String.valueOf(userIdx));

        UserVO user = new UserVO();
        user.setUserIdx(String.valueOf(userIdx));
        user.setUserName(userName);
        user.setUserEmail(userEmail);
        user.setUserPhone(userPhone);
        user.setUserPoint(userPoint);
        user.setUserGrade(userGrade);

        boolean isUpdated = adminDAO.updateUser(user);

        if (isUpdated) {

            logChange(adminDAO, Integer.parseInt(adminIdx), "userName", existingUser.getUserName(), userName);
            logChange(adminDAO, Integer.parseInt(adminIdx), "userPhone", existingUser.getUserPhone(), userPhone);
            logChange(adminDAO, Integer.parseInt(adminIdx), "userPoint", existingUser.getUserPoint(), userPoint);
            logChange(adminDAO, Integer.parseInt(adminIdx), "userGrade", existingUser.getUserGrade(), userGrade);

            response.setStatus(HttpServletResponse.SC_OK);
            response.getWriter().write("{\"message\": \"Movie updated successfully\"}");
        } else {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("{\"error\": \"Failed to update movie\"}");
        }
        return null;
    }


    private void logChange(AdminDAO adminDAO, int adminIdx, String target, String preValue, String curValue) {
        if ((preValue == null && curValue == null) || (preValue != null && preValue.equals(curValue))) {
            return;
        }

        LogVO log = new LogVO();
        log.setLogType("0");
//        log.setAdminIdx(String.valueOf(adminIdx)); 세션을 통해서 저장할때 해당코드 사용.
        log.setAdminIdx("1");
        log.setLogTarget(target);
        log.setLogPreValue(preValue != null ? preValue : "없음");
        log.setLogCurValue(curValue != null ? curValue : "없음");
        log.setLogInfo(target + " 수정");

        boolean logInserted = adminDAO.insertLog(log);
        System.out.println("로그 입력 시도: " + logInserted);
    }
}
