package action.admin.product;

import action.Action;
import mybatis.dao.ProductDAO;
import mybatis.vo.AdminVO;
import mybatis.vo.LogVO;
import mybatis.vo.ProductVO;
import util.LogUtil;
import util.SessionUtil;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;


public class ProductUpdateAction implements Action {


    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

        AdminVO adminvo = SessionUtil.getLoginAdmin(request);
        if (adminvo == null) {
            return "AdminController?type=admin";
        }


        // 폼에서 수정된 정보 가져오기
        String productIdx = request.getParameter("productIdx");
        String productCategory = request.getParameter("productCategory");
        String productName = request.getParameter("productName");
        String productInfo = request.getParameter("productInfo");
        String productPrice = request.getParameter("productPrice");
        String productStock = request.getParameter("productStock");
        String productStatus = request.getParameter("productStatus");
        String productImg = request.getParameter("productImg");

        // 관리자 ID
        String adminIdx = adminvo.getAdminIdx();

        // 기존 상품 정보 가져오기
        ProductVO oldProduct = ProductDAO.selectById(productIdx);

        // 수정된 상품 정보를 ProductVO 객체에 담기
        ProductVO updatedProduct = new ProductVO();
        updatedProduct.setProductIdx(productIdx); // 상품
        updatedProduct.setProductCategory(productCategory); // 상품 카테고리
        updatedProduct.setProductName(productName); // 상품명
        updatedProduct.setProductInfo(productInfo); // 상품 설명
        updatedProduct.setProductPrice(Integer.parseInt(productPrice)); // 가격
        updatedProduct.setProductStock(Integer.parseInt(productStock)); // 재고
        updatedProduct.setProductStatus(productStatus); // 상품 상태
        updatedProduct.setProductImg(productImg); // 상품 이미지

        // 상품 정보 수정
        int result = ProductDAO.updateProduct(updatedProduct);

        if (result > 0) {
            System.out.println("update successes");
            LogUtil.logChanges("0", adminIdx, "productIdx:"+productIdx, "productCategory 수정", oldProduct.getProductCategory(), updatedProduct.getProductCategory());
            LogUtil.logChanges("0", adminIdx, "productIdx:"+productIdx, "productName 수정", oldProduct.getProductName(), updatedProduct.getProductName());
            LogUtil.logChanges("0", adminIdx, "productIdx:"+productIdx, "productInfo 수정", oldProduct.getProductInfo(), updatedProduct.getProductInfo());
            LogUtil.logChanges("0", adminIdx, "productIdx:"+productIdx, "productPrice 수정", String.valueOf(oldProduct.getProductPrice()), String.valueOf(updatedProduct.getProductPrice()));
            LogUtil.logChanges("0", adminIdx, "productIdx:"+productIdx, "productStock 수정", String.valueOf(oldProduct.getProductStock()), String.valueOf(updatedProduct.getProductStock()));
            LogUtil.logChanges("0", adminIdx, "productIdx:"+productIdx, "productStatus 수정", oldProduct.getProductStatus(), updatedProduct.getProductStatus());
            LogUtil.logChanges("0", adminIdx, "productIdx:"+productIdx, "productImg 수정", oldProduct.getProductImg(), updatedProduct.getProductImg());
        } else {
            System.out.println("update fails");
        }

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
