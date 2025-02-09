package action.admin.coupon;

import action.Action;
import mybatis.dao.CouponDAO;
import mybatis.vo.CouponVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class CouponListAction implements Action {
    public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

        List<CouponVO> cvo = CouponDAO.getCouponList();
        request.setAttribute("cvo", cvo);


        return "./jsp/admin/coupon/couponList.jsp";
    }
}
