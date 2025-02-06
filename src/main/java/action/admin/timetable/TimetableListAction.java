package action.admin.timetable;

import action.Action;
import mybatis.dao.TheaterDAO;
import mybatis.dao.TimetableDAO;
import mybatis.vo.AdminVO;
import mybatis.vo.TheaterVO;
import mybatis.vo.TimetableVO;
import util.Paging;
import util.SessionUtil;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Map;

public class TimetableListAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

        // 로그인 여부 확인 및 관리자 정보 가져오기
        AdminVO adminvo = SessionUtil.getLoginAdmin(request);

        // adminvo가 null이면 로그인하지 않은 경우 - 관리자 페이지 전체 접근 불가능하므로 로그인 페이지로 전환
        if (adminvo == null) {
            return "AdminController?type=admin";
        }

        // 페이징 처리를 위한 객체 생성
        Paging page = new Paging(10, 10);


        // 검색 조건 파라미터 처리
        String screeningDate = request.getParameter("screeningDate");
        String theaterIdx = request.getParameter("theaterIdx");
        String screenIdx = request.getParameter("screenIdx");
        String searchType = request.getParameter("searchType");
        String searchValue = request.getParameter("searchValue");

        // 총 상영 시간표 수 조회
        int totalCount = TimetableDAO.countTimetables(screeningDate, theaterIdx, screenIdx, searchValue);


/*
        // 총 상영 시간표 수를 구한다.
        int totalCount = TimetableDAO.getTimetableCount();*/

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

        // 상영 시간표 목록 조회
        TimetableVO[] timetableArray = TimetableDAO.getTimetableList(
                screeningDate, theaterIdx, screenIdx, searchValue, page.getBegin(), page.getEnd()
        );

        // 극장 목록 조회 (검색 필터용)
        List<Map<String, Object>> theaterList = TimetableDAO.getTheatersWithScreens();

/*

        // 극장 필터 파라미터 처리 (필터링 기능)
        String theaterIdx = request.getParameter("theaterIdx");*/

/*        // DB에서 상영 시간표 목록을 가져온다.
        TimetableVO[] timetableArray;
        if (theaterIdx == null || theaterIdx.isEmpty()) {
            timetableArray = TimetableDAO.getTimetableList(page.getBegin(), page.getEnd());
        } else {
            timetableArray = TimetableDAO.getTimetableListByTheater(theaterIdx, page.getBegin(), page.getEnd());
        }*/

        // request에 데이터 저장
        request.setAttribute("totalCount", totalCount);
        request.setAttribute("timetableArray", timetableArray);
        request.setAttribute("page", page);
        request.setAttribute("cPage", cPage);
        request.setAttribute("theaterList", theaterList);

        return "/jsp/admin/movie/timetableList.jsp";
    }
}
