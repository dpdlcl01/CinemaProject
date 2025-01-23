<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>

<%--<%--%>
<%--    // 세션에서 user 값을 가져옴--%>
<%--    vo.UserVO user = (vo.UserVO) session.getAttribute("user");--%>
<%--    boolean isLoggedIn = (user != null); // userVO 객체가 존재하면 로그인 상태--%>

<%--%>--%>

<%--<!DOCTYPE html>--%>
<%--<html lang="ko">--%>
<%--<head>--%>
<%--    <meta charset="UTF-8">--%>
<%--    <title>로그인</title>--%>
<%--    <style>--%>
<%--        body {--%>
<%--            font-family: Arial, sans-serif;--%>
<%--            margin: 0;--%>
<%--            padding: 0;--%>
<%--            background-color: rgba(0, 0, 0, 0.5); /* 모달 배경 효과 */--%>
<%--            display: flex;--%>
<%--            justify-content: center;--%>
<%--            align-items: center;--%>
<%--            height: 100vh; /* 화면 전체 높이 */--%>
<%--        }--%>

<%--        .dialog-container {--%>
<%--            display: flex;--%>
<%--            width: 700px;--%>
<%--            height: 400px;--%>
<%--            background-color: #fff;--%>
<%--            border-radius: 3px;--%>
<%--            overflow: hidden;--%>
<%--            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);--%>
<%--        }--%>

<%--        .login-container {--%>
<%--            width: 50%;--%>
<%--            padding: 30px;--%>
<%--            display: flex;--%>
<%--            flex-direction: column;--%>
<%--            justify-content: center;--%>
<%--        }--%>

<%--        .login-header {--%>
<%--            font-size: 24px;--%>
<%--            font-weight: bold;--%>
<%--            color: #6a5acd;--%>
<%--            text-align: center;--%>
<%--            margin-bottom: 20px;--%>
<%--        }--%>

<%--        .login-input, .login-button {--%>
<%--            width: 100%; /* 너비 동일 */--%>
<%--            padding: 15px; /* 패딩 동일 */--%>
<%--            margin-bottom: 15px;--%>
<%--            font-size: 16px; /* 폰트 크기도 동일하게 */--%>
<%--            box-sizing: border-box; /* 패딩과 테두리를 포함한 너비 계산 */--%>
<%--        }--%>

<%--        .login-button {--%>
<%--            background-color: #6a5acd;--%>
<%--            color: white;--%>
<%--            border: none;--%>
<%--            border-radius: 5px;--%>
<%--            cursor: pointer;--%>
<%--        }--%>

<%--        .login-button:hover {--%>
<%--            background-color: #5a4cad;--%>
<%--        }--%>


<%--        .login-footer {--%>
<%--            margin-top: 15px;--%>
<%--            text-align: center;--%>
<%--        }--%>

<%--        .login-footer a {--%>
<%--            margin: 0 5px;--%>
<%--            color: #6a5acd;--%>
<%--            text-decoration: none;--%>
<%--        }--%>

<%--        .login-footer a:hover {--%>
<%--            text-decoration: underline;--%>
<%--        }--%>

<%--        .image-container {--%>
<%--            width: 50%; /* 컨테이너 너비 */--%>
<%--            height: 400px; /* 고정 높이 */--%>
<%--            display: flex;--%>
<%--            justify-content: center; /* 수평 가운데 정렬 */--%>
<%--            align-items: center; /* 수직 가운데 정렬 */--%>
<%--            overflow: hidden; /* 스크롤바 제거 */--%>
<%--            position: relative;--%>
<%--        }--%>

<%--        .image-container img {--%>
<%--            width: 100%; /* 이미지의 너비를 컨테이너에 맞춤 */--%>
<%--            height: 100%; /* 비율 유지 */--%>
<%--            object-fit: cover; /* 이미지를 비율 유지하며 고정 크기에 맞게 채우기 */--%>
<%--        }--%>

<%--        .image-container::after {--%>
<%--            content: '';--%>
<%--            position: absolute;--%>
<%--            top: 0;--%>
<%--            left: 0;--%>
<%--            width: 100%;--%>
<%--            height: 100%;--%>
<%--            background: rgba(0, 0, 0, 0.3); /* 반투명 효과 */--%>
<%--        }--%>

