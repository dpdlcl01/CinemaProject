package action.admin;

import action.Action;
import com.google.gson.Gson;
import mybatis.dao.AdminDAO;
import mybatis.vo.UserVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class UpdateUserAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int userIdx = Integer.parseInt(request.getParameter("userIdx"));
        String userName = request.getParameter("userName");
        String userEmail = request.getParameter("userEmail");
        String userPhone = request.getParameter("userPhone");
        int userPoint = Integer.parseInt(request.getParameter("userPoint"));
        String userGrade = request.getParameter("userGrade");

        // VO 객체 생성 및 데이터 설정
        UserVO user = new UserVO();
        user.setUserIdx(String.valueOf(userIdx));
        user.setUserName(userName);
        user.setUserEmail(userEmail);
        user.setUserPhone(userPhone);
        user.setUserPoint(String.valueOf(userPoint));
        user.setUserGrade(userGrade);

        // DAO를 통해 데이터 업데이트
        AdminDAO AdminDAO = new AdminDAO();
        boolean isUpdated = AdminDAO.updateUser(user);

        // 결과에 따라 메시지 설정
        if (isUpdated) {
            request.setAttribute("message", "사용자 정보가 성공적으로 수정되었습니다.");
        } else {
            request.setAttribute("message", "사용자 정보 수정에 실패했습니다.");
        }

        // 사용자 목록 페이지로 리다이렉트
        return "AdminController?type=userlist";
    }
}
