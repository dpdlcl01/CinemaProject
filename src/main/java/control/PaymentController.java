package control;

// Java 기본 I/O 관련 (입출력, 네트워크 요청)
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Base64;

// Servlet 관련 (HTTP 요청/응답)
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// JSON 데이터 처리 (org.json 라이브러리)
import org.json.JSONObject;

// MyBatis 관련 (SQL 세션 및 매퍼 인터페이스)
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;



@WebServlet("/PaymentController")
public class PaymentController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String SECRET_KEY = "test_sk_P9BRQmyarYDmP1Mwz94NVJ07KzLN";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("doPost");
        BufferedReader reader = new BufferedReader(new InputStreamReader(request.getInputStream(), "UTF-8"));
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = reader.readLine()) != null) {
            sb.append(line);
        }

        JSONObject requestData = new JSONObject(sb.toString());
        String paymentKey = requestData.getString("paymentKey");
        String orderId = requestData.getString("orderId");
        System.out.println("📌 클라이언트에서 받은 JSON 데이터: " + requestData.toString());
        JSONObject tossResponse = requestTossPayment(paymentKey);
        System.out.println(tossResponse.toString());

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(tossResponse.toString());
    }

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
                return new JSONObject(response.toString());
            } else {
                return new JSONObject().put("error", "토스 결제 조회 실패");
            }
        } catch (Exception e) {
            e.printStackTrace();
            return new JSONObject().put("error", "서버 오류 발생");
        }
    }
}
