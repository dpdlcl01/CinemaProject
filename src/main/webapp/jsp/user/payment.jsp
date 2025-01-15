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
    <jsp:include page="./common/head.jsp"/>
    <title>결제하기</title>
</head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="../../css/user/payment.css?v=1.0" type="text/css">
<body>
<!-- header 영역 -->
<jsp:include page="./common/header.jsp"/>
<!-- 추가된 page-util -->
<div class="page-util">
    <div class="inner-wrap">
        <div class="location">
            <span>Home</span>
            <a href="/booking" title="예매 페이지로 이동">예매</a>
            <a href="/booking" title="빠른예매 페이지로 이동">빠른예매</a>
        </div>
    </div>
</div>
<!-- contents 영역 -->
<div id="contents">
    <div class="payment-main">
        <h1 class="payment-title">결제하기</h1>
        <div class="payment-container">
            <!-- 예매 정보 -->
            <div class="payment-check">
                <div class="booking-info">
                    <h2>예매정보</h2>
                    <div class="movie-details">
                        <img src="../../css/user/images/movie_poster.jpg" alt="검은 수녀들 포스터">
                        <div class="movie-info">
                            <p class="movie-title">검은 수녀들</p>
                            <p class="movie-about">2025.01.24 (금) 11:25~13:29</p>
                            <p class="movie-about">강남 / 1관 · 2D</p>
                            <p class="movie-about">성인 1</p>
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
                    <div class="payment-choose">
                        <div class="payment-btn">
                            <h2>결제수단</h2>
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
            </div>
            <!-- 결제 금액 -->
            <div class="payment">
                <div class="payment-summary">
                    <h2>결제금액</h2>
                    <div class="payment-details">
                        <p>금액: <span>15,000 원</span></p>
                        <p>할인적용: <span>0 원</span></p>
                        <p>추가 차액: <span>0 원</span></p>
                        <p class="final-payment">
                            최종결제금액: <span>15,000 원</span>
                        </p>
                    </div>
                    <div class="btn-group">
                        <a href="" class="button pre" id="pagePrevious" title="이전">이전</a>
                        <a href="" class="button active" id="pageNext" title="결제">결제</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- script 영역 -->
<script>
    // DOMContentLoaded 이벤트로 코드가 DOM 로드 후 실행되도록 보장
    document.addEventListener("DOMContentLoaded", () => {
        // 쿠폰 데이터
        const coupons = [
            { category: "기타", name: "메가박스 쿠션", description: "메가박스 쿠션 - 기타의 인기 상품입니다.", code: 19763, discount: 100, expiration: "2024-10-21", type: 1 },
            { category: "음료", name: "스파클링 워터", description: "스파클링 워터 - 음료의 인기 상품입니다.", code: 10918, discount: 71, expiration: "2024-02-05", type: 1 },
            { category: "스낵", name: "팝콘+콜라 세트", description: "팝콘+콜라 세트 - 스낵의 인기 상품입니다.", code: 16920, discount: 28, expiration: "2024-06-15", type: 2 },
        ];

        // 드롭다운 요소 가져오기
        const dropdown = document.getElementById("couponDropdown");

        // 쿠폰 데이터를 드롭다운에 추가
        coupons.forEach(coupon => {
            const option = document.createElement("option");
            option.value = coupon.code;
            option.textContent = "${coupon.name} (${coupon.discount}원 할인) - ${coupon.expiration}";
            dropdown.appendChild(option);
        });

        // 선택한 쿠폰 출력 (디버깅용)
        dropdown.addEventListener("change", () => {
            const selectedOption = dropdown.options[dropdown.selectedIndex];
            console.log("선택된 쿠폰: ${selectedOption.textContent}");
        });
    });
</script>
<!-- footer 영역 -->
<jsp:include page="./common/footer.jsp"/>
</body>
</html>