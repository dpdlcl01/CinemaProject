package action.user;

import action.Action;
import mybatis.vo.ProductVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.net.URLDecoder;
import java.nio.charset.StandardCharsets;

public class ProductAction implements Action {

        public String execute(HttpServletRequest request, HttpServletResponse response) {

            try {
                request.setCharacterEncoding("UTF-8");
            } catch (Exception e) {
                e.printStackTrace();
            }


            String pName = request.getParameter("pName");
            String pImg = request.getParameter("pImg");

            request.setAttribute("pName", pName);
            request.setAttribute("pImg", pImg);

            return "/jsp/user/store/storeProduct.jsp";
        }
}
