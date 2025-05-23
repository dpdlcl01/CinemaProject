package action.admin.movie;

import action.Action;
import mybatis.dao.MovieDAO;
import mybatis.vo.AdminVO;
import mybatis.vo.MovieVO;
import util.Paging;
import util.SessionUtil;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class MovieInfoListAction implements Action {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

        // 로그인 여부 확인 및 관리자 정보 가져오기
        AdminVO adminvo = SessionUtil.getLoginAdmin(request);

        // adminvo가 null이면 로그인하지 않은 경우 - 관리자 페이지 전체 접근 불가능하므로 로그인 페이지로 전환
        if (adminvo == null) {
            return "AdminController?type=admin";
        }

        // 페이징 처리를 위한 객체생성
        Paging page = new Paging(10, 10);


        // 검색 조건 파라미터 수집
        String searchType = request.getParameter("searchType");
        String searchValue = request.getParameter("searchValue");
        String searchMonth = request.getParameter("searchMonth");    // 개봉월 검색 조건
        String movieStatus = request.getParameter("movieStatus");    // 영화 상태 검색 조건
        String movieGrade = request.getParameter("movieGrade");      // 관람 등급 검색 조건

        // 총 게시물의 수를 구한다.
        int totalCount = MovieDAO.adminMovieCount(searchType, searchValue, searchMonth, movieStatus, movieGrade);



        // 페이징 객체안에 총 게시물의 수를 저장하면서 전체페이지 수를 구한다.
        page.setTotalRecord(totalCount);// 이때 전체페이지수(totalPage)가 구해진다.

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

        // DB에서 원하는 자원들을 가져와야 한다.
        MovieVO[] movieArray = MovieDAO.adminMovieList(
                searchType, searchValue, searchMonth, movieStatus, movieGrade,
                page.getBegin(), page.getEnd()
        );

        // request에 저장해야 한다.
        request.setAttribute("totalCount", totalCount);
        request.setAttribute("movieArray", movieArray);
        request.setAttribute("page", page);
        request.setAttribute("cPage", cPage);

        return "/jsp/admin/movie/movieInfoList.jsp";
    }
}
