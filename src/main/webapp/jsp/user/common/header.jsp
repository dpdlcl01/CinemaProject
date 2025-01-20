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
                    <a href="#" class="reserve" data-bs-toggle="modal" data-bs-target="#reservationLoginModal">예매</a>
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

    <div class="modal fade" id="reservationLoginModal" tabindex="-1" aria-labelledby="reservationLoginModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-lg">
            <div class="modal-content">
                <!-- 모달 헤더 -->
                <div class="modal-header">
                    <h5 class="modal-title" id="reservationLoginModalLabel">로그인</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <!-- 모달 바디 -->
                <div class="modal-body">
                    <!-- 탭 메뉴 -->
                    <div class="tabs nav nav-tabs">
                        <a class="tab nav-link active" data-bs-toggle="tab" href="#memberLogin">회원 로그인</a>
                        <a class="tab nav-link" data-bs-toggle="tab" href="#nonMemberLogin">비회원 로그인</a>
                    </div>
                    <!-- 탭 컨텐츠 -->
                    <div class="tab-content mt-4">
                        <!-- 회원 로그인 -->
                        <div class="tab-pane fade show active" id="memberLogin">
                            <div class="login-container">
                                <input type="text" class="login-input form-control" placeholder="아이디">
                                <input type="password" class="login-input form-control mt-3" placeholder="비밀번호">
                                <button class="login-button btn btn-primary mt-3">로그인</button>
                                <div class="login-footer mt-3">
                                    <a href="#">ID/PW 찾기</a>
                                    <a href="#" class="ms-3">회원가입</a>
                                    <a href="#" class="ms-3">비회원 예매확인</a>
                                </div>
                            </div>
                            <div class="image-container text-center mt-3">
                                <img src="${pageContext.request.contextPath}/css/user/images/event/렛미인포스터.png" alt="이미지" class="img-fluid">
                            </div>
                        </div>

                        <!-- 비회원 로그인 -->
                        <div class="tab-pane fade" id="nonMemberLogin">
                            <div class="info-box-left">
                                <table class="info-box-table table">
                                    <tr>
                                        <td>이름</td>
                                        <td><input type="text" class="form-control" placeholder="이름"></td>
                                    </tr>
                                    <tr>
                                        <td>생년월일</td>
                                        <td><input type="text" class="form-control" placeholder="생년월일 앞 6자리"></td>
                                    </tr>
                                    <tr>
                                        <td>휴대폰 번호</td>
                                        <td>
                                            <div class="d-flex gap-2">
                                                <input type="text" class="form-control" placeholder="'-' 없이 입력">
                                                <button class="btn btn-outline-primary">인증요청</button>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>인증번호</td>
                                        <td>
                                            <div class="d-flex gap-2">
                                                <input type="text" class="form-control" placeholder="인증번호">
                                                <span class="text-danger" style="font-size: 12px;">3:00</span>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>비밀번호</td>
                                        <td><input type="password" class="form-control" placeholder="비밀번호 (숫자 4자리)"></td>
                                    </tr>
                                    <tr>
                                        <td>비밀번호 확인</td>
                                        <td><input type="password" class="form-control" placeholder="비밀번호 (숫자 4자리) 확인"></td>
                                    </tr>
                                </table>
                            </div>

                            <!-- 개인정보 처리방침 -->
                            <div class="info-box mt-3">
                                <h3>비회원 개인정보 처리방침</h3>
                                <p><strong>수집목적:</strong> 비회원 예매 서비스 제공, 이용자 식별, 구매 및 결제</p>
                                <p><strong>수집항목:</strong> 이름, 생년월일, 휴대폰 번호, 비밀번호</p>
                                <p><strong>보유기간:</strong> 관람 또는 취소 후 7일 이내</p>
                                <div class="radio-group">
                                    <label><input type="radio" name="agree"> 동의</label>
                                    <label><input type="radio" name="agree"> 미동의</label>
                                </div>
                                <p style="font-size: 10px; color: #888;">
                                    정보 수집에 동의하지 않을 경우, 비회원 예매 서비스를 이용할 수 없습니다.
                                </p>
                            </div>
                            <div class="text-center mt-3">
                                <button class="btn btn-primary">확인</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


</header>