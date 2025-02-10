<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="../../common/head.jsp"/>
</head>
<style>
    #main3{
        margin-top: 100px;
        min-height: 550px;
        text-align: center;
    }
    #main3Title{
        font-size: 20px;
        font-weight: bold;
        color: #339eb2;
        padding-bottom: 20px;
    }
    #main3Content{

        font-size: 13px;
        padding-bottom: 50px;

    }

    /* 버튼 스타일 */
    button {
        background-color: #339eb2;
        color: #fff;
        border: none;
        border-radius: 4px;
        padding: 10px;
        font-size: 16px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }
    button:disabled {
        background-color: #ccc;
        cursor: not-allowed;
    }
    button:hover:not(:disabled) {
        background-color: #1e7f9a;
    }
    img{
        width: 1100px;
    }

</style>
<body>
    <jsp:include page="../../common/header.jsp"/>
<div>
    <form action="${pageContext.request.contextPath}/UserController?type=register" method="post">
        <div id="main3">
        <div id="mainImg">
        <img src="${pageContext.request.contextPath}/css/user/images/logo_cinefeel_big.png">
    </div>
    <div id="main3Title">
        <p>${userName}님 메가박스 가입을 환영합니다.</p>
    </div>
    <div>
        <p id="main3Content">이제부터 메가박스에서 제공하는 다양한 멤버십 혜택을 이용하실 수 있습니다.</p>
    </div>
    <div id="completeDiv">
        <button type="button" id="complete"><a href="${pageContext.request.contextPath}/UserController">메인으로</a></button>
    </div>
    </div>
    </form>
    </div>
    </div>
    <jsp:include page="../../common/footer.jsp"/>
</body>
</html>
