<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 25. 1. 13.
  Time: 오후 10:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <jsp:include page="./common/head.jsp"/>
    <title>Title</title>
    <style>
      *{
        margin: 0;
        padding: 0;
        font-size: 15px;
      }

      #contents{
        width: 1100px;
        margin-right: auto;
        margin-left: auto;
        margin-top: 50px;
        margin-bottom: 50px;
      }
      #contents>h1{
        width: 1100px;
        margin-left: auto;
        margin-right: auto;
        font-size: 32px;
      }
      #contents>#category{
        color: dimgray;
        width: 1100px;
        margin-left: auto;
        margin-right: auto;
        padding-top: 20px;
        padding-bottom: 20px;
      }

      #wrap {
        display: flex;
        flex-direction: column;
        align-items: center;
        width: 100%;
        margin: 0 auto;
        padding: 0 20px;

      }

      img{
        width: 280px; /* 이미지의 너비 */
        height: 330px; /* 이미지의 높이 */
        object-fit: cover; /* 비율 유지하며 크기 맞추기 */
        border-right: 1px solid gray;

      }
      #center{
        border-top: 1px solid black;
        border-bottom: 1px solid black;
        display: flex;
        width: 1100px;
      }
      .info{
        display: flex;
        padding-top: 10px;
      }
      #info>.info a{
        color: #01738b;
      }
      .red{
        color: red;
      }
      .gray{
        color: gray;
      }
      .front{

        width: 120px;
        height: 40px;
        padding-left: 10px;
        padding-right: 10px;

      }
      #btnDiv{
        display: flex;
      }
      #present{
        display: flex;
        border: 1px solid #503396;
        color: black;
        width: 284px;
        height: 46px;
        text-decoration:none;
        align-items: center; /* 세로 중앙 정렬 */
        justify-content: center;
        margin: 10px;

      }
      #buy{
        display: flex;
        border: 1px solid #503396;
        background-color: #503396;
        color: gainsboro;
        width: 284px;
        height: 46px;
        text-decoration:none;
        align-items: center; /* 세로 중앙 정렬 */
        justify-content: center;
        margin: 10px;
      }
      .inputBt{
        width: 32px;
        height: 32px;
      }
      input{
        width: 30px;
        height: 30px;
        text-align: center;
      }
      #price{
        display: flex;
        margin-top: 20px;
      }
      .btn{
        width: 1000px;
        height: 39px;
        background-color: white;
        margin-top: 50px;
        border: 1px solid lightgray;
        border-radius: 8px;
      }

    </style>
  </head>
  <body>
  <header>
    <jsp:include page="./common/header.jsp"></jsp:include>
  </header>

  <div class="page-util">
    <div class="inner-wrap">
      <div class="location">
        <span>Home</span>
        <a href="/booking" title="예매 페이지로 이동">스토어</a>
        <a href="/booking" title="빠른예매 페이지로 이동" class="pageUtila">상세보기</a>
      </div>
    </div>
  </div>
  <div id="contents">


    <h1>일반관람권</h1>
    <div id="category">카테고리</div>
    <div id="wrap">


      <article id="center">
        <img src="../../img/m3.png">
        <article id="info">
          <div class="info">
            <p class="front">사용극장</p>
            <article>
              <a href="#">사용가능극장</a>
              <p class="red">※일부 특별관 및 특별석은 차액지불과 상관없이 이용 불가합니다.</p>
            </article>
          </div>
          <div class="info">
            <p class="front">유효기간</p>
            <article>
              <p>구매일로부터 24개월 이내 사용 가능</p>
              <p class="gray">예매 가능 유효기간은 구매일로부터 2년입니다.</p>
            </article>
          </div>
          <div class="info">
            <p class="front">판매수량</p>
            <p>1회 8개 구매가능</p>
          </div>
          <div class="info">
            <p class="front">구매 후 취소</p>
            <p>구매일로부터 10일 이내 취소 가능하며, 부분취소는 불가능합니다.</p>
          </div>
          <hr>
          <article id="price">
            <p class="front">수량/금액</p>
            <div id="bt">
              <button type="button" class="inputBt">-</button>
              <input type="text" value="1" readonly/>
              <button type="button" class="inputBt">+</button>
              <em>13000</em>
              <span>원</span>
            </div>

          </article>
          <div id="btnDiv">
            <a href="#" id="present">선물</a>
            <a href="#" id="buy">구매</a>
          </div>

        </article>

      </article>
      <button class="btn">구매 후 취소</button>
      <button class="btn">상품이용안내</button>
    </div>
  </div>
  <footer>
    <jsp:include page="./common/footer.jsp"></jsp:include>
  </footer>
  </body>
</html>
