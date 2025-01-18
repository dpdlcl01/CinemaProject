package action.user;

import action.Action;
import mybatis.dao.CartDAO;
import mybatis.dao.ProductDAO;
import mybatis.vo.CartVO;
import mybatis.vo.ProductVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AddCartAction implements Action {

    public String execute(HttpServletRequest request, HttpServletResponse response) {

        ProductVO[] ar= ProductDAO.gettotal();
        request.setAttribute("ar",ar);

        String quant =request.getParameter("productQuant");
        String idx=request.getParameter("productIdx");
        HttpSession session = request.getSession();
        String id = session.getAttribute("id").toString();
        /*여기서 아이디 퀀트 아이디액스로 장바구니에 저장하자*/
        CartDAO.addCart(id,idx,quant);

        return "/jsp/user/store/storeMain.jsp";

    }
}
