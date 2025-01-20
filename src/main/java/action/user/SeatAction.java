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
        user.setUserEmail("kimcs@example.com");
        user.setUserGrade("Basic");

        // 세션에 저장
        session.setAttribute("loggedInUser", user);

        // 임시 데이터 설정
        String screenIdx = "1"; // 임시로 설정된 상영관 ID
        String timetableIdx = "101"; // 임시로 설정된 상영 시간표 ID
        String screenType = "1"; // COMFORT 상영관 유형
        String ageGroup = "1"; // 성인
        String dayOfWeek = "1"; // 주중
        String timeOfDay = "2"; // 조조 및 심야

        // 입력값 검증
        if (screenIdx == null || timetableIdx == null) {
            return "/error/missingParams.jsp";
        }

        // 사용 가능한 좌석 조회
        SeatVO[] availableSeats = SeatDAO.getAvailableSeats(screenIdx, timetableIdx, screenType, ageGroup, dayOfWeek, timeOfDay);

        // request에 데이터 저장
        request.setAttribute("availableSeats", availableSeats);

        // 좌석 선택 화면으로 이동
        return "/user/seatSelection.jsp";
    }
}
