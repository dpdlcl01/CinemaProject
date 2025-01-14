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
            border-radius: 10px;
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

        .login-input {
            width: 100%;
            margin-bottom: 15px;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .login-button {
            width: 100%;
            padding: 10px;
            background-color: #6a5acd;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
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

        .close-button {
            position: absolute;
            top: 10px;
            right: 10px;
            font-size: 16px;
            font-weight: bold;
            color: #fff;
            background-color: #6a5acd;
            border: none;
            border-radius: 50%;
            width: 30px;
            height: 30px;
            display: flex;
            justify-content: center;
            align-items: center;
            cursor: pointer;
        }

        .close-button:hover {
            background-color: #5a4cad;
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
        <button class="close-button" onclick="closeDialog()"></button>
        <img src="images/렛미인포스터.png" alt="이미지">
    </div>
</div>

<script>
  function closeDialog() {
    // 다이얼로그 닫기
    document.querySelector(".dialog-container").style.display = "none";
  }
</script>
</body>
</html>