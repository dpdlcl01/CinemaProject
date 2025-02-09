package action.admin.coupon;

import action.Action;
import com.google.gson.Gson;
import mybatis.dao.CouponDAO;
import mybatis.vo.AdminVO;
import util.SessionUtil;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

public class IssueCouponAction implements Action {
    public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {


        String couponIdx = request.getParameter("couponIdx");
        String userGrade = request.getParameter("userGrade");
        HashMap <String, String> map = new HashMap<>();
        map.put("couponIdx", couponIdx);
        map.put("userGrade", userGrade);

        int cnt = CouponDAO.insertCouponForUserGrade(map);
        Map<String, Object> resultMap = new HashMap<>();

        if (cnt > 0) {
            resultMap.put("success", true);
            resultMap.put("message", "쿠폰이 성공적으로 발급되었습니다.");
            resultMap.put("affectedRows", cnt); // 발급된 개수 추가
        } else {
            resultMap.put("success", false);
            resultMap.put("message", "쿠폰 발급에 실패했습니다.");
        }


    // JSON 응답 전송
    String jsonResponse = new Gson().toJson(resultMap);
        response.getWriter().write(jsonResponse);
        response.getWriter().flush();

        return null;
    }
}
