package action.admin.movie;

import action.Action;
import com.fasterxml.jackson.databind.ObjectMapper;
import mybatis.dao.LogDAO;
import mybatis.dao.MovieDAO;
import mybatis.vo.AdminVO;
import mybatis.vo.MovieVO;
import util.SessionUtil;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
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

            // 1. 기존 데이터 조회 (oldMovieData)
            MovieVO oldMovieData = MovieDAO.getMovieByIdx(movieIdx);

            // 2. 새로운 데이터 구성 및 업데이트 실행
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

            // 3. 업데이트 성공 시 로그 기록
            if (isUpdated) {

                AdminVO adminvo = SessionUtil.getLoginAdmin(request);
                if(adminvo == null){
                    return "AdminController?type=admin";
                }
                // 세션의 adminvo에서 idx값 얻기 - 로그 테이블에 관리자 idx 저장시
                String adminIdx = adminvo.getAdminIdx();

                String logType = "0"; // 관리자 관련 로그 0
                String logTarget = "movieIdx " + movieIdx;
                String logInfo = "영화 정보 수정";

                // 4. 이전 값과 현재 값 준비
                //String logPreValue = new ObjectMapper().writeValueAsString(oldMovieData);
                String logPreValue = "logPreValue 데이터타입 TEXT로 변경하기";
                String logCurValue = String.format(
                        "장르: %s, 상영 시간: %s, 등급: %s, 개봉일: %s, 감독: %s, 출연 배우: %s, 정보: %s",
                        movieGenre, movieTime, movieGrade, movieDate, movieDirector, movieActors, movieInfo
                );

                // 5. 로그 기록
                LogDAO.insertLog(logType, adminIdx, logTarget, logInfo, logPreValue, logCurValue);

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
