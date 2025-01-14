<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!Doctype html>
<html lang="ko">
<head>
<jsp:include page="head.jsp"/>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: block;
        }
        main {
            display: flex;
            flex-direction: row;
            max-width: 1200px;
            margin: 0 auto;
        }
        .clearfix {
            display: flex; /* Flexbox 사용 */
            max-width: 1200px;
            width: 100%;
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
        #contents {
            width: 100%;
        }

        .content {
            width: 70%;
            flex-grow: 1;
            padding: 20px;
            box-sizing: border-box;
        }
        .content h1 {
            font-size: 24px;
            margin-bottom: 20px;
        }
        .content .filter {
            margin-bottom: 20px;
        }
        .content .filter select,
        .content .filter button {
            padding: 5px 10px;
            margin-right: 10px;
        }
        .content table {
            width: 100%;
            border-collapse: collapse;
        }
        .content table th,
        .content table td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: left;
        }
        .content table th {
            background-color: #f4f4f4;
        }
    </style>
</head>
<body>
<jsp:include page="header.jsp"/>
<main>
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


    <div class="content">
        <!-- Page Title -->
        <h1>예매/구매 내역</h1>

        <div class="filter">
            <select>
                <option>예매내역</option>
                <option>지난내역</option>
                <option>취소내역</option>
            </select>
            <select>
                <option>2025년 1월</option>
                <option>2024년 12월</option>
                <option>2024년 11월</option>
            </select>
            <button>조회</button>
        </div>

        <table class="table">
            <thead>
            <tr>
                <th>취소일시</th>
                <th>영화명</th>
                <th>극장</th>
                <th>상영일시</th>
                <th>취소금액</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td colspan="5" style="text-align:center;">취소내역이 없습니다.</td>
            </tr>
            </tbody>
        </table>
    </div>
    </div>
    </div>
</main>

<footer>
    <jsp:include page="footer.jsp"/>
</footer>

</body>
</html>
