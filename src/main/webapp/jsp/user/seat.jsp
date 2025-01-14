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
  <link rel="stylesheet" href="../../css/user/seat.css">
  <link rel="stylesheet" href="../../css/user/style.css">
  <jsp:include page="header.jsp"/>
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
  </div>
  <div class="res-main">
    <h1 class="res-title">빠른 예매</h1>
    <div class="seat-selection-container">
      <!-- 좌석 선택 -->
      <div class="seat-selection">
        <div class="header">
          <div class="counter">
            <label for="adult">성인</label>
            <button class="btn decrease" data-target="adult">-</button>
            <span id="adult" class="value">0</span>
            <button class="btn increase" data-target="adult">+</button>
          </div>
          <div class="counter">
            <label for="student">청소년</label>
            <button class="btn decrease" data-target="student">-</button>
            <span id="student" class="value">0</span>
            <button class="btn increase" data-target="student">+</button>
          </div>
          <button class="reset">초기화</button>
        </div>
        <div class="seat-container">
          <div class="screen">SCREEN</div>
              <%-- A set --%>
          <div class="rows">
            <div class="rows">--%>
              <div class="row" data-row="front">
                <button class="empty"></button>
                <button class="empty"></button>
                <button class="door-left"></button>
                <button class="empty"></button>
                <button class="empty"></button>
                <button class="empty"></button>
                <button class="empty"></button>
                <button class="empty"></button>
                <button class="empty"></button>
              </div>
            <div class="row" data-row="A">
              <button>1</button>
              <button class="empty"></button>
              <button>2</button>
              <button>3</button>
              <button>4</button>
              <button class="empty"></button>
              <button>5</button>
            </div>
            <div class="row" data-row="B">
              <button>1</button>
              <button class="empty"></button>
              <button>2</button>
              <button>3</button>
              <button>4</button>
              <button class="empty"></button>
              <button>5</button>
            </div>
            <div class="row" data-row="C">
              <button>1</button>
              <button class="empty"></button>
              <button>2</button>
              <button>3</button>
              <button>4</button>
              <button class="empty"></button>
              <button>5</button>
            </div>
            <div class="row" data-row="D">
              <button>1</button>
              <button class="empty"></button>
              <button>2</button>
              <button>3</button>
              <button>4</button>
              <button class="empty"></button>
              <button>5</button>
            </div>
            <div class="row" data-row="back">
              <button class="empty"></button>
              <button class="empty"></button>
              <button class="empty"></button>
              <button class="empty"></button>
              <button class="empty"></button>
              <button class="empty"></button>
              <button class="door-top"></button>
              <button class="empty"></button>
              <button class="empty"></button>
            </div>
          </div>
          <%-- B set --%>
<%--          <div class="rows">--%>
<%--            <div class="row" data-row="front">--%>
<%--              <button class="empty"></button>--%>
<%--              <button class="empty"></button>--%>
<%--              <button class="door-left"></button>--%>
<%--              <button class="empty"></button>--%>
<%--              <button class="empty"></button>--%>
<%--              <button class="empty"></button>--%>
<%--              <button class="empty"></button>--%>
<%--              <button class="empty"></button>--%>
<%--              <button class="empty"></button>--%>
<%--            </div>--%>
<%--            <div class="row" data-row="A">--%>
<%--              <button>A</button>--%>
<%--              <button class="empty"></button>--%>
<%--              <button>1</button>--%>
<%--              <button>2</button>--%>
<%--              <button>3</button>--%>
<%--              <button>4</button>--%>
<%--              <button class="empty"></button>--%>
<%--              <button>5</button>--%>
<%--              <button>6</button>--%>
<%--            </div>--%>
<%--            <div class="row" data-row="B">--%>
<%--              <button>B</button>--%>
<%--              <button class="empty"></button>--%>
<%--              <button>1</button>--%>
<%--              <button>2</button>--%>
<%--              <button>3</button>--%>
<%--              <button>4</button>--%>
<%--              <button class="empty"></button>--%>
<%--              <button>5</button>--%>
<%--              <button>6</button>--%>
<%--            </div>--%>
<%--            <div class="row" data-row="C">--%>
<%--              <button>C</button>--%>
<%--              <button class="empty"></button>--%>
<%--              <button>1</button>--%>
<%--              <button>2</button>--%>
<%--              <button>3</button>--%>
<%--              <button>4</button>--%>
<%--              <button class="empty"></button>--%>
<%--              <button>5</button>--%>
<%--              <button>6</button>--%>
<%--            </div>--%>
<%--            <div class="row" data-row="D">--%>
<%--              <button>D</button>--%>
<%--              <button class="empty"></button>--%>
<%--              <button>1</button>--%>
<%--              <button>2</button>--%>
<%--              <button>3</button>--%>
<%--              <button>4</button>--%>
<%--              <button class="empty"></button>--%>
<%--              <button>5</button>--%>
<%--              <button>6</button>--%>
<%--            </div>--%>
<%--            <div class="row" data-row="back">--%>
<%--              <button class="empty"></button>--%>
<%--              <button class="empty"></button>--%>
<%--              <button class="empty"></button>--%>
<%--              <button class="empty"></button>--%>
<%--              <button class="empty"></button>--%>
<%--              <button class="empty"></button>--%>
<%--              <button class="door-top"></button>--%>
<%--              <button class="empty"></button>--%>
<%--              <button class="empty"></button>--%>
<%--            </div>--%>
<%--          </div>--%>
          <%-- C set --%>
<%--          <div class="rows">--%>
<%--            <div class="row" data-row="A">--%>
<%--              <button>1</button>--%>
<%--              <button>2</button>--%>
<%--              <button>3</button>--%>
<%--              <button>4</button>--%>
<%--              <button class="empty"></button>--%>
<%--              <button>5</button>--%>
<%--              <button>6</button>--%>
<%--              <button>7</button>--%>
<%--              <button>8</button>--%>
<%--            </div>--%>
<%--            <div class="row" data-row="B">--%>
<%--              <button>1</button>--%>
<%--              <button>2</button>--%>
<%--              <button>3</button>--%>
<%--              <button>4</button>--%>
<%--              <button class="empty"></button>--%>
<%--              <button>5</button>--%>
<%--              <button>6</button>--%>
<%--              <button>7</button>--%>
<%--              <button>8</button>--%>
<%--            </div>--%>
<%--            <div class="row" data-row="C">--%>
<%--              <button class="empty"></button>--%>
<%--              <button class="empty"></button>--%>
<%--              <button>1</button>--%>
<%--              <button>2</button>--%>
<%--              <button class="empty"></button>--%>
<%--              <button>3</button>--%>
<%--              <button>4</button>--%>
<%--              <button class="empty"></button>--%>
<%--              <button class="empty"></button>--%>
<%--            </div>--%>
<%--          </div>--%>

        </div>

      </div>
      <!-- 영화 정보 -->
      <div class="movie-info">
        <h2>보고타: 마지막 기회의 땅</h2>
        <p>강남</p>
        <p>2관</p>
        <p>2025.01.19 (일)</p>
        <p>10:10 ~ 12:06</p>
        <img src="movie-poster.jpg" alt="보고타 영화 포스터">
        <div class="selected-seats">
          <p>선택 좌석</p>
          <ul>
            <li>A3</li>
            <li>A4</li>
          </ul>
        </div>
        <p class="total-price">총 결제 금액: 0원</p>
        <button class="next-button">다음</button>
      </div>
    </div>
  </div>
</div>
<jsp:include page="footer.jsp"/>
</body>
</html>
