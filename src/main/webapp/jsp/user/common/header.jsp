<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // 세션에서 user 값을 가져옴
    vo.userVO user = (vo.userVO) session.getAttribute("user");
    boolean isLoggedIn = (user != null); // userVO 객체가 존재하면 로그인 상태

%>
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
                <% if (isLoggedIn) { %>
                <!-- 로그인 상태: 로그아웃 버튼 표시 -->
                <a href="${pageContext.request.contextPath}/UserController?type=action&action=logout" id="logout-btn" title="로그아웃">로그아웃</a>
                <% } else { %>
                <!-- 비로그인 상태: 로그인 및 회원가입 버튼 표시 -->
                <a href="${pageContext.request.contextPath}/UserController" id="member-login-btn" title="로그인">로그인</a>
                <a href="#" id="member-signup-btn" title="회원가입">회원가입</a>
                <% } %>
            </div>
        </div>
        <!-- //util-area -->
        <!-- link-area -->
        <div class="link-area">
            <a href="#" title="사이트맵" class="sitemap">사이트맵</a>
            <a href="#" title="검색" class="search">검색</a>
            <a href="#" title="상영시간표" class="timetable">상영시간표</a>
            <a href="#" title="나의 메가박스" class="mymega">나의 메가박스</a>
        </div>
        <!-- //link-area -->
        <!-- gnb -->
        <nav id="gnb">
            <ul class="gnb-depth1">
                <li title="영화">
                    <a href="#" class="movie">영화</a>
                </li>
                <li title="예매">
                    <a href="#" class="reserve">예매</a>
                </li>
                <li title="극장">
                    <a href="${pageContext.request.contextPath}/UserController?type=theater" class="theater">극장</a>
                </li>
                <li title="이벤트">
                    <a href="#" class="event">이벤트</a>
                </li>
                <li title="스토어">
                    <a href="#" class="store">스토어</a>
                </li>
                <li title="혜택">
                    <a href="#" class="benefit">혜택</a>
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
    <!-- //container -->
    <script>
    </script>
</header>