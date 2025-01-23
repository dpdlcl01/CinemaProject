package action.user.theater;

import action.Action;
import dao.TheaterDAO;
import vo.TheaterVO;
import vo.UserVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

public class TheaterMainAction implements Action {


    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {


        // 세션에서 userVO 객체 가져오기
        HttpSession session = request.getSession();
        UserVO user = (UserVO) session.getAttribute("user");

        if (user != null) {
            String userIdx = user.getUserIdx();  // userVO 객체에서 userIdx를 가져옴
//            System.out.println("userIdx: " + userIdx);

            // 선호 극장 이름 가져오기
            List<Map<String, Object>> favoriteTheater = TheaterDAO.getFavorite(userIdx);
//            System.out.println("favoriteTheater: " + favoriteTheater);
            if (favoriteTheater != null) {
                // 선호 극장 이름을 request에 저장
                request.setAttribute("favoriteTheater", favoriteTheater);
            }
        }

// 전체극장 정보 가져오기 //
        TheaterVO[] theaterVO = TheaterDAO.getTheaterInfo();

        if (theaterVO != null) {
            // request에 극장 정보 저장
            request.setAttribute("theater", theaterVO);
        }

        // 포워딩할 JSP 페이지 반환
        return "/jsp/user/theater/theaterMain.jsp";
    }

}
