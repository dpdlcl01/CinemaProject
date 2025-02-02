<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div>
    <form action="${pageContext.request.contextPath}/UserController?type=updatepassword" method="post">
        <div id="main3">
            <div id="mainImg">
                <img src="../../../img/complete.png">
            </div>
            <div id="main3Title">
                <p>${userName}님의 비밀번호를 재설정 하여주세요.</p>
                <input type="password" id="userPassword1" name="userPassword1" oninput="pwCheck()" class="inputValue">
                <input type="password" id="userPassword2" name="userPassword2" oninput="pwCheck()" class="inputValue">
                <a id="authpwd">비밀번호를 입력하여 주세요.</a>
            </div>
            <div id="completeDiv">
                <button type="submit" id="complete">비밀번호 변경하기</button>
            </div>
        </div>
    </form>
</div>
</body>
<script>
        function pwCheck(){
        const authPwd = document.getElementById('authpwd');
        if (document.getElementById('userPassword1').value === document.getElementById('userPassword2').value) {
        authPwd.innerText = '비밀번호가 일치합니다.';
        authPwd.style.color = 'green';
        } else {
        authPwd.innerText = '비밀번호가 불일치합니다.';
        authPwd.style.color = 'red';
        }
        }
</script>
</html>
