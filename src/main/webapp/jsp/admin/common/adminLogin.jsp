<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자 로그인</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
            background-color: #f8f9fa;
        }

        .form-signin {
            width: 100%;
            max-width: 360px;
            padding: 30px;
            background-color: white;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        .login-header {
            font-size: 24px;
            font-weight: bold;
            color: #6a5acd;
            text-align: center;
            margin-bottom: 20px;
        }

        .form-floating input {
            height: 50px;
            font-size: 16px;
        }

        .btn-primary {
            background-color: #6c63ff;
            border: none;
            padding: 12px;
            font-size: 18px;
            border-radius: 8px;
        }

        .btn-primary:hover {
            background-color: #584de6;
        }

        .login-links {
            margin-top: 10px;
            display: flex;
            justify-content: space-around;
            font-size: 14px;
            color: #6c63ff;
        }

        .login-links a {
            text-decoration: none;
            color: #6c63ff;
        }

        .login-links a:hover {
            text-decoration: underline;
        }

    </style>
</head>
<body>
<main class="form-signin text-center">
    <form method="post" action="${pageContext.request.contextPath}/AdminController?type=adminLogin">
        <h1 class="login-header">관리자 로그인</h1>

        <div class="form-floating mb-3">
            <input type="text" name="adminId" class="form-control" id="floatingInput" placeholder="아이디">
            <label for="floatingInput">아이디</label>
        </div>
        <div class="form-floating mb-3">
            <input type="password" name="adminPassword" class="form-control" id="floatingPassword" placeholder="비밀번호">
            <label for="floatingPassword">비밀번호</label>
        </div>

        <button class="w-100 btn btn-lg btn-primary" type="submit">로그인</button>
        <p class="mt-3 mb-3 text-muted">© 2025</p>
    </form>
</main>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
