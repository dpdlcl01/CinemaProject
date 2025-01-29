package action.user.store;

import action.Action;
import mybatis.dao.PaymentDAO;
import mybatis.vo.PaymentVO;
import mybatis.vo.UserVO;
import org.json.JSONObject;

import util.SessionUtil;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;

import java.util.Base64;

public class SuccessAction implements Action {
    private static final String SECRET_KEY = "test_sk_P9BRQmyarYDmP1Mwz94NVJ07KzLN"; // Toss Secret Key

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
        System.out.println("[SuccessAction 호출됨]");

        // 요청에서 paymentKey, orderId, amount 가져오기
        String paymentKey = request.getParameter("paymentKey");
        String orderId = request.getParameter("orderId");
        String amount = request.getParameter("amount"); // JSP에서 금액을 전달받아야 함
        String pIdx = request.getParameter("pIdx");


        if (paymentKey == null || orderId == null || amount == null) {
            System.out.println("[오류] 요청 파라미터가 부족함");
            response.sendRedirect("http://localhost:8081/CinemaProject/jsp/user/store/paymentFail.jsp");
            return null;
        }


        // Toss API에서 결제 정보 요청
        JSONObject tossResponse = requestTossPayment(paymentKey);


        //  결제 확정 API 호출
        JSONObject confirmResponse = confirmPayment(paymentKey, orderId, amount);


        String status = confirmResponse.getString("status");

        System.out.println(status);
        String pstatus;
        if(status.equals("DONE")){
            pstatus="0";
        }else{
            pstatus="1";
        }

        PaymentVO pvo = new PaymentVO();
        UserVO uservo = SessionUtil.getLoginUser(request);
        String userIdx = uservo.getUserIdx();
        String paymentType;
        if (pIdx != null && !pIdx.trim().isEmpty()) {
            paymentType = "2";
        } else {
            paymentType = "1";
        }

        pvo.setProductIdx(pIdx);
        pvo.setUserIdx(userIdx);
        pvo.setPaymentType(paymentType);
        pvo.setPaymentTotal(String.valueOf(confirmResponse.getInt("totalAmount")));
        pvo.setPaymentFinal(String.valueOf(confirmResponse.getInt("totalAmount")));
        pvo.setPaymentTransactionId(confirmResponse.getString("orderId"));
        pvo.setPaymentMethod(confirmResponse.getString("method"));
        pvo.setPaymentStatus(pstatus);/*던일때 받아서 바꾸기 */
        /*pvo.setPaymentStatus(confirmResponse.getString("status"));*/

        int cnt=PaymentDAO.insertPayment(pvo);


        /*String paymentDiscount = confirmResponse.getString(""); 할인 생기면 여기서 해결하자*/

        /*여기서ㅏ DAO 호출해서 DB에 저장하자.*/


        ////////////////////////////////////

        //  결제 성공 시 JSP로 데이터 전달
        if (!confirmResponse.has("error")) {
            request.setAttribute("paymentData", confirmResponse);
            return "/jsp/user/store/paymentSuccess.jsp";
        } else {
            response.sendRedirect("http://localhost:8081/CinemaProject/jsp/user/store/paymentFail.jsp");
            return null;
        }
    }

    /**
     *  Toss API에서 결제 정보를 요청하는 메서드
     */
    private JSONObject requestTossPayment(String paymentKey) {
        try {
            URL url = new URL("https://api.tosspayments.com/v1/payments/" + paymentKey);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");
            conn.setRequestProperty("Authorization", "Basic " + Base64.getEncoder().encodeToString((SECRET_KEY + ":").getBytes()));
            conn.setRequestProperty("Content-Type", "application/json");

            int responseCode = conn.getResponseCode();
            if (responseCode == 200) {
                BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
                String inputLine;
                StringBuilder response = new StringBuilder();
                while ((inputLine = in.readLine()) != null) {
                    response.append(inputLine);
                }
                in.close();
                return new JSONObject(response.toString()); // JSON 데이터 반환
            } else {
                return new JSONObject().put("error", "토스 결제 조회 실패");
            }
        } catch (Exception e) {
            e.printStackTrace();
            return new JSONObject().put("error", "서버 오류 발생");
        }
    }

    /**
     *  Toss 결제 확정(Confirm API) 호출
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
            requestBody.put("amount", Integer.parseInt(amount)); // 숫자로 변환해서 전송

            // 요청 전송
            try (OutputStream os = conn.getOutputStream()) {
                byte[] input = requestBody.toString().getBytes("utf-8");
                os.write(input, 0, input.length);
            }

            // 응답 코드 확인
            int responseCode = conn.getResponseCode();
            if (responseCode == 200) {
                BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8")); //  UTF-8 적용
                StringBuilder response = new StringBuilder();
                String inputLine;
                while ((inputLine = in.readLine()) != null) {
                    response.append(inputLine);
                }
                in.close();
                return new JSONObject(response.toString()); //  JSON 반환
            } else {
                BufferedReader in = new BufferedReader(new InputStreamReader(conn.getErrorStream(), "UTF-8")); //  UTF-8 적용
                StringBuilder errorResponse = new StringBuilder();
                String inputLine;
                while ((inputLine = in.readLine()) != null) {
                    errorResponse.append(inputLine);
                }
                in.close();

                return new JSONObject(errorResponse.toString());
            }
        } catch (Exception e) {
            e.printStackTrace();
            return new JSONObject().put("error", "서버 오류 발생");
        }
    }
}
