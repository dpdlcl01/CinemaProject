package action.user.board;

import action.Action;
import mybatis.dao.BoardDAO;
import mybatis.vo.BoardVO;
import util.Paging;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ListAction implements Action {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        // 페이징 처리를 위한 객체생성
        Paging page = new Paging(10, 10);

        //bType을 인자로 받는다.
        String bType = request.getParameter("bType");

        // 총 게시물의 수를 구한다.
        int totalCount = BoardDAO.getTotalCount("notice");
        // 페이징 객체안에 총 게시물의 수를 저장하면서 전체페이지 수를 구한다.
        page.setTotalRecord(totalCount);// 이때 전체페이지수(totalPage)가 구해진다.

        request.setAttribute("total", totalCount);

        // 현재페이지 값을 파라미터로 받아보자!
        String cPage = request.getParameter("cPage");

        if (cPage == null)
            page.setNowPage(1);
        else {
            int nowPage = Integer.parseInt(cPage);// "2" --> 2
            page.setNowPage(nowPage);// 이때 !!!!
            // 게시물을 추출할 때 사용되는 begin과 end가 구해지고,
            // 더불어 시작페이지와 끝페이지 값도 구해진다.
        }

        // 검색어, 지역, 극장값을 받는다.
        String keyword = request.getParameter("keyword");
        String region = request.getParameter("region");
        String theater = request.getParameter("theater");

        // 게시판의 목록을 noticeMain.jsp에서 표현하기 위해 DB에서 원하는 자원들을 가져와야 한다.
        BoardVO[] ar = BoardDAO.getList("notice", page.getBegin(), page.getEnd(), keyword, region, theater);

        // 가져온 자원들을 noticeMain.jsp에서 표현할 수 있도록 request에 저장해야 한다.
        request.setAttribute("ar", ar);
        request.setAttribute("page", page);
        request.setAttribute("cPage", cPage);

        return "/jsp/user/notice/noticeMain.jsp";
    }
}
