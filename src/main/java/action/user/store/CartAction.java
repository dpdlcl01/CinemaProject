package action.user.store;

import action.Action;
import mybatis.dao.CartDAO;
import mybatis.vo.CartVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class CartAction implements Action {

    public String execute(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        String id = (String)session.getAttribute("id");
        String path = (String) request.getParameter("path");

        /*아래 조건문을 바꾸자 1 2 null 각각 바꿔서 반환하자*/
        if(path != null) {
            String idx = request.getParameter("pIdx");
            String quant =request.getParameter("productQuant");

            int cnt = CartDAO.delCart(id,idx);

            if(cnt > 0&&path.equals("1")) {
                CartDAO.addCart(id,idx,quant);
            }
        }


       CartVO[] cvo=CartDAO.getCart(id);

       request.setAttribute("cvo",cvo);


        return "/jsp/user/store/storeCart.jsp";

    }
}
