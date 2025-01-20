<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- header -->
<header id="header">
    <!-- container -->
    <div class="container">
        <h1 class="logo">
            <a href="UserController" title="MEGABOX 메인으로 가기">MEGABOX : Life Theater</a>
        </h1>
        <!-- util-area -->
        <div class="util-area">
            <div class="right-link">
                <a href="#" id="member-login-btn" title="로그인" data-bs-toggle="modal" data-bs-target="#loginModal">로그인</a>
                <a href="#" title="회원가입">회원가입</a>
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
                    <a href="${pageContext.request.contextPath}/UserController?type=reservation" class="reserve">예매</a>
                </li>
                <li title="극장">
                    <a href="#" class="theater">극장</a>
                </li>
                <li title="이벤트">
                    <a href="${pageContext.request.contextPath}/UserController?type=event&offset=0&pageSize=5" class="event">이벤트</a>
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
    <div class="dialog-area">
        <div class="modal fade dialog-area" id="loginModal" tabindex="-1" aria-labelledby="loginModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-lg">
                <div class="modal-content">
                    <!-- 모달 헤더 -->
                    <div class="modal-header">
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <!-- 모달 바디 -->
                    <div class="modal-body dialog-container">
                        <!-- 로그인 영역 -->
                        <div class="login-container">
                            <div class="login-header">로그인</div>
                            <input type="text" class="login-input form-control" placeholder="아이디">
                            <input type="password" class="login-input form-control mt-3" placeholder="비밀번호">
                            <button class="login-button btn btn-primary mt-3">로그인</button>
                            <div class="login-footer mt-3">
                                <a href="#">ID/PW 찾기</a>
                                <a href="#" class="ms-3">회원가입</a>
                                <a href="${pageContext.request.contextPath}/UserController?type=guestReservationCheck" class="ms-3 guest-booking-btn">비회원 예매확인</a>
                            </div>
                        </div>
                        <!-- 이미지 영역 -->
                        <div class="modal-body">
                            <div class="image-container text-center">
                                <img src="${pageContext.request.contextPath}/css/user/images/event/렛미인포스터.png" alt="이미지" class="img-fluid">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>