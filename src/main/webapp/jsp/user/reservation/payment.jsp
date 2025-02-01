<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!Doctype html>
<html lang="ko">
<!-- head -->
<head>
    <jsp:include page="../common/head.jsp"/>
    <title>결제하기</title>
</head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/payment.css"      type="text/css">
<body>
<!-- header 영역 -->
<jsp:include page="../common/header.jsp"/>
<!-- 추가된 page-util -->
<div class="page-util">
    <div class="inner-wrap">
        <div class="location">
            <span>Home</span>
            <img src="https://img.megabox.co.kr/static/pc/images/common/bg/bg-location-arr.png"/>
            <label>예매</label>
            <img src="https://img.megabox.co.kr/static/pc/images/common/bg/bg-location-arr.png"/>
            <label>빠른예매</label>
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
                    <h2>예매정보</h2>
                    <div class="movie-details">
                        <img src="${moviePosterUrl}" alt="검은 수녀들 포스터">
                        <div class="movie-info">
                            <p class="movie-title">${movieTitle}</p>
                            <p class="movie-about">${formattedDate} ${formattedStartTime} ~ ${formattedEndTime}</p>
                            <p class="movie-about">${movieType} ${screenIdx}관</p>
                            <p class="movie-about">
                                <c:if test="${adultCount > 0}">성인 ${adultCount}명</c:if>
                                <c:if test="${adultCount > 0 && studentCount > 0}"> / </c:if>
                                <c:if test="${studentCount > 0}">청소년 ${studentCount}명</c:if>
                            </p>
                        </div>
                    </div>
                </div>

                <!-- 할인 적용 -->
                <div class="discount-section">
                    <h2>할인 적용</h2>
                    <div class="discount-coupons">
                        <div class="coupon-title">
                            <span>할인/쿠폰</span>
                            <select id="couponDropdown" class="coupon-dropdown">
                                <c:choose>
                                    <c:when test="${not empty couponList}">
                                        <!-- 쿠폰이 있을 때 -->
                                        <option value="0">쿠폰을 선택해주세요.</option>
                                        <c:forEach var="coupon" items="${couponList}">
                                            <option value="${coupon.couponValue}">
                                                <c:choose>
                                                    <c:when test="${coupon.couponValue == 0}">
                                                        ${coupon.couponName} - 예매권 1장 무료
                                                    </c:when>
                                                    <c:otherwise>
                                                        ${coupon.couponName} - ${coupon.couponValue}원 할인
                                                    </c:otherwise>
                                                </c:choose>
                                            </option>
                                        </c:forEach>
                                    </c:when>
                                    <c:otherwise>
                                        <!-- 쿠폰이 없을 때 -->
                                        <option value="">쿠폰이 없습니다.</option>
                                    </c:otherwise>
                                </c:choose>
                            </select>


                        </div>
                    </div>
                    <div class="discount-points">
                        <div class="points-usage">
                            <h2>포인트 사용</h2>
                            <div class="points-have">
                                <span>보유</span>
                                <span class="points">${requestScope.uservo.userPoint}</span>
                            </div>
                        </div>
                        <div class="points-input-area">
                            <label for="points-input">사용</label>
                            <input type="text" id="points-input" class="points-input" value="0">
                            <span>원</span>
                        </div>
                    </div>
                </div>
