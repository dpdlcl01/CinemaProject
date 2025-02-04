package action.admin.logManagement;

import action.Action;
import mybatis.dao.LogDAO;
import mybatis.vo.LogVO;
import util.Paging;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LogAction implements Action {
  @Override
  public String execute(HttpServletRequest request, HttpServletResponse response) {

    // 페이징 처리를 위한 객체 생성 (페이지당 5개, 블록당 3개)
    Paging page = new Paging(10, 5);

    // 총 게시물 개수를 먼저 가져와야 함
    int totalRecord = LogDAO.getTotalCount();
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
    int begin = page.getBegin();
    int end = page.getNumPerPage();

    if (begin <= 0) begin = 0;
    if (end <= 0) end = 10; // 기본값 설정

    // 페이징된 데이터 가져오기
    LogVO[] ar = LogDAO.getLogList(begin, end);
    request.setAttribute("ar", ar);
    request.setAttribute("page", page);

    return "/jsp/admin/systemManagement/logManagement.jsp";
  }
}