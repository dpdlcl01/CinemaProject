package action.admin.payment;

import action.Action;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import mybatis.dao.PaymentDAO;
import mybatis.vo.AdminVO;
import mybatis.vo.PaymentVO;
import util.Paging;
import util.SessionUtil;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class PaymentDetailAction implements Action {
    public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

        AdminVO adminvo = SessionUtil.getLoginAdmin(request);
        if(adminvo == null){
            return "AdminController?type=admin";
        }
        // 세션의 adminvo에서 idx값 얻기 - 로그 테이블에 관리자 idx 저장시
        String adminIdx = adminvo.getAdminIdx();

        String paymentIdx = request.getParameter("paymentIdx");

        PaymentVO pvo = PaymentDAO.getPaymentByIdx(paymentIdx);

        // Jackson을 사용하여 JSON 변환
        ObjectMapper mapper = new ObjectMapper();
        String json = mapper.writeValueAsString(pvo);

        // 응답 헤더 및 JSON 전송 설정
        response.setContentType("application/json; charset=UTF-8");
        response.getWriter().write(json);

        return null;  // 비동기 요청이므로 JSP로 포워딩하지 않음
    }
}
