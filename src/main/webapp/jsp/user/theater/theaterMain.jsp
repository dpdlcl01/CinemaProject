<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!Doctype html>
<html lang="ko">
<!-- head -->
<head>
  <jsp:include page="../common/head.jsp"/>
</head>

<body>
<!-- header 영역 -->
<jsp:include page="../common/header.jsp"/>

<style>
  /* h1 태그 타이틀 */
  .title {
/*    font-size: 30px;*/
    left: 3px;
    font-weight: normal;
  }
  /* article 공통 스타일 */
  article {
    margin-top: 30px;
    margin-bottom: 30px;
    width: 100%;
    display: flex;
    flex-direction: column;
    gap: 20px; /* 각 섹션 간 간격 */
  }

  /* 극장 목록 영역 */
  .theater-list {
    position: relative;
    width: 100%;
    min-height: 190px;
    border: 3px solid #686571;
    border-radius: 10px;
    overflow: hidden; /* 모서리 경계 밖 배경색 숨김 */
    background-color: #fff;
    box-sizing: border-box;
  }

  /* 탭 영역 */
  ul.tabs {
    margin: 0;
    padding: 0;
    display: flex;
    justify-content: space-between; /* 탭 간 균등 간격 */
    list-style: none;
    border-bottom: 1px solid #ccc;
  }

  ul.tabs li {
    flex: 1;
    text-align: center;
    padding: 10px 15px;
    cursor: pointer;
    box-sizing: border-box;
  }

  ul.tabs li.current {
    background: #ededed;
    color: #222;
    font-weight: bold;
  }

  /* 극장 목록 */
  .tab-content {
    display: none;
    font-size: 16px;
    color: #333;
  }

  .tab-content.current {
    display: flex;
    justify-content: space-between;
    gap: 10px;
  }

  .tab-content ul {
    display: flex;
    flex: 1;
    list-style: none;
    padding: 0;
    margin: 0;
  }

  .tab-content ul li {
    flex: 1;
    text-align: center;
    border-left: 1px solid #ddd;
    padding: 10px 0;
    box-sizing: border-box;
  }

  .tab-content ul li:first-child {
    border-left: none;
  }

  .tab-content ul li a {
    text-decoration: none;
    color: #444;
    font-size: 16px;
  }

  .tab-content ul li a:hover {
    color: #222;
  }

  /* 극장 목록 하단 선호극장 */
  .my-fav-theater {
    padding: 15px;
    background-color: #ecf0f4;
    border-radius: 0 0 10px 10px;
    display: flex;
    align-items: center; /* 텍스트와 버튼 정렬 */
    gap: 10px; /* 텍스트와 버튼 사이 간격 */
    justify-content: flex-start; /* 왼쪽 정렬 */
  }

  .my-fav-theater span {
    font-weight: bold;
  }

  /* 버튼 스타일 */
  button.login {
    height: 32px;
    padding: 0 12px;
    line-height: 30px;
    font-size: .9333em;
    border: 1px solid #503396;
    border-radius: 4px;
    background-color: #fff;
    color: #503396;
    cursor: pointer;
  }

  button.login:hover {
    background-color: #503396;
    color: #fff;
  }


  /* 극장 이벤트 섹션 */
  .theater-event {
    margin-top: 70px;
  }

  .theater-event .event-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
  }

  .theater-event .more {
    display: inline-flex;
    align-items: center;
    font-size: 14px;
    color: darkgrey; /* "더보기" 텍스트 색상 */
    text-decoration: none;
  }

  .theater-event .more i {
    margin-left: 5px;
    font-size: 12px;
    color: #503396;
  }

  .theater-event .more:hover {
    text-decoration: underline;
  }

  /* 이벤트 카드 리스트 */
  .theater-event .event-list ul {
    display: flex;
    gap: 20px; /* 카드 간 간격 */
    list-style: none;
    padding: 0;
    margin: 0;
  }

  .theater-event .event-list ul li {
    /*flex: 1; !* 카드 너비를 균등 분배 *!*/
    overflow: hidden;
  }

  .theater-event .event-list ul li img {
    width: 100%;
    height: auto;
    /*display: block;*/
    border-radius: 5px;
  }

  /*.theater-event .event-list ul li div {*/
  /*  margin-top: 10px;*/
  /*  text-align: center;*/
  /*  font-size: 16px;*/
  /*  font-weight: bold;*/
  /*  color: #333;*/
  /*}*/

  /* 극장 공지사항 섹션 */
  .theater-notice {
    margin-top: 70px;
  }

  .theater-notice .notice-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
  }

  .theater-event .event-title {
    font-size: 24px;
    font-weight: bold;
    color: #503396; /* 타이틀 색상 */
  }

  .theater-notice .notice-title {
    font-size: 24px;
    font-weight: bold;
    color: #503396; /* 타이틀 색상 */
  }

  .theater-notice .more {
    font-size: 14px;
    color: darkgrey;
    text-decoration: none;
  }

  .theater-notice .more:hover {
    text-decoration: underline;
  }


  li{
    list-style: none;
  }

  /* 공지사항 테이블 */
  table {
    width: 100%;
    /*height: 100%;*/
    border-collapse: collapse;
  }
  table, th {
    border-top: 2px solid #333;
    border-bottom: 0;
  }
  th, td {
    padding: 15px;
    text-align: center;
  }
  td {
    border-top: 1px solid #ddd;
    border-bottom: 1px solid #ddd;
  }
  td:nth-child(4) {
    text-align: center;
    padding-left: 15px;
  }
  td a:hover {
    color: #666;
  }
  th {
    background-color: #f4f4f4;
    font-weight: bold;
  }

  /* 선호극장 */
 .my-fav-theater a{
   display: flex;
   align-items: center;
   padding: 0 15px;
   margin: 0 2px;
   height: 25px;
   line-height: 24px;
   border-radius: 25px;
   background-color: #fff;
 }

  /* 이벤트 */
  .event-sector {
    display: flex; /* 플렉스 컨테이너 */
    width: 540px;
    height: 250px;
    border-radius: 10px;
    padding: 35px;
    background-color: #dbcaff;
    align-items: center;
    gap: 20px;
  }

  .event-text {
    flex: 1;
    display: flex;
    flex-direction: column;
    justify-content: center;
  }

  .event-boardTitle {
    font-size: 23px;
    font-weight: bold;
    color: #000000;
    margin-top: 25px; /* 극장명과 타이틀 간격 */
  }

  /* 이미지 */
  .event-img {
    display: flex;
    align-items: center; /* 이미지 자체도 세로 가운데 정렬 */
  }

  .event-img img {
    max-width: 200px;
    height: auto;
    border-radius: 10px; /* 모서리 둥글게 */
    object-fit: cover; /* 이미지 비율 유지 */
  }
