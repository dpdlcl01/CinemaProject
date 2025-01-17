package action.user;
import action.Action;
import mybatis.dao.ProductDAO;
import mybatis.vo.ProductVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class StoreAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response){

        ProductVO[] ar= ProductDAO.gettotal();
        request.setAttribute("ar",ar);

        return "/jsp/user/store/storeMain.jsp";
}
}


