package action.user;

import action.Action;
import mybatis.dao.MovieDAO;
import mybatis.vo.MovieVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MovieMainAction implements Action {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {

        // 전체 영화 리스트 가져오기
        MovieVO[] movieArray = MovieDAO.getTotalMovie();

        request.setAttribute("movieArray", movieArray);

        return "/jsp/user/movie/movieMain.jsp";
    }
}
