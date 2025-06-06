<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ham
  Date: 2025. 1. 15.
  Time: 오전 2:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!Doctype html>
<html lang="ko">
<!-- head -->
<head>
  <jsp:include page="../common/head.jsp"/>
  <script src="https://js.tosspayments.com/v1"></script>
  <title>CINEFEEL - NEW OCEAN ESSENTIAL</title>
</head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/payment.css"      type="text/css">
<style>
  .payment-row{
    font-size: 20px;
  }
  .circle{
    align-items: center;
    justify-content: center;
    padding-bottom: 15px;=
  }
  #cupon{
    width: 65px;
  }
  #movie-detailsPrice{

    margin-left: 400px;
    font-weight: 600;
    font-size: 20px;
  }
  #categoryPrice{
    display: flex;
  }
  .amount-box{
    height: 56px;
  }
  .payment{
    height: 450px;
  }
  #pImg{
    width: 143px;
    height: 143px;
  }
  .movie-about{
    font-weight: 600;
    font-size: 14px;
  }
  .payment-main{
    height: 750px;
  }
  .hidden{
    display: none;
  }
  .address{
    width: 650px;
  }

</style>
<body>
<!-- header 영역 -->
<jsp:include page="../common/header.jsp"/>
<!-- 추가된 page-util -->
<div class="page-util">
  <div class="inner-wrap">
    <div class="location">
      <span>Home</span>
      <img src="https://img.megabox.co.kr/static/pc/images/common/bg/bg-location-arr.png"/>
      <label>스토어</label>
      <img src="https://img.megabox.co.kr/static/pc/images/common/bg/bg-location-arr.png"/>
      <label>결제하기</label>
    </div>
  </div>
</div>
<!-- contents 영역 -->
<div class="contents">
  <div class="payment-main">
    <h1 class="payment-title">결제하기</h1>
    <div class="payment-container">
      <!-- 예매 정보 -->
      <div class="payment-check">
        <div class="booking-info">
          <h2>구매정보</h2>
          <div class="movie-details">
            <img id="pImg" src="${pageContext.request.contextPath}/css/user/images/KangImg/${requestScope.img}">
            <div class="movie-info">
              <p class="movie-title" id="productTitle">${requestScope.name}</p>
              <div id="categoryPrice">
                <p class="movie-about">${requestScope.category}</p>
                <span id="movie-detailsPrice">${requestScope.price}원</span>
              </div>
              <p class="movie-about" id="productQuant">${requestScope.quant}개</p>
            </div>
          </div>
        </div>

        <!-- 할인 적용 -->
        <div class="discount-section">
          <h2>할인 적용</h2>
          <div class="discount-coupons">
            <div class="coupon-title">
              <span id="cupon">할인/쿠폰</span>

              <select id="couponDropdown" class="coupon-dropdown">
                <option value="" data-discount="r">사용 가능한 쿠폰 선택</option>
                <c:forEach items="${requestScope.couponVO}" var="couponVO">
                  <option value="${couponVO.couponIdx}" data-discount="${couponVO.couponValue}">
                      ${couponVO.couponName}
                  </option>
                </c:forEach>
              </select>

            </div>
          </div>
          <div class="discount-points">
            <div class="points-usage">
              <h2>포인트 사용</h2>
              <div class="points-have">
                <span>보유</span>
                <span class="points">${requestScope.userPoint}원</span>
              </div>
            </div>
            <div class="points-input-area">
              <label for="points-input">사용</label>
              <input type="text" id="points-input" class="points-input" value="0">
              <span>원</span>
            </div>
          </div>
        </div>
        <div class="payment-choose-container">
          <div class="payment-check">

            <div class="payment-btn">
              <c:if test="${requestScope.category eq '굿즈'}">
                <h2>배송지입력</h2><%--이부분에 배송지--%>
                <br>
                <br>
              <label for="address">주소입력</label>
              <input type="text" id="address" class="address" placeholder ="서울시 강남구 테헤란로 132">
              <br>
              <br>
              <label for="addressDetails">상세주소</label>
              <input type="text" id="addressDetails" class="address" placeholder ="한독빌딩 8층 쌍용교육센터">
              </c:if>
            </div>
            <%--  카드 결제 영역  --%>
            <div class="payment-card" id="payment-card">
             <%-- <label for="card-company">카드사 선택</label>
              <select id="card-company" class="card-company">
                <option value="현대카드">현대카드</option>
                <option value="삼성카드">삼성카드</option>
                <option value="신한카드">신한카드</option>
              </select>--%>
            </div>
            <%--  간편결제 영역  --%>
            <div class="payment-simple" id="payment-simple" style="display: none;">
              <label>간편결제 선택</label>
       <%--       <div class="payment-simple-radio">
                <input type="radio" id="toss" name="simple-payment" value="toss" class="simple-payment">
                <label for="toss" class="simple-payment-label">토스페이</label>
                <input type="radio" id="naver" name="simple-payment" value="naver" class="simple-payment">
                <label for="naver" class="simple-payment-label">네이버페이</label>
                <input type="radio" id="kakao" name="simple-payment" value="kakao" class="simple-payment">
                <label for="kakao" class="simple-payment-label">카카오페이</label>
                <input type="radio" id="payco" name="simple-payment" value="payco" class="simple-payment">
                <label for="payco" class="simple-payment-label">페이코</label>
                <input type="radio" id="kbpay" name="simple-payment" value="kbpay" class="simple-payment">
                <label for="kbpay" class="simple-payment-label">KB PAY</label>
              </div>--%>
            </div>

          </div>
        </div>
      </div>
      <!-- 결제 금액 -->
      <div class="payment">
        <div class="payment-summary">
          <h2>결제금액</h2>
          <div class="payment-details">
            <div class="amount-box">
              <div class="payment-row">
                <p class="payment-label">금액</p>
                <p class="payment-label">${requestScope.price}원</p>
              </div>
            </div>
            <div class="payment-divider">
              <div class="circle">-</div>
            </div>
            <div class="discount-box">
              <p class="payment-label">할인적용</p>
              <p class="payment-value" id="discountAmount">0 원</p>
            </div>
            <div class="payment-row final-amount">
              <p class="payment-label">최종결제금액</p>
              <p class="payment-value final" id="finalPrice">${requestScope.price}원</p>
            </div>
            <div class="payment-row payment-used">
              <p class="payment-label">결제수단</p>
              <p class="payment-label">신용/체크카드</p>
            </div>
          </div>
          <div class="btn-group">
            <a href="#" class="button pre" id="pagePrevious" title="이전">이전</a>
            <a href="#" class="button active" id="pageNext" title="결제" onclick="requestPayment()">결제</a>
          </div>
        </div>
      </div>

    </div>
  </div>
