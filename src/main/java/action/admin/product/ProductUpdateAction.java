package action.admin.product;

import action.Action;
import mybatis.dao.ProductDAO;
import mybatis.vo.ProductVO;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


public class ProductUpdateAction implements Action {


    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {


        // 폼에서 수정된 정보 가져오기 (String으로 받음)
        String productIdx = request.getParameter("productIdx");
        String productCategory = request.getParameter("productCategory");
        String productName = request.getParameter("productName");
        String productPrice = request.getParameter("productPrice");
        String productStock = request.getParameter("productStock");
        String productStatus = request.getParameter("productStatus");

        // 수정된 상품 정보를 ProductVO 객체에 담기 (String을 적절하게 변환)
        ProductVO updatedProduct = new ProductVO();
        updatedProduct.setProductIdx(productIdx); // 상품
        updatedProduct.setProductCategory(productCategory);
        updatedProduct.setProductName(productName); // 상품명
        updatedProduct.setProductPrice(Integer.parseInt(productPrice)); // 가격
        updatedProduct.setProductStock(Integer.parseInt(productStock)); // 재고
        updatedProduct.setProductStatus(productStatus); // 상품 상태

        // 상품 정보 수정
        int result = ProductDAO.updateProduct(updatedProduct);
        if (result > 0) {
            System.out.println("상품 수정 성공");
        } else {
            System.out.println("상품 수정 실패");
        }

        // 수정된 정보를 다시 request에 저장 (다시 확인할 수 있도록)
        request.setAttribute("updatedProduct", updatedProduct);


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
