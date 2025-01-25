package action.user.store;

import action.Action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PaymentAPIAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {

        return "/jsp/user/store/paymentAPI.jsp";
    }
}
