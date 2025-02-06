package action.user.common;

import action.Action;
import mybatis.dao.MovieDAO;
import mybatis.vo.MovieVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UserMainAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {

        // 메인 화면 들어오면서 예매율 상위 4개 영화 가져오기
        MovieVO[] movieArray = MovieDAO.getTopMovie();
        request.setAttribute("movieArray", movieArray);

        // main 화면 경로 반환
        return "/jsp/user/common/userMain.jsp";
    }
}
