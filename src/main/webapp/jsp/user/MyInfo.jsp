<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!Doctype html>
<html lang="ko">

<head>
    <jsp:include page="/jsp/user/head.jsp"/>
</head>
<style>

    body {
        font-family: 'Arial', sans-serif;
        margin: 0;
        padding: 0;
        background-color: #f9f9f9;
        display: block;
    }

    .clearfix {
        display: flex;
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

    .main-content {
        width: 75%;
        margin: auto;
        float: right;
    }
    .section {
        background-color: #fff;
        padding: 20px;
        margin-bottom: 20px;
        border-radius: 5px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    }
    .section h2 {
        font-size: 18px;
        margin-bottom: 10px;
    }


    .card-container {
        display: flex;
        justify-content: space-between;
        padding-right: 50px;
        gap: 10px;
    }
    .card {
        flex-grow: 1;
        background-color: #f5f5f5;
        padding: 15px;
        text-align: center;
        border-radius: 5px;
    }

</style>
<body>
<jsp:include page="/jsp/user/header.jsp"/>
<div id="contents">
    <div class="clearfix">
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

        <main class="main-content">

            <div class="section">
                <h2>안녕하세요! [username]님</h2>
                <p>포인트 : 0P</p>
            </div>

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

            <div class="section">
                <h2>나의 예매내역</h2>
                <p>예매 내역이 없습니다.</p>
            </div>

            <div class="section">
                <h2>나의 구매내역</h2>
                <p>구매 내역이 없습니다.</p>
            </div>
        </main>
    </div>
</div>

<jsp:include page="/jsp/user/footer.jsp"/>

<script>

</script>
</body>
</html>