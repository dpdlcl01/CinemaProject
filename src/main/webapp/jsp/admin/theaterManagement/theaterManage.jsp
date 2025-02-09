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
    .search-bar-container {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 20px;
    }
    .search-bar {
        display: flex;
        align-items: center;
        flex-wrap: nowrap;
        gap: 10px;
    }
    .search-bar select, .search-bar2 input {
        padding: 6px;
        font-size: 14px;
    }
    .search-bar2 {
        flex: 1;
        max-width: 400px;
        min-width: 200px;
        height: 30px;
        position: relative;
        border-bottom: 1px solid #423e3e;
    }
    .search-bar2 .input-text {
        width: 100%;
        background-color: transparent;
        border: 0;
        color: #000;
        font-size: 16px;
        outline: none;
        padding: 0 35px 0 5px;
        box-sizing: border-box;
    }
    .btn-reset {
        position: absolute;
        right: 30px;
        width: 30px;
        height: 100%;
        border: 0;
        background-color: transparent;
        cursor: pointer;
    }
    table {
        width: 100%;
        border-collapse: collapse;
        table-layout: fixed;
        margin-top: 20px;
    }
    table th, table td {
        border: 1px solid #ddd;
        padding: 12px;
        text-align: center;
    }
    table th {
        background-color: #f4f4f4;
        font-weight: bold;
    }
    table tbody tr:nth-child(even) {
        background-color: #f9f9f9;
    }
    table tbody tr:hover {
        background-color: #f1f1f1;
        transition: background-color 0.3s ease;
    }
</style>

<body>
<jsp:include page="../common/header.jsp"></jsp:include>
<div class="admin-contents">
    <div class="total-main">
        <div class="myPage-container">
            <jsp:include page="../common/adminSideBar.jsp"></jsp:include>

            <div id="main">
                <h1>극장, 상영관 관리</h1>
                <div class="search-bar-container">
                    <div class="total-count">전체 ${requestScope.totalCount}건</div>
                    <div class="search-bar">
                        <form id="searchForm" action="AdminController" method="get">
                            <input type="hidden" name="type" value="theaterList" />
                            <label for="searchMonth">개봉월:</label>
                            <input type="month" id="searchMonth" name="searchMonth" value="${param.searchMonth}" />
                            <select id="searchType" name="searchType">
                                <option value="all" ${param.searchType == 'all' ? 'selected' : ''}>검색 대상 (전체)</option>
                                <option value="title" ${param.searchType == 'title' ? 'selected' : ''}>영화 제목</option>
                                <option value="screen" ${param.searchType == 'screen' ? 'selected' : ''}>스크린 이름</option>
                                <option value="theater" ${param.searchType == 'theater' ? 'selected' : ''}>상영관</option>
                            </select>
                            <div class="search-bar2">
                                <input type="text" name="searchValue" placeholder="검색어를 입력해주세요." class="input-text" value="${fn:escapeXml(param.searchValue)}" />
                                <button type="submit" class="btn" title="검색">
                                    <i class="ico-search"></i> 검색
                                </button>
                            </div>
                            <button type="button" class="btn btn-reset" title="검색 조건 초기화" onclick="resetSearch()">
                                <i class="ico-reset"></i>
                            </button>
                        </form>
                    </div>
                </div>
                <div id="title">
                    <table>
                        <thead>
                        <tr>
                            <th>지역</th>
                            <th>상영관</th>
                            <th>스크린 이름</th>
                            <th>상영관 유형</th>
                            <th>영화 제목</th>
                            <th>날짜</th>
                            <th>시작 시간</th>
                            <th>종료 시간</th>
                            <th>잔여 좌석/총좌석</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="theater" items="${theaterList}">
                            <tr>
                                <td>${theater.theaterRegion}</td>
                                <td>${theater.theaterName}</td>
                                <td>${theater.screenName}</td>
                                <td>${theater.screenType}</td>
                                <td>${theater.movieTitle}</td>
                                <td>${theater.date}</td>
                                <td>${theater.startTime}</td>
                                <td>${theater.endTime}</td>
                                <td>${theater.remainingSeats}/${theater.totalSeats}</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    function resetSearch() {
        document.querySelector('#searchForm').reset();
        location.href = 'AdminController?type=theaterList';
    }
</script>
</body>
</html>
