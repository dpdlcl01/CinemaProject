package action.user.store;

import action.Action;
import mybatis.dao.CouponDAO;
import mybatis.vo.CouponVO;
import mybatis.vo.UserVO;
import util.SessionUtil;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.UUID;
public class PaymentAction implements Action {

    public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

        // 로그인 여부 확인 및 사용자 정보 가져오기
        UserVO uservo = SessionUtil.getLoginUser(request);
        if (uservo == null) {
            return "UserController?type=main";
        }
        UserVO user = SessionUtil.getLoginUser(request);
        String userPoint=user.getUserPoint();
        String userIdx = user.getUserIdx();

        if(userPoint==null){
            userPoint="0";
        }

        /*보유한 쿠폰 옵션으로 띄웁시다*/



        String orderId = "order-" + UUID.randomUUID().toString();
        String quant = request.getParameter("productQuant");
        String price = request.getParameter("productPrice");
        String name = request.getParameter("productName");
        String category = request.getParameter("productCategory");
        String img = request.getParameter("productImg");
        String pIdx = request.getParameter("pIdx");


        List<CouponVO> couponVO= CouponDAO.userCouponList(userIdx);


        System.out.println("productCategory"+category);


        System.out.println("paymentaction:"+pIdx);

        request.setAttribute("userPoint", userPoint);
        request.setAttribute("couponVO", couponVO);
        request.setAttribute("pIdx", pIdx);
        request.setAttribute("orderId", orderId);
        request.setAttribute("quant", quant);
        request.setAttribute("price", price);
        request.setAttribute("name", name);
        request.setAttribute("category", category);
        request.setAttribute("img", img);
        System.out.println("paymentAction");
        return "/jsp/user/store/storePayment.jsp";
    }

}
