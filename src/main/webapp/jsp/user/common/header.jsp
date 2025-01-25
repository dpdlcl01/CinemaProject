<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- header -->
<header id="header">
    <!-- container -->
    <div class="container">
        <h1 class="logo">
            <a href="${pageContext.request.contextPath}/UserController" title="MEGABOX 메인으로 가기">MEGABOX : Life Theater</a>
        </h1>
        <!-- util-area -->
        <div class="util-area">
            <div class="right-link">
                <!-- 로그인/로그아웃 버튼 동적으로 표시 -->
                <c:choose>
                    <c:when test="${not empty sessionScope.user}">
                        <!-- 세션에 user가 있으면 로그아웃 버튼 -->
                        <a href="#" id="member-logout-btn" title="로그아웃">로그아웃</a>
                    </c:when>
                    <c:otherwise>
                        <!-- 세션에 user가 없으면 로그인 버튼 -->
                        <a href="#" id="member-login-btn" title="로그인" data-bs-toggle="modal" data-bs-target="#loginModal">로그인</a>
                        <a href="${pageContext.request.contextPath}/UserController?type=register" title="회원가입">회원가입</a>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
        <!-- //util-area -->
        <!-- link-area -->
        <div class="link-area">
            <a href="#" title="사이트맵" class="sitemap">사이트맵</a>
            <a href="#" title="검색" class="search">검색</a>
            <a href="#" title="상영시간표" class="timetable">상영시간표</a>
            <a href="${pageContext.request.contextPath}/UserController?type=myPage" title="나의 메가박스" class="mymega">나의 메가박스</a>
        </div>
        <!-- //link-area -->
        <!-- gnb -->
        <nav id="gnb">
            <ul class="gnb-depth1">
                <li title="영화">
                    <a href="${pageContext.request.contextPath}/UserController?type=movieMain&offset=0&pageSize=20" class="movie">영화</a>
                </li>
                <li title="예매">
                    <a href="${pageContext.request.contextPath}/UserController?type=reservation" class="reserve">예매</a>
                </li>
                <li title="극장">
                    <a href="${pageContext.request.contextPath}/UserController?type=theater" class="theater">극장</a>
                </li>
                <li title="이벤트">
                    <a href="${pageContext.request.contextPath}/UserController?type=event&offset=0&pageSize=5" class="event">이벤트</a>
                </li>
                <li title="스토어">
                    <a href="${pageContext.request.contextPath}/UserController?type=store" class="store">스토어</a>
                </li>
                <li title="혜택">
                    <a href="${pageContext.request.contextPath}/UserController?type=board" class="benefit">공지사항</a>
                </li>
            </ul>
        </nav>
        <!-- //gnb -->
        <!-- 레이어 : 사이트맵 -->
        <!-- //레이어 : 사이트맵 -->
        <!-- 레이어 : 검색 -->
        <!-- //레이어 : 검색 -->
        <!-- 레이어 : 마이페이지 -->
        <!-- //레이어 : 마이페이지 -->
    </div>
    <!-- 로그인 모달 창 -->
    <jsp:include page="../login/loginModal.jsp"/>
</header>