package action.user.movie;

import action.Action;
import com.fasterxml.jackson.databind.ObjectMapper;
import mybatis.dao.MovieDAO;
import mybatis.vo.MovieVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

public class MovieSearchAction implements Action {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {

        try {
            String offsetParam = request.getParameter("offset");
            String pageSizeParam = request.getParameter("pageSize");

            String movieStatus = request.getParameter("status");
            String movieKeyword = request.getParameter("movieKeyword");

            // 기본값 설정
            if (movieStatus == null || movieStatus.isEmpty()) {
                movieStatus = "all";
            }
            if (movieKeyword == null) {
                movieKeyword = ""; // 빈 문자열로 처리
            }

            int offset = (offsetParam != null && !offsetParam.isEmpty()) ? Integer.parseInt(offsetParam) : 0;
            int pageSize = (pageSizeParam != null && !pageSizeParam.isEmpty()) ? Integer.parseInt(pageSizeParam) : 20;

            int totalMovieCount;
            MovieVO[] movieArray;

            // movieStatus에 따른 분기 처리
            switch (movieStatus) {
                case "all":
                    totalMovieCount = MovieDAO.searchMovieCount(movieKeyword);
                    movieArray = MovieDAO.searchMovieList(movieKeyword, offset, pageSize);
                    break;
                case "0":
                case "1":
                    totalMovieCount = MovieDAO.searchByStatusCount(movieStatus, movieKeyword);
                    movieArray = MovieDAO.searchByStatusList(movieStatus, movieKeyword, offset, pageSize);
                    break;
                default:
                    throw new IllegalArgumentException("Invalid status: " + movieStatus);
            }

            // Ajax 요청 여부 확인
            String ajaxHeader = request.getHeader("X-Requested-With");
            boolean isAjax = ajaxHeader != null && "XMLHttpRequest".equals(ajaxHeader);

            if (isAjax) {
                // JSON 응답
                response.setContentType("application/json;charset=utf-8");
                Map<String, Object> result = new HashMap<>();
                result.put("movieArray", movieArray);
                result.put("totalMovieCount", totalMovieCount);

                PrintWriter out = response.getWriter();
                ObjectMapper mapper = new ObjectMapper();
                mapper.writeValue(out, result);
                return null; // JSON 반환
            } else {
                // JSP로 포워딩
                request.setAttribute("movieArray", movieArray);
                request.setAttribute("totalMovieCount", totalMovieCount);
                return "/jsp/user/movie/movieMain.jsp";
            }
        } catch (Exception e) {
            e.printStackTrace();
            return "/jsp/user/common/404.jsp"; // 에러 페이지로 포워딩
        }
    }
}
