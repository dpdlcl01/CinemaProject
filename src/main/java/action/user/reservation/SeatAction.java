package action.user.reservation;

import action.Action;
import mybatis.dao.ReservationDAO;
import mybatis.dao.SeatDAO;
import mybatis.vo.*;
import util.SessionUtil;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class SeatAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

        // 로그인 여부 확인 및 사용자 정보 가져오기
        UserVO uservo = SessionUtil.getLoginUser(request);
        if (uservo == null) {
            return "UserController?type=main";
        }

        // 영화, 극장, 시간표 정보를 가져오기
        String movieIdx = request.getParameter("movieIdx");
        String theaterIdx = request.getParameter("theaterIdx");
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

        if (screenType == 1) {
            request.setAttribute("movieType", "COMFORT");
        } else if (screenType == 2) {
            request.setAttribute("movieType", "VIP");
        } else if (screenType == 3) {
            request.setAttribute("movieType", "DOLBY");
        } else if (screenType == 4) {
            request.setAttribute("movieType", "4DX");
        } else if (screenType == 5) {
            request.setAttribute("movieType", "IMAX");
        }

        request.setAttribute("movieIdx", movieIdx);
        request.setAttribute("theaterIdx", theaterIdx);
        request.setAttribute("screenIdx", screenIdx);
        request.setAttribute("timetableIdx", timetableIdx);
        request.setAttribute("screenType", screenType);
        request.setAttribute("isMorning", isMorning);
        request.setAttribute("isWeekend", isWeekend);

        System.out.println("SeatAction 에서의 결과: movieIdx: " + movieIdx +
                ", theaterIdx: " + theaterIdx +
                ", screenIdx: " + screenIdx +
                ", timetableIdx: " + timetableIdx +
                ", screenType: " + screenType +
                ", isMorning: " + isMorning +
                ", isWeekend: " + isWeekend );

        // DAO를 통해 좌석 데이터 가져오기
        SeatVO[] availableSeats = SeatDAO.getAllSeats(screenIdx);
        if (availableSeats != null) {
            for (SeatVO seat : availableSeats) {
                System.out.println("Seat: " + seat.getSeatNumber() + ", Status: " + seat.getSeatStatus());
            }
        }
        request.setAttribute("availableSeats", availableSeats);

        // 영화 상세 정보 가져오기
        MovieVO movieVO = ReservationDAO.movieDetailList(movieIdx);
        request.setAttribute("movieVO", movieVO);
        System.out.println(movieVO.getMovieIdx());

        // 극장 상세 정보 가져오기
        TheaterVO theaterVO = ReservationDAO.theaterDetailList(theaterIdx);
        request.setAttribute("theaterVO", theaterVO);

        // 영화 상영시간표 상세 정보 가져오기
        TimetableVO timetableVO = ReservationDAO.timetableDetailList(timetableIdx);
        if (timetableVO != null) {
            SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            SimpleDateFormat outputDateFormat = new SimpleDateFormat("yyyy-MM-dd (E)"); // 2025-01-29 (수)
            SimpleDateFormat outputTimeFormat = new SimpleDateFormat("HH:mm"); // 09:00 ~ 10:54

            try {
                Date startTime = inputFormat.parse(timetableVO.getTimetableStartTime());
                Date endTime = inputFormat.parse(timetableVO.getTimetableEndTime());

                request.setAttribute("formattedDate", outputDateFormat.format(startTime)); // 날짜
                request.setAttribute("formattedStartTime", outputTimeFormat.format(startTime)); // 시작 시간
                request.setAttribute("formattedEndTime", outputTimeFormat.format(endTime)); // 종료 시간
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }
        request.setAttribute("timetableVO", timetableVO);

        // 값 변환 (주중=1, 주말=2)
        int dayOfWeek = "true".equals(isWeekend) ? 2 : 1;
        // 값 변환 (조조 및 심야=1, 일반=2)
        int timeOfDay = "1".equals(isMorning) ? 2 : 1;

        // 영화 가격 조회 추가
        int adultPrice = SeatDAO.getSeatPrice(screenType.toString(), "1", dayOfWeek, timeOfDay);
        int studentPrice = SeatDAO.getSeatPrice(screenType.toString(), "2", dayOfWeek, timeOfDay);

        // JSP에서 사용하도록 request에 가격 정보 추가
        request.setAttribute("adultPrice", adultPrice);
        request.setAttribute("studentPrice", studentPrice);

        // 좌석 선택 화면으로 이동
        return "./jsp/user/reservation/reservationSeat.jsp";
    }
}