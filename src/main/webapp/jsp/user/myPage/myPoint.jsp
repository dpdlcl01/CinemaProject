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
              <button type="button" class="btn">1주일</button>
              <button type="button" class="btn">1개월</button>
              <button type="button" class="btn">3개월</button>
              <button type="button" class="btn">6개월</button>
            </div>
            <!-- 조회 폼 -->
            <div class="form-container">
              <form id="search-form">
                <input type="month" id="month" name="selectMonth" value="${param.startDate != null ? param.startDate : '2025-01-01'}">
                <button type="button" class="btn" id="searchButton">조회</button>
                <button type="button" class="btn" id="totalButton">전체</button>
              </form>
            </div>
          </div>

          <div class="table-wrap">
            <table id="pointTable" class="board-list">
              <thead>
              <tr>
                <th>일자</th>
                <th>구분</th>
                <th>내용</th>
                <th>포인트</th>
              </tr>
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

            <!-- Pagination -->
            <c:if test="${page.totalPage > 1}">
              <nav class="pagination">
                <c:if test="${page.nowPage > 1}">
                  <a href="UserController?type=myPoint&cPage=1" class="control first">&laquo;</a>
                  <a href="UserController?type=myPoint&cPage=${page.nowPage - 1}" class="control prev">&lt;</a>
                </c:if>

                <c:forEach begin="${page.startPage}" end="${page.endPage}" var="i">
                  <c:choose>
                    <c:when test="${i eq page.nowPage}">
                      <strong class="active">${i}</strong>
                    </c:when>
                    <c:otherwise>
                      <a href="UserController?type=myPoint&cPage=${i}">${i}</a>
                    </c:otherwise>
                  </c:choose>
                </c:forEach>

                <c:if test="${page.nowPage < page.totalPage}">
                  <a href="UserController?type=myPoint&cPage=${page.nowPage + 1}" class="control next">&gt;</a>
                  <a href="UserController?type=myPoint&cPage=${page.totalPage}" class="control last">&raquo;</a>
                </c:if>
              </nav>
            </c:if>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<jsp:include page="../common/footer.jsp"/>
<script>
  $(document).ready(function () {
    var contextPath = "${pageContext.request.contextPath}";

    // 월별 조회 드롭박스 이벤트
    $("#searchButton").click(function () {
      var selectedMonth = $("#month").val(); // YYYY-MM 형식
      if (!selectedMonth) {
        alert("조회할 월을 선택하세요!");
        return;
      }

      var startDate = selectedMonth + "-01"; // 월의 첫날
      var endDate = getLastDayOfMonth(selectedMonth); // 월의 마지막 날

      console.log("📅 월별 조회 요청:", startDate, "~", endDate);
      fetchPointData(startDate, endDate);
    });

    // 🔄 **전체 조회 버튼 클릭 이벤트**
    $("#totalButton").click(function () {
      $(".btn-period .btn").removeClass("on"); // 모든 버튼에서 'on' 클래스 제거
      console.log("🔄 전체 조회 요청");
      fetchPointData("", ""); // 전체 조회 요청
    });

    // ⏳ **기간별 버튼 클릭 이벤트**
    $(".btn-period .btn").click(function () {
      $(".btn-period .btn").removeClass("on");
      $(this).addClass("on");

      var period = $(this).text();
      var startDate = calculateStartDate(period);
      var endDate = getTodayDate();

      console.log("📅 선택한 기간:", period, " / 시작일:", startDate, " / 종료일:", endDate);
      fetchPointData(startDate, endDate);
    });

    // 📌 **AJAX 요청 함수 (startDate & endDate 기반)**
    function fetchPointData(startDate, endDate) {
      $.ajax({
        url: contextPath + "/UserController",
        type: "GET",
        data: { type: "pointFilter", startDate: startDate, endDate: endDate },
        dataType: "json",
        success: function (pointList) {
          console.log("📌 [DEBUG] 조회된 포인트 데이터:", pointList);
          updatePointTable(pointList);
        },
        error: function (xhr, status, error) {
          console.error("❌ 포인트 조회 오류:", error);
        }
      });
    }

    // 조회 결과를 테이블에 업데이트
    function updatePointTable(pointList) {
      var tableBody = $(".board-list tbody");
      tableBody.empty();

      if (!pointList || pointList.length === 0) {
        tableBody.append('<tr><td colspan="4" class="a-c">조회된 내역이 없습니다.</td></tr>');
        return;
      }

      $.each(pointList, function (index, point) {
        var row = "<tr>";
        row += "<td>" + point.pointDate + "</td>";
        row += "<td>" + (point.pointType === '0' ? '적립' : '사용') + "</td>";
        row += "<td>" + point.pointSource + "</td>";
        row += "<td>" + (point.pointType === '0' ? '+ ' : '- ') + point.pointValue + "P</td>";
        row += "</tr>";

        tableBody.append(row);
      });
    }

    // 📌 **기간 계산 함수 (1주일~6개월)**
    function calculateStartDate(period) {
      var today = new Date();
      var startDate = new Date();

      if (period.includes("주")) {
        startDate.setDate(today.getDate() - 7);
      } else if (period.includes("1개월")) {
        startDate.setMonth(today.getMonth() - 1);
      } else if (period.includes("3개월")) {
        startDate.setMonth(today.getMonth() - 3);
      } else if (period.includes("6개월")) {
        startDate.setMonth(today.getMonth() - 6);
      }

      return formatDate(startDate);
    }

    // 📌 **오늘 날짜 반환 (YYYY-MM-DD)**
    function getTodayDate() {
      return formatDate(new Date());
    }

    // 📌 **선택한 월의 마지막 날짜 반환**
    function getLastDayOfMonth(yearMonth) {
      var [year, month] = yearMonth.split("-");
      return formatDate(new Date(year, month, 0)); // 0일을 입력하면 해당 월의 마지막 날 반환
    }

    // 📌 **날짜 포맷팅 (YYYY-MM-DD)**
    function formatDate(date) {
      var yyyy = date.getFullYear();
      var mm = (date.getMonth() + 1).toString().padStart(2, "0");
      var dd = date.getDate().toString().padStart(2, "0");
      return yyyy + "-" + mm + "-" + dd;
    }
  });
</script>
</body>
</html>