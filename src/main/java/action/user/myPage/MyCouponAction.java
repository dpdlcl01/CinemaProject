package action.user.myPage;

import action.Action;
import mybatis.dao.CouponDAO;
import mybatis.vo.CouponVO;
import mybatis.vo.UserVO;
import util.SessionUtil;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class MyCouponAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {


        // 로그인 여부 확인 및 사용자 정보 가져오기
        UserVO uservo = SessionUtil.getLoginUser(request);
        if (uservo == null) {
            return "UserController?type=main";
        }

        // 사용자 쿠폰 조회
        String userIdx = uservo.getUserIdx();
        CouponVO[] couponList = CouponDAO.getList(userIdx, 0, 10); // 첫 10개 쿠폰 조회

        // 조회된 쿠폰 데이터를 request에 저장
        request.setAttribute("couponList", couponList);

        // 쿠폰 상세 화면 경로 반환
        return "./jsp/user/myPage/myCoupon.jsp";
    }
}
