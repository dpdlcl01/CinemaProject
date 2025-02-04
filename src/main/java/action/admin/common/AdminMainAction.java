package action.admin.common;

import action.Action;
import mybatis.vo.AdminVO;
import mybatis.vo.UserVO;
import util.SessionUtil;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class AdminMainAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

        // 로그인 여부 확인 및 관리자 정보 가져오기
        AdminVO adminvo = SessionUtil.getLoginAdmin(request);

        // adminvo가 null이면 로그인하지 않은 경우 - 관리자 페이지 전체 접근 불가능하므로 로그인 페이지로 전환
        if (adminvo == null) {
            return "AdminController?type=admin";
        }

        // 이후 로그인된 관리자 정보 활용 - 예) 로그 테이블에 관리자 idx 저장시
        String adminIdx = adminvo.getAdminIdx();







        // main 화면 경로 반환
        return "./jsp/admin/common/adminMain.jsp";
    }
}
