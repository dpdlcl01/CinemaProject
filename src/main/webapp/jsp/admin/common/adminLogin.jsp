<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자 로그인</title>
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #f4f4f4;
            margin: 0;
            font-family: 'Arial', sans-serif;
        }

        .login-page {
            width: 400px;
            padding: 20px;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        .login-header {
            font-size: 24px;
            font-weight: bold;
            color: #6a5acd;
            margin-bottom: 20px;
        }

        .login-input {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            font-size: 14px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        .login-button {
            width: 100%;
            padding: 12px;
            background-color: #6a5acd;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            margin-top: 10px;
        }

        .login-button:hover {
            background-color: #5a4cad;
        }

        .login-footer {
            font-size: 14px;
            margin-top: 20px;
        }

        .login-footer a {
            color: #6a5acd;
            text-decoration: none;
        }

        .login-footer a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<div class="login-page">
    <div class="login-header">관리자 로그인</div>
    <form method="post" action="${pageContext.request.contextPath}/AdminController?type=adminLogin">
        <input type="text" name="adminId" class="login-input" placeholder="아이디" required>
        <input type="password" name="adminPassword" class="login-input" placeholder="비밀번호" required>
        <button type="submit" class="login-button">로그인</button>
    </form>
    <div class="login-footer">
        <a href="${pageContext.request.contextPath}/AdminController?type=findIdPw">ID/PW 찾기</a>
    </div>
</div>
</body>
</html>
