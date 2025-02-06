package action.user.reservation;

import action.Action;
import mybatis.dao.ReservationPaymentDAO;
import mybatis.vo.*;
import org.json.JSONObject;
import util.SessionUtil;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Base64;

public class ReservationPaymentAction implements Action {

  private static final String SECRET_KEY = "test_sk_6bJXmgo28eNZ2KNapENX3LAnGKWx"; // Toss Secret Key

  @Override
  public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

    // 로그인 여부 확인 (필요 시)
    UserVO uservo = SessionUtil.getLoginUser(request);
    if (uservo == null) {
      return "UserController?type=login";
    }

    HttpSession session = request.getSession();

    String paymentKey = request.getParameter("paymentKey");
    String orderId = request.getParameter("orderId");
    String amount = request.getParameter("amount");

    String paymentTotal = request.getParameter("paymentTotal");
    String paymentDiscount = request.getParameter("paymentDiscount");
    String pointDiscount = request.getParameter("pointDiscount");
    String paymentFinal = request.getParameter("paymentFinal");
    String couponIdx = request.getParameter("couponIdx");

    String[] seatIdxList = (String[]) session.getAttribute("seatIdxList");
    String theaterIdx = (String) session.getAttribute("theaterIdx");
    String timetableIdx = (String) session.getAttribute("timetableIdx");
    String screenIdx = (String) session.getAttribute("screenIdx");
    String adultCountStr = (String) session.getAttribute("adultCount");
    String studentCountStr = (String) session.getAttribute("studentCount");
    String adultPriceIdx = (String) session.getAttribute("adultPriceIdx");
    String studentPriceIdx = (String) session.getAttribute("studentPriceIdx");

    if (paymentKey == null || orderId == null || amount == null) {
      System.out.println("[오류] 요청 파라미터 부족");
      String error = "결제 중 오류가 발생했습니다.";
      request.setAttribute("error", error);
      response.sendRedirect("./jsp/user/reservation/reservationPaymentFail.jsp");
      return null;
    }

    // Toss 결제 승인 요청
    JSONObject confirmResponse = confirmPayment(paymentKey, orderId, amount);
    System.out.println("[결제 승인 응답] " + confirmResponse.toString());

    if (confirmResponse.has("error")) {
      response.sendRedirect("./jsp/user/reservation/reservationPaymentFail.jsp");
      return null;
    }

    // 결제 상태 확인
    String status = confirmResponse.getString("status");
    String pstatus = status.equals("DONE") ? "0" : "1";

    // 예약 테이블 insert
    String userIdx = uservo.getUserIdx();

    String reservationStatus = "0"; // 기본값

    ReservationTableVO reservation = new ReservationTableVO();
    reservation.setUserIdx(userIdx);
    reservation.setTheaterIdx(theaterIdx);
    reservation.setScreenIdx(screenIdx);
    reservation.setTimetableIdx(timetableIdx);
    reservation.setReservationStatus(reservationStatus);

    ReservationTableVO reservationTableVO = ReservationPaymentDAO.insertReservation(reservation);
    String reservationIdx = reservationTableVO.getReservationIdx();
    System.out.println("reservationIdx:" + reservationIdx);

    if (timetableIdx != null && seatIdxList != null) {
      // 좌석 상태 업데이트
      boolean seatUpdated = ReservationPaymentDAO.updateSeatStatus(timetableIdx, seatIdxList);

      if (seatUpdated) {
        // 방금 변경된 seatStatusIdx 가져오기
        String[] updatedSeatStatusIdxList = ReservationPaymentDAO.getUpdatedSeatStatusIdx(timetableIdx, seatIdxList);
        System.out.println("updatedSeatStatusIdxList:" + updatedSeatStatusIdxList.length);

        if (updatedSeatStatusIdxList.length > 0) {
          int adultCount = Integer.parseInt(adultCountStr);
          int studentCount = Integer.parseInt(studentCountStr);

          // 예약 좌석 매핑 테이블에 insert
          boolean mappingInsert = ReservationPaymentDAO.insertReservationSeatMapping(reservationIdx, seatIdxList, updatedSeatStatusIdxList, adultCount, studentCount, adultPriceIdx, studentPriceIdx);
        }
      }
    } else {
      System.out.println("좌석리스트 또는 타임테이블 존재하지 않음");
    }

    // NULL 또는 0이면 기본값 처리
    if (paymentDiscount == null || paymentDiscount.trim().isEmpty() || "0".equals(paymentDiscount)) {
      paymentDiscount = "0";
    }
    if (pointDiscount == null || pointDiscount.trim().isEmpty() || "0".equals(pointDiscount)) {
      pointDiscount = "0";
    }

    // 결제 정보 저장 (결제 테이블에 insert)
    ReservationPaymentVO reservationPaymentVO = new ReservationPaymentVO();

