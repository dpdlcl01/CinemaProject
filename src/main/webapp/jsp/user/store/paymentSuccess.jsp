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
<STYLE>
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
</STYLE>
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
            <%--    <span class="response-label">paymentKey</span>
                <span class="response-text"><%= paymentKey %></span>--%>
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
