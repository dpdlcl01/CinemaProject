package action.user.reservation;

import action.Action;
import com.fasterxml.jackson.databind.ObjectMapper;
import mybatis.dao.ReservationDAO;
import mybatis.dao.ReservationPaymentDAO;
import mybatis.dao.SeatDAO;
import mybatis.vo.*;
import util.SessionUtil;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

public class SeatAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

        // 로그인 여부 확인 및 사용자 정보 가져오기
        UserVO uservo = SessionUtil.getLoginUser(request);
        if (uservo == null) {
            return "UserController?type=";
        }

        // 만약 type 파라미터가 "reserveSeats"이면 좌석 예약 insert 처리 후 payment 페이지로 포워딩
        String type = request.getParameter("type");
        if ("reservationPayment".equals(type)) {
            // 폼 전송 방식으로 전달된 파라미터에서 timetableIdx와 seatIdxList 읽기
            String timetableIdx = request.getParameter("timetableIdx");
            String[] seatIdxStrs = request.getParameterValues("seatIdxList");
            int successCount = 0;
            if (seatIdxStrs != null) {
                for (String seatIdxStr : seatIdxStrs) {
                    try {
                        int seatIdx = Integer.parseInt(seatIdxStr);
                        int result = SeatDAO.insertSeatStatus(timetableIdx, seatIdx);
                        if (result > 0) {
                            System.out.println("좌석 예약 성공: timetableIdx=" + timetableIdx + ", seatIdx=" + seatIdx);
                            successCount++;
                        } else {
                            System.out.println("좌석 예약 실패: timetableIdx=" + timetableIdx + ", seatIdx=" + seatIdx);
                        }
                    } catch (NumberFormatException e) {
                        System.out.println("seatIdx 파싱 오류: " + seatIdxStr);
                    }
                }
            } else {
                System.out.println("선택된 좌석이 없습니다.");
            }

            // 유저의 쿠폰 리스트
            List<CouponVO> couponList = ReservationPaymentDAO.userCouponList(uservo.getUserIdx());

            // 예약 후 timetableIdx와 seatIdxList 값을 request에 담아 결제 페이지로 포워딩
            request.setAttribute("timetableIdx", timetableIdx);
            request.setAttribute("seatIdxList", seatIdxStrs);

            // 기본 정보들
            request.setAttribute("uservo", uservo);
            request.setAttribute("couponList", couponList);
            request.setAttribute("movieTitle", request.getParameter("movieTitle"));
            request.setAttribute("theaterName", request.getParameter("theaterName"));
            request.setAttribute("formattedDate", request.getParameter("formattedDate"));
            request.setAttribute("formattedStartTime", request.getParameter("formattedStartTime"));
            request.setAttribute("formattedEndTime", request.getParameter("formattedEndTime"));
            request.setAttribute("screenIdx", request.getParameter("screenIdx"));
            request.setAttribute("movieType", request.getParameter("movieType"));
            request.setAttribute("moviePosterUrl", request.getParameter("moviePosterUrl"));
            request.setAttribute("theaterIdx", request.getParameter("theaterIdx"));
            System.out.println("theaterIdx=" + request.getParameter("theaterIdx"));
            request.setAttribute("adultPriceIdx", request.getParameter("adultPriceIdx"));
            request.setAttribute("studentPriceIdx", request.getParameter("studentPriceIdx"));
            request.setAttribute("adultCount", request.getParameter("adultCount"));
            request.setAttribute("studentCount", request.getParameter("studentCount"));
            request.setAttribute("totalAmount", request.getParameter("totalAmount"));

            // 결제 페이지로 포워딩 (여기서는 payment.jsp로 직접 이동하는 예)
            return "./jsp/user/reservation/payment.jsp";
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
        SeatVO[] availableSeats = SeatDAO.getAllSeats(screenIdx, timetableIdx);
        if (availableSeats != null) {
            for (SeatVO seat : availableSeats) {
                System.out.println("Seat: " + seat.getSeatNumber() + ", ID: " + seat.getSeatIdx() + ", Status: " + seat.getSeatStatus());
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
        PriceVO priceVO = new PriceVO();
        priceVO = SeatDAO.getSeatPrice(screenType.toString(), "1", dayOfWeek, timeOfDay);
        int adultPrice = Integer.parseInt(priceVO.getSeatPrice());
        int adultPriceIdx = Integer.parseInt(priceVO.getPriceIdx());

        priceVO = SeatDAO.getSeatPrice(screenType.toString(), "2", dayOfWeek, timeOfDay);
        int studentPrice = Integer.parseInt(priceVO.getSeatPrice());
        int studentPriceIdx = Integer.parseInt(priceVO.getPriceIdx());

        // JSP에서 사용하도록 request에 가격 정보 추가
        request.setAttribute("adultPrice", adultPrice);
        request.setAttribute("adultPriceIdx", adultPriceIdx);
        request.setAttribute("studentPrice", studentPrice);
        request.setAttribute("studentPriceIdx", studentPriceIdx);

        // 좌석 선택 화면으로 이동
        return "./jsp/user/reservation/reservationSeat.jsp";
    }
}