<%--        /*로그인 에러*/--%>
<%--        .error-modal {--%>
<%--            display: none; /* 기본적으로 숨김 */--%>
<%--            position: fixed;--%>
<%--            top: 50%;--%>
<%--            left: 50%;--%>
<%--            transform: translate(-50%, -50%);--%>
<%--            background-color: white;--%>
<%--            border-radius: 8px;--%>
<%--            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);--%>
<%--            padding: 20px;--%>
<%--            text-align: center;--%>
<%--            z-index: 1000;--%>
<%--        }--%>

<%--        .error-modal.active {--%>
<%--            display: block; /* 활성화 시 표시 */--%>
<%--        }--%>

<%--        .error-modal button {--%>
<%--            margin-top: 15px;--%>
<%--            padding: 10px 20px;--%>
<%--            background-color: #5a4cad;--%>
<%--            color: white;--%>
<%--            border: none;--%>
<%--            border-radius: 5px;--%>
<%--            cursor: pointer;--%>
<%--        }--%>

<%--        .error-modal button:hover {--%>
<%--            background-color: #4a3cad;--%>
<%--        }--%>

<%--    </style>--%>
<%--</head>--%>
<%--<body>--%>
<%--<div class="dialog-container">--%>
<%--    <!-- 로그인 영역 -->--%>
<%--    <div class="login-container">--%>
<%--        <div class="login-header">로그인</div>--%>

<%--        <!-- 실패 메시지 표시 -->--%>
<%--        <!-- 실패 알림 모달 -->--%>
<%--        <div class="error-modal" id="errorModal">--%>
<%--            <p>아이디 또는 비밀번호가 맞지 않습니다.<br>로그인 정보를 다시 확인 바랍니다.</p>--%>
<%--            <button onclick="closeErrorModal()">확인</button>--%>
<%--        </div>--%>

<%--        &lt;%&ndash; 로그인 성공 알림 모달 &ndash;%&gt;--%>
<%--        <div class="error-modal" id="okModal">--%>
<%--            <p>로그인성공!<br><c:out value="${sessionScope.user.userName}"/>반갑습니다.</p>--%>
<%--            <button onclick="closeErrorModal()">확인</button>--%>
<%--        </div>--%>

<%--        <form action="${pageContext.request.contextPath}/UserController" method="post" id="loginForm">--%>
<%--            <input type="hidden" name="type" value="action">--%>
<%--            <input type="text" class="login-input" name="userId" placeholder="아이디" required>--%>
<%--            <input type="password" class="login-input" name="userPassword" placeholder="비밀번호" required>--%>
<%--            <button type="submit" class="login-button">로그인</button>--%>
<%--        </form>--%>
<%--        <div class="login-footer">--%>
<%--            <a href="#">ID/PW 찾기</a>--%>
<%--            <a href="#">회원가입</a>--%>
<%--            <a href="#">비회원 예매확인</a>--%>
<%--        </div>--%>
<%--    </div>--%>

<%--    <!-- 이미지 영역 -->--%>
<%--    <div class="image-container">--%>
<%--        &lt;%&ndash;        <button class="close-button" onclick="closeDialog()"></button>&ndash;%&gt;--%>
<%--        <img src="${pageContext.request.contextPath}/css/user/images/event/렛미인포스터.png" alt="이미지">--%>
<%--    </div>--%>
<%--</div>--%>

<%--<script>--%>

<%--    // 로그인 실패 시 모달 표시--%>
<%--    <% if (request.getAttribute("message") != null) { %>--%>
<%--    document.getElementById("errorModal").classList.add("active");--%>
<%--    <% } %>--%>

<%--    <% if (request.getAttribute("success") == "1") { %>--%>
<%--    document.getElementById("okModal").classList.add("active");--%>
<%--    <% } %>--%>

<%--    <% if (request.getAttribute("success") == "1") { %>--%>
<%--    document.getElementById("okModal").classList.add("active");--%>
<%--    <% } %>--%>

<%--    // 모달 닫기--%>
<%--    function closeErrorModal() {--%>
<%--        document.getElementById("okModal").classList.remove("active");--%>
<%--        document.getElementById("errorModal").classList.remove("active");--%>
<%--    }--%>

<%--</script>--%>
<%--</body>--%>
<%--</html>--%>