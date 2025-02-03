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
    #main3Content{

        font-size: 13px;
        padding-bottom: 50px;

    }
</style>
<body>
    <jsp:include page="../../common/header.jsp"/>
<div>
    <form action="${pageContext.request.contextPath}/UserController?type=register" method="post">
        <div id="main3">
        <div id="mainImg">
        <img src="../../../img/complete.png">
    </div>
    <div id="main3Title">
        <p>${userName}님 메가박스 가입을 환영합니다.</p>
    </div>
    <div>
        <p id="main3Content">이제부터 메가박스에서 제공하는 다양한 멤버십 혜택을 이용하실 수 있습니다.</p>
    </div>
    <div id="completeDiv">
        <button type="button" id="complete"><a href="/UserController?type=main">메인으로</a></button>
    </div>
    </div>
    </form>
    </div>
    </div>
    <jsp:include page="../../common/footer.jsp"/>
</body>
</html>
