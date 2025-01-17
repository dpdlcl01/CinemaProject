package action.user;

import action.Action;
import mybatis.vo.ProductVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.net.URLDecoder;
import java.nio.charset.StandardCharsets;

public class ProductAction implements Action {

        public String execute(HttpServletRequest request, HttpServletResponse response) {
            String pName = request.getParameter("pName");
            String pImg = request.getParameter("pImg");

            System.out.println("상품명: " + pName);
            System.out.println("상품 이미지: " + pImg);


            return "/jsp/user/store/storeProduct.jsp";
        }
}
