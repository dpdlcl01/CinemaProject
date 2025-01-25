package action.user.movie;

import action.Action;
import com.fasterxml.jackson.databind.ObjectMapper;
import mybatis.dao.user.MovieDAO;
import mybatis.vo.MovieVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

public class MovieMainAction implements Action {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {

        try {
            String offsetParam = request.getParameter("offset");
            String pageSizeParam = request.getParameter("pageSize");

            // 기본값 설정 및 유효성 검증
            int offset = offsetParam != null && !offsetParam.isEmpty() ? Integer.parseInt(offsetParam) : 0;
            int pageSize = pageSizeParam != null && !pageSizeParam.isEmpty() ? Integer.parseInt(pageSizeParam) : 20;

            String type = request.getParameter("type");
            if (type.equals("movieMain")) {
                int totalMovieCount = MovieDAO.getTotalMovieCount(); // 전체 영화 개수
                MovieVO[] movieArray = MovieDAO.getMovieList(offset, pageSize);

                if (offset == 0) {
                    request.setAttribute("movieArray", movieArray);
                    request.setAttribute("totalMovieCount", totalMovieCount); // 총 개수 추가
                    return "/jsp/user/movie/movieMain.jsp";
                } else {
                    response.setContentType("application/json;charset=utf-8");
                    try {
                        PrintWriter out = response.getWriter();
                        ObjectMapper mapper = new ObjectMapper();

                        // JSON 객체 생성
                        Map<String, Object> result = new HashMap<>();
                        result.put("movieArray", movieArray);
                        result.put("totalMovieCount", totalMovieCount);

                        mapper.writeValue(out, result); // JSON 반환
                        return null; // JSP 이동 없음
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
            }
        } catch (NumberFormatException e) {
            e.printStackTrace();

        } catch (Exception e) {
            e.printStackTrace();
        } /*else if (type.equals("pastevent")) {
            // 진행중인 이벤트 게시물의 수 반환
            int totalPastEventCount = EventDAO.getTotalPastEventCount();

            // 이벤트 목록 가져오기
            EventVO[] ar = EventDAO.getPastEventList(offset, pageSize);

            if (offset == 0) {
                // 첫 요청: 화면 경로 반환 및 데이터 설정
                request.setAttribute("totalPastEventCount", totalPastEventCount);
                request.setAttribute("pastar", ar);

                System.out.println(ar);
                System.out.println(totalPastEventCount);
                return "/jsp/user/movie/movieMain.jsp";

            } else {
                // 비동기 요청: JSON 데이터 반환
                response.setContentType("application/json;charset=utf-8");
                try {
                    PrintWriter out = response.getWriter();

                    ObjectMapper mapper = new ObjectMapper();
                    mapper.writeValue(out, ar); // JSON으로 변환하여 응답
                    return null;
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        } else if (type.equals("searchpastevent")) {
            String keyword = request.getParameter("keyword");

            int totalSearchPastEventCount = EventDAO.getSearchTotalPastEventCount(keyword);
            EventVO[] ar = EventDAO.searchPastEvent(offset, pageSize, keyword);

            if (offset == 0) {
                request.setAttribute("totalSearchPastEventCount", totalSearchPastEventCount);
                request.setAttribute("ar", ar);

                return "./jsp/user/event/searchPastEvent.jsp";

            } else {
                // 비동기 요청: JSON 데이터 반환
                response.setContentType("application/json;charset=utf-8");
                try {
                    PrintWriter out = response.getWriter();

                    ObjectMapper mapper = new ObjectMapper();
                    mapper.writeValue(out, ar); // JSON으로 변환하여 응답
                    return null;
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }*/

        return null;


/*        // 전체 영화 리스트 가져오기
        MovieVO[] movieArray = MovieDAO.getTotalMovie();

        request.setAttribute("movieArray", movieArray);

        return "/jsp/user/movie/movieMain.jsp";*/
    }
}
