<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <form action="${pageContext.request.contextPath}/UserController?type=register" method="post">
    <div id="mainImg">
        <img src="../../../img/complete.png">
    </div>
     에러발생! 관리자에게 문의.
    </form>
</body>
<script>
    setTimeout('location.href = "/UserController"', 3000)
</script>
</html>
