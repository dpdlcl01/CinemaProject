package action.user.store;

import action.Action;
import mybatis.vo.UserVO;
import util.SessionUtil;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class PaymentAction implements Action {

    public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

        // 로그인 여부 확인 및 사용자 정보 가져오기
        UserVO uservo = SessionUtil.getLoginUser(request);
        if (uservo == null) {
            return "UserController?type=main";
        }

        String quant = request.getParameter("productQuant");
        String price = request.getParameter("productPrice");
        String name = request.getParameter("productName");
        String category = request.getParameter("productCategory");
        String img = request.getParameter("productImg");

        request.setAttribute("quant", quant);
        request.setAttribute("price", price);
        request.setAttribute("name", name);
        request.setAttribute("category", category);
        request.setAttribute("img", img);
        return "/jsp/user/store/storePayment.jsp";
    }

}
