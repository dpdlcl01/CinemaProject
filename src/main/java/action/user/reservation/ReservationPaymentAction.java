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
import java.util.UUID;

public class ReservationPaymentAction implements Action {

  private static final String SECRET_KEY = "test_sk_6bJXmgo28eNZ2KNapENX3LAnGKWx"; // Toss Secret Key

  @Override
  public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

    // 로그인 여부 확인 (필요 시)
    UserVO uservo = SessionUtil.getLoginUser(request);
    if (uservo == null) {
      return "UserController?type=login";
    }

    System.out.println("유저이메일"+uservo.getUserEmail());
    System.out.println("세션유저idx"+uservo.getUserIdx());

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
    String timetableStartTime = (String) session.getAttribute("timetableStartTime");
    String movieIdx = (String) session.getAttribute("movieIdx");
    String type = request.getParameter("type");

    if (type.equals("reservationPaymentFail")) {
      return "./jsp/user/reservation/reservationPaymentFail.jsp";
    }

    // 결제 최종 금액이 0원일 경우 Toss API 호출 생략
    JSONObject confirmResponse = new JSONObject();
    String pstatus = "0"; // 기본값 (결제 성공)


    if (!"0".equals(paymentFinal)) {
      if (paymentKey == null || orderId == null || amount == null) {
        System.out.println("[오류] 요청 파라미터 부족");
        response.sendRedirect("./jsp/user/reservation/reservationPaymentFail.jsp");
        return null;
      }

      // Toss 결제 승인 요청
      confirmResponse = confirmPayment(paymentKey, orderId, amount);
      System.out.println("[결제 승인 응답] " + confirmResponse.toString());

      if (confirmResponse.has("error")) {
        response.sendRedirect("./jsp/user/reservation/reservationPaymentFail.jsp");
        return null;
      }

      // 결제 상태 확인
      String status = confirmResponse.getString("status");
      pstatus = status.equals("DONE") ? "0" : "1";
    } else {
      System.out.println("[INFO] 결제 금액이 0원이므로 Toss API 호출 없이 결제 성공 처리");
      confirmResponse.put("method", "FREE"); // 무료 결제 처리
    }

    // 예약 테이블 insert
    String userIdx = uservo.getUserIdx();

    String reservationStatus = "0"; // 기본값

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