<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cinema Project</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f9;
        }

        header {
            background-color: #333;
            color: white;
            padding: 20px;
            text-align: center;
        }

        main {
            padding: 30px;
            text-align: center;
        }

        h1 {
            font-size: 2.5em;
            margin-bottom: 20px;
        }

        h2 {
            font-size: 1.8em;
            color: #444;
        }

        p {
            font-size: 1.2em;
            color: #666;
        }

        a {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }

        a:hover {
            background-color: #0056b3;
        }

        footer {
            background-color: #333;
            color: white;
            text-align: center;
            padding: 10px;
            position: fixed;
            bottom: 0;
            width: 100%;
        }
    </style>
</head>
<body>
<header>
    <h1>Cinema Project</h1>
</header>
<main>
    <h2>영화 예매 웹 애플리케이션</h2>

    <a href="${pageContext.request.contextPath}/UserController">Go to UserController</a>
    <a href="${pageContext.request.contextPath}/AdminController">Go to AdminController</a><br/><br/>
    <a href="${pageContext.request.contextPath}/AdminController?type=dbMovie">영화 API 연결 확인</a>
    <a href="${pageContext.request.contextPath}/AdminController?type=dbUpdate">영화 API 업데이트 확인</a>
    <a href="${pageContext.request.contextPath}/UserController?type=reservationPayment">예매결제화면</a>
</main>

<footer>
    <p>&copy; 2025 Cinema Project. All rights reserved.</p>
</footer>
</body>
</html>
