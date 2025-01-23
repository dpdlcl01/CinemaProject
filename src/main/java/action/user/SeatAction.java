package action.user;

import action.Action;
import mybatis.dao.SeatDAO;
import mybatis.vo.SeatVO;
import mybatis.vo.UserVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class SeatAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        // 사용자 로그인 성공 시
        HttpSession session = request.getSession();
        UserVO user = new UserVO();

        // 로그인 정보를 세팅
        user.setUserIdx("1");
        user.setUserName("김철수");
        user.setUserId("1111");

        // 세션에 저장
        session.setAttribute("loggedInUser", user);

        // 영화, 극장, 시간표 정보를 가져오기
        String movieIdx = request.getParameter("movieIdx");
        String screenIdx = request.getParameter("screenIdx");
        String timetableIdx = request.getParameter("timetableIdx");
        String screenTypeParam = request.getParameter("screenType");
        String isMorning = request.getParameter("isMorning");
        String isWeekend = request.getParameter("isWeekend");

        Integer screenType = null;
        if (screenTypeParam != null) {
            try {
                screenType = Integer.parseInt(screenTypeParam);
            } catch (NumberFormatException e) {
                screenType = 1; // 기본값
            }
        }

        request.setAttribute("movieIdx", movieIdx);
        request.setAttribute("screenIdx", screenIdx);
        request.setAttribute("timetableIdx", timetableIdx);
        request.setAttribute("screenType", screenType); // screenType 값 설정
        request.setAttribute("isMorning", isMorning);
        request.setAttribute("isWeekend", isWeekend);

        System.out.println("SeatAction 에서의 결과: movieIdx: " + movieIdx +
                ", screenIdx: " + screenIdx +
                ", timetableIdx: " + timetableIdx +
                ", screenType: " + screenType +
                ", isMorning: " + isMorning +
                ", isWeekend: " + isWeekend );

        // 좌석 선택 화면으로 이동
        return "./jsp/user/reservation/reservationSeat.jsp";
    }
}
