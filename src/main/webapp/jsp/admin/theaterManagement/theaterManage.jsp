<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!Doctype html>
<html lang="ko">
<head>
    <%--  <jsp:include page="../../user/common/head.jsp"/>--%>

</head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/common.css">

<style>
    .admin-contents {
        width: 100%;
        min-height: 550px;
    }
    .page-util .inner-wrap {
        max-width: 100%; !important;
        padding: 20px 20px; !important;
    }

    #h2 h2{
        width: 760px;
    }
    #h2 button{
        height:32px ;
        width: 74px;
        border: none;
        background-color: white;
    }

    .myPage-container{
        display: flex;

    }
    #main{
        width: 100%;
        margin: 27px 40px 40px 40px;
    }
    #main h1{
        font-size: 30px;
    }
    .btn-reset {
        background-color: #f5f5f5; /* 연한 회색 */
        border: 1px solid #d1d1d1; /* 테두리 회색 */
        border-radius: 4px; /* 둥근 모서리 */
        cursor: pointer;
        padding: 6px 12px;
        font-size: 14px;
        font-weight: bold;
        color: #333;
        display: flex;
        align-items: center;
        justify-content: center;
    }


    .noticeboard {
        margin-top: 20px;
    }

    .noticeboard.active {
        display: block;
    }

    /* form 내의 요소들을 나란히 배치 */
    #searchForm {
        display: flex;
        align-items: center;
        gap: 10px; /* 간격 설정 */
    }

    .search-bar-container {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 20px;
    }

    .search-bar-container .total-count {
        font-size: 16px;
    }

    .search-bar {
        display: flex;
        justify-content: flex-end;
        align-items: center;
        gap: 10px;
    }

    .search-bar label {
        display: flex;
        align-items: center;
        gap: 5px; /* 텍스트와 입력 필드 사이 간격 */
        font-size: 14px;
        white-space: nowrap; /* 텍스트 줄바꿈 방지 */
    }

    .search-bar2 {
        flex: 1;               /* 부모 컨테이너의 남은 공간을 차지 */
        max-width: 400px;      /* 최대 너비 */
        min-width: 200px;      /* 최소 너비 */
        height: 30px;
        position: relative;
        display: flex;
        border-bottom: 1px solid #423e3e;
    }

    .search-bar2 .input-text {
        width: 100%;           /* 부모의 너비에 맞게 확장 */
        height: 25px;
        background-color: transparent;
        border: 0;
        color: #000;
        line-height: 25px;
        font-size: 16px;
        outline: none;
        padding: 0 35px 0 5px; /* 버튼과 충돌 방지 */
        box-sizing: border-box;
    }
    /* 🔄 수정: 날짜 입력, 셀렉트 박스, 검색 필드 높이 동일하게 설정 */
    .search-bar input[type="date"],
    .search-bar select {
        height: 30px;   /* 🔄 높이를 40px로 통일 */
        padding: 6px;
        font-size: 14px;
        border: 1px solid #ccc;
        border-radius: 4px;
        vertical-align: middle; /* 🔹 추가: 요소 수직 정렬 */
    }

    .search-bar2 .input-text:active {
        border: 0;
        outline: none;
    }

    .search-bar2 .btn {
        width: 30px;
        height: 30px;
        position: absolute;
        right: 0;
        top: 0;
        font-size: 0;
        border: 0;
        background-color: transparent;
        cursor: pointer;
    }

    .search-bar2 .btn:hover {
        background-color: #0056b3;
    }

    .search-bar2 .btn .ico-search {
        display: inline-block;
        width: 18px;
        height: 18px;
        background-image: url(https://img.megabox.co.kr/static/pc/images/common/ico/ico-search-white.png);
        vertical-align: middle;
    }

    table {
        width: 100%;
        /*height: 100%;*/
        border-collapse: collapse;
        margin-top: 20px;
    }

    table, th {
        border-top: 2px solid #333;
        border-bottom: 0;
    }

    th {
        text-align: center !important;
    }


    th, td {
        padding: 15px;
        text-align: center;

    }

    td {
        border-top: 1px solid #ddd !important;
        border-bottom: 1px solid #ddd !important;
    }

    td a {
        color: inherit; /* 부모 요소의 색상을 따르도록 설정 */
        text-decoration: none; /* 밑줄 제거 */
    }


    td a:hover {
        color: #666;
    }

    th {
        background-color: #f4f4f4;
        font-weight: bold;
    }

    /* 클릭 가능한 행 스타일 */
    .clickable-row {
        cursor: pointer;
        transition: background-color 0.2s ease;
    }

    /* 마우스를 가져갔을 때 배경색 변경 */
    .clickable-row:hover {
        background-color: #f0f0f0;
    }


    /* 페이지네이션 */
    .pagination {
        clear: both;
        position: relative;
        margin: 0 auto;
        padding: 30px 0 0 0;
        display: flex;
        justify-content: center;
    }

    .pagination .active {
        color: #fff;
        background-color: #01738b;
        border-color: #01738b;
    }

    .pagination .control, .pagination a, .pagination strong {
        display: inline-block;
        position: relative;
        min-width: 32px;
        height: 32px;
        margin: 0 2px;
        padding: 0 8px;
        border: 1px solid #ebebeb;
        text-decoration: none;
        line-height: 30px;
        color: #333;
        font-weight: 400;
        vertical-align: middle;
        border-radius: 4px;
    }

    .pagination .control.first {
        background-position: 0 0;
    }

    .pagination .control.prev {
        background-position: -32px 0;
    }

    .pagination .control.next {
        background-position: -64px 0;
    }

    .pagination .control.last {
        background-position: -96px 0;
    }

    .pagination .control {
        overflow: hidden;
        width: 32px;
        height: 32px;
        background: url('${pageContext.request.contextPath}/css/user/images/btn-paging.png') no-repeat 0 0;
    }

    .poster-section img {
        width: 100%;
        max-width: 200px;
        height: auto;
        border: 1px solid #ccc;
        border-radius: 8px;
    }

    .field-group label {
        width: 48%;
    }

    .field-group input {
        width: 48%;
        padding: 8px;
        margin-bottom: 10px;
        border: 1px solid #ccc;
        border-radius: 4px;
    }

</style>

<body>
<%--  헤더  --%>
<jsp:include page="../common/header.jsp"></jsp:include>
<div class="admin-contents">
    <div class="total-main">
        <div class="myPage-container">
            <%--  사이드바  --%>
            <jsp:include page="../common/adminSideBar.jsp"></jsp:include>
            <%--  메인  --%>

            <div id="main">
                <h1>극장, 상영관 관리</h1>
                <div id="title">
                    <!-- 검색 폼 -->
                    <div id="announcement" class="noticeboard">
                        <div class="search-bar-container">
                            <div class="total-count">전체 ${requestScope.totalCount}건</div>

                            <div class="search-bar">

                                <!-- 검색 유형 선택 -->
                                <select id="searchType" name="searchType">
                                    <option value="" <c:if test="${searchType == ''}">selected</c:if>>검색 유형 선택</option>
                                    <option value="theaterName" <c:if test="${searchType == 'theaterName'}">selected</c:if>>극장 이름</option>
                                    <option value="theaterRegion" <c:if test="${searchType == 'theaterRegion'}">selected</c:if>>지역</option>
                                </select>

                                <div class="search-bar2">
                                    <input type="text" id="searchKeyword" name="searchKeyword" placeholder="검색어 입력" value="${searchKeyword}" class="input-text">

                                    <button class="btn" title="검색" onclick="searchTheaters()">
                                        <i class="ico-search"></i> 검색
                                    </button>
                                </div>

                                <button type="button" class="btn-reset" title="검색 조건 초기화" onclick="resetSearch()">초기화</button>
                            </div>
                        </div>


                        <table>
                            <thead>
                            <tr>
                                <th style="width: 5%;">지역</th>
                                <th style="width: 10%;">극장 이름</th>
                                <th style="width: 20%;">스크린 이름</th>
                                <th style="width: 20%;">스크린 유형</th>
                                <th style="width: 10%;">스크린 좌석수</th>
                                <th style="width: 10%;">극장 상태</th>
                                <th style="width: 10%;">스크린 상태</th>
                            </tr>
                            </thead>

                            <tbody>
                            <c:choose>
                                <c:when test="${empty ar}">
                                    <tr>
                                        <td colspan="7">관련 데이터가 없습니다. (현재 ar 값: ${ar})</td>
                                    </tr>
                                </c:when>
                                <c:otherwise>
                                    <c:forEach var="theater" items="${ar}">
                                        <tr>
                                            <td>${theater.theaterRegion}</td>
                                            <td>${theater.theaterName}</td>
                                            <td>${theater.screenName}</td>

                                            <!-- screenType 변환 -->
                                            <td>
                                                <c:choose>
                                                    <c:when test="${theater.screenType == 1}">COMFORT</c:when>
                                                    <c:when test="${theater.screenType == 2}">VIP</c:when>
                                                    <c:when test="${theater.screenType == 3}">DOLBY</c:when>
                                                    <c:when test="${theater.screenType == 4}">4DX</c:when>
                                                    <c:when test="${theater.screenType == 5}">IMAX</c:when>
                                                    <c:otherwise>Unknown</c:otherwise>
                                                </c:choose>
                                            </td>

                                            <td>${theater.screenSeatCount}</td>

                                            <!-- theaterStatus 변환 -->
                                            <td>
                                                <c:choose>
                                                    <c:when test="${theater.theaterStatus == 0}">운영</c:when>
                                                    <c:when test="${theater.theaterStatus == 1}">점검</c:when>
                                                    <c:when test="${theater.theaterStatus == 2}">폐쇄</c:when>
                                                    <c:otherwise>Unknown</c:otherwise>
                                                </c:choose>
                                            </td>

                                            <!-- screenStatus 변환 -->
                                            <td>
                                                <c:choose>
                                                    <c:when test="${theater.screenStatus == 0}">운영</c:when>
                                                    <c:when test="${theater.screenStatus == 1}">점검</c:when>
                                                    <c:when test="${theater.screenStatus == 2}">폐쇄</c:when>
                                                    <c:otherwise>Unknown</c:otherwise>
                                                </c:choose>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </c:otherwise>
                            </c:choose>
                            </tbody>
                        </table>

                        <!--------------------- 페이지네이션 --------------------->
                        <nav class="pagination">
                            <c:if test="${requestScope.page ne null}">
                                <c:set var="pvo" value="${requestScope.page}" />

                                <!-- 첫 페이지로 이동 버튼 -->
                                <c:if test="${pvo.startPage > 1}">
                                    <a href="AdminController?type=theaterSearch&cPage=1&searchType=${param.searchType}&searchKeyword=${param.searchKeyword}"
                                       class="control first" title="처음 페이지"></a>
                                </c:if>

                                <!-- 이전 페이지 블록으로 이동 버튼 -->
                                <c:if test="${pvo.startPage > 1}">
                                    <a href="AdminController?type=theaterSearch&cPage=${pvo.startPage - pvo.pagePerBlock}&searchType=${param.searchType}&searchKeyword=${param.searchKeyword}"
                                       class="control prev" title="이전 블록"></a>
                                </c:if>

                                <!-- 페이지 번호 목록 -->
                                <c:forEach begin="${pvo.startPage}" end="${pvo.endPage}" varStatus="st">
                                    <c:if test="${st.index eq pvo.nowPage}">
                                        <strong class="active">${st.index}</strong>
                                    </c:if>
                                    <c:if test="${st.index ne pvo.nowPage}">
                                        <a href="AdminController?type=theaterSearch&cPage=${st.index}&searchType=${param.searchType}&searchKeyword=${param.searchKeyword}"
                                           title="${st.index}페이지 보기">${st.index}</a>
                                    </c:if>
                                </c:forEach>

                                <!-- 다음 페이지 블록으로 이동 버튼 -->
                                <c:if test="${pvo.endPage < pvo.totalPage}">
                                    <a href="AdminController?type=theaterSearch&cPage=${pvo.startPage + pvo.pagePerBlock}&searchType=${param.searchType}&searchKeyword=${param.searchKeyword}"
                                       class="control next" title="다음 블록"></a>
                                </c:if>

                                <!-- 마지막 페이지로 이동 버튼 -->
                                <c:if test="${pvo.endPage < pvo.totalPage}">
                                    <a href="AdminController?type=theaterSearch&cPage=${pvo.totalPage}&searchType=${param.searchType}&searchKeyword=${param.searchKeyword}"
                                       class="control last" title="마지막 페이지"></a>
                                </c:if>
                            </c:if>
                        </nav>
                        <!--------------------- 페이지네이션 --------------------->


                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
  function searchTheaters() {
    let keyword = document.getElementById("searchKeyword").value.trim();
    let searchType = document.getElementById("searchType").value;

    let queryParams = new URLSearchParams(); // URL 파라미터 객체 생성
    queryParams.append("type", "theaterSearch"); // type=logSearch 추가

    if (searchType && keyword) {
      queryParams.append("searchType", searchType); // searchType 추가
      queryParams.append("searchKeyword", keyword); // searchKeyword 추가
    }

    let baseUrl = window.location.origin + "/AdminController";
    let queryString = queryParams.toString(); // 자동으로 `&`을 처리

    window.location.href = baseUrl + "?" + queryString; // 최종 URL 적용
  }


  function resetSearch() {
    let baseUrl = window.location.origin + "/AdminController?type=theaterList";
    window.location.href = baseUrl;
  }

</script>

</body>
</html>