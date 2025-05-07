package action.user.movie;

import action.Action;
import mybatis.dao.FavoriteMovieDAO;
import mybatis.dao.MovieDAO;
import mybatis.vo.UserVO;
import util.SessionUtil;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class MovieLikesAction implements Action {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

        // 로그인 사용자 확인
        UserVO uservo = SessionUtil.getLoginUser(request);
        if (uservo == null) {
            return null; // 이미 리다이렉트됨
        }

        // JSON 응답 설정
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();

        String userIdx = uservo.getUserIdx();
        String movieIdx = request.getParameter("movieIdx");

        // 이미 찜한 영화인지 확인
        boolean isFavorite = FavoriteMovieDAO.isFavorite(movieIdx, userIdx);

        String message;
        if (isFavorite) {
            // 찜하기 취소
            FavoriteMovieDAO.removeFavorite(userIdx, movieIdx);
            FavoriteMovieDAO.downMovieLikes(movieIdx); // 좋아요 수 감소
            message = "찜하기가 취소되었습니다.";
        } else {
            // 찜하기 추가
            FavoriteMovieDAO.addFavorite(userIdx, movieIdx);
            FavoriteMovieDAO.upMovieLikes(movieIdx); // 좋아요 수 증가
            message = "찜하기가 완료되었습니다.";
        }

        // 새로운 좋아요 수 가져오기
        int newLikeCount = FavoriteMovieDAO.getMovieLikes(movieIdx);

        // 최종 JSON 응답
        out.write("{\"success\": true, \"liked\": " + !isFavorite +
                ", \"newLikeCount\": " + newLikeCount +
                ", \"movieIdx\": \"" + movieIdx + "\"" +
                ", \"message\": \"" + message + "\"}");

        return null; // 비동기 요청이므로 JSP로 포워딩하지 않음
    }
}
