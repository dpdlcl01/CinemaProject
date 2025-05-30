package action.user.theater;

import action.Action;
import mybatis.dao.TheaterDAO;
import mybatis.vo.EventVO;
import mybatis.vo.TheaterVO;
import mybatis.vo.UserVO;
import util.SessionUtil;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import java.util.Map;

public class TheaterMainAction implements Action {


    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

        UserVO uservo = SessionUtil.getLoginUser(request);
        if(uservo != null){
            String userIdx = uservo.getUserIdx();  // userVO 객체에서 userIdx를 가져옴

            // 선호 극장 이름 가져오기
            List<Map<String, Object>> favoriteTheater = TheaterDAO.getFavorite(userIdx);
            if (favoriteTheater != null) {
                // 선호 극장 이름을 request에 저장
                request.setAttribute("favoriteTheater", favoriteTheater);
            }
        }

        // 전체극장 정보 가져오기 //
        TheaterVO[] theaterVO = TheaterDAO.getTheaterInfo();
        if (theaterVO.length > 0) {
            // request에 극장 정보 저장
            request.setAttribute("theater", theaterVO);
        }

        EventVO[] eventVO = TheaterDAO.getEvent();

        if (eventVO.length > 0) {
            request.setAttribute("event", eventVO);
        }

        EventVO[] notice = TheaterDAO.getNotice();
        if (notice.length > 0) {
            request.setAttribute("notice", notice);
        }

        // 포워딩할 JSP 페이지 반환
        return "/jsp/user/theater/theaterMain.jsp";
    }

}
