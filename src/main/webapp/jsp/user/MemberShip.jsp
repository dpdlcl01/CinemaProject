<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <jsp:include page="head.jsp"/>
  <style>
    /* 기본 스타일 */
    body {
      font-family: 'Arial', sans-serif;
      margin: 0;
      padding: 0;
      background-color: #f9f9f9;
    }
    .clearfix {
      display: flex;
      max-width: 1200px;
      margin: 0 auto;
      padding: 20px;
      background-color: #fff;
    }
    .sidebar {
      width: 250px;
      background-color: #f8f8f8;
      border-right: 1px solid #ddd;
      padding: 20px;
    }
    .sidebar ul {
      list-style: none;
      padding: 0;
    }
    .sidebar ul li {
      margin-bottom: 10px;
    }
    .sidebar ul li a {
      text-decoration: none;
      color: #333;
      font-size: 14px;
    }
    .content {
      width: 75%;
      margin-left: auto;
      padding: 20px;
    }
    .section {
      background-color: #fff;
      padding: 20px;
      margin-bottom: 20px;
      border-radius: 5px;
      box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    }
    .section h1, .section h2 {
      font-size: 18px;
      margin-bottom: 10px;
    }
    .point-summary {
      display: flex;
      justify-content: space-between;
    }
    .point-summary div {
      flex-grow: 1;
      background-color: #f5f5f5;
      padding: 15px;
      text-align: center;
      border-radius: 5px;
    }
    table {
      width: 100%;
      border-collapse: collapse;
      margin-top: 20px;
    }
    table th, table td {
      border: 1px solid #ddd;
      padding: 10px;
      text-align: center;
    }
  </style>
</head>
<body>
<jsp:include page="header.jsp"/>
<div id="contents">
  <div class="clearfix">
    <!-- 사이드바 -->
    <div class="sidebar">
      <ul>
        <li><a href="MyInfo.jsp" title="나의 메가박스"><strong>나의 메가박스</strong></a></li>
        <li><a href="Reservation.jsp" title="예매/구매내역">예매/구매내역</a></li>
        <li><a href="Admission-Ticket.jsp" title="영화/스토어 관람권">영화/스토어 관람권</a></li>
        <li><a href="Discount-Coupon.jsp" title="메가박스/제휴쿠폰">메가박스/제휴쿠폰</a></li>
        <li><a href="MemberShip.jsp" title="멤버십 포인트">멤버십 포인트</a></li>
        <li><a href="#" title="나의 무비스토리">나의 무비스토리</a></li>
        <li><a href="#" title="회원정보">회원정보</a></li>
      </ul>
    </div>

    <!-- 메인 콘텐츠 -->
    <main class="content">
      <!-- 사용자 정보 섹션 -->
      <section class="section">
        <h1>[username]님</h1>
        <p>사용가능 포인트 : 0P</p>
      </section>

      <!-- 카드 섹션 -->
      <div class="section point-summary">
        <div class="usable-points">
          <h3>사용가능 포인트</h3>
          <p>0P</p>
        </div>
        <div class="vip-points">
          <h3>VIP 선정 누적 포인트 현황</h3>
          <table>
            <tr><th>매표</th><td>0</td></tr>
            <tr><th>매점</th><td>0</td></tr>
            <tr><th>이벤트</th><td>0</td></tr>
          </table>
        </div>
      </div>

      <!-- 이용내역 조회 -->
      <section class="section">
        <h2>이용내역 조회</h2>
        <form id="search-form">
          <label for="start-date">조회기간:</label>
          <input type="date" id="start-date" value="2025-01-07">
          ~
          <input type="date" id="end-date" value="2025-01-14">
          <button type="submit">조회</button>
        </form>

        <!-- 조회 결과 -->
        <table class="history-table">
          <thead>
          <tr><th>일자</th><th>구분</th><th>내용</th><th>지점</th><th>포인트</th></tr>
          </thead>
          <tbody id="history-body">
          <!-- 데이터가 없을 경우 -->
          <tr><td colspan="5">조회된 내역이 없습니다.</td></tr>
          </tbody>
        </table>
      </section>
    </main>
  </div>
</div>

<jsp:include page="footer.jsp"/>
</body>
</html>
