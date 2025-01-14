<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 25. 1. 14.
  Time: 오후 3:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!Doctype html>
<html lang="en">
<!-- head -->
<head>
  <meta charset="UTF-8">
  <jsp:include page="./common/head.jsp"/>
</head>
<style>
  *{
    padding: 0;
    margin: 0;
    font-size: 14px;
  }
  h2{
    font-size: 30px;
    padding-top: 20px;
    padding-bottom: 20px;
  }
  #contents{
    width: 1200px;
    margin-right: auto;
    margin-left: auto;
    padding-left: 30px;

  }
  .warning{
    font-size: 15px;
    color: red;
    padding-bottom: 20px;
  }
  .title{
    font-size: 19px;
    padding-bottom: 20px;
  }
  li{
    padding-bottom: 5px;
  }
  table{
    width: 840px;
    border-collapse: collapse;

  }
  table input{
    width: 200px;
    height: 25px;
  }
  table td{
    font-size: 15px;
    color:  gray;
    border: 1px solid gray;
    height: 40px;
    font-weight: bold;
    padding-left: 10px;
  }
  caption{
    text-indent: -9999px;

  }
  table button{
    width: 100px;
    height: 30px;
    font-size: 17px;
  }
  #btnDiv{
    padding-top: 30px;
    margin-left: auto;
    margin-right: auto;
    width: 200px;
    padding-bottom: 20px;
  }
  #cancle{
    width: 88px;
    height: 46px;
  }
  #go{
    width: 88px;
    height: 46px;
  }
  #wrap{
    display: flex;

  }
  .sidebar {
    width: 250px;
    order: 0;
    background-color: #f8f8f8;
    border-right: 1px solid #ddd;
    padding: 20px;
    box-sizing: border-box;
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
  #main{
    padding-left: 20px;
  }

</style>
<body>
<!-- header 영역 -->
<jsp:include page="./common/header.jsp"/>

<!-- contents 영역 -->
<div id="contents">
  <article id="wrap">


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

    <div id="main">
      <h2>회원탈퇴</h2>
      <p class="warning">[주의] 메가박스 회원탈퇴를 신청하기 전에 안내 사항을 꼭 확인해주세요.</p>
      <p class="title">1. 30일간 회원 재가입이 불가능합니다.</p>
      <li>회원 탈퇴 후, 30일 경과 후 재가입할 수 있습니다.</li>
      <br>
      <p class="title">2. 다음에 경우에 회원 탈퇴가 제한됩니다.</p>
      <li>영화예매 내역이 있는 경우</li>
      <li>모바일오더 주문건이 있는 경우</li>
      <li>기명식 기프트카드 잔액이 있을 경우</li>
      <li>기명식 기프트카드가 카드정지 상태인 경우</li>
      <li>기명식 기프트카드 환불신청이 진행중인 경우</li>
      <br>
      <p class="title">3. 탈퇴 후 삭제 내역</p>
      <p class="warning">(회원 탈퇴하시면 회원정보와 개인 보유 포인트 등 정보가 삭제되며 데이터는 복구되지 않습니다.)</p>
      <li>메가박스 멤버십 포인트 및 적립/차감 내역</li>
      <li>관람권 및 쿠폰</li>
      <li>영화 관람 내역</li>
      <li>간편 로그인 연동 정보</li>
      <br>
      <p class="title">4. 회원님의 비밀번호를 입력하시고[탈퇴] 버튼을 클릭해주세요.</p>
      <table>
        <caption>탈퇴 테이블</caption>
        <colgroup>
          <col width="150px">
          <col width="*">
        </colgroup>
        <tbody>
        <tr>
          <td>비밀번호</td>
          <td><input type="password"></td>
        </tr>
        <tr>
          <td>이메일</td>
          <td>
            <input type="text">
            <span>@</span>
            <input type="text">
            <button type="button">인증요청</button>
          </td>
        </tr>
        <tr>
          <td>인증번호</td>
          <td>
            <input type="text">
            <button type="button">인증확인</button>
          </td>
        </tr>
        </tbody>
      </table>
      <div id="btnDiv">
        <button id="cancle">취소</button>
        <button id="go" disabled>탈퇴</button>
      </div>
    </div>

  </article>
</div>

<!-- footer 영역 -->
<jsp:include page="./common/footer.jsp"/>

<!-- script 영역 -->
<script>

</script>
</body>
</html>
