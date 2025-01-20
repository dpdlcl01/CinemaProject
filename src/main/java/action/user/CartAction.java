package action.user;

import action.Action;
import mybatis.dao.CartDAO;
import mybatis.vo.CartVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashMap;

public class CartAction implements Action {

    public String execute(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        String id = (String)session.getAttribute("id");
        String path = (String) request.getParameter("path");

        if(path != null) {
            String idx = request.getParameter("pIdx");
            String quant =request.getParameter("quant");

            int cnt = CartDAO.delCart(id,idx);

            if(cnt > 0) {
                CartDAO.addCart(id,idx,quant);
            }
        }


       CartVO[] cvo=CartDAO.getCart(id);

       request.setAttribute("cvo",cvo);


        return "/jsp/user/store/storeCart.jsp";

    }
}
