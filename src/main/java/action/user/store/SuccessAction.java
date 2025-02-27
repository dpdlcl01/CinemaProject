package action.user.store;

import action.Action;
import mybatis.dao.CouponDAO;
import mybatis.dao.PaymentDAO;
import mybatis.dao.PointDAO;
import mybatis.dao.ProductDAO;
import mybatis.vo.PaymentVO;
import mybatis.vo.PointVO;
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

        // 요청에서 paymentKey, orderId, amount 가져오기
        String paymentKey = request.getParameter("paymentKey");
        String orderId = request.getParameter("orderId");
        String amount = request.getParameter("amount"); // JSP에서 금액을 전달받아야 함
        String pIdx = request.getParameter("pIdx");
        String totalDiscount = request.getParameter("totalDiscount"); /*총 할인값*/
        String couponDiscount = request.getParameter("couponDiscount"); /*쿠폰할인값*/
        String enteredPoints = request.getParameter("enteredPoints"); /*포인트 할인값*/
        String couponIdx =request.getParameter("couponIdx");

        /*요청객체로 넘어온 이미지 이름 퀀트를 받아내자*/
        String quant = request.getParameter("quant");
        String img = request.getParameter("image");


        UserVO uservo = SessionUtil.getLoginUser(request);
        String userIdx = uservo.getUserIdx();

    /*   결제를 하고 난 뒤 퀀트의 수만큼 숫자를 줄이자
         프로덕트DAO안에서 quant와 pIdx를 가지고 퀀트만큼 숫자 줄이기 1번
         만약 남은 productStock이 0이되면 productStatus가 1이 되는 로직을 짜자*/
        int updateCnt=ProductDAO.updateProductStock(pIdx,quant);


       /*  결제를 할 때 할인금액을 적고 쿠폰을 사용하면 해당 idx에서 쿠폰을 사용완료 상태로 변경하자
        */
        if(!couponIdx.equals("0")){
            int updateCoupon= CouponDAO.updateCoupon(userIdx,couponIdx);
        }



        System.out.println("totalDiscount"+totalDiscount);
        System.out.println("couponDiscount"+couponDiscount);
        System.out.println("enteredPoints"+enteredPoints);
        System.out.println("couponIdx"+couponIdx);


        if (paymentKey == null || orderId == null || amount == null) {
            System.out.println("[오류] 요청 파라미터가 부족함");
            response.sendRedirect("http://localhost:8081/CinemaProject/jsp/user/store/paymentFail.jsp");
            return null;
        }


        // Toss API에서 결제 정보 요청
        JSONObject tossResponse = requestTossPayment(paymentKey);


        //  결제 확정 API 호출
        JSONObject confirmResponse = confirmPayment(paymentKey, orderId, amount);
        System.out.println(confirmResponse.toString());

        String status = confirmResponse.getString("status");

        System.out.println(status);
        String pstatus;
        if(status.equals("DONE")){
            pstatus="0";
        }else{
            pstatus="1";
        }

        PaymentVO pvo = new PaymentVO();

        String paymentType;
        if (pIdx != null && !pIdx.trim().isEmpty()) {
            paymentType = "2";
        } else {
            paymentType = "1";
        }



        /* 포인트 테이블에서 유저가 사용한 만큼 포인트를 줄이자.*/
        /*결제 시 포인트 추가하는 로직도 필요합니다*/

        int updatePoint = PointDAO.updatePoint(userIdx, Integer.parseInt(enteredPoints),confirmResponse.getInt("totalAmount"));


        pvo.setPaymentQuantity(quant);
        pvo.setProductIdx(pIdx);
        pvo.setUserIdx(userIdx);
        pvo.setPaymentType(paymentType);
        pvo.setPaymentTotal(String.valueOf(confirmResponse.getInt("totalAmount")+Integer.parseInt(totalDiscount)));
        pvo.setPaymentDiscount(totalDiscount);
        pvo.setPaymentFinal(String.valueOf(confirmResponse.getInt("totalAmount")));
        pvo.setPaymentTransactionId(confirmResponse.getString("orderId"));
        pvo.setPaymentMethod(confirmResponse.getString("method"));
        pvo.setPaymentStatus(pstatus);/*던일때 받아서 바꾸기 */
        /*pvo.setPaymentStatus(confirmResponse.getString("status"));*/
/// ////////////////////////////////////////////////
        int cnt=PaymentDAO.insertPayment(pvo,confirmResponse.getInt("totalAmount"),Integer.parseInt(userIdx));

        System.out.println("cnt:"+cnt);
        /// ///////////////////////////////////////
        request.setAttribute("quant", quant);
        request.setAttribute("img", img);
        request.setAttribute("totalAmount", pvo.getPaymentTotal());
        request.setAttribute("orderName", confirmResponse.getString("orderName"));




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
