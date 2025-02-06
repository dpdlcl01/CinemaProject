package action.user.store;

import action.Action;
import mybatis.dao.CouponDAO;
import mybatis.dao.PaymentDAO;
import mybatis.dao.PointDAO;
import mybatis.dao.ProductDAO;
import mybatis.vo.PaymentVO;
import mybatis.vo.UserVO;
import util.SessionUtil;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.UUID;

public class SuccessAction2 implements Action {


    public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {


        String orderId = "order-"+UUID.randomUUID().toString();

        String amount = request.getParameter("amount"); // JSP에서 금액을 전달받아야 함
        String pIdx = request.getParameter("pIdx");
        String totalDiscount = request.getParameter("totalDiscount"); /*총 할인값*/
        String couponDiscount = request.getParameter("couponDiscount"); /*쿠폰할인값*/
        String enteredPoints = request.getParameter("enteredPoints"); /*포인트 할인값*/
        String couponIdx =request.getParameter("couponIdx");
        String ordername =request.getParameter("ordername");

        String quant = request.getParameter("quant");
        String img = request.getParameter("image");

        UserVO userVO = SessionUtil.getLoginUser(request);
        String userIdx = userVO.getUserIdx();

        PaymentVO pvo = new PaymentVO();

        int updateCnt= ProductDAO.updateProductStock(pIdx,quant);

        if(!couponIdx.equals("0")){
            int updateCoupon= CouponDAO.updateCoupon(userIdx,couponIdx);
        }
        int updatePoint = PointDAO.updatePoint(userIdx, Integer.parseInt(enteredPoints),0);


        String paymentType;
        if (pIdx != null && !pIdx.trim().isEmpty()) {
            paymentType = "2";
        } else {
            paymentType = "1";
        }


        pvo.setPaymentQuantiy(quant);
        pvo.setProductIdx(pIdx);
        pvo.setUserIdx(userIdx);
        pvo.setPaymentType(paymentType);
        pvo.setPaymentTotal(amount);
        pvo.setPaymentDiscount(totalDiscount);
        pvo.setPaymentFinal("0");
        pvo.setPaymentTransactionId(orderId);
        pvo.setPaymentMethod("쿠폰/포인트");
        pvo.setPaymentStatus("0");


        int cnt= PaymentDAO.insertPayment(pvo);
        request.setAttribute("quant", quant);
        request.setAttribute("img", img);
        request.setAttribute("totalAmount", pvo.getPaymentTotal());
        request.setAttribute("orderName", ordername);



        return "/jsp/user/store/paymentSuccess.jsp";
    }
}
