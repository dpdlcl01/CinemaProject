package action.admin.coupon;

import action.Action;
import com.google.gson.Gson;
import mybatis.dao.CouponDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

public class DelCouponAction implements Action {

    public String execute(HttpServletRequest request, HttpServletResponse response) {

        String couponIdx= request.getParameter("couponIdx");

        Map<String, Object> responseMap = new HashMap<>();

        try {
            int cnt = CouponDAO.delCoupon(couponIdx); // 쿠폰 삭제 실행

            if (cnt > 0) {
                responseMap.put("success", true);
            } else {
                responseMap.put("success", false);
                responseMap.put("message", "삭제할 쿠폰을 찾을 수 없습니다.");
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
