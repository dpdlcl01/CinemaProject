package action.user.store;

import action.Action;
import mybatis.dao.CartDAO;
import mybatis.dao.ProductDAO;
import mybatis.vo.ProductVO;
import mybatis.vo.UserVO;
import util.SessionUtil;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class AddCartAction implements Action {

    public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

        ProductVO[] ar= ProductDAO.gettotal();
        request.setAttribute("ar",ar);

        String quant =request.getParameter("productQuant");
        String idx= request.getParameter("productIdx");

        // 로그인 여부 확인 및 사용자 정보 가져오기
        UserVO uservo = SessionUtil.getLoginUser(request);
        if (uservo == null) {
            return "UserController?type=main";
        }

        String id = uservo.getUserId();
        String userIdx = uservo.getUserIdx();
        /*여기서 아이디 퀀트 아이디액스로 장바구니에 저장하자*/
        CartDAO.addCart(id,idx,quant,userIdx);

        return "/jsp/user/store/storeMain.jsp";

    }
}
