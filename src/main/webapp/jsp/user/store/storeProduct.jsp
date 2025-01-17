<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 25. 1. 13.
  Time: 오후 10:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <jsp:include page="../common/head.jsp"/>
    <title>Title</title>
    <style>
      *{
        margin: 0;
        padding: 0;
        font-size: 15px;
      }

      #contents{
        width: 1100px;
        margin-right: auto;
        margin-left: auto;
        margin-top: 50px;
        margin-bottom: 50px;
      }
      #contents>h1{
        width: 1100px;
        margin-left: auto;
        margin-right: auto;
        font-size: 32px;
      }
      #contents>#category{
        color: dimgray;
        width: 1100px;
        margin-left: auto;
        margin-right: auto;
        padding-top: 20px;
        padding-bottom: 20px;
      }

      #wrap {
        display: flex;
        flex-direction: column;
        align-items: center;
        width: 100%;
        margin: 0 auto;
        padding: 0 20px;

      }

      img{
        width: 280px; /* 이미지의 너비 */
        height: 340px; /* 이미지의 높이 */
        object-fit: cover; /* 비율 유지하며 크기 맞추기 */
        border-right: 1px solid gray;

      }
      #center{
        border-top: 1px solid black;
        border-bottom: 1px solid black;
        display: flex;
        width: 1100px;
      }
      .info{
        display: flex;
        padding-top: 10px;
      }
      #info>.info a{
        color: #01738b;
      }
      .red{
        color: red;
      }
      .gray{
        color: gray;
      }
      .front{

        width: 120px;
        height: 40px;
        padding-left: 10px;
        padding-right: 10px;

      }
      #btnDiv{
        display: flex;
      }
      #present{
        display: flex;
        border: 1px solid #503396;
        color: black;
        width: 284px;
        height: 46px;
        text-decoration:none;
        align-items: center; /* 세로 중앙 정렬 */
        justify-content: center;
        margin: 10px;

      }
      #buy{
        display: flex;
        border: 1px solid #503396;
        background-color: #503396;
        color: gainsboro;
        width: 284px;
        height: 46px;
        text-decoration:none;
        align-items: center; /* 세로 중앙 정렬 */
        justify-content: center;
        margin: 10px;
      }
      .inputBt{
        width: 32px;
        height: 32px;
      }
      input{
        width: 32px;
        height: 32px;
        text-align: center;
      }
      #price{
        display: flex;
        margin-top: 20px;
      }
      .btn{
        width: 1100px;
        height: 39px;
        background-color: white;

        border: 1px solid lightgray;
        border-radius: 8px;
      }
      #refund{
        margin-top: 50px;
      }
      #product{
        margin-top: 30px;
      }
      .hideDiv li{
        list-style: disc; /* 기본 점 스타일 */
          width: 800px;
        padding-top: 10px;
      }
      .hideDiv{
        display: none;
      }
      i{
        text-indent: -9999px;
      }

    </style>
  </head>
  <body>
  <header>
    <jsp:include page="../common/header.jsp"></jsp:include>
  </header>

  <div class="page-util">
    <div class="inner-wrap">
      <div class="location">
        <span>Home</span>
        <span>스토어</span>
        <span class="pageUtila">상세보기</span>
      </div>
    </div>
  </div>
  <div id="contents">


    <h1>${requestScope.pName}</h1>
    <div id="category">카테고리</div>
    <div id="wrap">


      <article id="center">
        <img src="${pageContext.request.contextPath}/css/user/images/KangImg/${requestScope.pImg}">
        <article id="info">
          <div class="info">
            <p class="front">사용극장</p>
            <article>
              <a href="#">사용가능극장</a>
              <p class="red">※일부 특별관 및 특별석은 차액지불과 상관없이 이용 불가합니다.</p>
            </article>
          </div>
          <div class="info">
            <p class="front">유효기간</p>
            <article>
              <p>구매일로부터 24개월 이내 사용 가능</p>
              <p class="gray">예매 가능 유효기간은 구매일로부터 2년입니다.</p>
            </article>
          </div>
          <div class="info">
            <p class="front">판매수량</p>
            <p>1회 8개 구매가능</p>
          </div>
          <div class="info">
            <p class="front">구매 후 취소</p>
            <p>구매일로부터 10일 이내 취소 가능하며, 부분취소는 불가능합니다.</p>
          </div>
          <hr>
          <article id="price">
            <p class="front">수량/금액</p>
            <div id="bt">
              <button type="button" class="inputBt">-</button>
              <input type="text" value="1" readonly/>
              <button type="button" class="inputBt">+</button>
              <em>13000</em>
              <span>원</span>
            </div>

          </article>
          <div id="btnDiv">
            <a href="#" id="present">선물</a>
            <a href="#" id="buy">구매</a>
          </div>

        </article>

      </article>
      <button class="btn" id="refund" onclick="view1()">구매 후 취소</button>
      <div class="hideDiv" id="hideDiv1">
        <ul>
          <li>본 상품은 구매일로부터 10일 이내에 취소 가능합니다.</li>
          <li>유효기간은 본 상품의 유효기간 내에서 연장 신청이 가능하며, 1회 연장 시 3개월(92일) 단위로 연장됩니다.</li>
          <li>구매일로부터 5년까지 유효기간 연장이 가능합니다.</li>
          <li>최초 유효기간 만료 후에는 결제금액의 90%에 대해 환불 요청 가능하며, 환불 처리에 7일 이상의 시간이 소요될 수 있습니다.</li>
          <li>구매 취소 및 환불 요청은 미사용 상품에 한해 가능하며, 사용한 상품에 대해서는 불가합니다.</li>
          <li>본 상품은 현금으로 환불이 불가합니다.</li>
        </ul>
      </div>
      <button class="btn" id="product" onclick="view2()">상품이용안내</button>
      <div class="hideDiv" id="hideDiv2">
        <ol>
          <li>본 권은 구매 시 계정으로 자동 등록되며, 등록된 계정에서만 사용 가능합니다.</li>
          <li>본 권의 예매 가능한 유효기간은 구매일로부터 2년입니다.</li>
          <li>가격 정책에 따라 티켓금액이 변동 될 수 있으며 이에 대한 차액 환불이 불가합니다. (조조/심야/청소년/우대 등)</li>
          <li>본 권은 메가박스 홈페이지, 어플에서만 예매 가능합니다. (현장 매표소, 무인발권기 예매 불가)</li>
          <li>어플 및 홈페이지 예매방법 : 지점 > 영화명 > 시간 > 인원 > 관람권/모바일상품권 > 스토어 관람권으로 전송 받은 PIN번호 16자리 입력 > 결제</li>
          <li>본 권으로 영화 관람 시 메가박스 규정에 의해 일정의 포인트가 적립됩니다.</li>
        </ol>
      </div>
    </div>
  </div>
  <footer>
    <jsp:include page="../common/footer.jsp"></jsp:include>
  </footer>
  <script>
    function view1() {
      const button = document.getElementById('refund');
      const hiddenDiv = document.getElementById('hideDiv1');
      if (hiddenDiv.style.display === 'none' || hiddenDiv.style.display === '') {
        hiddenDiv.style.display = 'block';
        button.textContent = '구매 후 취소 내용 숨기기'; // 버튼 텍스트 변경
      } else {
        hiddenDiv.style.display = 'none'; // div 숨기기
        button.textContent = '구매 후 취소'; // 버튼 텍스트 원래대로
      }
    }
    function view2() {
      const button = document.getElementById('product');
      const hiddenDiv = document.getElementById('hideDiv2');
      if (hiddenDiv.style.display === 'none' || hiddenDiv.style.display === '') {
        hiddenDiv.style.display = 'block';
        button.textContent = '상품이용안내 내용 숨기기'; // 버튼 텍스트 변경
      } else {
        hiddenDiv.style.display = 'none'; // div 숨기기
        button.textContent = '상품이용안내'; // 버튼 텍스트 원래대로
      }
    }
  </script>
  </body>
</html>
