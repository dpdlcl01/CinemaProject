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
    #top1 img{
        width: 90px;
        height: 90px;
    }
    #imgName p{
        font-size: 40px;
        line-height: 10px;
        padding-left: 30px;
        margin: 30px 0;

    }
    #point span, #point em{
        padding-top: 10px;
        padding-left: 10px;
    }
    #point em{
        color: deepskyblue;
        font-weight: 600;
    }
    /* 등급 텍스트 */
    .level-item span {
        position: absolute;
        top: 20px;
        left: 50%;
        transform: translateX(-50%);
        color: white;
        font-size: 12px;
        text-align: center;
    }
    .top2>a{
        display: block;
        text-align: center;
        color: #503396;
        font-weight: 600;
        padding-bottom: 10px;
        text-decoration: none;
    }
    .top2>div{
        display: flex;
        margin-left: 10px;
    }
    .top2 span{
        width: 120px;
    }
    .top2 em{
        text-align: right;
        display: block;
        font-weight: 600;
    }
    #myReserv>img{
        width: 70px;
        height: 100px;
    }
    #reservInfo p{
        margin: 0 30px;
        width: 640px;
    }
    #reservInfo em{
        color: #01738b;
    }
    #myReserv button{
        background-color: white;
        width: 74px;
        height: 32px;
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
    .top2 span{
        font-size: 14px;
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
    table {
        width: 100%;
        border-collapse: collapse;
        table-layout: fixed; /* 테이블이 지정된 너비 내에서 고정됨 */
        margin-top: 20px;
    }
    table, th {
        border-top: 1px solid #333;
        border-bottom: 1px solid #333;
    }
    th, td {
        font-size: 13px;
        padding: 8px;
        text-align: center;
    }
    td {
        border-top: 1px solid #ddd;
        border-bottom: 1px solid #ddd;
    }
    td a:hover {
        color: #666;
    }
    th {
        background-color: #f4f4f4;
        font-weight: bold;
    }
</style>

<body>
<header>
    <div class="page-util">
        <div class="inner-wrap" style="display: flex; justify-content: space-between; align-items: center;">
            <!-- 홍길동 관리자님 위치 -->
            <div class="location" style="flex-grow: 1;">
                <span>홍길동 관리자님</span>
            </div>
            <!-- 로그인/로그아웃 버튼 -->
            <div style="display: flex; gap: 10px; flex-shrink: 0;">
                <a href="/login" title="로그인 페이지로 이동" style="text-decoration: none; color: black; font-weight: 600;">
                    로그인
                </a>
                <a href="/logout" title="로그아웃" style="text-decoration: none; color: black; font-weight: 600;">
                    로그아웃
                </a>
            </div>
        </div>
    </div>
</header>
<div class="admin-contents">
    <div class="total-main">
        <div class="myPage-container">
            <%--  사이드바  --%>
            <jsp:include page="../common/adminSideBar.jsp"></jsp:include>
            <%--  메인  --%>

            <div id="main">
                <h1>극장, 상영관 관리</h1>

                <div style="margin-bottom: 20px; display: flex; align-items: center; gap: 10px;">
                    <input type="text" id="searchKeyword" placeholder="검색어 입력" style="padding: 5px; width: 200px;">

                    <input type="month" id="searchMonth" style="padding: 5px;">

                    <button onclick="searchLogs()" style="padding: 5px 10px;">검색</button>
                    <button onclick="resetSearch()" style="padding: 5px 10px; background-color: red; color: white;">초기화</button>
                </div>

                <div id="title">
                    <table border="1" width="100%" style="border-collapse: collapse; text-align: center;">
                        <thead>
                        <tr style="background-color: #f2f2f2;">
                            <th style="width: 5%;">지역</th>
                            <th style="width: 5%;">상영관</th>
                            <th style="width: 15%;">스크린 이름</th>
                            <th style="width: 8%;">상영관 유형</th>
                            <th style="width: 25%;">영화 제목</th>
                            <th style="width: 10%;">날짜</th>
                            <th style="width: 10%;">시작 시간</th>
                            <th style="width: 10%;">종료 시간</th>
                            <th style="width: 10%;">잔여 좌석/총좌석</th>
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
                                <td>${theater.totalSeats}/${theater.totalSeats}</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>


<%--<jsp:include page="../../user/common/footer.jsp"/>--%>

<script>

</script>
</body>
</html>