    reservationPaymentVO.setUserIdx(userIdx);
    reservationPaymentVO.setReservationIdx(reservationIdx);
    reservationPaymentVO.setPaymentMethod(confirmResponse.getString("method"));
    reservationPaymentVO.setPaymentTotal(paymentTotal);
    reservationPaymentVO.setPaymentDiscount(paymentDiscount);
    reservationPaymentVO.setPaymentFinal(paymentFinal);
    reservationPaymentVO.setPaymentTransactionId(orderId);
    reservationPaymentVO.setPaymentStatus(pstatus);

    boolean paymentSaved = ReservationPaymentDAO.insertPayment(reservationPaymentVO, paymentDiscount);

    String paymentIdx = reservationPaymentVO.getPaymentIdx();

    // 포인트 사용시 감소, 사용내역 추가, 포인트 결제금액의 5% 적립
    if (Integer.parseInt(pointDiscount) > 0) {
      System.out.println("포인트 사용 ! pointDiscount:" + pointDiscount);

      System.out.println("pointCount:" + pointDiscount);

      int finalPrice = Integer.parseInt(paymentFinal);

      double getPointValue = finalPrice * 0.05;

      // 유저 포인트 감소
      boolean pointUpdated = ReservationPaymentDAO.updateUserPointUsage(userIdx, pointDiscount, getPointValue);
      System.out.println("pointUpdated:" + pointUpdated);

      if (pointUpdated) {
        ReservationPointVO reservationPointVO = new ReservationPointVO();
        reservationPointVO.setUserIdx(userIdx);
        reservationPointVO.setPaymentIdx(paymentIdx);
        reservationPointVO.setPointValue(pointDiscount);

        ReservationPaymentDAO.insertPointUsage(reservationPointVO);
        System.out.println(reservationPointVO.getUserIdx());
      }
    }

    if (couponIdx != null && !couponIdx.trim().isEmpty() && !"0".equals(couponIdx) && !"null".equals(couponIdx)) {
      // 쿠폰 상태 업데이트 실행
      boolean couponUpdated = ReservationPaymentDAO.updateCouponStatus(couponIdx, userIdx);
      System.out.println("couponUpdated:" + couponUpdated);
    }

    // 예매내역 보여주기
    ReservationDetailVO reservationDetailVO = new ReservationDetailVO();
    reservationDetailVO = ReservationPaymentDAO.getReservationDetail(userIdx, reservationIdx);

    // JSP에 결제 정보 전달
    request.setAttribute("vo", reservationDetailVO);
    request.setAttribute("paymentDiscount", paymentDiscount);
    request.setAttribute("paymentFinal", paymentFinal);

    return "./jsp/user/reservation/reservationPaymentSuccess.jsp";
  }

  /**
   * Toss 결제 확정(Confirm API) 호출
   */
  private JSONObject confirmPayment(String paymentKey, String orderId, String amount) {
    try {
      URL url = new URL("https://api.tosspayments.com/v1/payments/confirm");
      HttpURLConnection conn = (HttpURLConnection) url.openConnection();
      conn.setRequestMethod("POST");
      conn.setRequestProperty("Authorization", "Basic " + Base64.getEncoder().encodeToString((SECRET_KEY + ":").getBytes()));
      conn.setRequestProperty("Content-Type", "application/json");
      conn.setDoOutput(true);

      // 요청 바디 생성
      JSONObject requestBody = new JSONObject();
      requestBody.put("paymentKey", paymentKey);
      requestBody.put("orderId", orderId);
      requestBody.put("amount", Integer.parseInt(amount));

      // 요청 전송
      try (OutputStream os = conn.getOutputStream()) {
        os.write(requestBody.toString().getBytes("utf-8"));
      }

      // 응답 코드 확인
      int responseCode = conn.getResponseCode();
      if (responseCode == 200) {
        JSONObject jsonResponse = getJsonResponse(conn);
        System.out.println("[결제 승인 응답] " + jsonResponse.toString());

        return jsonResponse;
      } else {
        return getJsonErrorResponse(conn);
      }
    } catch (Exception e) {
      e.printStackTrace();
      return new JSONObject().put("error", "서버 오류 발생");
    }
  }

  /**
   * API 응답을 JSON 객체로 변환하는 공통 메서드
   */
  private JSONObject getJsonResponse(HttpURLConnection conn) throws IOException {
    try (BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"))) {
      StringBuilder response = new StringBuilder();
      String inputLine;
      while ((inputLine = in.readLine()) != null) {
        response.append(inputLine);
      }
      return new JSONObject(response.toString());
    }
  }

  /**
   * API 오류 응답을 JSON 객체로 변환하는 공통 메서드
   */
  private JSONObject getJsonErrorResponse(HttpURLConnection conn) throws IOException {
    try (BufferedReader in = new BufferedReader(new InputStreamReader(conn.getErrorStream(), "UTF-8"))) {
      StringBuilder errorResponse = new StringBuilder();
      String inputLine;
      while ((inputLine = in.readLine()) != null) {
        errorResponse.append(inputLine);
      }
      return new JSONObject(errorResponse.toString());
    }
  }
}