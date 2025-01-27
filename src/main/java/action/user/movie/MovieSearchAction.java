package action.user.movie;

import action.Action;
import mybatis.dao.MovieDAO;
import mybatis.vo.MovieVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class MovieSearchAction implements Action {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

        String offsetParam = request.getParameter("offset");
        String pageSizeParam = request.getParameter("pageSize");

        // 기본값 설정 및 유효성 검증
        int offset = offsetParam != null && !offsetParam.isEmpty() ? Integer.parseInt(offsetParam) : 0;
        int pageSize = pageSizeParam != null && !pageSizeParam.isEmpty() ? Integer.parseInt(pageSizeParam) : 20;

        String movieKeyword = request.getParameter("movieKeyword");


        int totalMovieCount = MovieDAO.searchMovieCount(movieKeyword); // 전체 영화 개수
        MovieVO[] movieArray = MovieDAO.searchMovieList(movieKeyword, offset, pageSize);

        request.setAttribute("movieArray", movieArray);
        request.setAttribute("totalMovieCount", totalMovieCount); // 총 개수 추가
        return "/jsp/user/movie/movieMain.jsp";
    }
}
