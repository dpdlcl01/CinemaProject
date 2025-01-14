<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!Doctype html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <!-- 사용자의 환경에 맞게 화면의 크기를 조정할 수 있도록 함. -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>라이프시어터, 메가박스</title>
    <meta property="name" id="metaTagTitle" content="라이프시어터,메가박스">

    <!-- 해당 페이지의 설명(검색 시 페이지의 제목 아래 페이지 내용의 요약 부분) -->
    <meta property="description" id="metaTagDtls" content="삶의 의미와 즐거움을 소통하는 공간, 함께 더 행복한 가치있는 콘텐츠를 추구하는 만남과 소통의 즐거움이 가득한 공간 메가박스 입니다.">

    <!-- 해당 컨텐츠 내용의 대표적인 키워드를 지정 -->
    <meta property="keywords" id="metaTagKeyword" content="메가박스,megabox,영화,영화관,극장,티켓,박스오피스,상영예정작,예매,오페라,싱어롱,큐레이션,필름소사이어티,이벤트,Movie,theater,Cinema,film,Megabox">

    <!-- OpenGraph -->
    <!-- 웹페이지가 소셜 미디어 또는 오픈그래프를 활용한 사이트로 공유될 때 사용되어지는 정보 -->
    <meta property="fb:app_id" id="fbAppId" content="546913502790694">
    <meta property="og:site_name" id="fbSiteName" content="메가박스">
    <meta property="og:type" id="fbType" content="movie">
    <meta property="og:url" id="fbUrl" content="https://www.megabox.co.kr/">
    <meta property="og:title" id="fbTitle" content="라이프시어터, 메가박스">
    <meta property="og:description" id="fbDtls" content="삶의 의미와 즐거움을 소통하는 공간, 함께 더 행복한 가치있는 콘텐츠를 추구하는 만남과 소통의 즐거움이 가득한 공간 메가박스 입니다.">
    <meta property="og:image" id="fbImg" content="https://img.megabox.co.kr/SharedImg/metaTag/2020/02/04/gFfTzMwwiCxhBwcUV5TRGMFX9Cmoj64W.jpg">
    <link rel="stylesheet" href="../../css/user/reset.css">
    <link rel="stylesheet" href="../../css/user/style.css">
    <script src="https://kit.fontawesome.com/d7f530ec10.js" crossorigin="anonymous"></script>
    <script src="../../js/app.js"></script>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
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
            flex-grow: 1;
            padding: 20px;
        }

        .section {
            background-color: #fff;
            padding: 20px;
            margin-bottom: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .section h2 {
            font-size: 24px;
            margin-bottom: 10px;
        }

        .filters {
            display: flex;
            align-items: center;
            gap: 10px;
            margin-bottom: 20px;
        }

        .filters input[type="radio"] {
            margin-right: 5px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        table th, table td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: left;
        }

        table th {
            background-color: #f4f4f4;
        }
    </style>
</head>
<body>
<main>
    <jsp:include page="header.jsp"/>

    <div class="clearfix">
        <!-- Sidebar -->
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

        <!-- Main Content -->
        <div class="main-content">
            <!-- Section Header -->
            <div class="section">
                <h2>메가박스/제휴쿠폰</h2>

                <!-- Information -->
                <p>• 보유하신 쿠폰 내역입니다.<br>• 각 쿠폰 별 사용 방법이 다르니 사용 전 상세 쿠폰정보를 확인바랍니다.</p>

                <!-- Filters -->
                <div class="filters">
                    <label><input type="radio" name="filter" checked> 사용가능</label>
                    <label><input type="radio" name="filter"> 사용완료</label>
                    <label><input type="radio" name="filter"> 기간만료</label>

                    <select>
                        <option>전체</option>
                        <option>매점</option>
                        <option>포인트</option>
                        <option>기타</option>
                    </select>

                    <button>조회</button>
                </div>

                <!-- Coupon Table -->
                <table>
                    <thead>
                    <tr>
                        <th>구분</th>
                        <th>쿠폰명</th>
                        <th>유효기간</th>
                        <th>사용상태</th>
                        <th></th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>매점</td>
                        <td>[생일쿠폰] 오리지널 팝콘 L 무료<br>9218-4969-2233-4408</td>
                        <td>2025.01.05 ~ 2025.01.23</td>
                        <td>사용가능</td>
                        <td><button>쿠폰정보</button></td>
                    </tr>
                    </tbody>
                </table>

                <!-- Pagination -->
                <div style="text-align:center; margin-top:20px;">
                    [1]
                </div>

            </div>

        </div>

    </div>
</main>
<jsp:include page="footer.jsp"/>
</body>
</html>
