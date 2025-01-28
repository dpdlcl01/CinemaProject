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
  <title>결제하기</title>
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
              <p class="movie-title">${requestScope.name}</p>
              <div id="categoryPrice">
                <p class="movie-about">${requestScope.category}</p>
                <span id="movie-detailsPrice">${requestScope.price}원</span>
              </div>

              <p class="movie-about">${requestScope.quant}개</p>
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
                <%--                                <option value="">사용 가능한 쿠폰 선택</option>--%>
                <option>사용 가능한 쿠폰 선택</option>
              </select>
            </div>
          </div>
          <div class="discount-points">
            <div class="points-usage">
              <h2>포인트 사용</h2>
              <div class="points-have">
                <span>보유</span>
                <span class="points">9,330원</span>
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
            <h2>결제수단</h2>
            <div class="payment-btn">
              <button class="btn" id="card-btn">신용/체크카드</button>
              <button class="btn" id="simple-btn">간편결제</button>
            </div>
            <%--  카드 결제 영역  --%>
            <div class="payment-card" id="payment-card">
              <label for="card-company">카드사 선택</label>
              <select id="card-company" class="card-company">
                <option value="현대카드">현대카드</option>
                <option value="삼성카드">삼성카드</option>
                <option value="신한카드">신한카드</option>
              </select>
            </div>
            <%--  간편결제 영역  --%>
            <div class="payment-simple" id="payment-simple" style="display: none;">
              <label>간편결제 선택</label>
              <div class="payment-simple-radio">
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
              </div>
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
                <p class="payment-label">${requestScope.price}</p>
              </div>
            </div>
            <div class="payment-divider">
              <div class="circle">-</div>
            </div>
            <div class="discount-box">
              <p class="payment-label">할인적용</p>
              <p class="payment-value">0 원</p>
            </div>
            <div class="payment-row final-amount">
              <p class="payment-label">최종결제금액</p>
              <p class="payment-value final">${requestScope.price}원</p>
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

<!-- script 영역 -->
<script>
  const tossPayments = TossPayments("test_ck_24xLea5zVARRXDQbeYRYrQAMYNwW");


  let totalPrice = parseInt(document.getElementsByClassName("payment-value final")[0].innerText.trim(), 10);
  function requestPayment() {
    tossPayments.requestPayment('카드', {
      amount: totalPrice,
      orderId: "order-12345",
      orderName: document.getElementsByClassName("movie-title")[0].innerText,
      customerEmail: "user@example.com",
      successUrl: "http://localhost:8081/CinemaProject/jsp/user/store/paymentSuccess.jsp",
      failUrl: "http://localhost:8081/CinemaProject/jsp/user/store/paymentFail.jsp",
    })
            .then(function(response) { // 결제 성공 후 실행될 콜백 함수
              fetch("http://localhost:8081/PaymentController", {
                method: "POST",
                headers: {
                  "Content-Type": "application/json"
                },
                body: JSON.stringify({
                  paymentKey: response.paymentKey,
                  orderId: response.orderId
                })
              })
                      .then(res => res.json())
                      .then(data => {
                        if (data.success) {
                          window.location.href = "/paymentSuccess.jsp";
                        } else {
                          alert("결제 데이터 저장 중 오류가 발생했습니다.");
                        }
                      })
                      .catch(error => console.error("서버 요청 오류:", error));
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