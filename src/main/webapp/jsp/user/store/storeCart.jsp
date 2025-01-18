<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 25. 1. 16.
  Time: 오전 11:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!Doctype html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>Title</title>
  <style>
    *{
      padding: 0px;
      margin: 0px;
    }
    #contents{
      margin: 50px auto;
      width: 1100px;
      min-height: 550px;


    }
    caption{
      text-indent: -9999px;
    }
    #null{

      border-top: 2px solid #666666;
      border-bottom: 2px solid #666666;
      text-align: center;
      height: 300px;
      padding: 110px;
      box-sizing: border-box;
      margin-bottom: 30px;
    }
    #null>p{
      font-weight: 600;
      font-size: 25px;
    }
    #null>button{
      margin-top: 10px;
      width: 300px;
      height: 50px;
      border-radius: 6px;
      background-color: #666666;
      border: 1px solid #666666;
      font-size: 20px;
      font-weight: 600;
      color: white;
    }
    h1{
      margin-bottom: 30px;
    }
    #main>table{
      border-collapse: collapse;
      border-top: 2px solid black;
      border-bottom: 1px solid #666666;
    }
    #main>table>thead{
      height: 40px;
      background-color: #eeeeee;
      border-bottom: 1px solid #D3D3D3;
    }
    #main>table span{
      display: flex;
      height: 120px;
      width: 120px;
      margin: 0 30px;
    }
    #main>table td{
      vertical-align: middle;
      text-align: center;
      font-weight: 600;
      height: 160px;
      align-items: center;
    }

    #quant{
      width: 40px;
      height: 30px;
      font-size: 20px;
      text-align: center;
    }
    #changeQuantBtn, #buyBtn{
      border: 1px solid #666666;
      background-color: white;
      width: 60px;
      height: 33px;
      border-radius: 2px;
    }
    #firstTd{
      display: flex;
    }
    #firstTd input{
      margin-left: 60px;
      display: flex;
    }
    #p{
      text-align: right;
      font-weight: 600;
    }
    #totalPrice{
      margin-top: 30px;
      text-align: center;
    }
    #totalPrice>button{
      margin: 50px 0;
      width: 200px;
      height: 50px;
      font-weight: 600;
      font-size: 20px;
      background-color: #222222;
      border-radius: 8px;
      color: white;
    }
  </style>
</head>
<!-- head -->
<head>
  <jsp:include page="../common/head.jsp"/>
</head>

<body>
<!-- header 영역 -->
<jsp:include page="../common/header.jsp"/>
<div class="page-util">
  <div class="inner-wrap">
    <div class="location">
      <span>Home</span>
      <span>스토어</span>
      <span>장바구니</span>
    </div>
  </div>
</div>
<!-- contents 영역 -->
<div id="contents">
  <h1>장바구니</h1>
  <div id="null">
    <p>장바구니에 담긴 상품이 없습니다.</p>
    <button type="button">쇼핑 계속하기</button>
  </div>

  <div id="main">
    <table>
      <caption>장바구니</caption>
      <colgroup>
        <col width="404px">
        <col width="155px">
        <col width="206px">
        <col width="148px">
        <col width="167px">
      </colgroup>
      <thead>
      <th><input type="checkbox"> 상품명</th>
      <th>판매금액</th>
      <th>수량</th>
      <th>구매금액</th>
      <th>선택</th>
      </thead>
      <!--여기는 장바구니에 담은 상품이 있을 때 보여주자-->
      <tr>
        <td id="firstTd"><input type="checkbox"><span><img src=""> </span>멋진 굿즈</td>
        <td>11000원</td>
        <td>
          <form action="changeQuant.jsp" method="post">
            <input type="number" name="quant" id="quant"
                   value="0" min="0"/>
            <button type="submit" id="changeQuantBtn">변경</button>
          </form>
        </td>
        <td>판매금액*수량</td>
        <td><button type="button" id="buyBtn">구매하기</button> </td>
      </tr>
    </table>
    <p id="p">장바구니에 보관된 상품은 최대 30일까지 보관됩니다.</p>
    <div id="totalPrice">
      <h1>총 결제금액</h1>
      <h2>10000원</h2>
      <button type="button">구매하기</button>
    </div>


  </div>

</div>

<!-- footer 영역 -->
<jsp:include page="../common/footer.jsp"/>

<!-- script 영역 -->
<script>

</script>
</body>
</html>
