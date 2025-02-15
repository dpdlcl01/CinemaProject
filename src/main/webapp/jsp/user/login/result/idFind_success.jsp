<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>CINEFEEL - NEW OCEAN ESSENTIAL</title>
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

        #main3 {
            text-align: center;
        }

        #main3Title p {
            font-size: 16px;
            color: #333;
            margin-top: 20px;
        }

        #completeDiv button {
            width: 100%;
            padding: 10px;
            font-size: 16px;
            background-color: #339eb2;
            border-radius: 4px;
            color: #fff;
            border: none;
            margin-top: 20px;
        }

        #completeDiv button:hover {
            background-color: #1e7f9a;
        }

        #completeDiv a {
            text-decoration: none;
            color: white;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="logo">
        <img src="${pageContext.request.contextPath}/css/user/images/logo_cinefeel.png" alt="Logo">
    </div>
    <form action="${pageContext.request.contextPath}/UserController?type=findid" method="post">
        <div id="main3">
            <div id="main3Title">
                <p>${param.userName}님의 아이디는 ${param.userId}입니다.</p>
            </div>
            <div id="completeDiv">
                <button type="button" id="complete" onclick="window.location.href='${pageContext.request.contextPath}/UserController'">메인으로</button>
            </div>
        </div>
    </form>
</div>
</body>
</html>
