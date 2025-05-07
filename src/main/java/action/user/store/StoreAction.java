package action.user.store;
import action.Action;
import mybatis.dao.ProductDAO;
import mybatis.vo.ProductVO;
import mybatis.vo.UserVO;
import util.SessionUtil;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class StoreAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

        ProductVO[] ar= ProductDAO.gettotal();
        request.setAttribute("ar",ar);

        return "/jsp/user/store/storeMain.jsp";
}
}


