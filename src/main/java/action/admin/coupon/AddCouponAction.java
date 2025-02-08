package action.admin.coupon;

import action.Action;
import mybatis.dao.CouponDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import com.google.gson.Gson;

public class AddCouponAction implements Action {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        Map<String, Object> couponData = new HashMap<>();
        couponData.put("couponName", request.getParameter("couponName"));
        couponData.put("couponInfo", request.getParameter("couponInfo"));
        couponData.put("couponType", request.getParameter("couponType"));
        couponData.put("couponValue", request.getParameter("couponValue"));
        couponData.put("couponRegDate", request.getParameter("couponRegDate"));
        couponData.put("couponExpDate", request.getParameter("couponExpDate"));

        Map<String, Object> responseMap = new HashMap<>();

        try {
            int result = CouponDAO.insertCoupon(couponData);

            if (result > 0) {
                responseMap.put("success", true);
            } else {
                responseMap.put("success", false);
                responseMap.put("message", "쿠폰 추가 실패");
            }
        } catch (Exception e) {
            responseMap.put("success", false);
            responseMap.put("message", "서버 오류 발생");
            e.printStackTrace();
        }

        // JSON 응답 전송
        try {
            response.setContentType("application/json;charset=UTF-8");
            response.getWriter().write(new Gson().toJson(responseMap));
        } catch (IOException e) {
            e.printStackTrace();
        }

        return null;
    }
}
