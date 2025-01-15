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
            background-color: rgba(0, 0, 0, 0.5);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            overflow: hidden;
        }

        .dialog-container {
            width: 700px;
            height: 400px;
            background-color: #fff;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);
        }

        .dialog-header {
            background-color: #6a5acd;
            color: white;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 20px;
        }

        .dialog-title {
            font-size: 18px;
            font-weight: bold;
        }

        .tabs {
            display: flex;
            border-bottom: 1px solid #ddd;
        }

        .tab {
            flex: 1;
            padding: 10px;
            text-align: center;
            cursor: pointer;
            font-size: 16px;
            font-weight: bold;
            border-bottom: 2px solid transparent;
            color: #6a5acd;
        }

        .tab.active {
            border-bottom: 2px solid #6a5acd;
            color: #000;
        }

        .content {
            display: none;
        }

        .content.active {
            display: flex;
            gap: 20px;
            padding: 20px;
        }

        .login-container {
            width: 50%;
            flex: 1;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .login-container input,
        .login-container button {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            font-size: 14px;
            box-sizing: border-box;
        }

        .login-container button {
            background-color: #6a5acd;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .login-container button:hover {
            background-color: #5a4cad;
        }

        .checkbox-container {
            display: flex;
            align-items: center;
            margin-bottom: 15px;
            font-size: 14px;
        }

        .checkbox-container input {
            margin-right: 5px;
        }

        .image-container img {
            width: 100%;
            height: auto;
            object-fit: cover;
        }
        .image-container {
            width: 43%; /* 컨테이너 너비 */
            height: auto; /* 고정 높이 */
            display: flex;
            justify-content: center; /* 수평 가운데 정렬 */
            align-items: center; /* 수직 가운데 정렬 */
            overflow: hidden; /* 스크롤바 제거 */
            position: relative;
        }

        .info-box {
            flex: 1;
        }

        .radio-group {
            margin-top: 10px;
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
    </style>
</head>
<body>
<div class="dialog-container">
    <div class="dialog-header">
        <div class="dialog-title">로그인</div>
    </div>
    <div class="tabs">
        <div class="tab active" data-target="member">회원 로그인</div>
        <div class="tab" data-target="nonmember">비회원 로그인</div>
    </div>
    <!-- 회원 로그인 -->
    <div class="content active" id="member">
        <div class="login-container">
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
            <img src="images/렛미인포스터.png" alt="이미지">
        </div>
    </div>
    <!-- 비회원 로그인 -->
    <div class="content" id="nonmember">
        <div class="info-box">
            <h3>비회원 정보 입력</h3>
            <input type="text" placeholder="이름">
            <input type="text" placeholder="생년월일 (6자리)">
            <input type="text" placeholder="휴대폰 번호">
            <input type="password" placeholder="비밀번호 (4자리)">
            <input type="password" placeholder="비밀번호 확인 (4자리)">
            <button>확인</button>
        </div>
        <div class="info-box">
            <h3>비회원 개인정보 처리방침</h3>
            <p><strong>수집목적:</strong> 비회원 예매 서비스 제공, 이용자 식별, 구매 및 결제</p>
            <p><strong>수집항목:</strong> 이름, 생년월일, 휴대폰 번호, 비밀번호</p>
            <p><strong>보유기간:</strong> 관람 또는 취소 후 7일 이내</p>
            <div class="radio-group">
                <label><input type="radio" name="agree"> 동의</label>
                <label><input type="radio" name="agree"> 미동의</label>
            </div>
            <p style="font-size: 12px; color: #888;">
                정보 수집에 동의하지 않을 경우, 비회원 예매 서비스를 이용할 수 없습니다.
            </p>
        </div>
    </div>
</div>
<script>
  document.addEventListener('DOMContentLoaded', () => {
    const tabs = document.querySelectorAll('.tab');
    const contents = document.querySelectorAll('.content');

    tabs.forEach(tab => {
      tab.addEventListener('click', () => {
        tabs.forEach(t => t.classList.remove('active'));
        tab.classList.add('active');

        const target = tab.getAttribute('data-target');
        contents.forEach(content => {
          content.classList.toggle('active', content.id === target);
        });
      });
    });
  });
</script>
</body>
</html>
