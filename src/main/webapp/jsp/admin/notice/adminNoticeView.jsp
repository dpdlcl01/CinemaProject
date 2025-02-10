<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!Doctype html>
<html lang="ko">
<head>
</head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/common.css">
<link rel="stylesheet" href="https://code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">

<style>
    .page-util .inner-wrap {
        max-width: 100%;
    !important;
        padding: 20px 20px;
    !important;
    }

    .myPage-container {
        display: flex;

    }

    #main {
        width: 100%;
        margin: 27px 40px 40px 40px;
    }

    .view {
        width: 840px;
    }

    .view h2 {
        font-size: 30px;
    }

    .view table {
        width: 100%;
    }

    .notice-title {
        font-size: 21px;
        font-weight: bold;
        margin-bottom: 20px;
        margin-top: 20px;
    }

    .notice-info {
        font-size: 14px;
        color: #888;
        margin-bottom: 20px;
    }

    .notice-content {
        border-top: 1px solid #ccc;
        border-bottom: 1px solid #ccc;
        padding: 20px 0;
        margin-bottom: 20px;
    }

    .navigation-table {
        width: 100%;
        border-collapse: collapse;
        margin: 20px 0;
    }

    .navigation-table td:first-child {
        background-color: #f8f8f8;
        font-weight: bold;
        text-align: center;
    }

    .navigation-table td {
        padding: 10px 15px;
        border: 1px solid #ddd;
        vertical-align: middle;
    }

    a {
        color: inherit !important;
    }


    .btn-list {
        display: block;
        width: 100px;
        margin: 20px auto;
        padding: 10px;
        text-align: center;
        color: #fff;
        background-color: #339eb2;
        text-decoration: none;
        border-radius: 5px;
        font-size: 14px;
    }

    .change{
        background-color: #01738b;
        color: #fff;
        border-radius: 5px;
        border: none;
        outline: none;
        box-shadow: none !important;
        margin-top: 10px;

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
                <div class="view">
                    <c:set var="board" value="${requestScope.board}"/>
                    <c:set var="pboard" value="${requestScope.pboard}"/>
                    <c:set var="nboard" value="${requestScope.nboard}"/>
                    <h2>공지사항</h2>
                    <h1 class="notice-title">${board.boardTitle}</h1>
                    <div class="notice-info">
                        <span>영화관: <c:if test="${board.theaterName ne null}">
                            <td>${board.theaterName}</td>
                        </c:if>
                        <c:if test="${board.theaterName eq null}">
                            <td>메가박스</td>
                        </c:if></span> |
                        <span>구분:
                            <c:if test="${board.boardType eq 'NOTICE'}">
                                <td>공지</td>
                            </c:if>
                            <c:if test="${board.boardType eq 'EVENT'}">
                                <td>이벤트</td>
                            </c:if>
                        </span> |
                        <span>등록일: ${board.boardRegDate}</span>
                        <form action="${pageContext.request.contextPath}/AdminController" method="get">
                            <input type="hidden" name="type" value="adEdit">
                            <input type="hidden" name="boardIdx" value="${board.boardIdx}">
                            <button type="submit" class="change">수정</button>
                        </form>
                    </div>
                    <div class="notice-content">
                        <c:if test="${board.boardType eq 'EVENT'}">
                            <img src="${board.boardContent}"/>
                        </c:if><c:if test="${board.boardType ne 'EVENT'}">
                        ${board.boardContent}
                    </c:if>
                    </div>

                    <table class="navigation-table">
                        <colgroup>
                            <col width="20%">
                            <col width="*">
                        </colgroup>
                        <tbody>
                        <tr>
                            <td>
                                <span>이전</span>
                            </td>
                            <td>
                                <c:choose>
                                    <c:when test="${not empty nboard}">
                                        <a href="AdminController?type=adView&boardIdx=${nboard.boardIdx}
                        <c:if test='${not empty param.bType}'> &bType=${param.bType}</c:if>
                        <c:if test='${not empty param.keyword}'> &keyword=${param.keyword}</c:if>
                        <c:if test='${not empty param.region}'> &region=${param.region}</c:if>
                        <c:if test='${not empty param.theater}'> &theater=${param.theater}</c:if>">
                                                ${nboard.boardTitle}</a>
                                    </c:when>
                                    <c:otherwise>
                                        이전 글이 없습니다.
                                    </c:otherwise>
                                </c:choose>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <span>다음</span>
                            </td>
                            <td>
                                <c:choose>
                                    <c:when test="${not empty pboard}">
                                        <a href="AdminController?type=adView&boardIdx=${pboard.boardIdx}
                            <c:if test='${not empty param.bType}'> &bType=${param.bType}</c:if>
                            <c:if test='${not empty param.keyword}'> &keyword=${param.keyword}</c:if>
                            <c:if test='${not empty param.region}'> &region=${param.region}</c:if>
                            <c:if test='${not empty param.theater}'> &theater=${param.theater}</c:if>">
                                                ${pboard.boardTitle}</a>
                                    </c:when>
                                    <c:otherwise>
                                        다음 글이 없습니다.
                                    </c:otherwise>
                                </c:choose>

                            </td>
                        </tr>
                        </tbody>
                    </table>
                    <form action="AdminController" method="post">
                        <input type="hidden" name="type" value="adBoard"/>
                        <c:if test='${not empty param.bType}'>
                            <input type="hidden" name="bType" value="${param.bType}"/>
                        </c:if>
                        <c:if test='${not empty param.keyword}'>
                            <input type="hidden" name="keyword" value="${param.keyword}"/>
                        </c:if>
                        <c:if test='${not empty param.region}'>
                            <input type="hidden" name="region" value="${param.region}"/>
                        </c:if>
                        <c:if test='${not empty param.theater}'>
                            <input type="hidden" name="theater" value="${param.theater}"/>
                        </c:if>
                        <button type="submit" class="btn-list">목록</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>