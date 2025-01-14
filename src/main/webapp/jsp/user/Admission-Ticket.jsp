<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <jsp:include page="head.jsp"/>
    <style>
        /* 기본 스타일 */
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
        }

        .contents {
            display: flex;
            max-width: 1200px;
            margin: 0 auto;
            background-color: #fff;
        }

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
            flex-grow: 1;
            padding: 20px;
        }

        .main-content header1 {
            margin-bottom: 20px;
        }

        .main-content header h1 {
            font-size: 24px;
            margin-bottom: 10px;
        }

        .main-content header p {
            font-size: 14px;
            color: #555;
        }

        .register-btn {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 10px 15px;
            cursor: pointer;
            border-radius: 5px;
        }

        /* 테이블 스타일 */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: center;
        }

        th {
            background-color: #f4f4f4;
        }

        /* 푸터 스타일 */
        footer {
            text-align: center;
            margin-top: 20px;
            font-size: 12px;
            color: #777;
        }
    </style>
</head>
<body>
<jsp:include page="header.jsp"/>
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
        <!-- 헤더 -->
        <header>
            <h1>영화관람권</h1>
            <p>보유하신 영화관람권/예매권 내역입니다.<br>소지하신 지정(특정) 관람권은 등록 후 이용하실 수 있습니다.</p>
            <button class="register-btn">관람권 등록</button>
        </header>

        <!-- 테이블 -->
        <section class="ticket-table">
            <table>
                <thead>
                <tr>
                    <th>관람권명</th>
                    <th>유효기간</th>
                    <th>사용상태</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td colspan="3">조회된 관람권 내역이 없습니다.</td>
                </tr>
                </tbody>
            </table>
        </section>
    </main>
</div>

</body>
</html>