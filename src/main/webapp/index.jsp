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

    <h3>UserController</h3>
    <p>type 기본값: "main"</p>
    <p><strong>user_action.properties</strong> 파일에 다음 항목을 추가: <em>main=user.action.MainAction</em></p>

    <%-- 기능 구현 전이므로 일단은 main.jsp를 경로로 연결해 메인 화면으로 바로 접근. 추후 Controller 연결 예정 --%>
    <a href="jsp/user/main.jsp">Go to UserController</a> <br/>
    <a href="jsp/user/reservation.jsp">Go to ReservationJSP</a> <br/>
    <a href="jsp/user/seat.jsp">Go to SeatJSP</a> <br/>
    <a href="jsp/user/payment.jsp">Go PaymentJSP</a> <br/>
</main>

<footer>
    <p>&copy; 2025 Cinema Project. All rights reserved.</p>
</footer>
</body>
</html>
