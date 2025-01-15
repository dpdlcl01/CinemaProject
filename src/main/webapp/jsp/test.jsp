<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
  <style>
    body {
      font-family: Arial, sans-serif;
    }
    .menu {
      width: 250px;
      border: 1px solid #ccc;
    }
    .menu-header {
      background-color: #333;
      color: white;
      padding: 10px;
      font-weight: bold;
    }
    .menu-item {
      padding: 10px;
      border-bottom: 1px solid #eee;
    }
    .submenu-item {
      padding-left: 20px;
      font-size: 0.9em;
      color: #555;
    }
  </style>
</head>
<body>
<div class="menu">
  <div class="menu-header">나의 메가박스</div>
  <div class="menu-item">예매/구매내역</div>
  <div class="menu-item">영화/스토어 관람권
    <div class="submenu-item">영화관람권</div>
    <div class="submenu-item">스토어 교환권</div>
  </div>
  <div class="menu-item">메가박스/제휴쿠폰</div>
  <div class="menu-item">멤버십 포인트
    <div class="submenu-item">포인트 이용내역</div>
    <div class="submenu-item">멤버십 카드관리</div>
    <div class="submenu-item">MiL.k 포인트</div>
  </div>
  <div class="menu-item">나의 무비스토리</div>
  <div class="menu-item">나의 이벤트 응모내역</div>
  <div class="menu-item">나의 문의내역</div>
  <div class="menu-item">중앙페이 결제수단 관리</div>
  <div class="menu-item">자주쓰는 카드 관리</div>
  <div class="menu-item">회원정보
    <div class="submenu-item">개인정보 수정</div>
    <div class="submenu-item">선택정보 수정</div>
  </div>
</div>
</body>
</html>
