<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <jsp:include page="./common/head.jsp"/>
  <title>빠른 예매</title>
</head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<%--<link rel="stylesheet" href="../../css/user/seat.css">--%>
<link rel="stylesheet" href="../../css/user/seat.css?v=1.0">
<body>
<!-- header 영역 -->
<jsp:include page="./common/header.jsp"/>
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
<%--          <div class="rows">--%>
<%--            <div class="rows">--%>
<%--              <div class="row" data-row="front">--%>
<%--                <button class="empty"></button>--%>
<%--                <button class="door-left"></button>--%>
<%--                <button class="empty"></button>--%>
<%--                <button class="empty"></button>--%>
<%--                <button class="empty"></button>--%>
<%--                <button class="empty"></button>--%>
<%--                <button class="empty"></button>--%>
<%--                <button class="empty"></button>--%>
<%--                <button class="empty"></button>--%>
<%--              </div>--%>
<%--            <div class="row" data-row="A">--%>
<%--              <button class="row-label">A</button>--%>
<%--              <button class="empty"></button>--%>
<%--              <button>1</button>--%>
<%--              <button class="empty"></button>--%>
<%--              <button>2</button>--%>
<%--              <button>3</button>--%>
<%--              <button>4</button>--%>
<%--              <button class="empty"></button>--%>
<%--              <button>5</button>--%>
<%--            </div>--%>
<%--            <div class="row" data-row="B">--%>
<%--              <button class="row-label">B</button>--%>
<%--              <button class="empty"></button>--%>
<%--              <button>1</button>--%>
<%--              <button class="empty"></button>--%>
<%--              <button>2</button>--%>
<%--              <button>3</button>--%>
<%--              <button>4</button>--%>
<%--              <button class="empty"></button>--%>
<%--              <button>5</button>--%>
<%--            </div>--%>
<%--            <div class="row" data-row="C">--%>
<%--              <button class="row-label">C</button>--%>
<%--              <button class="empty"></button>--%>
<%--              <button>1</button>--%>
<%--              <button class="empty"></button>--%>
<%--              <button>2</button>--%>
<%--              <button>3</button>--%>
<%--              <button>4</button>--%>
<%--              <button class="empty"></button>--%>
<%--              <button>5</button>--%>
<%--            </div>--%>
<%--            <div class="row" data-row="D">--%>
<%--              <button class="row-label">D</button>--%>
<%--              <button class="empty"></button>--%>
<%--              <button>1</button>--%>
<%--              <button class="empty"></button>--%>
<%--              <button>2</button>--%>
<%--              <button>3</button>--%>
<%--              <button>4</button>--%>
<%--              <button class="empty"></button>--%>
<%--              <button>5</button>--%>
<%--            </div>--%>
<%--            <div class="row" data-row="back">--%>
<%--              <button class="empty"></button>--%>
<%--              <button class="empty"></button>--%>
<%--              <button class="empty"></button>--%>
<%--              <button class="empty"></button>--%>
<%--              <button class="empty"></button>--%>
<%--              <button class="empty"></button>--%>
<%--              <button class="empty"></button>--%>
<%--              <button class="door-top"></button>--%>
<%--              <button class="empty"></button>--%>
<%--            </div>--%>
<%--          </div>--%>
          <%-- B set --%>
          <div class="rows">
            <div class="row" data-row="front">
              <button class="empty"></button>
              <button class="door-left"></button>
              <button class="empty"></button>
              <button class="empty"></button>
              <button class="empty"></button>
              <button class="empty"></button>
              <button class="empty"></button>
              <button class="empty"></button>
              <button class="empty"></button>
            </div>
            <div class="row" data-row="A">
              <button class="row-label">A</button>
              <button class="empty"></button>
              <button>1</button>
              <button>2</button>
              <button>3</button>
              <button>4</button>
              <button class="empty"></button>
              <button>5</button>
              <button>6</button>
            </div>
            <div class="row" data-row="B">
              <button class="row-label">B</button>
              <button class="empty"></button>
              <button>1</button>
              <button>2</button>
              <button>3</button>
              <button>4</button>
              <button class="empty"></button>
              <button>5</button>
              <button>6</button>
            </div>
            <div class="row" data-row="C">
              <button class="row-label">C</button>
              <button class="empty"></button>
              <button>1</button>
              <button>2</button>
              <button>3</button>
              <button>4</button>
              <button class="empty"></button>
              <button>5</button>
              <button>6</button>
            </div>
            <div class="row" data-row="D">
              <button class="row-label">D</button>
              <button class="empty"></button>
              <button>1</button>
              <button>2</button>
              <button>3</button>
              <button>4</button>
              <button class="empty"></button>
              <button>5</button>
              <button>6</button>
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
          <%-- C set --%>
