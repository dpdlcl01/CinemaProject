<%--
  Created by IntelliJ IDEA.
  User: ham
  Date: 2025. 1. 13.
  Time: 오후 5:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>좌석 선택</title>
  <link rel="stylesheet" href="css/user/seat.css">
</head>
<body>
<jsp:include page="header.jsp"/>
<div class="seat-selection-page">
  <header>
    <h1>좌석 선택</h1>
  </header>
  <div class="seat-selection">
    <div class="header">
      <label>성인</label>
      <button>-</button>
      <input type="number" value="0" readonly>
      <button>+</button>
      <label>청소년</label>
      <button>-</button>
      <input type="number" value="0" readonly>
      <button>+</button>
    </div>
    <div class="seat-container">
      <div class="screen">SCREEN</div>
      <div class="rows">
        <div class="row" data-row="A">
          <button>1</button>
          <button>2</button>
          <button>3</button>
          <button>4</button>
          <button>5</button>
          <button>6</button>
          <button class="selected">7</button>
          <button>8</button>
        </div>
        <div class="row" data-row="B">
          <button>1</button>
          <button>2</button>
          <button>3</button>
          <button class="disabled">X</button>
          <button>5</button>
          <button>6</button>
          <button>7</button>
          <button>8</button>
        </div>
        <div class="row" data-row="C">
          <button>1</button>
          <button>2</button>
          <button class="disabled">X</button>
          <button>4</button>
          <button>5</button>
          <button>6</button>
          <button>7</button>
          <button>8</button>
        </div>
      </div>
    </div>
    <div class="summary">
      <h3>선택 정보</h3>
      <ul>
        <li>선택 좌석: <span>A7</span></li>
        <li>총 결제 금액: <span>20,000원</span></li>
      </ul>
      <button onclick="alert('예매 완료')">결제하기</button>
    </div>
  </div>
  <jsp:include page="footer.jsp"/>
</div>
</body>
</html>