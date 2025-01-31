package action.admin.payment;

import action.Action;
import mybatis.dao.PaymentDAO;
import mybatis.vo.PaymentVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PaymentAction implements Action {
    public String execute(HttpServletRequest request, HttpServletResponse response)  {

        PaymentVO[] ar =PaymentDAO.totalPayment();

        request.setAttribute("ar",ar);

        return "/jsp/admin/payment/paymentList.jsp";
    }
}
