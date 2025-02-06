package action.user.store;

import action.Action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SuccessAction2 implements Action {


    public String execute(HttpServletRequest request, HttpServletResponse response) {


        return "/jsp/user/store/paymentSuccess.jsp";
    }
}
