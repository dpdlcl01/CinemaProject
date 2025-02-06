package action.admin.theaterSeat;

import action.Action;
import mybatis.vo.AdminVO;
import util.SessionUtil;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class SeatAction implements Action {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response){

        // 로그인 여부 확인 및 관리자 정보 가져오기
        AdminVO adminvo = SessionUtil.getLoginAdmin(request);

        // adminvo가 null이면 로그인하지 않은 경우 - 관리자 페이지 전체 접근 불가능하므로 로그인 페이지로 전환
        if (adminvo == null) {
            return "AdminController?type=admin";
        }







        return "/jsp/admin/theaterManagement/seatManage.jsp";
    }
}
