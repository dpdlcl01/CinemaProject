package action.admin.payment;

import action.Action;
import com.google.gson.Gson;
import mybatis.dao.PaymentDAO;
import mybatis.vo.PaymentVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class paymentIdSearchAction implements Action {

    public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String userId = request.getParameter("userId");
        PaymentVO[] ar = PaymentDAO.searchPayment(userId);

        Gson gson = new Gson();
        String jsonResponse = gson.toJson(ar); // 객체 배열을 JSON 문자열로 변환

        // JSON 응답 설정
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        PrintWriter out = response.getWriter();
        out.write(jsonResponse);
        out.flush();
        out.close();


        return null;
    }
}
