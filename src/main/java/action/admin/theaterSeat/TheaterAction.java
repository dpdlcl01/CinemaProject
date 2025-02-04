package action.admin.theaterSeat;

import action.Action;
import mybatis.dao.AdminDAO;
import mybatis.vo.LogVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;

public class TheaterAction implements Action {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response){

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
