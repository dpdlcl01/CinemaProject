package action.admin.adminManagement;

import action.Action;
import mybatis.dao.AdminManagementDAO;
import mybatis.vo.AdminVO;
import util.Paging;
import util.SessionUtil;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GetAllAdminAction implements Action {
  @Override
  public String execute(HttpServletRequest request, HttpServletResponse response) {

    // 로그인 여부 확인 및 관리자 정보 가져오기
    AdminVO adminvo = SessionUtil.getLoginAdmin(request);

    // adminvo가 null이면 로그인하지 않은 경우 - 관리자 페이지 전체 접근 불가능하므로 로그인 페이지로 전환
    if (adminvo == null) {
      return "AdminController?type=admin";
    }

    // 페이징 처리
    Paging page = new Paging(5, 5);

    // 검색 조건 파라미터 수집
    String searchType = request.getParameter("searchType");       // 검색 대상 (이름, 아이디 등)
    String searchKeyword = request.getParameter("searchKeyword"); // 검색어
    String adminStatus = request.getParameter("adminStatus");       // 관리자 상태
    String adminLevel = request.getParameter("adminLevel");         // 관리자 등급

    // 총 게시물 개수 가져오기
    int totalRecord = AdminManagementDAO.getTotalCount(searchType, searchKeyword, adminStatus, adminLevel);

    page.setTotalRecord(totalRecord);

    // 현재 페이지 값 설정
    String cPage = request.getParameter("cPage");
    if (cPage == null) {
      page.setNowPage(1);
    } else {
      int nowPage = Integer.parseInt(cPage);
      page.setNowPage(nowPage);
    }

    // 'begin' 과 'end'가 null이면 기본값을 설정
    int begin = page.getBegin() - 1;
    int end = page.getNumPerPage();

    if (begin <= 0) begin = 0;
    if (end <= 0) end = 5; // 기본값 설정

    // 페이징된 데이터 가져오기
    AdminVO[] ar = AdminManagementDAO.getNonSuperAdmin(searchType, searchKeyword, adminStatus, adminLevel, begin, end);

    request.setAttribute("totalCount", totalRecord);
    request.setAttribute("adminArray", ar);
    request.setAttribute("page", page);
    request.setAttribute("cPage", cPage);

    return "/jsp/admin/systemManagement/adminManagement.jsp";
  }
}
