package action.user.store;
import action.Action;
import mybatis.dao.ProductDAO;
import mybatis.vo.ProductVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class StoreAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response){

        HttpSession session = request.getSession();

        /*아래 두 구문은 확인용*/



        ProductVO[] ar= ProductDAO.gettotal();
        request.setAttribute("ar",ar);

        return "/jsp/user/store/storeMain.jsp";
}
}


