package action.admin.product;

import action.Action;
import mybatis.dao.ProductDAO;
import mybatis.vo.AdminVO;
import mybatis.vo.LogVO;
import mybatis.vo.ProductVO;
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
            return "AdminController?type=main";
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
//        System.out.println("adminidx:"+adminIdx);

        // 기존 상품 정보 가져오기
        ProductVO oldProduct = ProductDAO.selectById(productIdx);

        // 수정된 상품 정보를 ProductVO 객체에 담기
        ProductVO updatedProduct = new ProductVO();
        updatedProduct.setProductIdx(productIdx); // 상품
        updatedProduct.setProductCategory(productCategory); // 상품 카테고리
        updatedProduct.setProductInfo(productInfo); // 상품 카테고리
        updatedProduct.setProductName(productName); // 상품명
        updatedProduct.setProductPrice(Integer.parseInt(productPrice)); // 가격
        updatedProduct.setProductStock(Integer.parseInt(productStock)); // 재고
        updatedProduct.setProductStatus(productStatus); // 상품 상태
        updatedProduct.setProductImg(productImg); // 상품 이미지

        // 상품 정보 수정
        int result = ProductDAO.updateProduct(updatedProduct);

        if (result > 0) {
            System.out.println("update successes");
            logChanges(adminIdx, productIdx, "카테고리 변경", oldProduct.getProductCategory(), updatedProduct.getProductCategory());
            logChanges(adminIdx, productIdx, "상품명 변경", oldProduct.getProductName(), updatedProduct.getProductName());
            logChanges(adminIdx, productIdx, "상품 설명 변경", oldProduct.getProductInfo(), updatedProduct.getProductInfo());
            logChanges(adminIdx, productIdx, "상품 가격 변경", String.valueOf(oldProduct.getProductPrice()), String.valueOf(updatedProduct.getProductPrice()));
            logChanges(adminIdx, productIdx, "상품 재고 변경", String.valueOf(oldProduct.getProductStock()), String.valueOf(updatedProduct.getProductStock()));
            logChanges(adminIdx, productIdx, "상품 상태 변경", oldProduct.getProductStatus(), updatedProduct.getProductStatus());
            logChanges(adminIdx, productIdx, "상품 이미지 변경", oldProduct.getProductImg(), updatedProduct.getProductImg());
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

    private void logChanges(String adminIdx, String target, String info, String preValue, String curValue) {
        if (!preValue.equals(curValue)) {
            LogVO log = new LogVO();
            log.setLogType("0");
            log.setAdminIdx(adminIdx);
            log.setLogTarget("productIdx:"+target);
            log.setLogInfo(info);
            log.setLogPreValue(preValue);
            log.setLogCurValue(curValue);
            ProductDAO.insertLog(log);
        }
    }
}
