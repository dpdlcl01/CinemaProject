<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/memberLogin.css">
</head>
<body>
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
                        <%-- action="${pageContext.request.contextPath}/UserController?type=action" --%>
                        <form method="post" id="loginForm">
                            <input type="hidden" name="type" value="action">
                            <input type="text" id="userId" name="userId" class="login-input form-control" placeholder="아이디" required>
                            <input type="password" id="userPassword" name="userPassword" class="login-input form-control mt-3" placeholder="비밀번호" required>
                            <button type="submit" class="login-button btn btn-primary mt-3">로그인</button>
                        </form>
                        <div class="login-footer mt-3">
                            <a href="${pageContext.request.contextPath}/UserController?type=findIdPw">ID/PW 찾기</a>
                            <a href="${pageContext.request.contextPath}/UserController?type=register" class="ms-3">회원가입</a>
                            <a href="${pageContext.request.contextPath}/UserController?type=guestReservationCheck" class="ms-3 guest-booking-btn">비회원 예매확인</a>
                        </div>
                    </div>
                    <!-- 이미지 영역 -->
                    <div class="modal-body">
                        <div class="image-container text-center">
                            <img src="https://img.megabox.co.kr/SharedImg/frontBanner/2025/02/03/Gj9RZJkAG1LyRddiMjE1yzQqxAakOdKw.jpg" alt="이미지" class="img-fluid">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    document.getElementById("loginForm").addEventListener("submit", function(event) {
        event.preventDefault();  // 폼 제출 기본 동작 방지

        const userId = document.getElementById("userId").value;
        const userPassword = document.getElementById("userPassword").value;


        // AJAX 요청 보내기
        fetch('${pageContext.request.contextPath}/UserController?type=login', {
            method: 'POST',
            credentials: 'include', // 세션 쿠키 포함
            body: new URLSearchParams({
                userId: userId,
                userPassword: userPassword,
            })
        })
            .then(response => response.json())  // 응답을 JSON으로 처리
            .then(data => {
                if (data.success) {
                    // 로그인 성공 시 페이지 새로고침
                    window.location.reload();
                } else {
                    // 로그인 실패 시 메시지 표시
                    alert(data.message);
                }
            })
            .catch(error => {
                console.error('Error:', error);
                alert('로그인 처리 중 오류가 발생했습니다.');
            });
    });

    // 로그아웃 처리
    document.getElementById("member-logout-btn").addEventListener("click", function(event) {
        event.preventDefault();  // 기본 동작 방지

        // AJAX 요청 보내기 (로그아웃)
        fetch('${pageContext.request.contextPath}/UserController?type=logout', {
            method: 'POST'
        })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    // 로그아웃 후 버튼 상태 변경
                    // alert(data.message);  // 로그아웃 메시지
                    window.location.reload();  // 페이지 새로고침
                } else {
                    alert("로그아웃 실패");
                }
            })
            .catch(error => {
                console.error('Error:', error);
                alert('로그아웃 처리 중 오류가 발생했습니다.');
            });
    });
</script>
</body>