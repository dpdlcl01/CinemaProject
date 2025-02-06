<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="../../common/head.jsp"/>
</head>
<style>
    #main3{

        text-align: center;
    }
    #main3Title{
        font-size: 20px;
        font-weight: bold;
        color: #503396;
        padding-bottom: 20px;
    }

</style>
<body onload="setTimeout(function() { location.href='${pageContext.request.contextPath}/UserController'; }, 3000);">
<jsp:include page="../../common/header.jsp"/>
<div>
    <div id="main3">
        <div id="mainImg">
            <img src="../../../img/complete.png">
        </div>
        <div id="main3Title">
            <p>${userName}님의 아이디는 ${userId}입니다.</p>
            <button type="button"></button>
        </div>

    </div>
</div>
<jsp:include page="../../common/footer.jsp"/>
</body>
</html>
