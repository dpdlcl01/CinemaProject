<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 25. 1. 29.
  Time: 오전 1:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="utf-8" />
  <link rel="icon" href="https://static.toss.im/icons/png/4x/icon-toss-logo.png" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>CINEFEEL - NEW OCEAN ESSENTIAL</title>
  <style>
    .wrapper{
      width: 1100px;
      margin: 50px auto 50px auto;
    }
    .flex-column{
      text-align: center;
    }
    .response-label{
      font-weight: 600;
      font-size: 18px;
    }
    .response-text{
      font-size: 18px;
      color: blue;
      line-height: 30px;
    }
    .button-group{
      margin: 100px;
    }
    .btn.w-100{
      border: 1px solid black;
      width: 120px;
      height: 70px;
      background-color: white;
      border-radius: 4px;

    }
  </style>
</head>

<body>
<div class="wrapper w-100">
  <div class="flex-column align-center w-100 max-w-540">
    <img src="https://static.toss.im/lotties/error-spot-no-loop-space-apng.png" width="160" height="160"></img>
    <h2 class="title">결제를 실패했어요</h2>
    <div class="response-section w-100">
      <div class="flex justify-between">
        <span class="response-label">code</span>
        <span id="error-code" class="response-text"></span>
      </div>
      <div class="flex justify-between">
        <span class="response-label">message</span>
        <span id="error-message" class="response-text"></span>
      </div>
    </div>
    <div class="w-100 button-group">
      <div class="flex" style="gap: 16px;">
        <button class="btn w-100" onclick="exe()">돌아가기</button>
      </div>
    </div>
  </div>
</div>
<script>
  function exe(){
    location.href="${pageContext.request.contextPath}/UserController?type=store";
  }
</script>

</body>
</html>