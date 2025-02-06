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
    table th {
        border: 1px solid #ccc;
        background-color: #dddddd;
        color: #1e1e1e;
        font-weight: bold;
        padding: 12px;
    }

    table tbody tr:nth-child(even) {
        background-color: #f9f9f9;
    }

    /* 테이블 호버 효과 */
    table tbody tr:hover {
        background-color: #f1f1f1;
        transition: background-color 0.3s ease; /* 부드러운 전환 효과 */
    }

    /* 테이블 셀 스타일 */
    table td {
        padding: 12px;
        border: 1px solid #ddd; /* 테두리 색상 */
    }

    /* 입력 필드와 셀렉트 박스 스타일 */
    #title td input, #title td select {
        border: 1px solid #ddd;
        border-radius: 5px;
        padding: 8px;
        width: 100%;
        text-align: center;
        transition: border-color 0.3s ease;
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

    table tfoot ol.paging {
        list-style:none;
    }

    table tfoot ol.paging li {
        float:left;
        margin-right:8px;
    }

    table tfoot ol.paging li a {
        display:block;
        padding:3px 7px;
        border:1px solid #00B3DC;
        color:#2f313e;
        font-weight:bold;
    }

    table tfoot ol.paging li a:hover {
        background:#00B3DC;
        color:white;
        font-weight:bold;
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
                <h1>사용자 로그 관리</h1>

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
                            <th style="width: 5%;">번호</th>
                            <th style="width: 8%;">로그 유형</th>
                            <th style="width: 8%;">관리자 ID</th>
                            <th style="width: 12%;">대상</th>
                            <th style="width: 15%;">로그 정보</th>
                            <th style="width: 19%;">이전 값</th>
                            <th style="width: 19%;">변경 후 값</th>
                            <th style="width: 14%;">날짜</th>
                            <th style="width: 10%;">관리</th>  <!-- 수정 및 삭제 버튼 -->
                        </tr>
                        </thead>

                        <tfoot>
                            <tr>
                                <td colspan="7">
                                    <ol class="paging">
                                        <c:if test="${requestScope.page ne null}">
                                            <c:set var="pvo" value="${requestScope.page}"/>
                                            <c:if test="${pvo.startPage < pvo.pagePerBlock}">
                                                <li class="disable">&lt;</li>
                                            </c:if>
                                            <c:if test="${pvo.startPage >= pvo.pagePerBlock}">
                                                <li><a href="${pageContext.request.contextPath}/AdminController?type=logManagement&cPage=${pvo.startPage - pvo.pagePerBlock}">&lt;</a></li>
                                            </c:if>
                                            <c:forEach begin="${pvo.startPage}" end="${pvo.endPage}" varStatus="status">
                                                <c:if test="${status.index eq pvo.nowPage}">
                                                    <li class="now">${status.index}</li>
                                                </c:if>
                                                <c:if test="${status.index ne pvo.nowPage}">
                                                    <li><a href="${pageContext.request.contextPath}/AdminController?type=logManagement=list&cPage=${status.index}">${status.index}</a></li>
                                                </c:if>
                                            </c:forEach>
                                            <c:if test="${pvo.endPage < pvo.totalPage}">
                                                <li><a href="${pageContext.request.contextPath}/AdminController?type=logManagement&cPage=${pvo.startPage+pvo.pagePerBlock}">&gt;</a></li>
                                            </c:if>
                                            <c:if test="${pvo.endPage >= pvo.totalPage}">
                                                <li class="disable">&gt;</li>
                                            </c:if>
                                        </c:if>
                                    </ol>
                                </td>
                            </tr>
                        </tfoot>

                        <tbody>
                        <c:choose>
                            <c:when test="${empty ar}">
                                <tr>
                                    <td colspan="9" style="text-align: center; color: red;">로그 데이터가 없습니다.</td>
                                </tr>
                            </c:when>
                            <c:otherwise>
                                <c:forEach var="log" items="${ar}">
                                    <tr>
                                        <td>${log.logIdx}</td>
                                        <td>${log.logType}</td>
                                        <td>${log.adminIdx}</td>
                                        <td>${log.logTarget}</td>
                                        <td>${log.logInfo}</td>
                                        <td>${log.logPreValue}</td>
                                        <td>${log.logCurValue}</td>
                                        <td>${log.logDate}</td>
                                        <td>
                                            <button onclick="editLog(${log.logIdx})">수정</button>
                                            <button onclick="deleteLog(${log.logIdx})" style="color: red;">삭제</button>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>
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