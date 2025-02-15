<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CINEFEEL - NEW OCEAN ESSENTIAL</title>
    <!-- Bootstrap CSS CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Google Fonts: Montserrat -->
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Montserrat', sans-serif;
            background-color: #f8f9fa;
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
            margin: 0;
        }
        .index-container {
            width: 100%;
            max-width: 480px;
            padding: 30px;
            background-color: #fff;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        .logo img {
            width: 150px;  /* 로고 크기 */
            margin-bottom: 20px;
        }

        .btn-custom {
            background-color: #339eb2;
            border: none;
            padding: 12px 20px;
            font-size: 16px;
            border-radius: 8px;
            color: #fff;
            margin: 5px;
            text-decoration: none;
            display: inline-block;
        }
        .btn-custom:hover {
            background-color: #287d8f;
        }

        .footer-text {
            margin-top: 20px;
            font-size: 14px;
            color: #6c757d;
        }
    </style>
</head>
<body>
<div class="index-container">
    <div class="logo">
        <img src="${pageContext.request.contextPath}/css/user/images/logo_cinefeel.png" alt="CINEFEEL 로고">
    </div>
    <div>
        <a href="${pageContext.request.contextPath}/UserController" class="btn btn-custom">User Area</a>
        <a href="${pageContext.request.contextPath}/AdminController" class="btn btn-custom">Admin Area</a>
    </div>
    <div class="footer-text">&copy; 2025 CINEFEEL. All rights reserved.</div>
</div>

<!-- Bootstrap JS Bundle CDN (팝퍼 포함) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
