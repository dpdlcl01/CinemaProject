package action.admin.theaterSeat;

import action.Action;
import mybatis.dao.AdminDAO;
import mybatis.vo.AdminVO;
import mybatis.vo.LogVO;
import util.SessionUtil;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;

public class TheaterAction implements Action {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response){

        // 로그인 여부 확인 및 관리자 정보 가져오기
        AdminVO adminvo = SessionUtil.getLoginAdmin(request);

        // adminvo가 null이면 로그인하지 않은 경우 - 관리자 페이지 전체 접근 불가능하므로 로그인 페이지로 전환
        if (adminvo == null) {
            return "AdminController?type=admin";
        }

        // 극장 리스트 가져오기 (List<Map<String, String>>)
        List<Map<String, String>> theaterList = AdminDAO.getTheaterList();

        // 콘솔 출력 (데이터 확인용)
        System.out.println("=== 극장 리스트 출력 시작 ===");
        for (Map<String, String> theater : theaterList) {
            System.out.println(theater);
        }
        System.out.println("=== 극장 리스트 출력 끝 ===");

        // JSP에 데이터 전달
        request.setAttribute("theaterList", theaterList);

        return "/jsp/admin/theaterManagement/theaterManage.jsp";
    }

}
