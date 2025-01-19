package action.user;

import action.Action;
import mybatis.dao.CouponDAO;
import mybatis.vo.CouponVO;
import mybatis.vo.UserVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;

public class MyCouponAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) {

//        // 세션에서 사용자 정보 가져오기
//        HttpSession session = request.getSession();
//        UserVO user = (UserVO) session.getAttribute("loggedInUser");
//
//        if (user == null) {
//            // 로그인하지 않은 경우 로그인 페이지로 리다이렉트
//            return "./jsp/user/login.jsp";
//        }

        // 사용자 로그인 성공 시
        HttpSession session = request.getSession();
        UserVO user = new UserVO();

        // 로그인 정보를 세팅
        user.setUserIdx("1");
        user.setUserName("김철수");
        user.setUserId("1111");
        user.setUserEmail("kimcs@example.com");
        user.setUserGrade("Basic");

        // 세션에 저장
        session.setAttribute("loggedInUser", user);

        // 사용자 쿠폰 조회
        String userIdx = user.getUserIdx();
        CouponVO[] couponList = CouponDAO.getList(userIdx, 0, 10); // 첫 10개 쿠폰 조회

        // 조회된 쿠폰 데이터를 request에 저장
        request.setAttribute("couponList", couponList);

        // 쿠폰 상세 화면 경로 반환
        return "./jsp/user/myInfo/myCoupon.jsp";
    }
}
