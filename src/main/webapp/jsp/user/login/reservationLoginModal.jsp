<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>로그인</title>
    <style>
        /* Body 기본 설정 */
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

        /* Dialog Container */
        .nonmember-dialog-container {
            width: 700px;
            height: 480px;
            background-color: #fff;
            border-radius: 3px;
            overflow: hidden;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);
            display: flex;
            flex-direction: column;
        }

        /* Header */
        .dialog-header {
            background-color: #6a5acd;
            color: white;
            padding: 15px;
            font-size: 18px;
            font-weight: bold;
        }

        /* Tabs */
        .tabs {
            display: flex;
            background-color: #f4f4f4;
            border-bottom: 1px solid #ddd;
        }

        .tab {
            flex: 1;
            text-align: center;
            padding: 10px;
            cursor: pointer;
            font-size: 16px;
            font-weight: bold;
            color: #6a5acd;
            border-bottom: 2px solid transparent;
        }

        .tab.active {
            color: #000;
            border-bottom: 2px solid #6a5acd;
        }

        /* Content */
        .content#member{
            display: none;
            flex: 1;
            padding: 20px;
        }

        .content.active#member{
            display: grid;
            grid-template-columns: 1fr 1fr; /* 좌우 1:1 비율 */
            gap: 20px;
            align-items: center;
        }

        /* 로그인 영역 */
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

        .login-footer {
            text-align: center;
            margin-top: 10px;
        }

        .login-footer a {
            margin: 0 5px;
            color: #6a5acd;
            text-decoration: none;
        }

        .login-footer a:hover {
            text-decoration: underline;
        }

        /* 이미지 영역 */
        .image-container {
            width: 100%;
            height: 100%;
            display: flex;
            justify-content: center;
            overflow: hidden;
        }

        .image-container img {
            max-width: 100%;
            max-height: 100%;
            object-fit: cover;
        }

        /* 비회원 로그인 섹션 */

        /* Content */
        .content#nonmember{
            display: none;
            height: 100%;
            padding: 20px 20px 0px 20px;
        }

        .content.active#nonmember {
            display: grid; /* 그리드 레이아웃 */
            grid-template-columns: 1fr 1fr; /* 좌우 1:1 비율 */
            gap: 20px; /* 좌우 간격 */
            align-items: stretch; /* 높이를 동일하게 설정 */
        }

        /* 공통 폰트 크기 */
        .info-box, .info-box-table td {
            font-size: 12px; /* 전체적으로 폰트 크기 줄임 */
        }

        /* 왼쪽 테이블 컨테이너 */
        .info-box-left {
            display: flex;
            flex-direction: column;
            justify-content: space-between; /* 상하 간격 균일 */
            background-color: #f5f5f5; /* 회색 배경 */
            border-radius: 10px;
            padding: 10px; /* 패딩 조정 */
            box-sizing: border-box;
            height: 100%; /* 부모 높이에 맞춤 */
        }

        /* 테이블 스타일 */
        .info-box-table {
            width: 100%;
            border-collapse: collapse;
        }

        .info-box-table td {
            padding: 6px; /* 패딩 축소 */
            font-size: 12px; /* 폰트 크기 축소 */
            vertical-align: middle; /* 텍스트 가운데 정렬 */
            background-color: #f5f5f5; /* 기본 회색 배경 */
        }

        .info-box-table td:first-child {
            font-weight: bold;
            width: 30%; /* 첫 번째 열 폭 조정 */
            text-align: left;
        }

        .info-box-table input {
            width: 100%;
            padding: 6px; /* 패딩 축소 */
            font-size: 12px; /* 폰트 크기 축소 */
            border: 1px solid #ddd;
            border-radius: 5px;
            box-sizing: border-box;
            background-color: white; /* Input만 흰색 배경 */
        }

        .info-box-table button {
            padding: 6px 10px;
            background-color: #6a5acd;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 12px; /* 버튼 폰트 크기 축소 */
        }

        .info-box-table button:hover {
            background-color: #5a4cad;
        }

        /* 오른쪽 정보 박스 */
        .info-box {
            background-color: #f9f9f9;
            border-radius: 10px;
            padding: 10px; /* 패딩 축소 */
            box-sizing: border-box;
            height: 100%; /* 부모 높이에 맞춤 */
        }

        .info-box h3 {
            font-size: 14px; /* 제목 크기 유지 */
            color: #333;
            margin-bottom: 10px;
        }

        .info-box .radio-group {
            display: flex;
            gap: 10px;
            margin-top: 10px;
        }

        .info-box .radio-group label {
            font-size: 12px; /* 라디오 버튼 폰트 축소 */
            color: #666;
        }

        .info-box p {
            font-size: 12px; /* 설명 폰트 축소 */
            color: #555;
            margin-bottom: 8px;
        }

        .info-box p:last-child {
            font-size: 10px; /* 마지막 문구 크기 더 축소 */
            color: #888;
        }

        /* 확인 버튼 스타일 */
        .submit-button-container {
            grid-column: span 2; /* 버튼이 두 열을 차지 */
            text-align: center; /* 가운데 정렬 */
        }

        .submit-button-container button {
            padding: 8px 16px;
            background-color: #6a5acd;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 14px; /* 버튼 폰트 크기 유지 */
            cursor: pointer;
        }

        .submit-button-container button:hover {
            background-color: #5a4cad;
        }
    </style>
</head>
<body>
<div class="nonmember-dialog-container">
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
            <img src="${pageContext.request.contextPath}/css/user/images/event/렛미인포스터.png" alt="이미지">
        </div>
    </div>
    <!-- 비회원 로그인 -->
    <div class="content" id="nonmember">
        <!-- 왼쪽: 테이블 형식 -->
        <div class="info-box-left">
            <table class="info-box-table">
                <tr>
                    <td>이름</td>
                    <td><input type="text" placeholder="이름"></td>
                </tr>
                <tr>
                    <td>생년월일</td>
                    <td><input type="text" placeholder="생년월일 앞 6자리"></td>
                </tr>
                <tr>
                    <td>휴대폰 번호</td>
                    <td>
                        <div style="display: flex; gap: 10px;">
                            <input type="text" placeholder="'-' 없이 입력" style="flex: 1;">
                            <button>인증요청</button>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>인증번호</td>
                    <td>
                        <div style="display: flex; gap: 10px;">
                            <input type="text" placeholder="인증번호">
                            <span style="color: red; font-size: 12px;">3:00</span>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>비밀번호</td>
                    <td><input type="password" placeholder="비밀번호 (숫자 4자리)"></td>
                </tr>
                <tr>
                    <td>비밀번호 확인</td>
                    <td><input type="password" placeholder="비밀번호 (숫자 4자리) 확인"></td>
                </tr>
            </table>
        </div>

        <!-- 오른쪽: 개인정보 처리방침 -->
        <div class="info-box">
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

        <!-- 확인 버튼 -->
        <div class="submit-button-container">
            <button>확인</button>
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
