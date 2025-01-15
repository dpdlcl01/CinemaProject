<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!Doctype html>
<html lang="ko">
<!-- head -->
<head>
    <jsp:include page="./user/common/head.jsp"/>
</head>
<style>
    body {
        font-family: Arial, sans-serif;
        text-align: center;
        margin: 0;
        padding: 0;
        background-color: #f9f9f9;
    }
    .container1 {
        max-width: 600px;
        margin: 100px auto;
        padding: 20px;
        background-color: #fff;
        border-radius: 8px;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }
    .icon {
        font-size: 50px;
        color: #6c63ff;
    }
    h1 {
        color: #333;
        font-size: 24px;
        margin-bottom: 20px;
    }
    p {
        color: #666;
        line-height: 1.6;
    }
    .buttons {
        margin-top: 20px;
    }
    .button1 {
        display: inline-block;
        padding: 10px 20px;
        margin: 5px;
        font-size: 14px;
        color: #fff;
        background-color: #6c63ff;
        border-radius: 5px;
        text-decoration: none;
    }
    .button1.secondary {
        background-color: #ccc;
    }
</style>
<body>
<!-- header 영역 -->
<jsp:include page="./user/common/header.jsp"/>

<!-- contents 영역 -->
<div class="container1">
    <div class="icon"><img src="../css/user/images/404.png"/></div>
    <h1>페이지를 찾을 수 없습니다.</h1>
    <p>방문하시려는 웹 페이지의 주소가 잘못 입력되었거나<br> 변경 또는 삭제되어 요청하신 페이지를 찾을 수 없습니다.<br> 입력하신 주소가 정확한지 다시 한 번 확인해 주시기 바랍니다.</p>
    <div class="buttons">
        <a href="#" class="button1 secondary" onclick="history.back()">이전 페이지 이동</a>
        <a href="user/main.jsp" class="button1">메가박스 메인으로 이동</a>
    </div>
</div>

<!-- footer 영역 -->
<jsp:include page="./user/common/footer.jsp"/>

<!-- script 영역 -->
<script>

</script>
</body>
</html>
