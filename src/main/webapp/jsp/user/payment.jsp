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
<link rel="stylesheet" href="../../css/user/payment.css">
<body>
<!-- header 영역 -->
<jsp:include page="./common/header.jsp"/>
<!-- contents 영역 -->
<div id="contents">
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
                    <h2>할인적용</h2>
                    <div class="discount-options">
                        <div class="tabs">
                            <button>쿠폰/관람권/기타</button>
                            <button>포인트</button>
                        </div>
                        <div class="discount-buttons">
                            <button>할인쿠폰</button>
                            <button>VIP 영화쿠폰</button>
                            <button>메가박스 관람권</button>
                            <button>스토어 교환권</button>
                            <button>모바일 관람권</button>
                            <button>페이즈 금액권</button>
                            <button>중앙패밀리</button>
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

<!-- footer 영역 -->
<jsp:include page="./common/footer.jsp"/>

<!-- script 영역 -->
<script>

</script>
</body>
</html>