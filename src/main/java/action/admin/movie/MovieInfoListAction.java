package action.admin.movie;

import action.Action;
import mybatis.dao.MovieDAO;
import mybatis.vo.MovieVO;
import util.Paging;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class MovieInfoListAction implements Action {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

        // 페이징 처리를 위한 객체생성
        Paging page = new Paging(10, 10);

        // 총 게시물의 수를 구한다.
        int totalCount = MovieDAO.adminMovieCount();
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
        MovieVO[] movieArray = MovieDAO.adminMovieList(page.getBegin(), page.getEnd());

        // request에 저장해야 한다.
        request.setAttribute("totalCount", totalCount);
        request.setAttribute("movieArray", movieArray);
        request.setAttribute("page", page);
        request.setAttribute("cPage", cPage);


        return "/jsp/admin/movie/movieInfoList.jsp";
    }
}
