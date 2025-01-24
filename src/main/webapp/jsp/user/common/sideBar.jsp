<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 25. 1. 24.
  Time: 오전 11:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
  <title>Title</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/myInfo.css">
</head>
<body>
<div class="sidebar">
  <ul>
    <div class="sidebar-title"><a href="MyInfo.jsp" title="나의 메가박스">나의 메가박스</a></div>
    <div class="liWrap"><li><a href="MyReservation.jsp" title="예매/구매내역">예매/구매내역</a></li></div>
    <div class="liWrap"><li><a href="Admission-Ticket.jsp" title="영화/스토어 관람권">영화/스토어 관람권</a></li></div>
    <div class="liWrap"><li><a href="${pageContext.request.contextPath}/UserController?type=myCoupon" title="메가박스/제휴쿠폰">메가박스/제휴쿠폰</a></li></div>
    <div class="liWrap"><li><a href="${pageContext.request.contextPath}/UserController?type=myPoint" title="멤버십 포인트">멤버십 포인트</a></li></div>
    <div class="liWrap"><li><a href="#" title="나의 무비스토리">나의 무비스토리</a></li></div>
    <div class="liWrap"><li><a href="myInfoMain.jsp" title="회원정보">회원정보</a></li></div>
  </ul>
</div>
</body>
</html>
