<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <jsp:include page="../common/head.jsp"/>
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

      #center img{
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
        border-radius: 5px;
        border: 1px solid #339eb2;
        color: black;
        width: 284px;
        height: 46px;
        text-decoration:none;
        align-items: center; /* 세로 중앙 정렬 */
        justify-content: center;
        margin: 10px;
      }
      #present:hover{
        border: 1px solid #1e7f9a;
        background-color: #ebebeb;
      }
      #buy{
        border-radius: 5px;
        display: flex;
        background-color: #339eb2;
        color: #fff;
        width: 284px;
        height: 46px;
        text-decoration:none;
        align-items: center; /* 세로 중앙 정렬 */
        justify-content: center;
        margin: 10px;
      }

      #buy:hover{
        background-color: #1e7f9a;
      }
      .inputBt{
        width: 30px;
        height: 30px;
        font-size: 16px;
        font-weight: bold;
        border: 1px solid #ddd;
        border-radius: 50%;
        background: #fff;
        color: #333;
        cursor: pointer;
        align-items: center;
        justify-content: center;
        /* transition: all 0.2s ease; */
      }
      input{
        width: 30px;
        height: 30px;
        text-align: center;
        border: 1px solid #ddd;
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
      #bt>div{
        margin-left: 400px;
      }
      #bt>div>em, #bt>div>span{
        color: #339eb2;
        font-weight: 600;
        font-size: 20px;
      }

      #notice {
        display: none; /* 초기 상태에서 다이얼로그 숨김 */
      }
      .ui-dialog{
        padding: 0;
        font-weight: 600;
      }
      .ui-dialog .ui-btn-div{
        margin: auto;
        text-align: center;
        margin-top: 20px;
      }
      .ui-dialog button{
        width: 80px;
        height: 40px;
        border: 1px solid #339eb2;
        background-color: #339eb2;
        color: white;
        border-radius: 3px;
      }
      .ui-dialog-titlebar {
        background-color: #339eb2;  /* 타이틀 배경색 */
        color: white; /* 텍스트 색상 */
        border: 2px solid #339eb2;
      }
      .ui-dialog-content {
        color: black;
        font-size: 14px;
        padding-bottom: 10px; /* 콘텐츠와 버튼 사이 여백 */
      }
      .ui-dialog-titlebar-close {
        display: none; /* 닫기 버튼 숨김 */
      }
      /* 다이얼로그 버튼 가운데 정렬 */
      .ui-dialog-buttonpane {
        text-align: center !important; /* 버튼 가운데 정렬 */
        border-top: none; /* 구분선 제거 */
        padding-top: 10px; /* 버튼과 콘텐츠 사이 여백 */
      }
      .ui-dialog-buttonset {
        float: none !important; /* 기본 float 제거 */
        display: inline-block; /* 가운데 정렬 */
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
        <img src="https://img.megabox.co.kr/static/pc/images/common/bg/bg-location-arr.png"/>
        <label>스토어</label>
        <img src="https://img.megabox.co.kr/static/pc/images/common/bg/bg-location-arr.png"/>
        <label>상세보기</label>
      </div>
    </div>
  </div>
  <div class="contents">

    <h1>${requestScope.pName}</h1>
    <div id="category">${requestScope.pCategory}</div>
    <div id="wrap">


      <article id="center">
        <img src="${pageContext.request.contextPath}/css/user/images/KangImg/${requestScope.pImg}">
        <article id="info">
          <div class="info">
            <p class="front">사용극장</p>
            <article>
              <a href="#">사용가능극장</a>
            </article>
          </div>
          <div class="info">
            <p class="front">유효기간</p>
            <article>
              <p>구매일로부터 24개월 이내 사용 가능</p>
            </article>
          </div>


          <div class="info">
            <p class="front">남은수량</p>
            <p>${requestScope.productStock}개</p>
          </div>


          <div class="info">
            <p class="front">구매 후 취소</p>
            <p>구매일로부터 10일 이내 취소 가능하며, 부분취소는 불가능합니다.</p>
          </div>
          <hr width="820px">
          <article id="price">
            <p class="front">수량/금액</p>
            <div id="bt">
              <button type="button" class="inputBt" onclick="minusQuant('${requestScope.pPrice}')">-</button>
              <input type="text" value="1" readonly id="quant"/>
              <button type="button" class="inputBt" id="plus" onclick="plusQuant('${requestScope.pPrice}')">+</button>
              <div>
                <em id="priceEm">${requestScope.pPrice}</em>
                <span>원</span>
              </div>

            </div>

          </article>
          <div id="btnDiv">
            <a href="#" id="present" onclick="addCart()">장바구니</a>
            <a href="#" id="buy" onclick="buy()">구매</a>
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

  <form method="post" action="" id="form0">
    <input type="hidden" name="productImg" id="productImg" value="${requestScope.pImg}">
    <input type="hidden" name="productName" id="productName" value="${requestScope.pName}">
    <input type="hidden" name="productCategory" id="productCategory" value="${requestScope.pCategory}">
    <input type="hidden" name="productQuant" id="productQuant">
    <input type="hidden" name="productPrice" id="productPrice">
    <input type="hidden" name="pIdx" id="productIdx" value="${requestScope.pIdx}">
  </form>

  <article id="notice" title="알림">
    <p>
     장바구니에 담았습니다.
    </p>
    <div id="btnDiv2" class="ui-btn-div">
      <button type="button" > 확인 </button>
    </div>
  </article>

  <footer>
    <jsp:include page="../common/footer.jsp"></jsp:include>
  </footer>

  <script>

    form0=document.getElementById("form0");
    let productPrice;
    let productQuant;
    let productStock=${requestScope.productStock};
    const ppp=${requestScope.pPrice};

    function validateQuantity() {
      if (typeof productQuant === "undefined") {
        productQuant = "1";
      }

      if (productQuant > productStock) {
        alert("주문수량이 남은수량보다 많습니다");

        pQuant.value = 1;
        productQuant = pQuant.value;
        productPrice = ppp;
        price.innerHTML = productPrice;

        return false; // 🚨 유효성 검사 실패 시 false 반환
      }

      return true; // ✅ 유효성 검사 통과 시 true 반환
    }


    function addCart() {

      if (!validateQuantity()) return;
      $('#notice').dialog({
        modal: true, // 모달 설정
      });
      document.getElementById("productQuant").value=productQuant;
      let Idx = document.getElementById("productIdx").value;

      console.log(Idx);
      form0.action="${pageContext.request.contextPath}/UserController?type=cart";


      form0.submit();

    }

    function buy() {

      if (!validateQuantity()) return;
      if (typeof productPrice === "undefined") {
        productPrice=document.getElementById("priceEm").innerHTML;
      }
      /*남은 수량보다 프로덕트 퀀트가 크면 리턴*/

      document.getElementById("productQuant").value=productQuant;
      document.getElementById("productPrice").value=productPrice;

      <%--${pageContext.request.contextPath}/UserController?type=payment--%>
      form0.action="${pageContext.request.contextPath}/UserController?type=payment";

      console.log("현재 바이 함수가 실행되었습니다,.");
      form0.submit();
    }
    
    let pQuant=document.getElementById("quant");
    let price = document.getElementById("priceEm");
    function plusQuant(p) {
      pQuant.value = Math.min(parseInt(pQuant.value, 10) + 1, 10);/*minus 함수 참고*/
      price.innerHTML= pQuant.value*parseInt(p);

      productQuant=pQuant.value
      productPrice=pQuant.value*parseInt(p);
    }
    function minusQuant(p) {
      pQuant.value = Math.max(parseInt(pQuant.value, 10) - 1, 1);/*10진법 숫자로 문자열 변환 이후 1이하로 내려가지 않게 하는 구문*/
      price.innerHTML= pQuant.value*parseInt(p);

      productQuant=pQuant.value
      productPrice=pQuant.value*parseInt(p);
    }
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
