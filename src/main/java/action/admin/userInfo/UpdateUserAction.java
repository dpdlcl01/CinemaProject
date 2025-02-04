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

        response.setContentType("application/json;charset=utf-8");
        PrintWriter out = response.getWriter();
        Map<String, Object> result = new HashMap<>();

        try {
            int userIdx = Integer.parseInt(request.getParameter("userIdx"));
            String userName = request.getParameter("userName");
            String userEmail = request.getParameter("userEmail");
            String userPhone = request.getParameter("userPhone");
            String userPoint = request.getParameter("userPoint");
            String userGrade = request.getParameter("userGrade");




            AdminDAO adminDAO = new AdminDAO();
            UserVO existingUser = adminDAO.getUserById(userIdx);

            if (existingUser == null) {
                result.put("success", false);
                result.put("error", "해당 사용자가 존재하지 않습니다.");
                out.write(new Gson().toJson(result));
                out.flush();
                return null;
            }

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

                result.put("success", true);
                result.put("message", "사용자 정보가 성공적으로 수정되었습니다.");
            } else {
                result.put("success", false);
                result.put("error", "사용자 정보 수정에 실패했습니다.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            result.put("success", false);
            result.put("error", "서버 오류: " + e.getMessage());
        } finally {
            out.write(new Gson().toJson(result));
            out.flush();
            out.close();
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
