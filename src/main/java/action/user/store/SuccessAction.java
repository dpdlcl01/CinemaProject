package action.user.store;

import action.Action;
import mybatis.dao.ProductDAO;
import mybatis.vo.ProductVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class SuccessAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

        System.out.println("success");

        return "/jsp/user/store/paymentSuccess.jsp";
    }
}