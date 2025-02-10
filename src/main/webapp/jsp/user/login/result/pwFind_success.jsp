<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    session.setAttribute("userIdx", request.getParameter("userIdx"));
    session.setAttribute("userId", request.getParameter("userId"));
    session.setAttribute("userName", request.getParameter("userName"));

%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>아이디/비밀번호 찾기</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f0f0f0; /* 좌우 회색 배경 */
            display: flex;
            justify-content: center;
            align-items: flex-start;
            min-height: 100vh;
        }

        .container {
            width: 600px;
            min-height: 100vh; /* 화면 꽉 차게 */
            background: white;
            margin: auto; /* 좌우 중앙 정렬 */
            padding: 50px; /* 좌우 여백 추가 */
            box-sizing: border-box;
        }

        .logo img {
            width: 150px;
            margin: 0 auto 20px;
            display: block;
        }

        h1 {
            font-size: 18px;
            font-weight: 500;
            color: #4a4a4a;
            text-align: center;
            margin-bottom: 20px;
        }

        table {
            width: 100%; /* 테이블 폭 통일 */
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        table tr:first-child {
            border-top: 1px solid #000; /* 맨 윗선 굵게 */
        }

        table tr {
            border-bottom: 1px solid #ddd;
        }

        table td {
            padding: 10px;
            font-size: 14px;
        }

        table td:first-child {
            width: 30%;
            font-weight: bold; /* 강조 */
            background-color: #f5f5f5; /* 회색 배경 */
            text-align: center;
        }

        input {
            width: 100%; /* 입력 필드 폭 통일 */
            padding: 8px;
            border: 1px solid #ddd;
            font-size: 14px;
            box-sizing: border-box;
        }

        input:focus {
            outline: none;
            border-color: #999; /* 포커스 시 테두리 색상 변경 */
        }

        button {
            width: 100%;
            padding: 10px;
            font-size: 16px;
            background-color: #339eb2;
            border-radius: 4px;
            color: #fff;
            border: none;
            margin-bottom: 10px;
        }

        button:hover {
            background-color: #1e7f9a;
        }

        select {
            padding: 5px;
            font-size: 14px;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="logo">
        <img src="${pageContext.request.contextPath}/css/user/images/logo_cinefeel.png" alt="MEGABOX 로고">
    </div>
    <h1><b>아이디/비밀번호 찾기</b></h1>

    <!-- 에러 메시지 표시 -->
    <c:if test="${not empty error}">
        <div class="error-message">
            <p>${error}</p>
        </div>
    </c:if>

    <form action="${pageContext.request.contextPath}/UserController?type=updatepassword" method="POST">
        <p>${userId}님의 비밀번호를 재설정 하여주세요.</p>
        <table>
            <tr>
                <td>비밀번호</td>
                <td>
                    <input type="password" id="newPassword" name="newPassword" oninput="pwCheck()" placeholder="8자리 이상 비밀번호를 설정해주세요.">
                </td>
            </tr>
            <tr>
                <td>비밀번호 확인</td>
                <td>
                    <input type="password" id="newPassword2" name="newPassword2" oninput="pwCheck()" placeholder="위에서 입력한 비밀번호와 동일하게 작성하세요.">
                    <div id="authpwd" style="margin-top: 5px; font-size: 12px; color: red;">비밀번호를 입력하여 주세요.</div>
                </td>
            </tr>
        </table>
        <button type="submit" id="gosub" name="gosub" disabled>비밀번호 찾기</button>
    </form>
</div>

<script>
    function pwCheck() {
        const authPwd = document.getElementById('authpwd');
        const newPassword = document.getElementById('newPassword').value;
        const newPassword2 = document.getElementById('newPassword2').value;

        if (newPassword === newPassword2 && newPassword.length >= 8) {
            authPwd.innerText = '비밀번호가 일치합니다.';
            authPwd.style.color = 'green';
            gosub.disabled = false;
        } else if (newPassword !== newPassword2) {
            authPwd.innerText = '비밀번호가 불일치합니다.';
            authPwd.style.color = 'red';
            gosub.disabled = true;
        } else if (newPassword.length < 8) {
            authPwd.innerText = '비밀번호는 최소 8자리 이상이어야 합니다.';
            authPwd.style.color = 'red';
            gosub.disabled = true;
        }
    }
</script>

</body>
</html>