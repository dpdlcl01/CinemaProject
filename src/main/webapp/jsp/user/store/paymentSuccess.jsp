<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 25. 1. 28.
  Time: 오전 12:24
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
    <title>토스페이먼츠 결제 성공</title>
</head>

<body>
<%
    // URL 쿼리스트링에서 결제 정보를 가져오기
    String amount = request.getParameter("amount"); // 결제 금액
    String orderId = request.getParameter("orderId"); // 주문 ID
    String paymentKey = request.getParameter("paymentKey"); // 토스페이먼츠 결제 키
%>

<div class="wrapper w-100">
    <div class="flex-column align-center confirm-success w-100 max-w-540">
        <img src="https://static.toss.im/illusts/check-blue-spot-ending-frame.png" width="120" height="120"></img>
        <h2 class="title">🎉 결제를 완료했어요 🎉</h2>

        <div class="response-section w-100">
            <div class="flex justify-between">
                <span class="response-label">결제 금액</span>
                <span class="response-text"><%= amount %> 원</span>
            </div>
            <div class="flex justify-between">
                <span class="response-label">주문번호</span>
                <span class="response-text"><%= orderId %></span>
            </div>
            <div class="flex justify-between">
                <span class="response-label">paymentKey</span>
                <span class="response-text"><%= paymentKey %></span>
            </div>
        </div>

        <div class="w-100 button-group">
            <div class="flex" style="gap: 16px;">
                <a class="btn w-100" href="https://developers.tosspayments.com/sandbox">다시 테스트하기</a>
                <a class="btn w-100" href="https://docs.tosspayments.com/guides/v2/payment-widget/integration" target="_blank" rel="noreferrer noopener">결제 연동 문서가기</a>
            </div>
        </div>
    </div>
</div>
</body>
</html>