<%--          <div class="rows">--%>
<%--            <div class="row" data-row="front">--%>
<%--              <button class="door-left"></button>--%>
<%--              <button class="empty"></button>--%>
<%--              <button class="empty"></button>--%>
<%--              <button class="empty"></button>--%>
<%--              <button class="empty"></button>--%>
<%--              <button class="empty"></button>--%>
<%--              <button class="empty"></button>--%>
<%--              <button class="empty"></button>--%>
<%--              <button class="empty"></button>--%>
<%--            </div>--%>
<%--            <div class="row" data-row="A">--%>
<%--              <button class="row-label">A</button>--%>
<%--              <button class="empty"></button>--%>
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
<%--              <button class="row-label">B</button>--%>
<%--              <button class="empty"></button>--%>
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
<%--              <button class="row-label">C</button>--%>
<%--              <button class="empty"></button>--%>
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
<%--            <div class="row" data-row="back">--%>
<%--              <button class="empty"></button>--%>
<%--              <button class="empty"></button>--%>
<%--              <button class="empty"></button>--%>
<%--              <button class="empty"></button>--%>
<%--              <button class="empty"></button>--%>
<%--              <button class="door-top"></button>--%>
<%--              <button class="empty"></button>--%>
<%--              <button class="empty"></button>--%>
<%--              <button class="empty"></button>--%>
<%--            </div>--%>
<%--          </div>--%>
        </div>
      </div>
      <!-- 영화 정보 -->
      <div class="movie-container">
        <div class="movie-info">
          <img class="movie-grade" src="../../css/user/images/age_15.png"></img>
          <div class="movie-text-group">
            <p class="movie-title">검은 수녀들</p>
            <p class="movie-type">2D</p>
          </div>
        </div>
        <div class="movie-info-area">
          <div class="movie-details">
            <p class="theater-info">강남 / 1관</p>
            <p class="movie-date">2025.01.24 (금)</p>
            <p class="movie-time">13:50~15:54</p>
          </div>
          <img src="../../css/user/images/movie_poster.jpg" alt="검은 수녀들 포스터" class="poster">
        </div>
        <div class="choose-seat-area">
          <div class="legend">
            <ul class="list">
              <li><div class="seat-condition choice" title="선택한 좌석"></div> <em>선택</em></li>
              <li><div class="seat-condition finish" title="예매 완료"></div> <em>예매완료</em></li>
              <li><div class="seat-condition impossible" title="선택 불가"></div> <em>선택불가</em></li>
              <li><div class="seat-condition common" title="일반"></div> <em>일반</em></li>
            </ul>
          </div>
          <div class="seat-num">
            <p class="tit">선택좌석</p>
            <div class="my-seat">
              <div class="seat choice" title="선택한 좌석">E11</div>
              <div class="seat choice" title="선택한 좌석">E12</div>
              <div class="seat all" title="구매가능 좌석">-</div>
              <div class="seat all" title="구매가능 좌석">-</div>
              <div class="seat all" title="구매가능 좌석">-</div>
              <div class="seat all" title="구매가능 좌석">-</div>
              <div class="seat all" title="구매가능 좌석">-</div>
              <div class="seat all" title="구매가능 좌석">-</div>
            </div>
          </div>
        </div>
        <div class="payment-summary">
          <div class="info">
            <p class="details">성인 2</p>
            <p class="final-payment">
              <span class="label">최종결제금액</span>
              <span class="amount">30,000 원</span>
            </p>
          </div>
        </div>
        <div class="btn-group">
          <a href="" class="button pre" id="pagePrevious" title="이전">이전</a>
          <a href="" class="button active" id="pageNext" title="다음">다음</a>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- footer 영역 -->
<jsp:include page="./common/footer.jsp"/>
</body>
</html>
