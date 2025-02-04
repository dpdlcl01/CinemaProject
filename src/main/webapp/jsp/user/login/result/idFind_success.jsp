<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div>
    <form action="${pageContext.request.contextPath}/UserController?type=findid" method="post">
        <div id="main3">
            <div id="mainImg">
                <img src="../../../img/complete.png">
            </div>
            <div id="main3Title">
                <p>${userName}님의 아이디는 ${userId}입니다.</p>
            </div>
            <div id="completeDiv">
                <button type="button" id="complete"><a href="/UserController">메인으로</a></button>
            </div>
        </div>
    </form>
</div>
</body>
</html>
