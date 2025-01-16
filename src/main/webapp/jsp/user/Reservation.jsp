<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!Doctype html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>라이프시어터, 메가박스</title>
    <meta property="name" id="metaTagTitle" content="라이프시어터,메가박스">
    <meta property="description" id="metaTagDtls" content="삶의 의미와 즐거움을 소통하는 공간, 함께 더 행복한 가치있는 콘텐츠를 추구하는 만남과 소통의 즐거움이 가득한 공간 메가박스 입니다.">
    <meta property="keywords" id="metaTagKeyword" content="메가박스,megabox,영화,영화관,극장,티켓,박스오피스,상영예정작,예매,오페라,싱어롱,큐레이션,필름소사이어티,이벤트,Movie,theater,Cinema,film,Megabox">
    <link rel="stylesheet" href="../../css/user/reset.css">
    <link rel="stylesheet" href="../../css/user/style.css">
    <script src="../../js/app.js"></script>
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
        .sidebar {
            width: 250px;
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
        .content {
            flex-grow: 1;
            padding: 20px;
            box-sizing: border-box;
        }
        .content h1 {
            font-size: 20px;
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
    <!-- Sidebar -->
    <div class="sidebar">
        <ul>
            <li><a href="MyInfo.jsp"><strong>나의 메가박스</strong></a></li>
            <li><a href="Reservation.jsp">예매/구매내역</a></li>
            <li><a href="#">영화/스토어 관람권</a></li>
            <li><a href="Discount-Coupon.jsp">메가박스/제휴쿠폰</a></li>
            <li><a href="#">멤버십 포인트</a></li>
            <li><a href="#">나의 무비스토리</a></li>
            <li><a href="#">회원정보</a></li>
        </ul>
    </div>

    <!-- Content -->
    <div class="content">
        <!-- Page Title -->
        <h1>예매/구매 내역</h1>

        <!-- Filter Section -->
        <div class="filter">
            <select>
                <option>예매내역</option>
                <option>지난내역</option>
                <option>취소내역</option>
            </select>
            <select>
                <option>2025년 1월</option>
                <!-- Add more months dynamically if needed -->
                <option>2024년 12월</option>
                <option>2024년 11월</option>
                <!-- ... -->
            </select>
            <button>조회</button>
        </div>

        <!-- Table Section -->
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
            <!-- Placeholder for no data -->
            <tr>
                <td colspan="5" style="text-align:center;">취소내역이 없습니다.</td>
            </tr>
            <!-- Example dynamic rows (to be replaced with actual data) -->
            <!--
            Example:
            <tr>
                <td>2025-01-12 오후 3시</td>
                <td>하얼빈</td>
                <td>메가박스 강남점</td>
                <td>2025-01-15 오후 7시</td>
                <td>15,000원</td>
            </tr>
            -->
            </tbody>
        </table>

    </div>

</main>

<footer>
    <jsp:include page="footer.jsp"/>
</footer>

</body>
</html>
