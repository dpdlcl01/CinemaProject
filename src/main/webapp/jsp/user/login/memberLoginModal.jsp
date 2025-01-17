<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>로그인</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: rgba(0, 0, 0, 0.5); /* 모달 배경 효과 */
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh; /* 화면 전체 높이 */
        }

        .dialog-container {
            display: flex;
            width: 700px;
            height: 400px;
            background-color: #fff;
            border-radius: 3px;
            overflow: hidden;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);
        }

        .login-container {
            width: 50%;
            padding: 30px;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .login-header {
            font-size: 24px;
            font-weight: bold;
            color: #6a5acd;
            text-align: center;
            margin-bottom: 20px;
        }

        .login-input, .login-button {
            width: 100%; /* 너비 동일 */
            padding: 15px; /* 패딩 동일 */
            margin-bottom: 15px;
            font-size: 16px; /* 폰트 크기도 동일하게 */
            box-sizing: border-box; /* 패딩과 테두리를 포함한 너비 계산 */
        }

        .login-button {
            background-color: #6a5acd;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .login-button:hover {
            background-color: #5a4cad;
        }


        .login-footer {
            margin-top: 15px;
            text-align: center;
        }

        .login-footer a {
            margin: 0 5px;
            color: #6a5acd;
            text-decoration: none;
        }

        .login-footer a:hover {
            text-decoration: underline;
        }

        .image-container {
            width: 50%; /* 컨테이너 너비 */
            height: 400px; /* 고정 높이 */
            display: flex;
            justify-content: center; /* 수평 가운데 정렬 */
            align-items: center; /* 수직 가운데 정렬 */
            overflow: hidden; /* 스크롤바 제거 */
            position: relative;
        }

        .image-container img {
            width: 100%; /* 이미지의 너비를 컨테이너에 맞춤 */
            height: 100%; /* 비율 유지 */
            object-fit: cover; /* 이미지를 비율 유지하며 고정 크기에 맞게 채우기 */
        }

        .image-container::after {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.3); /* 반투명 효과 */
        }
    </style>
</head>
<body>
<div class="dialog-container">
    <!-- 로그인 영역 -->
    <div class="login-container">
        <div class="login-header">로그인</div>
        <input type="text" class="login-input" placeholder="아이디">
        <input type="password" class="login-input" placeholder="비밀번호">
        <button class="login-button">로그인</button>
        <div class="login-footer">
            <a href="#">ID/PW 찾기</a>
            <a href="#">회원가입</a>
            <a href="#">비회원 예매확인</a>
        </div>
    </div>

    <!-- 이미지 영역 -->
    <div class="image-container">
<%--        <button class="close-button" onclick="closeDialog()"></button>--%>
        <img src="${pageContext.request.contextPath}/css/user/images/event/렛미인포스터.png" alt="이미지">
    </div>
</div>
</body>
</html>