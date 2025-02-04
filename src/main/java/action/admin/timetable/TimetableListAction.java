package action.admin.timetable;

import action.Action;
import mybatis.dao.TimetableDAO;
import mybatis.vo.TimetableVO;
import util.Paging;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class TimetableListAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

        // 페이징 처리를 위한 객체 생성
        Paging page = new Paging(10, 10);

        // 총 상영 시간표 수를 구한다.
        int totalCount = TimetableDAO.getTimetableCount();
        // 페이징 객체에 총 게시물 수를 저장하면서 전체 페이지 수를 구한다.
        page.setTotalRecord(totalCount);

        // 현재 페이지 값을 파라미터로 받아온다.
        String cPage = request.getParameter("cPage");

        if (cPage == null)
            page.setNowPage(1);
        else {
            int nowPage = Integer.parseInt(cPage);
            page.setNowPage(nowPage);
        }

        // 극장 필터 파라미터 처리 (필터링 기능)
        String theaterIdx = request.getParameter("theaterIdx");

        // DB에서 상영 시간표 목록을 가져온다.
        TimetableVO[] timetableArray;
        if (theaterIdx == null || theaterIdx.isEmpty()) {
            timetableArray = TimetableDAO.getTimetableList(page.getBegin(), page.getEnd());
        } else {
            timetableArray = TimetableDAO.getTimetableListByTheater(theaterIdx, page.getBegin(), page.getEnd());
        }

        // request에 데이터 저장
        request.setAttribute("totalCount", totalCount);
        request.setAttribute("timetableArray", timetableArray);
        request.setAttribute("page", page);
        request.setAttribute("cPage", cPage);
        request.setAttribute("theaterIdx", theaterIdx);

        return "/jsp/admin/movie/timetableList.jsp";
    }
}