</div>
<div id="orderId" class="hidden">${requestScope.orderId}</div>
<div id="pIdx" class="hidden">${requestScope.pIdx}</div>
<div id="productImg" class="hidden">${requestScope.img}</div>
<!-- script 영역 -->
<script>
  let totalDiscount=0;
  let enteredPoints=0;
  let couponDiscount = 0; // 쿠폰 할인 금액
  let couponIdx=0;
  let originalPrice = parseInt("${requestScope.price}", 10);
  let ordername=document.getElementsByClassName("movie-title")[0].innerText;
  document.addEventListener("DOMContentLoaded", function () {
    const pointsInput = document.getElementById("points-input"); // 포인트 입력 필드
    const discountAmountEl = document.getElementById("discountAmount"); // 할인 금액 표시 요소
    const finalPriceEl = document.getElementById("finalPrice"); // 최종 결제 금액 표시 요소
    const userPoint = parseInt("${requestScope.userPoint}", 10); // 사용자가 보유한 포인트




    // 쿠폰 선택 시 할인 적용

    document.getElementById("couponDropdown").addEventListener("change", function() {
      var selectedOption = this.options[this.selectedIndex];
      let discount = parseInt(selectedOption.getAttribute("data-discount")) || 0;
      let finalPrice;
      couponIdx = parseInt(selectedOption.value) || 0;

      // 첫 번째 옵션(기본 선택)인지 확인
      if (selectedOption.value === "") {
        couponIdx=0;
        couponDiscount = 0;
        pointsInput.disabled = false; // 포인트 입력 다시 활성화
        document.getElementById("discountAmount").innerText = "0 원";
        document.getElementById("finalPrice").innerText = originalPrice + " 원";
        updateFinalPrice();
        return;
      }

      // 기본적으로 포인트 입력 가능하도록 설정
      pointsInput.disabled = false;

      // 할인 값이 0이거나 빈 값이면 전체 금액 할인 적용
      if (discount === 0) {
        discount = originalPrice;
        couponDiscount = discount; // 쿠폰 할인 값 저장
        pointsInput.disabled = true; // 포인트 입력 비활성화
      } else {
        couponDiscount = discount; // 선택된 쿠폰 할인 값 저장
      }

      // 할인 적용 금액 업데이트
      document.getElementById("discountAmount").innerText = discount + " 원";

      // 최종 결제 금액 업데이트
      finalPrice = originalPrice - discount;
      document.getElementById("finalPrice").innerText = finalPrice + " 원";

      // 결제 금액 및 할인 금액 최종 업데이트
      updateFinalPrice();
    });



    // 포인트 입력 시 실시간 업데이트
    pointsInput.addEventListener("input", function () {
      enteredPoints = parseInt(pointsInput.value, 10) || 0;

      // 사용자가 보유한 포인트보다 많이 입력하면 보유 포인트 한도로 조정
      if (enteredPoints > userPoint) {
        enteredPoints = userPoint;
      }

      // 입력된 포인트가 상품 금액을 초과하면 상품 금액으로 제한
      if (enteredPoints > originalPrice) {
        enteredPoints = originalPrice;
      }

      // 총 할인 금액 계산 (쿠폰 할인 + 포인트 사용)
      totalDiscount = couponDiscount + enteredPoints;

      //  총 할인 금액이 상품 가격을 초과하면 조정
      if (totalDiscount > originalPrice) {
        totalDiscount = originalPrice;

        // 포인트 사용 금액을 조정하여 총 할인 금액이 초과되지 않도록 설정
        enteredPoints = originalPrice - couponDiscount;
        if (enteredPoints < 0) enteredPoints = 0; // 음수가 되지 않도록 보장
      }

      // 조정된 값을 다시 입력 필드에 반영
      pointsInput.value = enteredPoints;

      // 할인 금액 업데이트
      discountAmountEl.innerText = totalDiscount + " 원";

      // 최종 결제 금액 업데이트 (음수가 되지 않도록 최소값 0 설정)
      let finalPrice = Math.max(originalPrice - totalDiscount, 0);
      finalPriceEl.innerText = finalPrice + " 원";
      totalPrice = finalPrice;
    });


    // 최종 결제 금액 업데이트 함수
    function updateFinalPrice() {
      let enteredPoints = parseInt(pointsInput.value, 10) || 0;
      totalDiscount = couponDiscount + enteredPoints;
      discountAmountEl.innerText = totalDiscount + " 원";
      let finalPrice = Math.max(originalPrice - totalDiscount, 0);
      finalPriceEl.innerText = finalPrice + " 원";
      totalPrice=finalPrice;
    }
  });


  // pIdx 값을 가져오기 (JSP에서 requestScope 값을 JavaScript로 전달)
  var pIdx = ${requestScope.pIdx};

  // select 요소 가져오기
  var dropdown = document.getElementById("couponDropdown");

  // 특정 pIdx 값일 때만 couponIdx가 5인 옵션만 활성화
  // 모든 쿠폰을 기본적으로 비활성화
  for (var i = 0; i < dropdown.options.length; i++) {
    var option = dropdown.options[i];
    if (option.value && !isNaN(option.value)) {
      option.disabled = true; // 기본적으로 비활성화
    }
  }

  // 특정 pIdx 값일 때만 해당 쿠폰 활성화
  for (var i = 0; i < dropdown.options.length; i++) {
    var option = dropdown.options[i];

    if (option.value && !isNaN(option.value)) {
      var optionValue = parseInt(option.value);

      if ((pIdx == 11 || pIdx == 12) && optionValue === 6) {
        option.disabled = false; // 활성화
      }
      if ((pIdx == 16 || pIdx == 17) && optionValue === 5) {
        option.disabled = false; // 활성화
      }
      if ((pIdx == 13 || pIdx == 14) && optionValue === 7) {
        option.disabled = false; // 활성화
      }
    }
  }



  const tossPayments = TossPayments("test_ck_24xLea5zVARRXDQbeYRYrQAMYNwW");
  let quant =document.getElementById("productQuant").innerHTML.trim();
  let firstChar = quant.charAt(0);
  let title = document.getElementById("productTitle").innerHTML.trim();
  let image = document.getElementById("productImg").innerHTML.trim();

  let totalPrice = parseInt(document.getElementsByClassName("payment-value final")[0].innerText.trim(), 10);

  function requestPayment() {


    let successUrl ="${pageContext.request.contextPath}/UserController?type=success&pIdx=${pIdx}&image="+image+"&quant="+firstChar+"&totalDiscount="+totalDiscount
            +"&enteredPoints="+enteredPoints
            +"&couponDiscount="+couponDiscount
            +"&couponIdx="+couponIdx;

    if(totalPrice===0){
      location.href=window.location.origin + "${pageContext.request.contextPath}/UserController?type=success0&pIdx=${pIdx}&image="+image+"&quant="+firstChar+"&enteredPoints="+enteredPoints
              +"&couponDiscount="+couponDiscount
              +"&couponIdx="+couponIdx
              +"&totalDiscount="+totalDiscount
              +"&amount="+originalPrice
              +"&ordername="+ordername;

              return ;

    }


    console.log(image);
    tossPayments.requestPayment('카드', { // 결제 수단 (예: 카드, 계좌이체 등)
      amount: totalPrice, // 결제 금액 (예: 5000원)
      orderId: document.getElementById("orderId").innerHTML, // 주문 ID (서버에서 생성해야 함)
      orderName: document.getElementsByClassName("movie-title")[0].innerText, // 상품명
      customerEmail: "abc@naver.com", // 고객 이메일
      successUrl: window.location.origin + successUrl,
      failUrl: window.location.origin + "${pageContext.request.contextPath}/UserController?type=reservationPaymentFail", // 결제 실패 시 이동할 페이지
    })
            .catch(function (error) {
              console.error(error);
              alert("결제 중 오류가 발생했습니다. 다시 시도해 주세요.");
            });
    return false;
  }


  document.addEventListener("DOMContentLoaded", () => {
    // 카드 및 간편결제 버튼과 영역 가져오기
    const cardBtn = document.getElementById("card-btn");
    const simpleBtn = document.getElementById("simple-btn");
    const paymentCard = document.getElementById("payment-card");
    const paymentSimple = document.getElementById("payment-simple");

    // 카드 버튼 클릭 이벤트
    cardBtn.addEventListener("click", () => {
      paymentCard.style.display = "block"; // 카드 결제 영역 표시
      paymentSimple.style.display = "none"; // 간편결제 영역 숨김

      // 버튼 활성화 스타일
      cardBtn.classList.add("active");
      simpleBtn.classList.remove("active");
    });

    // 간편결제 버튼 클릭 이벤트
    simpleBtn.addEventListener("click", () => {
      paymentCard.style.display = "none"; // 카드 결제 영역 숨김
      paymentSimple.style.display = "block"; // 간편결제 영역 표시

      // 버튼 활성화 스타일
      simpleBtn.classList.add("active");
      cardBtn.classList.remove("active");
    });

    // 쿠폰 데이터 추가
    const coupons = [
      { name: "메가박스 쿠션", discount: 100, expiration: "2024-10-21" },
      { name: "스파클링 워터", discount: 71, expiration: "2024-02-05" },
      { name: "팝콘+콜라 세트", discount: 28, expiration: "2024-06-15" },
    ];

    const dropdown = document.getElementById("couponDropdown");

    // 쿠폰 옵션 추가
    coupons.forEach((coupon) => {
      const option = document.createElement("option");
      option.value = coupon.name;
      option.textContent = `${coupon.name} (${coupon.discount}원 할인) - ${coupon.expiration}`;
      dropdown.appendChild(option);
    });

    // 선택한 쿠폰 디버깅
    dropdown.addEventListener("change", () => {
      const selectedOption = dropdown.options[dropdown.selectedIndex];
      console.log(`선택된 쿠폰: ${selectedOption.textContent}`);
    });

    // 취소/환불 동의 버
    const cancelButton = document.getElementById("cancel-btn");

    cancelButton.addEventListener("click", () => {
      cancelButton.classList.toggle("active"); // 버튼 상태 토글
    });
  });
</script>
<!-- footer 영역 -->
<jsp:include page="../common/footer.jsp"/>
</body>
</html>