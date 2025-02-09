package action.admin.theaterSeat;

import action.Action;
import mybatis.dao.TheaterAdminDAO;
import mybatis.vo.AdminVO;
import mybatis.vo.TheaterVO;
import util.Paging;
import util.SessionUtil;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SearchTheaterAction implements Action {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {

        // (로그인 체크가 필요한 경우 아래 주석 해제)
        // AdminVO adminvo = SessionUtil.getLoginAdmin(request);
        // if (adminvo == null) {
        //     return "AdminController?type=admin";
        // }

        // 전달받은 type 값 (디버깅용)
        String type = request.getParameter("type");
        System.out.println("🔹 Received type: " + type);

        // 페이징 객체 생성 (페이지당 10개, 블록당 5개)
        Paging page = new Paging(10, 5);

        // 검색 필터 값 받아오기
        String searchType = request.getParameter("searchType");
        String searchKeyword = request.getParameter("searchKeyword");

        // 총 검색 결과 개수 조회 (TheaterAdminDAO의 getFilteredCount 메서드를 사용)
        int totalRecord = TheaterAdminDAO.getFilteredCount(searchType, searchKeyword);
        System.out.println("totalrecord = " + totalRecord);
        page.setTotalRecord(totalRecord);

        // 현재 페이지 설정
        String cPage = request.getParameter("cPage");
        if (cPage == null) {
            page.setNowPage(1);
        } else {
            page.setNowPage(Integer.parseInt(cPage));
        }

        // offset과 limit 계산 (begin이 1부터 시작한다고 가정)
        int offset = page.getBegin() - 1;
        int limit = page.getNumPerPage();
        if (offset < 0) offset = 0;
        if (limit <= 0) limit = 10;

        // 검색 + 페이징된 극장 정보 조회 (TheaterVO 배열)
        TheaterVO[] theaterList = TheaterAdminDAO.searchTheater(searchType, searchKeyword, offset, limit);

        // 결과를 JSP에 전달
        request.setAttribute("theaterList", theaterList);
        request.setAttribute("page", page);
        request.setAttribute("searchType", searchType);
        request.setAttribute("searchKeyword", searchKeyword);
        request.setAttribute("totalCount", totalRecord);

        return "/jsp/admin/theaterManagement/theaterManage.jsp";
    }
}
