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
</head>
<body>
<jsp:include page="header.jsp"/>

    <!-- 사이드바 및 메인 콘텐츠 -->
    <div class="clearfix">
        <!-- 사이드바 -->
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

<jsp:include page="footer.jsp"/>
</body>
</html>
