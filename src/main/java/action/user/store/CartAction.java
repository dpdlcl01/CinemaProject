package action.user.store;

import action.Action;
import mybatis.dao.user.CartDAO;
import mybatis.vo.CartVO;
import mybatis.vo.UserVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class CartAction implements Action {

    public String execute(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();


        UserVO user = (UserVO) session.getAttribute("user");



        String id = user.getUserId();
        String userIdx = user.getUserIdx();
        String path = (String) request.getParameter("path");
        String idx = request.getParameter("pIdx");
        /*아래 조건문을 바꾸자 1 2 null 각각 바꿔서 반환하자*/
        if(path != null) {

            String quant =request.getParameter("productQuant");

            int cnt = CartDAO.delCart(userIdx,idx);

            if(cnt > 0&&path.equals("1")) {
                CartDAO.addCart(id,idx,quant,userIdx);
            }
        }


       CartVO[] cvo=CartDAO.getCart(userIdx);

       request.setAttribute("cvo",cvo);


        return "/jsp/user/store/storeCart.jsp";

    }
}