<%--                <div class="payment-choose-container">--%>
<%--                    <div class="payment-check">--%>
<%--                        <h2>결제수단</h2>--%>
<%--                        <div class="payment-btn">--%>
<%--                            <button class="btn" id="card-btn">신용/체크카드</button>--%>
<%--                            <button class="btn" id="simple-btn">간편결제</button>--%>
<%--                        </div>--%>
<%--                        &lt;%&ndash;  카드 결제 영역  &ndash;%&gt;--%>
<%--                        <div class="payment-card" id="payment-card">--%>
<%--                            <label for="card-company">카드사 선택</label>--%>
<%--                            <select id="card-company" class="card-company">--%>
<%--                                <option value="현대카드">현대카드</option>--%>
<%--                                <option value="삼성카드">삼성카드</option>--%>
<%--                                <option value="신한카드">신한카드</option>--%>
<%--                            </select>--%>
<%--                        </div>--%>
<%--                        &lt;%&ndash;  간편결제 영역  &ndash;%&gt;--%>
<%--                        <div class="payment-simple" id="payment-simple" style="display: none;">--%>
<%--                            <label>간편결제 선택</label>--%>
<%--                            <div class="payment-simple-radio">--%>
<%--                                <input type="radio" id="toss" name="simple-payment" value="toss" class="simple-payment">--%>
<%--                                <label for="toss" class="simple-payment-label">토스페이</label>--%>
<%--                                <input type="radio" id="naver" name="simple-payment" value="naver" class="simple-payment">--%>
<%--                                <label for="naver" class="simple-payment-label">네이버페이</label>--%>
<%--                                <input type="radio" id="kakao" name="simple-payment" value="kakao" class="simple-payment">--%>
<%--                                <label for="kakao" class="simple-payment-label">카카오페이</label>--%>
<%--                                <input type="radio" id="payco" name="simple-payment" value="payco" class="simple-payment">--%>
<%--                                <label for="payco" class="simple-payment-label">페이코</label>--%>
<%--                                <input type="radio" id="kbpay" name="simple-payment" value="kbpay" class="simple-payment">--%>
<%--                                <label for="kbpay" class="simple-payment-label">KB PAY</label>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="cancel-area">--%>
<%--                            <button type="button" id="cancel-btn" class="cancel-button">--%>
<%--                                ✓--%>
<%--                            </button>--%>
<%--                            <label for="cancel-btn" class="cancel-title">취소/환불 정책에 대한 동의</label>--%>
<%--                            <p class="cancel-content">--%>
<%--                                - 온라인 예매는 영화 상영시간 20분 전까지 취소 가능하며, 20분 이후 현장 취소만 가능합니다.<br>--%>
<%--                                - 현장 취소 시 영화 상영시간 이전까지만 가능합니다.--%>
<%--                            </p>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
            </div>
            <!-- 결제 금액 -->
            <div class="payment">
                <div class="payment-summary">
                    <h2>결제금액</h2>
                    <div class="payment-details">
                        <div class="amount-box">
                            <div class="payment-row">
                                <p class="payment-label">
                                    <c:if test="${adultCount > 0}">성인 ${adultCount}명</c:if>
                                    <c:if test="${adultCount > 0 && studentCount > 0}"> / </c:if>
                                    <c:if test="${studentCount > 0}">청소년 ${studentCount}명</c:if>
                                </p>
                                <p class="payment-label">${totalAmount}</p>
                            </div>
                            <div class="payment-row total-amount">
                                <p class="payment-label">금액</p>
                                <p class="payment-value">${totalAmount} 원</p>
                            </div>
                        </div>
                        <div class="payment-divider">
                            <div class="circle">-</div>
                        </div>
                        <div class="discount-box">
                            <p class="payment-label">할인적용</p>
                            <p><span id="discountAmount">0</span> 원</p>
                        </div>
                        <div class="payment-row final-amount">
                            <p class="payment-label">최종결제금액</p>
                            <p><span id="finalAmount">${totalAmount}</span> 원</p>
                        </div>
                        <div class="payment-row payment-used">
                            <p class="payment-label">결제수단</p>
                            <p class="payment-label">신용/체크카드</p>
                        </div>
                    </div>
                    <div class="btn-group">
                        <a href="#" class="button pre" id="pagePrevious" title="이전">이전</a>
                        <a href="#" class="button active" id="pageNext" title="결제">결제</a>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>

<form id="paymentForm" action="${pageContext.request.contextPath}/UserController?type=reservationPaymentSuccess" method="POST">
    <input type="hidden" name="uservo" value="${uservo}">
    <input type="hidden" name="seatIdxList" value="${seatIdxList}">
    <input type="hidden" name="theaterIdx" value="${theaterIdx}">
    <input type="hidden" name="timetableIdx" value="${timetableIdx}">
    <input type="hidden" name="screenIdx" value="${screenIdx}">
    <input type="hidden" name="adultCount" value="${adultCount}">
    <input type="hidden" name="studentCount" value="${studentCount}">
    <input type="hidden" name="adultPriceIdx" value="${adultPriceIdx}">
    <input type="hidden" name="studentPriceIdx" value="${studentPriceIdx}">
    <input type="hidden" name="paymentTotal" id="formTotalAmount" value="${totalAmount}">
    <input type="hidden" name="paymentDiscount" id="formDiscountAmount" value="0">
    <input type="hidden" name="paymentFinal" id="formFinalAmount" value="${totalAmount}">
    <input type="hidden" name="paymentKey" id="paymentKey">
    <input type="hidden" name="orderId" id="orderId">
