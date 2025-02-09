<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
  <title>관리자 화면</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
          crossorigin="anonymous"></script>
</head>

<style>
    #adminSideBar {
        width: 210px;
        flex-shrink: 0;
        color: black;
        box-sizing: border-box;
        background-color: #f8f8f8;
        padding-left: 15px;
        padding-top: 8px;
    }

    .dashboard {
        font-size: 15px;
        font-weight: 600;
        padding-top: 2px;
        padding-bottom: 8px;
        border-bottom: 1px solid #ddd;
    }

    .dashboard a {
        color: black;
    }

    ul {
        list-style-type: none;
        padding-left: 10px;
    }

    ul li {
        padding: 4px 0;
    }

    ul li a {
        text-decoration: none;
        color: black !important;
        font-size: 14px;
    }

    ul li a:hover {
        color: #007bff;
    }

    .disabled-link {
        color: #b0b0b0 !important; /* 회색 글씨 */
        pointer-events: none; /* 클릭 비활성화 */
        text-decoration: none; /* 밑줄 제거 */
        cursor: default;
    }
</style>


<body>
<div id="adminSideBar">
    <h2 class="dashboard"><a href="${pageContext.request.contextPath}/AdminController?type=dashboard">대시보드</a></h2>
    <h2 class="dashboard">사용자 관리</h2>
    <ul>
        <li><a href="${pageContext.request.contextPath}/AdminController?type=userlist">회원 정보 관리</a></li>
        <li><a href="#">비회원 정보 관리</a></li>
    </ul>

    <h2 class="dashboard">영화 관리</h2>
    <ul>
        <li><a href="${pageContext.request.contextPath}/AdminController?type=movieInfoList">영화 정보 관리</a></li>
        <li><a href="${pageContext.request.contextPath}/AdminController?type=timetableList">영화 상영 관리</a></li>
    </ul>

    <h2 class="dashboard">극장 관리</h2>
    <ul>
        <li><a href="${pageContext.request.contextPath}/AdminController?type=theaterManage">극장/상영관 관리</a></li>
    </ul>

    <h2 class="dashboard">상품 관리</h2>
    <ul>
        <li><a href="${pageContext.request.contextPath}/AdminController?type=product">상품 추가/수정</a></li>
    </ul>

    <h2 class="dashboard">결제 관리</h2>
    <ul>
        <li><a href="${pageContext.request.contextPath}/AdminController?type=paymentList">결제내역 조회</a></li>
    </ul>

    <h2 class="dashboard">게시판 관리</h2>
    <ul>
        <li><a href="${pageContext.request.contextPath}/AdminController?type=adBoard">공지/이벤트 관리</a></li>
    </ul>

    <h2 class="dashboard">쿠폰 관리</h2>
    <ul>
        <li><a href="${pageContext.request.contextPath}/AdminController?type=coupon">쿠폰 추가/발급</a></li>
    </ul>

    <h2 class="dashboard">시스템 관리</h2>
    <ul>
        <li>
            <c:choose>
                <c:when test="${sessionScope.adminvo.adminLevel eq 'SUPER'}">
                    <a href="${pageContext.request.contextPath}/AdminController?type=adminlist">관리자 권한 관리</a>
                </c:when>
                <c:otherwise>
                    <a class="disabled-link">권한 관리</a>
                </c:otherwise>
            </c:choose>
        </li>
        <li>
            <c:choose>
                <c:when test="${sessionScope.adminvo.adminLevel eq 'SUPER'}">
                    <a href="${pageContext.request.contextPath}/AdminController?type=logManagement">관리자/사용자 로그 관리</a>
                </c:when>
                <c:otherwise>
                    <a class="disabled-link">관리자/사용자 로그 관리</a>
                </c:otherwise>
            </c:choose>
        </li>
    </ul>
</div>
</body>
</html>
