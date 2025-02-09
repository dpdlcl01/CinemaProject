package action.admin.theaterSeat;

import action.Action;
import mybatis.dao.TheaterAdminDAO;
import mybatis.vo.TheaterVO;
import util.SessionUtil;
import mybatis.vo.AdminVO; // 필요 시 로그인 체크용

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class UpdateTheaterAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // (로그인 체크가 필요하면 아래 주석 해제)
        // AdminVO adminvo = SessionUtil.getLoginAdmin(request);
        // if (adminvo == null) {
        //     return "AdminController?type=admin";
        // }

        // 요청 파라미터 읽기
        String theaterIdx = request.getParameter("theaterIdx");
        String theaterName = request.getParameter("theaterName");
        String theaterRegion = request.getParameter("theaterRegion");
        String theaterStatus = request.getParameter("theaterStatus");
        String screenStatus = request.getParameter("screenStatus");

        TheaterVO theaterVO = new TheaterVO();
        theaterVO.setTheaterIdx(theaterIdx);
        theaterVO.setTheaterName(theaterName);
        theaterVO.setTheaterRegion(theaterRegion);
        theaterVO.setTheaterStatus(theaterStatus);
        theaterVO.setScreenStatus(screenStatus);

        // DAO를 통해 업데이트 수행
        boolean isUpdated = TheaterAdminDAO.updateTheater(theaterVO);

        if (isUpdated) {
            response.setStatus(HttpServletResponse.SC_OK);
            response.getWriter().write("{\"message\": \"Theater updated successfully\"}");
        } else {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("{\"error\": \"Failed to update theater\"}");
        }
        return null; // AJAX 요청이므로 JSP 포워딩 없이 null 리턴
    }
}
