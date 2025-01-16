<%--
  Created by IntelliJ IDEA.
  User: wjddk
  Date: 25. 1. 15.
  Time: 오후 8:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Title</title>
  </head>
  <body>
  <%--
Created by IntelliJ IDEA.
User: user
Date: 25. 1. 14.
Time: 오후 5:45
To change this template use File | Settings | File Templates.
--%>
  <%@ page contentType="text/html;charset=UTF-8" language="java" %>


  <!Doctype html>
  <html lang="en">
  <!-- head -->
  <head>
    <meta charset="UTF-8">
    <jsp:include page="./common/head.jsp"/>
  </head>
  <style>
    *{
      padding: 0;
      margin: 0;
      font-size: 14px;
    }
    h2{
      font-size: 30px;
      padding-top: 20px;
      padding-bottom: 20px;
    }
    #contents{
      width: 1100px;
      margin-right: auto;
      margin-left: auto;
      padding-left: 30px;

    }

    li{
      padding-bottom: 5px;
    }
    #wrap{
      display: flex;

    }
    /* 상단 메뉴바 Page Util */
    .page-util {
      background-color: #f8f8f8; /* 배경색 */
      border-bottom: 1px solid #ddd; / 하단 경계선 /
      /*padding: 10px 0;*/
    }
    .page-util .inner-wrap {
      max-width: 1100px;
      height: 40px;
      margin: 0 auto;
      display: flex;
      align-items: center;
      justify-content: flex-start; /* 왼쪽 정렬 */
      font-size: 14px;
      color: #333;
    }
    .page-util .location span {
      font-weight: bold;
      margin-right: 10px;
    }
    .page-util .location a {
      color: #0078ff;
      text-decoration: none;
      margin-left: 10px;
      pointer-events: none;
      cursor: default;
    }
    .page-util .location a:hover {
      text-decoration: none; /* 호버 효과 */
    }

    .sidebar{
      width: 200px;
      border-radius: 6px;
      height: 360px;
      margin-top: 15px;
      margin-right: 50px;

    }
    .sidebar>ul{
      border-right:1px solid #222222;
      border-left:1px solid #222222;
      border-radius: 6px;
    }
    .sidebar a{
      display: flex;

      padding-top: 15px;
      padding-bottom: 10px;
      text-decoration: none;
      text-indent: 20px;
      line-height: 30px;
      font-weight: bolder;

    }
    .sidebar li>a{

      font-size: 14px;
      width: 180px;
      color: #222222;
    }
    #myMega{
      border-bottom: 2px solid #222222;
      background-color: #222222;
      border-radius: 4px;
      color: #D3D3D3;
    }
    #myMega>a:hover{

      color: gray;
    }
    .sidebar li>a:hover{
      color: gray;
    }

    table{
      border-collapse: collapse;
      width: 720px;
      margin-bottom: 70px;
    }

    table td{
      border-bottom: 1px solid gray;
      border-top: 1px solid gray;
      height: 40px;
      padding-left: 20px;
    }
    .title{
      font-weight: bold;
      font-size: 15px;
      background-color: #F5F5F5;
    }
    caption{
      text-indent: -9999px;
    }
    h3{
      font-size: 19px;
      padding-top: 20px;
    }
    #main,#passwordMain{
      padding-left: 100px;
      width: 800px;
    }
    #btnDiv>button, #lastBtnDiv>button{
      width: 88px;
      height: 46px;
    }
    #btnDiv, #lastBtnDiv{
      margin-right: auto ;
      margin-left: auto;
      width: 100%;
      padding-bottom: 40px;
      text-align: right;
    }
    table .normalBtn{
      background-color: white;
      border: 1px solid gray;
      width: 120px;
      height: 30px;
      border-radius: 4px;
      margin-left: 10px;
    }
    table input{
      height: 25px;
    }
    i{
      text-indent: -9999px;
    }
    .liWrap{
      display: flex;
      border-bottom: 1px solid #222222;
    }

  </style>
  <body>
  <!-- header 영역 -->
  <jsp:include page="./common/header.jsp"/>
  <div class="page-util">
    <div class="inner-wrap">
      <div class="location">
        <span>Home</span>
<%--        <span>회원정보</span>--%>
        <span class="pageUtila">나의 무비스토리</span>
      </div>
    </div>
  </div>
  <!-- contents 영역 -->
  <div id="contents">
    <article id="wrap">


      <div class="sidebar">
        <ul>
          <div  id="myMega"><a href="MyInfo.jsp" title="나의 메가박스"><h1>나의 메가박스</h1></a></div>
          <div class="liWrap"><li><a href="Reservation.jsp" title="예매/구매내역">예매/구매내역</a></li></div>
          <div class="liWrap"> <li><a href="Admission-Ticket.jsp" title="영화/스토어 관람권">영화/스토어 관람권</a></li></div>
          <div class="liWrap">  <li><a href="Discount-Coupon.jsp" title="메가박스/제휴쿠폰">메가박스/제휴쿠폰</a></li></div>
          <div class="liWrap"> <li><a href="MemberShip.jsp" title="멤버십 포인트">멤버십 포인트</a></li></div>
          <div class="liWrap"> <li><a href="#" title="나의 무비스토리">나의 무비스토리</a></li></div>
          <div class="liWrap"> <li><a href="#" title="회원정보">회원정보</a></li></div>
        </ul>
      </div>
      <!-- 사이드 바 옆 -->
      <jsp:include page="includeMovieStory.jsp"/>
    </article>
  </div>

  <!-- footer 영역 -->
  <jsp:include page="./common/footer.jsp"/>

  <!-- script 영역 -->
  <script>
    const hiddenDiv = document.getElementById('passwordMain');
    const mainDiv = document.getElementById("main");
    function passwordMain() {
      if (hiddenDiv.style.display === 'none' || hiddenDiv.style.display === '') {
        hiddenDiv.style.display = 'block';
        mainDiv.style.display='none';
      }
    }
    function returnMain() {
      hiddenDiv.style.display = 'none'; // div 숨기기
      mainDiv.style.display='block';
    }
  </script>
  </body>
  </html>
  </body>
</html>
