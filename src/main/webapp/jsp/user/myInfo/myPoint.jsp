<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="mybatis.vo.PointVO" %>
<%@ page import="mybatis.vo.UserVO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <jsp:include page="../common/head.jsp"/>
</head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/point.css"/>
<body>
<jsp:include page="../common/header.jsp"/>
<div id="contents">
  <div class="page-util">
    <div class="inner-wrap">
      <div class="location">
        <span>Home</span>
        <a href="/booking" title="예매 페이지로 이동">이벤트</a>
        <a href="/booking" title="빠른예매 페이지로 이동" class="pageUtila">진행중 이벤트</a>
      </div>
    </div>
  </div>
  <div class="total-main">
    <div class="myPoint-container">
      <!-- 사이드바 -->
      <div class="sidebar">
        <ul>
          <div class="sidebar-title"><a href="myInfoMain.jsp" title="나의 메가박스"><strong>나의 메가박스</strong></a></div>
          <li><a href="myReservation.jsp" title="예매/구매내역">예매/구매내역</a></li>
          <li><a href="myAdmissionTicket.jsp" title="영화/스토어 관람권">영화/스토어 관람권</a></li>
          <li><a href="${pageContext.request.contextPath}/UserController?type=myCoupon" title="메가박스/제휴쿠폰">메가박스/제휴쿠폰</a></li>
          <li><a href="${pageContext.request.contextPath}/UserController?type=myPoint" title="멤버십 포인트">멤버십 포인트</a></li>
          <li><a href="#" title="나의 무비스토리">나의 무비스토리</a></li>
          <li><a href="editMyInfo.jsp" title="회원정보">회원정보</a></li>
        </ul>
      </div>
      <!-- 메인 콘텐츠 -->
      <main class="main-content">
        <%
          UserVO user = (UserVO) session.getAttribute("loggedInUser");
        %>
        <!-- 멤버십 포인트 섹션 -->
        <section class="section">
          <h1>멤버십 포인트</h1>
          <p>보유하신 멤버십 포인트 내역입니다.<br>포인트는 다양한 혜택으로 사용 가능합니다.</p>

          <!-- 사용자 정보 -->
          <table>
            <thead>
            <tr><th>항목</th><th>정보</th></tr>
            </thead>
            <tbody>
            <tr>
              <td>등급</td>
              <td>${loggedInUser.userGrade}</td>
            </tr>
            <tr>
              <td>사용 가능 포인트</td>
              <td>${userPoints}P</td>
            </tr>
            <tr>
              <td>VIP 선정 누적 포인트</td>
              <td>${userVIPPoints}P</td>
            </tr>
            </tbody>
          </table>
        </section>

        <!-- 이용 내역 -->
        <section class="section">
          <h2>포인트 이용 내역 조회</h2>

          <!-- 조회 폼 -->
          <form id="search-form" action="${pageContext.request.contextPath}/UserController?type=myPoint" method="get">
            <label for="start-date">조회기간:</label>
            <input type="date" id="start-date" name="startDate" value="${param.startDate != null ? param.startDate : '2025-01-01'}">
            ~
            <input type="date" id="end-date" name="endDate" value="${param.endDate != null ? param.endDate : '2025-12-31'}">
            <button type="submit">조회</button>
          </form>

          <!-- 조회 결과 -->
          <table class="history-table">
            <thead>
            <tr><th>일자</th><th>구분</th><th>내용</th><th>포인트 변동</th></tr>
            </thead>
            <tbody>
            <c:choose>
              <c:when test="${not empty pointList}">
                <c:forEach var="point" items="${pointList}">
                  <tr>
                    <td>${point.pointDate}</td>
                    <td>
                      <c:choose>
                        <c:when test="${point.pointType == '0'}">적립</c:when>
                        <c:when test="${point.pointType == '1'}">사용</c:when>
                        <c:otherwise>만료</c:otherwise>
                      </c:choose>
                    </td>
                    <td>${point.pointSource}</td>
                    <td>
                      <c:choose>
                        <c:when test="${point.pointType == '0'}">+ ${point.pointValue}P</c:when>
                        <c:when test="${point.pointType == '1'}">- ${point.pointValue}P</c:when>
                        <c:otherwise>- ${point.pointValue}P</c:otherwise>
                      </c:choose>
                    </td>
                  </tr>
                </c:forEach>
              </c:when>
              <c:otherwise>
                <tr><td colspan="4">조회된 내역이 없습니다.</td></tr>
              </c:otherwise>
            </c:choose>
            </tbody>
          </table>
        </section>

        <!-- 기타 안내 -->
        <section class="section">
          <h2>안내 사항</h2>
          <p>• 멤버십 포인트는 영화 예매 및 매점 구매 시 적립됩니다.<br>• 적립된 포인트는 이벤트 참여 및 할인 혜택으로 사용 가능합니다.</p>
        </section>

      </main>
    </div>
  </div>
</div>

<jsp:include page="../common/footer.jsp"/>
</body>
</html>
