package action.user.myPage;

import action.Action;
import com.fasterxml.jackson.databind.ObjectMapper;
import mybatis.dao.CouponDAO;
import mybatis.vo.CouponVO;
import mybatis.vo.UserVO;
import util.Paging;
import util.SessionUtil;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.io.IOException;

public class MyCouponAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {


        // 로그인 여부 확인 및 사용자 정보 가져오기
        UserVO uservo = SessionUtil.getLoginUser(request);
        if (uservo == null) {
            return "UserController?type=main";
        }

        // 사용자 ID 가져오기
        String userIdx = uservo.getUserIdx();
        String filter = request.getParameter("filter"); // 필터 값 받기
        String cPage = request.getParameter("cPage");

        String type = request.getParameter("type");

        // AJAX 요청이면 JSON 응답
        if ("couponFilter".equals(type)) {
            response.setContentType("application/json;charset=UTF-8");

            try {
                CouponVO[] couponList = CouponDAO.getListNoPaging(userIdx, filter);

                ObjectMapper mapper = new ObjectMapper();
                PrintWriter out = response.getWriter();
                out.write(mapper.writeValueAsString(couponList));
                out.flush();
                return null;
            } catch (Exception e) {
                System.err.println("[ERROR] 쿠폰 필터링 중 오류 발생: " + e.getMessage());
                e.printStackTrace();
                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                return null;
            }
        }

        // 페이징 설정 (한 페이지당 쿠폰 개수 5개, 페이지 블록 5개)
        Paging page = new Paging(5, 5);

        // 전체 쿠폰 개수 조회
        int totalCount = CouponDAO.getTotalCount(userIdx);
        if (totalCount == 0) {
            totalCount = 1;  // 최소 1페이지를 설정
        }
        page.setTotalRecord(totalCount); // 전체 레코드 수 설정 (이때 전체 페이지수 계산됨)
        System.out.println("totalCount"+totalCount);

        // 현재 페이지 값 가져오기
        if (cPage == null) {
            page.setNowPage(1);
        } else {
            int nowPage = Integer.parseInt(cPage);
            page.setNowPage(nowPage);
        }

        // 사용자 쿠폰 조회
        CouponVO[] couponList = CouponDAO.getList(userIdx, page.getBegin(), page.getEnd());

        // 조회된 쿠폰 데이터를 request에 저장
        request.setAttribute("couponList", couponList);
        request.setAttribute("page", page);
        request.setAttribute("cPage", cPage);

        // 쿠폰 상세 화면 경로 반환
        return "./jsp/user/myPage/myCoupon.jsp";
    }
}
