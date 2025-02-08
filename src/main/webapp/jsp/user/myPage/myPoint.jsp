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
<div class="page-util">
  <div class="inner-wrap">
    <div class="location">
      <span>Home</span>
      <img src="https://img.megabox.co.kr/static/pc/images/common/bg/bg-location-arr.png"/>
      <label>회원정보</label>
      <img src="https://img.megabox.co.kr/static/pc/images/common/bg/bg-location-arr.png"/>
      <label>포인트</label>
    </div>
  </div>
</div>
<!-- 메인 콘텐츠 -->
<div id="contents">
  <div class="total-main">
    <div class="myPoint-container">
      <!--  사이드바  -->
      <div class="mypage-side">
        <jsp:include page="../common/sideBar.jsp"/>
      </div>
      <!-- 메인 -->
      <div class="main-content">
        <h1>포인트 이용내역</h1>
        <!-- Section Header -->
        <div class="point-section">
          <div class="point-container">
            <div class="summary">
              <p class="tit">사용가능 포인트</p>
              <div class="mainpoint">${userPoints}P</div>
            </div>
          </div>
          <div class="this-year">
            <p class="tit-year">
              <c:choose>
                <c:when test="${loggedInUser.userGrade eq 'Basic'}">
                  VIP 선정 누적 포인트 현황
                </c:when>
                <c:when test="${loggedInUser.userGrade eq 'VIP'}">
                  VVIP 선정 누적 포인트 현황
                </c:when>
                <c:otherwise>
                  최고 등급입니다.
                </c:otherwise>
              </c:choose>
            </p>
            <table>
              <tr><td class="td-title">매표</td><td class="td-content">${pointData.paymentTotal}</td></tr>
              <tr><td class="td-title">매점</td><td class="td-content">${pointData.storeTotal}</td></tr>
              <tr><td class="td-title">리뷰</td><td class="td-content">${pointData.reviewTotal}</td></tr>
            </table>
            <div class="sum">${pointData.totalPoints} P</div>
          </div>
        </div>

        <%-- 이용 내역 테이블 --%>
        <div class="point-table">
          <h1 class="tit mt40">이용내역 조회</h1>
          <div class="board-list-search">
            <div class="btn-period">
              <button type="button" class="btn on">1주일</button>
              <button type="button" class="btn">1개월</button>
              <button type="button" class="btn">3개월</button>
              <button type="button" class="btn">6개월</button>
              <!-- 조회 폼 -->
              <form id="search-form" action="${pageContext.request.contextPath}/UserController?type=myPoint" method="get">
                <input type="date" id="start-date" name="startDate" value="${param.startDate != null ? param.startDate : '2025-01-01'}">
                ~
                <input type="date" id="end-date" name="endDate" value="${param.endDate != null ? param.endDate : '2025-12-31'}">
                <button type="button" class="btn" id="searchButton">조회</button>
                <button type="button" class="btn" id="totalButton">전체</button>
              </form>
            </div>
          </div>

          <div class="table-wrap">
            <table class="board-list">
              <thead>
              <tr>
                <th>일자</th>
                <th>구분</th>
                <th>내용</th>
                <th>지점</th>
                <th>포인트</th>
              </tr>
              </thead>
              <tbody>
<%--                <c:choose>--%>
<%--                  <c:when test="${not empty pointList}">--%>
<%--                  <c:forEach var="point" items="${pointList}">--%>
<%--                <tr>--%>
<%--                  <td>${point.pointDate}</td>--%>
<%--                  <td>${point.pointSource}</td>--%>
<%--                  <td>${point.pointValue}P</td>--%>
<%--                </tr>--%>
<%--                </c:forEach>--%>
<%--                </c:when>--%>
<%--                  <c:otherwise>--%>
<%--                    <tr>--%>
<%--                      <td colspan="4" class="a-c">조회된 내역이 없습니다.</td>--%>
<%--                    </tr>--%>
<%--                  </c:otherwise>--%>
<%--                </c:choose>--%>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>



