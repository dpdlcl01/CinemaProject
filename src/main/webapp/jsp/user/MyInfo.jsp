<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!Doctype html>
<html lang="ko">
<!-- head -->
<head>
    <jsp:include page="/jsp/user/head.jsp"/>
</head>
<style>
    /* 기본 스타일 */
    body {
        font-family: 'Arial', sans-serif;
        margin: 0;
        padding: 0;
        background-color: #f9f9f9;
        display: block;
    }
    /* 사이드바 스타일 */
    .clearfix {
        display: flex; /* Flexbox 사용 */
        max-width: 1200px;
        margin: 0 auto;
        padding: 20px;
        background-color: #fff;
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
    /* 메인 콘텐츠 스타일 */
    .main-content {
        width: 75%;
        margin: auto;
        float: right;
    }
    .section {
        background-color: #fff;
        padding: 20px;
        margin-bottom: 20px;
        border-radius: 5px; /* 모서리 둥글게 */
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    }
    .section h2 {
        font-size: 18px; /* 제목 크기 */
        margin-bottom: 10px; /* 제목 아래 여백 */
    }

    /* 카드 스타일 */
    .card-container {
        display: flex;
        justify-content: space-between;
        padding-right: 50px;
        gap: 10px; /* 카드 간격 */
    }
    .card {
        flex-grow: 1; /* 카드 크기 균등 분배 */
        background-color: #f5f5f5;
        padding: 15px;
        text-align: center;
        border-radius: 5px; /* 모서리 둥글게 */
    }

</style>
<body>
<!-- header 영역 -->
<jsp:include page="/jsp/user/header.jsp"/>

<!-- contents 영역 -->
<div id="contents">
    <!-- 사이드바 및 메인 콘텐츠 -->
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
        <main class="main-content">

            <!-- 사용자 정보 섹션 -->
            <div class="section">
                <h2>안녕하세요! [username]님</h2>
                <p>포인트 : 0P</p>
                <!-- 추가 정보 -->
            </div>

            <!-- 카드 섹션 -->
            <div class="card-container">
                <div class="card">
                    <h3>나의 무비스토리</h3>
                    <p>본 영화 : 0편<br>관람평 : 0개<br>보고싶다 : 0개</p>
                </div>
                <div class="card">
                    <h3>선호관람정보</h3>
                    <p>선호극장 : 없음<br>선호시간 : 없음</p>
                </div>
            </div>

            <!-- 예매 내역 -->
            <div class="section">
                <h2>나의 예매내역</h2>
                <p>예매 내역이 없습니다.</p>
            </div>

            <!-- 구매 내역 -->
            <div class="section">
                <h2>나의 구매내역</h2>
                <p>구매 내역이 없습니다.</p>
            </div>
        </main>
    </div>
</div>

<!-- footer 영역 -->
<jsp:include page="/jsp/user/footer.jsp"/>

<!-- script 영역 -->
<script>

</script>
</body>
</html>