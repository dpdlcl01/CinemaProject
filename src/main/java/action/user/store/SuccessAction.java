package action.user.store;

import action.Action;
import org.json.JSONObject;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Base64;

public class SuccessAction implements Action {
    private static final String SECRET_KEY = "test_sk_P9BRQmyarYDmP1Mwz94NVJ07KzLN"; // ✅ Toss Secret Key

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
        System.out.println("✅ [SuccessAction 호출됨]");

        // 1️⃣ 요청에서 paymentKey 가져오기
        String paymentKey = request.getParameter("paymentKey");
        String orderId = request.getParameter("orderId");

        if (paymentKey == null || orderId == null) {
            System.out.println("🚨 [오류] 요청 파라미터가 부족함");
            response.sendRedirect("http://localhost:8081/CinemaProject/jsp/user/store/paymentFail.jsp");
            return null;
        }

        System.out.println("📌 받은 결제 키: " + paymentKey);
        System.out.println("📌 받은 주문 ID: " + orderId);

        // 2️⃣ Toss API에서 결제 정보 요청
        JSONObject tossResponse = requestTossPayment(paymentKey);

        // 3️⃣ Toss API 응답 데이터 확인
        System.out.println("📌 Toss API 응답 데이터: " + tossResponse.toString());

        // 4️⃣ 결제 데이터를 JSP에 전달
        request.setAttribute("paymentData", tossResponse);
        return "/jsp/user/store/paymentSuccess.jsp";
    }

    /**
     * ✅ Toss API에서 결제 정보를 요청하는 메서드
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
                return new JSONObject(response.toString()); // ✅ JSON 데이터 반환
            } else {
                return new JSONObject().put("error", "토스 결제 조회 실패");
            }
        } catch (Exception e) {
            e.printStackTrace();
            return new JSONObject().put("error", "서버 오류 발생");
        }
    }
}