</style>

<!-- 상단 탭 영역 -->
<div class="page-util">
  <div class="inner-wrap">
    <div class="location">
      <span>Home</span>
      <a href="/CinemaProject/jsp/user/theater.jsp" title="극장 페이지로 이동">극장</a>
      <a href="/CinemaProject/jsp/user/theater.jsp" title="전체극장 페이지로 이동">전체극장</a>
    </div>
  </div>
</div>

<!-- contents 영역 -->
<div class="contents">

  <!-- title -->
  <div class="title">
    <h1>전체극장</h1>
<%--    <h1>${sessionScope.user.userName}</h1>--%>
  </div>

  <!-- 극장 목록 -->
  <article class="theater-list">
      <!-- 극장지역 탭 목록 -->
      <ul class="tabs">
        <c:forEach var="theater" items="${requestScope.theater}" varStatus="status">
          <c:if test="${status.first}">
            <!-- 중복되지 않는 지역만 추출 -->
            <c:set var="regions" value="${theater.theaterRegion}" />
          </c:if>
          <c:if test="${regions.indexOf(theater.theaterRegion) == -1}">
            <c:set var="regions" value="${regions} ${theater.theaterRegion}" />
          </c:if>
        </c:forEach>

        <!-- 지역별로 탭을 생성 -->
        <c:forEach var="region" items="${regions.split(' ')}">
          <li class="tab-link" ${status.first ? 'current' : ''} data-tab="tab-${region}"><c:out value="${region}" /></li>
        </c:forEach>
      </ul>

      <!-- 극장 목록 -->
      <c:forEach var="region" items="${regions.split(' ')}">
        <div id="tab-${region}" class="tab-content ${region eq regions.split(' ')[0] ? 'current' : ''}">
          <ul>
            <c:forEach var="theater" items="${requestScope.theater}">
              <c:if test="${theater.theaterRegion == region}">
                <!-- theaterIdx를 URL 파라미터로 전달 -->
                <li><a href="UserController?type=theaterDetail&theaterIdx=${theater.theaterIdx}"><c:out value="${theater.theaterName}"/></a></li>
              </c:if>
            </c:forEach>
          </ul>
        </div>
      </c:forEach>

    <!-- 선호극장 -->
    <div class="my-fav-theater">
      <c:choose>
        <c:when test="${not empty sessionScope.user}">
          <%--세션에 user가 있으면--%>
          <span>${sessionScope.user.userName}님의 선호극장</span>
          <c:forEach var="theater" items="${favoriteTheater}">
            <a href="UserController?type=theaterDetail&theaterIdx=${theater['theaterIdx']}">
                ${theater['theaterName']}  <!-- 극장 이름 출력 -->
            </a>
          </c:forEach>
        </c:when>
        <c:otherwise>
          <span>나의 선호극장 정보</span>
        </c:otherwise>
      </c:choose>
      </div>
  </article>



  <!-- 극장 이벤트 -->
  <article class="theater-event">
    <!-- 섹션 제목 -->
    <div class="event-header">
      <h2 class="event-title">극장 이벤트</h2>
      <a href="${pageContext.request.contextPath}/UserController?type=event&offset=0&pageSize=5" class="more" title="이벤트 더보기">더보기 <i class="iconset ico-arr-right-gray"></i></a>
    </div>

    <!-- 이벤트 카드 리스트 -->
    <div class="event-list">
      <ul>
        <!-- 첫 번째 이벤트 카드 -->
        <c:forEach var="event" items="${event}">
          <li>
            <div class="event-sector">
              <!-- 텍스트 영역 -->
              <div class="event-text">
                <div class="event-header">
                  <h3>${event.theaterName}점</h3>
                </div>
                <div class="event-boardTitle">
                  <a href="${pageContext.request.contextPath}/UserController?type=eventdetail&boardIdx=${event.boardIdx}">
                      ${event.boardTitle}
                  </a>
                </div>
              </div>
              <!-- 이미지 영역 -->
              <div class="event-img">
                <img src="${pageContext.request.contextPath}/css/user/images/event/${event.boardContent}" alt="이벤트 이미지">
              </div>
            </div>
          </li>
        </c:forEach>
      </ul>
    </div>
  </article>

  <!-- 극장 공지사항 -->
  <article class="theater-notice">
    <!-- 섹션 제목 -->
    <div class="notice-header">
      <h2 class="notice-title">극장 공지사항</h2>
      <a href="${pageContext.request.contextPath}/UserController?type=view" class="more" title="극장 공지사항 더보기">더보기 <i class="iconset ico-arr-right-gray"></i></a>
    </div>

    <div class="notic-table">
      <!-- 공지사항 테이블 -->
      <table>
        <thead>
        <tr>
          <th>극장</th>
          <th>제목</th>
          <th>지역</th>
          <th>등록일</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="notice" items="${notice}">
        <tr>
          <td>${notice.theaterName}</td>
          <td><a href="${pageContext.request.contextPath}/UserController?type=view&boardIdx=${notice.boardIdx}">${notice.boardTitle}</a></td>
          <td>${notice.theaterRegion}</td>
          <td>${notice.boardRegDate}</td>
        </tr>
        </c:forEach>
        </tbody>
      </table>
    </div>

  </article>

</div>

<!-- footer 영역 -->
<jsp:include page="../common/footer.jsp"/>

<!-- script 영역 -->
<script>
  document.addEventListener("DOMContentLoaded", function () {
    // 모든 탭과 콘텐츠 가져오기
    const tabs = document.querySelectorAll(".tabs li");
    const tabContents = document.querySelectorAll(".tab-content");

    // 탭 클릭 시 current 클래스를 변경하고 콘텐츠를 갱신
    tabs.forEach((tab, index) => {
      tab.addEventListener("click", () => {
        // 모든 탭과 콘텐츠에서 current 클래스 제거
        tabs.forEach(t => t.classList.remove("current"));
        tabContents.forEach(content => content.classList.remove("current"));

        // 선택된 탭과 해당 콘텐츠에 current 클래스 추가
        tab.classList.add("current");
        tabContents[index].classList.add("current");

        // 콘텐츠 내부 li 요소의 flex 처리
        const listItems = tabContents[index].querySelectorAll("ul li");
        listItems.forEach(item => {
          item.style.flex = "0 0 25%"; // 4등분
        });
      });
    });
  });
</script>
</body>
</html>