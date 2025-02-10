<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- header -->
<header id="header">
    <style>
        /* 모달 CSS */
        .alert-popup {
            display: none;
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background: #fff;
            z-index: 5006;
            width: 420px;
            padding: 0;
            border-radius: 10px;
            height: 200px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
        }

        .wrap {
            position: relative;
        }

        .layer-header {
            background: #339eb2;  /* 보라색 */
            padding: 15px;
            height: 50px;
            border-radius: 10px 10px 0 0;
        }

        .tit {
            color: #fff;
            font-size: 20px;
            font-weight: 500;
        }

        .layer-con {
            padding: 30px 20px;
            text-align: center;
        }

        .txt-common {
            font-size: 17px;
            color: #333;
        }

        .modal-btn-group {
            display: flex;
            justify-content: center;
            gap: 20px;
            margin-top: 30px;
        }

        .modal-btn {
            padding: 10px 20px;
            font-size: 14px;
            border-radius: 5px;
            cursor: pointer;
            border: 0;
            background: #fff;
            color: #339eb2;
            font-weight: bold;
            width: 100px;
            text-align: center;
        }

        .button:hover {
            background: #1e7f9a;
            color: #fff;
        }

        .purple {
            background: #339eb2;
            color: #fff;
        }

        .purple:hover {
            background: #1e7f9a
        }

        .btn-layer-close:hover {
            color: #ccc;
        }

        .modal-overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5); /* 검은색 배경 (50% 투명) */
            z-index: 999; /* 모달보다 아래, 일반 요소보다 위 */
            display: none;
            overflow: auto;  /* 오버레이에 스크롤 허용 */
        }
    </style>
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
                    <c:when test="${not empty sessionScope.uservo}">
                        <!-- 세션에 uservo가 있으면 로그아웃 버튼 -->
                        <a href="#" id="member-logout-btn" title="로그아웃">로그아웃</a>
                    </c:when>
                    <c:otherwise>
                        <!-- 세션에 uservo가 없으면 로그인 버튼 -->
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
            <a href="${pageContext.request.contextPath}/UserController?type=myPage" title="나의 메가박스" class="mymega">나의 메가박스</a>
        </div>
        <!-- //link-area -->
        <!-- 로그인 필요 알림 다이얼로그 -->
<%--        <div id="loginNoticeDialog" title="알림" class="dialog-common">
            <p>로그인 후 이용 가능한 서비스입니다.</p>
            <div class="ui-btn-div">
                <button type="button" onclick="closeDialog('loginNoticeDialog')">확인</button>
            </div>
        </div>--%>
        <!-- 오버레이 HTML -->
        <div id="modalOverlay" class="modal-overlay"></div>
        <!-- 로그인 필요 알림 모달 -->
        <section class="alert-popup" id="loginNoticeModal">
            <div class="wrap">
                <header class="layer-header">
                    <h3 class="tit">알림</h3>
                </header>
                <div class="layer-con">
                    <p class="txt-common" id="loginNoticeMessage">로그인 후 이용 가능한 서비스입니다.</p>
                    <div class="modal-btn-group">
                        <button type="button" class="modal-btn purple confirm" id="closeLoginNoticeModal">확인</button>
                    </div>
                </div>
            </div>
        </section>

        <script>
            // 로그인 필요 알림 모달 요소 가져오기
            const loginNoticeModal = document.getElementById('loginNoticeModal');
            const closeLoginNoticeModal = document.getElementById('closeLoginNoticeModal');
            const modalOverlay = document.getElementById("modalOverlay"); // 오버레이 요소 가져오기

            // 모달 보이기 / 숨기기 함수
            function showModal(modal) {
                modal.style.display = "block";
                modalOverlay.style.display = "block";
            }

            function hideModal(modal) {
                modal.style.display = "none";
                modalOverlay.style.display = "none";
                document.body.style.overflow = "auto";
            }

            // 로그인 필요 알림 모달 보이기 함수
            function showLoginNoticeModal(message) {
                document.getElementById('loginNoticeMessage').textContent = message;
                showModal(loginNoticeModal);
            }

            // 닫기 버튼 클릭 시 모달 숨기기
            closeLoginNoticeModal.addEventListener("click", () => hideModal(loginNoticeModal));

            // ✅ 모달 외부 클릭 시 닫기 방지
            loginNoticeModal.addEventListener("click", (event) => {
                if (event.target === loginNoticeModal) {
                    event.stopPropagation();
                }
            });

            // 기존 이벤트와 통합
            $(document).ready(function () {
                $(".mymega").on("click", function (e) {
                    e.preventDefault();  // 기본 링크 동작 막기

                    $.ajax({
                        url: 'UserController?type=loginCheck',
                        type: 'POST',
                        dataType: 'json',
                        success: function (res) {
                            if (res.login) {
                                // 로그인된 상태 → 마이페이지로 이동
                                window.location.href = `${pageContext.request.contextPath}/UserController?type=myPage`;
                            } else {
                                // 로그인되지 않은 상태 → 로그인 알림 모달 띄우기
                                showLoginNoticeModal("로그인 후 이용 가능한 서비스입니다.");
                            }
                        }
                    });
                });
            });
        </script>

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
                <li title="공지">
                    <a href="${pageContext.request.contextPath}/UserController?type=board" class="benefit">공지사항</a>
                </li>
            </ul>
        </nav>
    </div>
    <!-- 로그인 모달 창 -->
    <jsp:include page="../login/loginModal.jsp"/>
</header>