package action.admin.logManagement;

import action.Action;
import mybatis.dao.LogDAO;
import mybatis.vo.AdminVO;
import mybatis.vo.LogVO;
import util.Paging;
import util.SessionUtil;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SearchLogAction implements Action {

  @Override
  public String execute(HttpServletRequest request, HttpServletResponse response) {

    // 로그인 여부 확인 및 관리자 정보 가져오기
    AdminVO adminvo = SessionUtil.getLoginAdmin(request);

    // adminvo가 null이면 로그인하지 않은 경우 - 관리자 페이지 전체 접근 불가능하므로 로그인 페이지로 전환
    if (adminvo == null) {
      return "AdminController?type=admin";
    }

    String type = request.getParameter("type");
    System.out.println("🔹 Received type: " + type);  // 디버깅 로그 추가

    // 페이징 처리를 위한 객체 생성 (페이지당 10개, 블록당 5개)
    Paging page = new Paging(10, 5);

    // 검색 필터 값 받아오기
    String startDate = request.getParameter("startDate");
    String endDate = request.getParameter("endDate");
    String searchType = request.getParameter("searchType"); // 로그 정보 OR 로그 대상 선택
    String searchKeyword = request.getParameter("searchKeyword"); // 선택된 유형의 검색어 가져오기

    // 총 게시물 개수를 먼저 가져와야 함
    int totalRecord = LogDAO.getFilteredCount(startDate, endDate, searchType, searchKeyword);
    System.out.println("totalrecord = " +totalRecord);
    page.setTotalRecord(totalRecord);

    // 현재 페이지 값 설정
    String cPage = request.getParameter("cPage");
    if (cPage == null) {
      page.setNowPage(1);
    } else {
      int nowPage = Integer.parseInt(cPage);
      page.setNowPage(nowPage);
    }

    // `begin`과 `end`가 null이면 기본값을 설정
    int begin = page.getBegin() - 1;
    int end = page.getNumPerPage();

    if (begin <= 0) begin = 0;
    if (end <= 0) end = 10; // 기본값 설정

    // 페이징된 데이터 가져오기
    LogVO[] ar = LogDAO.searchLogs(startDate, endDate, searchType, searchKeyword, begin, end);
    request.setAttribute("ar", ar);
    request.setAttribute("page", page);
    request.setAttribute("startDate", startDate);
    request.setAttribute("endDate", endDate);
    request.setAttribute("searchType", searchType);
    request.setAttribute("searchKeyword", searchKeyword);
    request.setAttribute("totalCount", totalRecord);


    return "/jsp/admin/systemManagement/logManagement.jsp";
  }
}
