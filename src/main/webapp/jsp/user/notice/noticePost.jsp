<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <jsp:include page="../common/head.jsp"/>
    <style>
        h1 {
            /*margin: 50px 0 20px 0;*/
            text-align: left;
        }


        .notice-title {
            font-size: 24px;
            font-weight: bold;
            margin: 20px 0;
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

        .notice-content p {
            margin: 10px 0;
        }

        .btn-list {
            border: 1px solid #339eb2;
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

        .btn-list:hover {
            border: 1px solid #1e7f9a;
            background-color: #1e7f9a;
        }

        .navigation-table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }

        .navigation-table td {
            padding: 10px 15px;
            border: 1px solid #ddd;
            vertical-align: middle;
        }

        .navigation-table td span {
            font-weight: bold;
            color: #666;
        }

        .navigation-table td:first-child {
            background-color: #f8f8f8; /* 옅은 회색 */
            font-weight: bold;
            text-align: center;
        }

        .navigation-table td a:hover {
            text-decoration: underline; /* 마우스를 올릴 때 밑줄 */
        }

        /*.navigation-table tr:first-child td {*/
        /*    border-top: 1px solid #6a5acd;*/
        /*}*/
        /*.navigation-table tr:last-child td {*/
        /*    border-bottom: 1px solid #6a5acd;*/
        /*}*/
    </style>
</head>
<body>
<jsp:include page="../common/header.jsp"/>
<!-- 추가된 page-util -->
<div class="page-util">
    <div class="inner-wrap">
        <div class="location">
            <span>Home</span>
            <img src="https://img.megabox.co.kr/static/pc/images/common/bg/bg-location-arr.png"/>
            <label>공지사항</label>
            <img src="https://img.megabox.co.kr/static/pc/images/common/bg/bg-location-arr.png"/>
            <label>상세보기</label>
        </div>
    </div>
</div>
<div class="contents">
    <c:set var="board" value="${requestScope.board}"/>
    <c:set var="pboard" value="${requestScope.pboard}"/>
    <c:set var="nboard" value="${requestScope.nboard}"/>
    <h1>공지사항</h1>
    <h1 class="notice-title">${board.boardTitle}</h1>
    <div class="notice-info">
        <span>영화관: <c:if test="${board.theaterName ne null}">
            <td>${board.theaterName}</td>
        </c:if>
                        <c:if test="${board.theaterName eq null}">
                            <td>메가박스</td>
                        </c:if></span> | <span>구분: 공지</span> | <span>등록일: ${board.boardRegDate}</span>
    </div>
    <div class="notice-content">
        ${board.boardContent}
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
                        <a href="UserController?type=view&boardIdx=${nboard.boardIdx}
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
                        <a href="UserController?type=view&boardIdx=${pboard.boardIdx}
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
    <form action="UserController" method="get">
        <input type="hidden" name="type" value="board"/>
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
<jsp:include page="../common/footer.jsp"/>
</body>
</html>