<%--          <!-- 조회 결과 -->--%>
<%--          <table id="pointTable" class="history-table">--%>
<%--            <thead>--%>
<%--            <tr><th>일자</th><th>구분</th><th>내용</th><th>포인트 변동</th></tr>--%>
<%--            </thead>--%>
<%--            <tbody>--%>
<%--            <c:choose>--%>
<%--              <c:when test="${not empty pointList}">--%>
<%--                <c:forEach var="point" items="${pointList}">--%>
<%--                  <tr>--%>
<%--                    <td>${point.pointDate}</td>--%>
<%--                    <td>--%>
<%--                      <c:choose>--%>
<%--                        <c:when test="${point.pointType == '0'}">적립</c:when>--%>
<%--                        <c:when test="${point.pointType == '1'}">사용</c:when>--%>
<%--                        <c:otherwise>만료</c:otherwise>--%>
<%--                      </c:choose>--%>
<%--                    </td>--%>
<%--                    <td>${point.pointSource}</td>--%>
<%--                    <td>--%>
<%--                      <c:choose>--%>
<%--                        <c:when test="${point.pointType == '0'}">+ ${point.pointValue}P</c:when>--%>
<%--                        <c:when test="${point.pointType == '1'}">- ${point.pointValue}P</c:when>--%>
<%--                        <c:otherwise>- ${point.pointValue}P</c:otherwise>--%>
<%--                      </c:choose>--%>
<%--                    </td>--%>
<%--                  </tr>--%>
<%--                </c:forEach>--%>
<%--              </c:when>--%>
<%--              <c:otherwise>--%>
<%--                <tr><td colspan="4">조회된 내역이 없습니다.</td></tr>--%>
<%--              </c:otherwise>--%>
<%--            </c:choose>--%>
<%--            </tbody>--%>
<%--          </table>--%>
<%--        </section>--%>


</div>


<jsp:include page="../common/footer.jsp"/>
<script>
  document.addEventListener("DOMContentLoaded", function () {
    var searchButton = document.getElementById("searchButton");
    var totalButton = document.getElementById("totalButton");

    searchButton.addEventListener("click", function () {
      var startDate = document.getElementById("start-date").value;
      var endDate = document.getElementById("end-date").value;

      console.log("조회 기간: " + startDate + " ~ " + endDate);

      var url = "UserController?type=pointFilter&startDate=" + startDate + "&endDate=" + endDate;

      var xhr = new XMLHttpRequest();
      xhr.open("GET", url, true);
      xhr.setRequestHeader("X-Requested-With", "XMLHttpRequest");

      xhr.onreadystatechange = function () {
        if (xhr.readyState === 4 && xhr.status === 200) {
          var pointList = JSON.parse(xhr.responseText);
          updatePointTable(pointList);
        }
      };

      xhr.send();
    });

    function updatePointTable(pointList) {
      var tableBody = document.getElementById("pointTable").getElementsByTagName("tbody")[0];

      if (!tableBody) {
        console.error("tableBody 요소를 찾을 수 없습니다.");
        return;
      }

      tableBody.innerHTML = ""; // 기존 내용 제거 후 새로운 데이터 추가

      if (!pointList || pointList.length === 0) {
        var emptyRow = document.createElement("tr");
        var emptyCell = document.createElement("td");
        emptyCell.colSpan = "4";
        emptyCell.textContent = "포인트 내역이 없습니다.";
        emptyRow.appendChild(emptyCell);
        tableBody.appendChild(emptyRow);
        return;
      }

      pointList.forEach(function (point) {
        var row = document.createElement("tr");

        // 날짜 셀
        var dateCell = document.createElement("td");
        dateCell.textContent = point.pointDate;
        dateCell.className = "date";

        // 구분 셀
        var typeCell = document.createElement("td");
        typeCell.className = "type";
        if (point.pointType === "0") {
          typeCell.textContent = "적립";
        } else if (point.pointType === "1") {
          typeCell.textContent = "사용";
        } else {
          typeCell.textContent = "만료";
        }

        // 내용 셀
        var detailCell = document.createElement("td");
        detailCell.className = "detail";
        detailCell.textContent = point.pointSource;

        // 포인트 변동 셀
        var changeCell = document.createElement("td");
        changeCell.className = "change";
        if (point.pointType === "0") {
          changeCell.textContent = "+ " + point.pointValue + "P";
        } else {
          changeCell.textContent = "- " + point.pointValue + "P";
        }

        row.appendChild(dateCell);
        row.appendChild(typeCell);
        row.appendChild(detailCell);
        row.appendChild(changeCell);

        tableBody.appendChild(row);
      });

      document.getElementById("totalButton").addEventListener("click", function () {
        window.location.href = "UserController?type=myPoint"; // 초기 화면처럼 다시 호출
      });
    }
  });

  document.addEventListener("DOMContentLoaded", function () {
    var userGrade = "${loggedInUser.userGrade}";  // 현재 등급
    var currentVIPPoints = ${userVIPPoints};  // 현재 VIP 포인트

    var vipThreshold = 13000;  // Basic -> VIP 기준
    var vvipThreshold = 20000; // VIP -> VVIP 기준

    if (userGrade === "Basic") {
      var pointsToVIP = vipThreshold - currentVIPPoints;
      document.getElementById("pointsToVIP").textContent = pointsToVIP > 0 ? pointsToVIP : 0;
    } else if (userGrade === "VIP") {
      var pointsToVVIP = vvipThreshold - currentVIPPoints;
      document.getElementById("pointsToVVIP").textContent = pointsToVVIP > 0 ? pointsToVVIP : 0;
    }
  });
</script>
</body>
</html>