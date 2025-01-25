<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/paymentAPI.css">
  <script src="https://js.tosspayments.com/v1/payment-widget"></script>
  <title>결제위젯 샘플</title>
  <style>

  </style>
</head>
<body>
<div class="wrapper w-100">
  <div class="max-w-540 w-100">
    <div id="payment-method" class="w-100"></div>
    <div id="agreement" class="w-100"></div>
    <div class="btn-wrapper w-100">
      <button id="payment-request-button" class="btn primary w-100">결제하기</button>
    </div>
  </div>
</div>
<script type="module" src="${pageContext.request.contextPath}/js/paymentAPI.js"></script>

</body>
</html>
