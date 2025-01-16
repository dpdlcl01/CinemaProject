<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <jsp:include page="../common/head.jsp"/>
  <style>
    /* 기본 스타일 */
    *{
      padding: 0;
      margin: 0;
    }
    .sidebar{
      width: 200px;
      border-radius: 6px;
      height: 360px;
      margin-top: 50px;
      margin-right: 50px;
    }
    .sidebar a{
      display: flex;
      color: #222222;
      padding-top: 10px;
      padding-bottom: 10px;
      text-decoration: none;
      text-indent: 20px;
      line-height: 30px;
      font-weight: bolder;

    }
    .sidebar li>a{

      font-size: 14px;
      width: 180px;

    }
    .sidebar li{
      border-bottom: 1px solid #222222;
    }
    #myMega a{
      border-bottom: 2px solid #222222;
    }
    #myMega>a:hover{

      color: gray;
    }
    .sidebar li>a:hover{
      color: gray;
    }


    .content1 {
      width: 75%;
      margin-top : 50px;
      margin-bottom: 50px;
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
    #contents {
      display: flex;
      margin-left : auto;
      margin-right: auto;
      width: 1100px;
    }
  </style>
</head>
<body>
<jsp:include page="../common/header.jsp"/>
<div class="page-util">
  <div class="inner-wrap">
    <div class="location">
      <span>Home</span>
      <a href="/booking" title="예매 페이지로 이동">이벤트</a>
      <a href="/booking" title="빠른예매 페이지로 이동" class="pageUtila">진행중 이벤트</a>
    </div>
  </div>
</div>
<div id="contents">
  <!-- 사이드바 -->
  <div class="sidebar">
    <ul>
      <div id="myMega"><a href="myInfo.jsp" title="나의 메가박스"><strong>나의 메가박스</strong></a></div>
      <li><a href="myReservation.jsp" title="예매/구매내역">예매/구매내역</a></li>
      <li><a href="admissionTicket.jsp" title="영화/스토어 관람권">영화/스토어 관람권</a></li>
      <li><a href="discountCoupon.jsp" title="메가박스/제휴쿠폰">메가박스/제휴쿠폰</a></li>
      <li><a href="myMemberShip.jsp" title="멤버십 포인트">멤버십 포인트</a></li>
      <li><a href="#" title="나의 무비스토리">나의 무비스토리</a></li>
      <li><a href="editMyInfo.jsp" title="회원정보">회원정보</a></li>
    </ul>
  </div>

  <!-- 메인 콘텐츠 -->
  <main class="content1">
    <!-- 멤버십 포인트 섹션 -->
    <section class="section">
      <h1>멤버십 포인트</h1>
      <p>보유하신 멤버십 포인트 내역입니다.<br>포인트는 다양한 혜택으로 사용 가능합니다.</p>

      <!-- 포인트 요약 -->
      <table>
        <thead>
        <tr><th>항목</th><th>포인트</th></tr>
        </thead>
        <tbody>
        <tr><td>사용 가능 포인트</td><td>0P</td></tr>
        <tr><td>VIP 선정 누적 포인트</td><td>0P</td></tr>
        </tbody>
      </table>
    </section>

    <!-- 이용 내역 -->
    <section class="section">
      <h2>포인트 이용 내역 조회</h2>

      <!-- 조회 폼 -->
      <form id="search-form">
        <label for="start-date">조회기간:</label>
        <input type="date" id="start-date" value="2025-01-01">
        ~
        <input type="date" id="end-date" value="2025-12-31">
        <button type="submit">조회</button>
      </form>

      <!-- 조회 결과 -->
      <table class="history-table">
        <thead>
        <tr><th>일자</th><th>구분</th><th>내용</th><th>포인트 변동</th></tr>
        </thead>
        <tbody id="history-body">
        <!-- 데이터가 없을 경우 -->
        <tr><td colspan="4">조회된 내역이 없습니다.</td></tr>
        </tbody>
      </table>

    </section>

    <!-- 기타 안내 -->
    <section class="section">
      <h2>안내 사항</h2>
      <p>• 멤버십 포인트는 영화 예매 및 매점 구매 시 적립됩니다.<br>• 적립된 포인트는 이벤트 참여 및 할인 혜택으로 사용 가능합니다.</p>
    </section>

  </main>
</div>

<jsp:include page="../common/footer.jsp"/>
</body>
</html>
