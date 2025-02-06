package action.admin.product;

import action.Action;
import mybatis.dao.ProductDAO;
import mybatis.vo.AdminVO;
import mybatis.vo.ProductVO;
import util.SessionUtil;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


public class ProductAction implements Action {


    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

        // 로그인 여부 확인 및 관리자 정보 가져오기
        AdminVO adminvo = SessionUtil.getLoginAdmin(request);

        // adminvo가 null이면 로그인하지 않은 경우 - 관리자 페이지 전체 접근 불가능하므로 로그인 페이지로 전환
        if (adminvo == null) {
            return "AdminController?type=admin";
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
