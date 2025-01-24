package action.user.store;

import action.Action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PaymentAction implements Action {

    public String execute(HttpServletRequest request, HttpServletResponse response) {

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
