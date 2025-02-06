<%@ page buffer="8kb" autoFlush="true"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body onload="setTimeout(function() { location.href='${pageContext.request.contextPath}/UserController'; }, 3000);">
탈퇴 완료
</body>
</html>