</form>

<script src="https://js.tosspayments.com/v1"></script>
<script>
  document.addEventListener("DOMContentLoaded", () => {
    const couponDropdown = document.getElementById("couponDropdown");
    const discountAmountElement = document.getElementById("discountAmount");
    const finalAmountElement = document.getElementById("finalAmount");
    const pointsInput = document.getElementById("points-input");
    const paymentButton = document.getElementById("pageNext");

    const paymentForm = document.getElementById("paymentForm");
    const formDiscountAmount = document.getElementById("formDiscountAmount");
    const formFinalAmount = document.getElementById("formFinalAmount");
    const formPaymentKey = document.getElementById("paymentKey");
    const formOrderId = document.getElementById("orderId");

    let userPoints = parseInt("${requestScope.uservo.userPoint}", 10) || 0;
    let totalAmount = parseInt("${totalAmount}", 10);
    let oneTicketPrice = Math.floor(totalAmount / (${adultCount} + ${studentCount}));

    let discountValue = 0;
    let pointDiscount = 0;

    // 🔹 쿠폰 선택 시 할인 적용
    couponDropdown.addEventListener("change", function () {
      let selectedOption = couponDropdown.options[couponDropdown.selectedIndex];
      discountValue = parseInt(selectedOption.value, 10) || 0;

      if (discountValue === 0 && selectedOption.text.includes("예매권 1장 무료")) {
        discountValue = oneTicketPrice;
      }

      updateFinalPrice();
    });

    // 🔹 포인트 입력 시 최대값 제한 & 실시간 할인 적용
    pointsInput.addEventListener("input", function () {
      let inputValue = parseInt(pointsInput.value, 10) || 0;

      if (inputValue > userPoints) {
        inputValue = userPoints;
      }

      pointDiscount = inputValue;
      pointsInput.value = inputValue;

      updateFinalPrice();
    });

    // 🔹 최종 금액 업데이트 함수
    function updateFinalPrice() {
      let finalPrice = totalAmount - discountValue - pointDiscount;
      finalPrice = Math.max(finalPrice, 0);

      discountAmountElement.textContent = (discountValue + pointDiscount).toLocaleString();
      finalAmountElement.textContent = finalPrice.toLocaleString();
      formDiscountAmount.value = discountValue + pointDiscount;
      formFinalAmount.value = finalPrice;
    }

    // 🔹 Toss Payments 결제 요청
    paymentButton.addEventListener("click", function () {
      let finalPaymentAmount = parseInt(finalAmountElement.textContent.replace(/,/g, ""), 10);

      if (finalPaymentAmount <= 0) {
        alert("최종 결제 금액이 0원이므로 결제할 수 없습니다.");
        return;
      }

      const tossPayments = TossPayments("test_ck_AQ92ymxN34Zmb2DLJyJOrajRKXvd");

      tossPayments.requestPayment("카드", {
        amount: finalPaymentAmount,
        orderId: "ORDER-" + new Date().getTime(),
        orderName: "${movieTitle}",
        customerEmail: "${requestScope.uservo.userEmail}",
        successUrl: window.location.origin + "/UserController?type=reservationPaymentSuccess",
        failUrl: window.location.origin + "/UserController?type=reservationPaymentFail"
      }).then((result) => {
        console.log("결제 성공, 폼 제출 시작"); // 디버깅 추가

        // 결제 성공 시 폼에 추가 데이터 저장 후 전송
        formPaymentKey.value = result.paymentKey;
        formOrderId.value = result.orderId;

        console.log("폼 데이터:", new FormData(paymentForm)); // 폼 데이터 확인

        paymentForm.submit();
      }).catch((error) => {
        console.error("결제 요청 오류:", error);
        alert("결제 요청 중 오류가 발생했습니다.");
      });
    });
  });
</script>



<!-- footer 영역 -->
<jsp:include page="../common/footer.jsp"/>
</body>
</html>