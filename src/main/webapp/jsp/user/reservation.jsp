<%--
  Created by IntelliJ IDEA.
  User: ham
  Date: 2025. 1. 13.
  Time: 오후 5:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
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
    <script src="https://kit.fontawesome.com/d7f530ec10.js" crossorigin="anonymous"></script>

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>빠른 예매</title>
    <link rel="stylesheet" href="../../css/user/reservation.css">
    <link rel="stylesheet" href="../../css/user/style.css">
    <jsp:include page="./common/header.jsp"/>
</head>
<body>
<div id="content">
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
    <div class="res-main">
        <h1 class="res-title">빠른 예매</h1>
        <div class="res-container">
            <nav class="date-navigation">
                <button>◀</button>
                <ul>
                    <li>2025.01</li>
                    <li>21 · 화</li>
                    <li>22 · 수</li>
                    <li>23 · 목</li>
                    <li>24 · 금</li>
                    <li>25 · 토</li>
                    <li>26 · 일</li>
                </ul>
                <button>▶</button>
            </nav>
            <main class="content">
                <section class="movie-selection">
                    <h2>영화</h2>
                    <ul>
                        <li>말할 수 없는 비밀</li>
                        <li>검은 수녀들</li>
                        <li>하얼빈</li>
                        <li>동화지만 참불입니다</li>
                        <li>고별의 상자</li>
                    </ul>
                </section>
                <section class="theater-selection">
                    <h2>극장</h2>
                    <ul>
                        <li>서울 (20)</li>
                        <li>경기 (31)</li>
                        <li>인천 (6)</li>
                        <li>대전/충청/세종 (17)</li>
                        <li>부산/대구/경상 (27)</li>
                    </ul>
                </section>
                <section class="time-selection">
                    <h2>시간</h2>
                    <p>영화와 극장을 선택하시면 상영 시간표를 비교하여 볼 수 있습니다.</p>
                </section>
            </main>
        </div>
    </div>
</div>
<jsp:include page="./common/footer.jsp"/>
</body>
</html>