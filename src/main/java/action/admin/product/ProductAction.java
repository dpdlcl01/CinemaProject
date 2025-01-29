package action.admin.product;

import action.Action;
import mybatis.dao.ProductDAO;
import mybatis.vo.ProductVO;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


public class ProductAction implements Action {


    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

        // 전체 정보 가져오기 //
        ProductVO[] productVO = ProductDAO.selectAll();
        if (productVO.length > 0) {
            // request에 전체정보 저장
            request.setAttribute("product", productVO);
        }

        // 포워딩할 JSP 페이지 반환
        return "/jsp/admin/product/adminProduct.jsp";
    }

}
