package action.user;

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
       CartVO[] cvo=CartDAO.getCart(id);

       request.setAttribute("cvo",cvo);


        return "/jsp/user/store/storeCart.jsp";

    }
}
