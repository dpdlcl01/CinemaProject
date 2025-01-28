package action.user.store;

import action.Action;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class SuccessAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

        String amount = request.getParameter("amount");
        System.out.println(amount);


        return "/jsp/user/store/paymentSuccess.jsp";
    }
}
