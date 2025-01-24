<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div>
    <form action="${pageContext.request.contextPath}/UserController?type=register" method="post">
    <div id="mainImg">
        <img src="../../../img/complete.png">
    </div>
    <div id="main3Title">
        가입에 실패하였습니다.
    </div>
    </form>
</div>
</body>
<script>
    setTimeout('location.href = "/UserController"', 3000)
</script>
</html>
