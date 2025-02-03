package action.admin.product;

import action.Action;
import mybatis.dao.ProductDAO;
import mybatis.vo.LogVO;
import mybatis.vo.ProductVO;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


public class ProductAddAction implements Action {


    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

        String productCategory = request.getParameter("productCategory");
        String productName = request.getParameter("productName");
        String productInfo = request.getParameter("productInfo");
        String productPrice = request.getParameter("productPrice");
        String productStock = request.getParameter("productStock");
        String productImg = request.getParameter("productImg");
        String productStatus = request.getParameter("productStatus");

        // 빈 값 처리 - 만약 productInfo나 productImg가 빈 문자열이라면 null로 설정
        if (productInfo == null || productInfo.trim().isEmpty()) {
            productInfo = null;
        }
        if (productImg == null || productImg.trim().isEmpty()) {
            productImg = null;
        }

        // 관리자 ID
//        HttpSession session = request.getSession();
//        Object adminIdx = session.getAttribute("adminIdx");
        String adminIdx = "1";

        // ProductVO 객체에 값 설정
        ProductVO newProduct = new ProductVO();
        newProduct.setProductCategory(productCategory); // 카테고리
        newProduct.setProductName(productName); // 상품명
        newProduct.setProductInfo(productInfo); // 상품 설명
        newProduct.setProductPrice(Integer.parseInt(productPrice)); // 가격
        newProduct.setProductStock(Integer.parseInt(productStock)); // 재고
        newProduct.setProductImg(productImg); // 상품 이미지
        newProduct.setProductStatus(productStatus); // 상품 상태



        // DAO를 통해 상품 추가
        int result = ProductDAO.addProduct(newProduct);

        System.out.println(newProduct.getProductName());

        if(result > 0){
            logChanges(adminIdx, "adminProduct", "상품 추가", newProduct.getProductName());
        } else {
            System.out.println("fail");
        }

        // 전체 정보 가져오기 //
        ProductVO[] productVO = ProductDAO.selectAll();
        if (productVO.length > 0) {
            // request에 전체정보 저장
            request.setAttribute("product", productVO);
        }
        return "/jsp/admin/product/adminProduct.jsp";
    }

    private void logChanges(String adminIdx, String target, String info, String curValue) {
            LogVO log = new LogVO();
            log.setLogType("0");
            log.setAdminIdx(adminIdx);
            log.setLogTarget(target);
            log.setLogInfo(info);
            log.setLogPreValue(null);
            log.setLogCurValue(curValue);
            ProductDAO.insertLog(log);
    }
}
