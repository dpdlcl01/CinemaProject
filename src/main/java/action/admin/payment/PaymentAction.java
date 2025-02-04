package action.admin.payment;

import action.Action;
import mybatis.dao.PaymentDAO;
import mybatis.vo.PaymentVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

public class PaymentAction implements Action {
    public String execute(HttpServletRequest request, HttpServletResponse response) {
        // 현재 페이지 (cPage 파라미터가 없으면 기본값 1)
        int cPage = 1;
        String pageParam = request.getParameter("cPage");
        if (pageParam != null) {
            cPage = Integer.parseInt(pageParam);
        }

        int numPerPage = 10; // 한 페이지당 10개씩 출력

        // 전체 데이터 개수 가져오기
        int totalData = PaymentDAO.getTotalPaymentCount();
        int totalPage = (int) Math.ceil((double) totalData / numPerPage); // 총 페이지 수 계산

        // 현재 페이지에 해당하는 데이터 가져오기
        List<PaymentVO> paymentList = PaymentDAO.getPaymentListByPage(cPage, numPerPage);

        // JSP로 데이터 전달
        request.setAttribute("ar", paymentList);
        request.setAttribute("cPage", cPage);
        request.setAttribute("totalPage", totalPage);

        return "/jsp/admin/payment/paymentList.jsp";
    }
}
