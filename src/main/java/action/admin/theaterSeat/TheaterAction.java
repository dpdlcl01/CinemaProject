package action.admin.theaterSeat;

import action.Action;
import mybatis.dao.SeatDAO;
import mybatis.dao.TheaterAdminDAO;
import mybatis.vo.AdminVO;
import mybatis.vo.SeatVO;
import mybatis.vo.TheaterVO;
import util.Paging;
import util.SessionUtil;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class TheaterAction implements Action {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response){

//        // 로그인 여부 확인 및 관리자 정보 가져오기
//        AdminVO adminvo = SessionUtil.getLoginAdmin(request);
//
//        // adminvo가 null이면 로그인하지 않은 경우 - 관리자 페이지 전체 접근 불가능하므로 로그인 페이지로 전환
//        if (adminvo == null) {
//            return "AdminController?type=admin";
//        }

        // 페이징 처리를 위한 객체 생성 (페이지당 10개, 블록당 5개)
        Paging page = new Paging(10, 5);

        // 총 게시물 개수를 먼저 가져와야 함
        int totalRecord = TheaterAdminDAO.getTotalCount();
        page.setTotalRecord(totalRecord); // 전체 게시물 개수를 먼저 설정해야 totalPage가 계산됨

        // 현재 페이지 값 설정
        String cPage = request.getParameter("cPage");
        if (cPage == null) {
            page.setNowPage(1);
        } else {
            int nowPage = Integer.parseInt(cPage);
            page.setNowPage(nowPage);
        }

        // `begin`과 `end`가 null이면 기본값을 설정
        int offset = page.getBegin() - 1;
        int limit = page.getNumPerPage();

        if (offset <= 0) offset = 0;
        if (limit <= 0) limit = 10; // 기본값 설정

        // 페이징된 데이터 가져오기
        TheaterVO[] theaterList = TheaterAdminDAO.getTheaterList(offset, limit);
        request.setAttribute("page", page);
        request.setAttribute("totalCount", totalRecord);

        // JSP에 데이터 전달
        request.setAttribute("theaterList", theaterList);

        return "/jsp/admin/theaterManagement/theaterManage.jsp";
    }

}
