package action.admin.movie;

import action.Action;
import com.fasterxml.jackson.databind.ObjectMapper;
import mybatis.dao.MovieDAO;
import mybatis.vo.MovieVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class MovieInfoDetailAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

        String type = request.getParameter("type");

        // 타입에 따라 분기 처리
        if ("getMovieInfo".equals(type)) {
            String movieIdx = request.getParameter("movieIdx");

            MovieVO mvo = MovieDAO.getMovieByIdx(movieIdx);

            // Jackson을 사용하여 JSON 변환
            ObjectMapper mapper = new ObjectMapper();
            String json = mapper.writeValueAsString(mvo);

            // 응답 헤더 및 JSON 전송 설정
            response.setContentType("application/json; charset=UTF-8");
            response.getWriter().write(json);

            return null;  // 비동기 요청이므로 JSP로 포워딩하지 않음

        } else if ("updateMovieInfo".equals(type)) {
            // 폼 데이터 읽기
            String movieIdx = request.getParameter("movieIdx");
            String movieGenre = request.getParameter("movieGenre");
            String movieTime = request.getParameter("movieTime");
            String movieGrade = request.getParameter("movieGrade");
            String movieDate = request.getParameter("movieDate");
            String movieDirector = request.getParameter("movieDirector");
            String movieActors = request.getParameter("movieActors");
            String movieInfo = request.getParameter("movieInfo");



            // DB 업데이트 실행
            boolean isUpdated = MovieDAO.updateMovieInfo(movieIdx, movieGenre, movieTime, movieGrade,
                    movieDate, movieDirector, movieActors, movieInfo);

            // 응답 전송
            if (isUpdated) {
                response.setStatus(HttpServletResponse.SC_OK);
                response.getWriter().write("{\"message\": \"Movie updated successfully\"}");
            } else {
                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                response.getWriter().write("{\"error\": \"Failed to update movie\"}");
            }
        }

        return null;
    }

}
