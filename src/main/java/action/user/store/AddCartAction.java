package action.user.store;

import action.Action;
import mybatis.dao.user.CartDAO;
import mybatis.dao.user.ProductDAO;
import mybatis.vo.ProductVO;
import mybatis.vo.UserVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AddCartAction implements Action {

    public String execute(HttpServletRequest request, HttpServletResponse response) {

        ProductVO[] ar= ProductDAO.gettotal();
        request.setAttribute("ar",ar);

        String quant =request.getParameter("productQuant");
        String idx= request.getParameter("productIdx");

        HttpSession session = request.getSession();

        UserVO user = (UserVO) session.getAttribute("user");

        String id = user.getUserId();
        String userIdx = user.getUserIdx();
        /*여기서 아이디 퀀트 아이디액스로 장바구니에 저장하자*/
        CartDAO.addCart(id,idx,quant,userIdx);

        return "/jsp/user/store/storeMain.jsp";

    }
}
