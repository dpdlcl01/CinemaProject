package action.admin.payment;

import action.Action;
import mybatis.dao.PaymentDAO;
import mybatis.vo.AdminVO;
import mybatis.vo.PaymentVO;
import util.Paging;
import util.SessionUtil;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

public class PaymentAction implements Action {
    public String execute(HttpServletRequest request, HttpServletResponse response) {

        // 로그인 여부 확인 및 관리자 정보 가져오기
        AdminVO adminvo = SessionUtil.getLoginAdmin(request);

        // adminvo가 null이면 로그인하지 않은 경우 - 관리자 페이지 전체 접근 불가능하므로 로그인 페이지로 전환
        if (adminvo == null) {
            return "AdminController?type=admin";
        }

        // 페이징 객체 생성
        Paging page = new Paging(20, 10);

        // 검색 조건 파라미터 수집
        String searchType = request.getParameter("searchType");  // 검색 대상 (사용자 ID, 거래 ID, 예매 ID, 상품 ID 등)
        String searchValue = request.getParameter("searchValue");  // 검색어
        String paymentMonth = request.getParameter("paymentMonth");  // 결제 월
        String paymentStatus = request.getParameter("paymentStatus");  // 결제 상태
        String paymentType = request.getParameter("paymentType");  // 결제 종류

        // 총 결제 내역 수 가져오기
        int totalCount = PaymentDAO.countPayments(searchType, searchValue, paymentMonth, paymentStatus, paymentType);

        // 페이징 객체안에 총 게시물의 수를 저장하면서 전체페이지 수를 구한다.
        page.setTotalRecord(totalCount);// 이때 전체페이지수(totalPage)가 구해진다.

        // 현재페이지 값을 파라미터로 받아보자!
        String cPage = request.getParameter("cPage");

        if (cPage == null)
            page.setNowPage(1);
        else {
            int nowPage = Integer.parseInt(cPage);// "2" --> 2
            page.setNowPage(nowPage);// 이때 !!!!
            // 게시물을 추출할 때 사용되는 begin과 end가 구해지고,
            // 더불어 시작페이지와 끝페이지 값도 구해진다.
        }

        // LIMIT에 사용할 값을 명시적으로 설정
        int begin = (page.getNowPage() - 1) * page.getNumPerPage();  // 0부터 시작
        int limit = page.getNumPerPage();                            // 페이지 크기

        // 결제 내역 리스트 가져오기
        PaymentVO[] paymentArray = PaymentDAO.getPaymentList(
                searchType, searchValue, paymentMonth, paymentStatus, paymentType,
                begin, limit
        );

        // 결과 데이터를 request에 저장
        request.setAttribute("totalCount", totalCount);
        request.setAttribute("paymentArray", paymentArray);
        request.setAttribute("page", page);
        request.setAttribute("cPage", cPage);

        return "/jsp/admin/payment/paymentList.jsp";
    }
}
