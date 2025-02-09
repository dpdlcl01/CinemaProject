package action.admin.theaterSeat;

import action.Action;
import mybatis.dao.AdminDAO;
import mybatis.dao.TheaterManagementDAO;
import mybatis.vo.AdminVO;
import mybatis.vo.LogVO;
import mybatis.vo.TheaterManagementVO;
import util.Paging;
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

        Paging page = new Paging(10, 5);

        int totalRecord = TheaterManagementDAO.getTheaterScreenListCount();
        page.setTotalRecord(totalRecord);

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

      TheaterManagementVO[] ar = TheaterManagementDAO.getTheaterScreenList(begin, end);
      request.setAttribute("ar", ar);
      request.setAttribute("page", page);
      request.setAttribute("totalCount", totalRecord);

        return "/jsp/admin/theaterManagement/theaterManage.jsp";
    }

}
