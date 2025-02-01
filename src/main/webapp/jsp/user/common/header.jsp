<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- header -->
<header id="header">
    <style>
        /* 로그인 알림 다이얼로그 기본 숨김 */
        #loginNoticeDialog {
            display: none;
        }
        /* 공통 다이얼로그 스타일 */
        .dialog-common {
            padding: 0;
            font-weight: 600;
        }

        .dialog-common .ui-btn-div {
            margin: auto;
            text-align: center;
            margin-top: 20px;
        }

        .dialog-common button {
            width: 80px;
            height: 40px;
            border: 1px solid #503396;
            background-color: #503396;
            color: white;
            border-radius: 3px;
        }

        /* 타이틀 스타일 */
        .dialog-common .ui-dialog-titlebar {
            background-color: #503396; /* 타이틀 배경색 */
            color: white; /* 텍스트 색상 */
            border: 2px solid #503396;
        }

        /* 콘텐츠 스타일 */
        .dialog-common .ui-dialog-content {
            color: black; /* 텍스트 색상 */
            font-size: 14px; /* 적절한 폰트 크기 */
        }

        /* 닫기 버튼 숨김 */
        .dialog-common .ui-dialog-titlebar-close {
            display: none;
        }

        /* 버튼 정렬 */
        .dialog-common .ui-dialog-buttonpane {
            text-align: center !important;
        }

        .dialog-common .ui-dialog-buttonset {
            float: none !important;
            display: inline-block;
        }
        /* 공통 다이얼로그 스타일 */
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
            <a href="#" title="검색" class="search">검색</a>
            <a href="#" title="상영시간표" class="timetable">상영시간표</a>
            <a href="${pageContext.request.contextPath}/UserController?type=myPage" title="나의 메가박스" class="mymega">나의 메가박스</a>
        </div>
        <!-- //link-area -->
        <!-- 로그인 필요 알림 다이얼로그 -->
        <div id="loginNoticeDialog" title="알림" class="dialog-common">
            <p>로그인 후 이용 가능한 서비스입니다.</p>
            <div class="ui-btn-div">
                <button type="button" onclick="closeDialog('loginNoticeDialog')">확인</button>
            </div>
        </div>
        <script>
            // 다이얼로그 열기 함수
            function openDialog(dialogId) {
                $("#" + dialogId).dialog({
                    modal: true, // 모달 형태
                    resizable: false, // 크기 조정 불가
                    width: 400, // 다이얼로그 너비
                });
            }

            // 다이얼로그 닫기 함수
            function closeDialog(dialogId) {
                $("#" + dialogId).dialog("close"); // jQuery UI의 close 메서드 호출
            }
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
                                // 로그인되지 않은 상태 → 로그인 알림 다이얼로그 띄우기
                                openDialog("loginNoticeDialog");
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