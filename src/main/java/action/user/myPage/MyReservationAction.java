package action.user.myPage;

import action.Action;
import mybatis.dao.MyPageDAO;
import mybatis.dao.MyReservationDAO;
import mybatis.vo.ProductDetailVO;
import mybatis.vo.ReservationDetailVO;
import mybatis.vo.ReservationVO;
import mybatis.vo.UserVO;
import util.SessionUtil;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

public class MyReservationAction implements Action {
  @Override
  public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

    // 로그인 여부 확인 및 사용자 정보 가져오기
    UserVO uservo = SessionUtil.getLoginUser(request);
    if (uservo == null) {
      return "UserController?type=main";
    }

    int userIdx = Integer.parseInt(uservo.getUserIdx()); // 로그인한 사용자 ID

  //마이페이지 메인 예약 내역 가져오기
    ReservationVO[] rvo = MyPageDAO.getReservation(String.valueOf(userIdx));
    request.setAttribute("rvo", rvo);


    // 사용자가 선택한 값 가져오기
    String selectedYear = request.getParameter("selectedYear");
    String selectedMonth = request.getParameter("selectedMonth");
    String reservationType = request.getParameter("reservationType");

    // 현재 날짜 가져오기 (기본값 설정)
    Calendar cal = Calendar.getInstance();
    int currentYear = cal.get(Calendar.YEAR);
    int currentMonth = cal.get(Calendar.MONTH) + 1;

    // 사용자가 선택하지 않았거나 빈 문자열이면 기본값으로 현재 년월 설정
    if (selectedYear == null || selectedYear.isEmpty()) {
      selectedYear = String.valueOf(currentYear);
    }
    if (selectedMonth == null || selectedMonth.isEmpty()) {
      selectedMonth = String.valueOf(currentMonth);
    }

    // `reservationType`이 `null`이면 기본값 설정 (예매내역)
    if (reservationType == null || reservationType.isEmpty()) {
      reservationType = "reservationTable"; // 기본값: 예매내역
    }

    // 12개월 옵션 생성 (조회된 값이 유지되도록 `selected` 추가)
    int startYear = currentYear;
    int startMonth = currentMonth + 1;
    StringBuilder monthOptions = new StringBuilder();

    for (int i = 0; i < 12; i++) {
      int month = startMonth - i;
      int year = startYear;

      if (month <= 0) {
        month += 12;
        year -= 1;
      }

      // `selectedMonth`와 `year-month` 값이 같다면 `selected` 추가
      String value = year + "-" + month;
      monthOptions.append("<option value='").append(value).append("'");

      if (value.equals(selectedYear + "-" + selectedMonth)) {
        monthOptions.append(" selected");
      }

      monthOptions.append(">").append(year).append("년 ").append(month).append("월</option>");
    }
    request.setAttribute("monthOptions", monthOptions.toString());
    request.setAttribute("selectedYear", selectedYear);
    request.setAttribute("selectedMonth", selectedMonth);
    request.setAttribute("reservationType", reservationType);

    // ✅ 예매 내역 또는 취소 내역 가져오기
    if ("reservationTable".equals(reservationType)) {
      List<ReservationDetailVO> reservations = MyReservationDAO.getReservationDetail(userIdx, selectedYear, selectedMonth);
      if (reservations == null) reservations = new ArrayList<>();
      request.setAttribute("reservations", reservations);
      return "./jsp/user/myPage/myReservation.jsp";
    }
    else if ("cancelTable".equals(reservationType)) {
      List<ReservationDetailVO> reservations = MyReservationDAO.getCancelReservationDetail(userIdx, selectedYear, selectedMonth);
      if (reservations == null) reservations = new ArrayList<>();
      request.setAttribute("reservations", reservations);
      return "./jsp/user/myPage/myReservation.jsp";
    }
    else if ("purchaseTable".equals(reservationType)) {  // 구매내역 추가
      List<ProductDetailVO> purchases = MyReservationDAO.getPurchaseHistory(userIdx, selectedYear, selectedMonth);
      System.out.println(selectedYear + "-" + selectedMonth);
      if (purchases == null) purchases = new ArrayList<>();
      request.setAttribute("purchases", purchases);

      return "./jsp/user/myPage/myPurchase.jsp";  // 여기서 종료 (더 이상 실행 안 됨)
    }

    return "./jsp/user/myPage/myReservation.jsp"; // 기본적으로 예매 내역으로 이동
  }
}

