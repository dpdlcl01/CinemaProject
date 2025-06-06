package action.user.store;

import action.Action;
import mybatis.dao.CartDAO;
import mybatis.vo.CartVO;
import mybatis.vo.UserVO;
import util.SessionUtil;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class CartAction implements Action {

    public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

        // 로그인 여부 확인 및 사용자 정보 가져오기
        UserVO uservo = SessionUtil.getLoginUser(request);
        if (uservo == null) {
            return "UserController?type=main";
        }

        String id = uservo.getUserId();
        String userIdx = uservo.getUserIdx();
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
