<<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!Doctype html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
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

    .quant{
      width: 40px;
      height: 33px;
      border: 1px solid #ddd;
      border-radius: 5px;
      text-align: center;
    }
    #changeQuantBtn, .buyBtn ,#delBtn{
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
    tr{
      border-bottom: 1px solid lightgrey;
    }

    #main button{
      border-radius: 5px;
      border: 1px solid #339eb2;
      background-color: #339eb2;
      color: #fff;
    }
    #main button:hover{
      background-color: #1e7f9a;
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
      <img src="https://img.megabox.co.kr/static/pc/images/common/bg/bg-location-arr.png"/>
      <label>스토어</label>
      <img src="https://img.megabox.co.kr/static/pc/images/common/bg/bg-location-arr.png"/>
      <label>장바구니</label>
    </div>
  </div>
</div>
<!-- contents 영역 -->

<div class="contents">
  <h1>장바구니</h1>
  <c:set var="cvo" value="${requestScope.cvo}"/>
  <c:if test="${cvo eq null}">
  <div id="null">
    <p>장바구니에 담긴 상품이 없습니다.</p>
    <button type="button">쇼핑 계속하기</button>
  </div>
  </c:if>
<c:if test="${cvo ne null}">



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
      <th>상품명</th>
      <th>판매금액</th>
      <th>수량</th>
      <th>구매금액</th>
      <th>선택</th>
      </thead>
      <!--여기는 장바구니에 담은 상품이 있을 때 보여주자-->
      <c:forEach items="${requestScope.cvo}" var="ar">
      <tr>
        <td id="firstTd"><span><img src="${pageContext.request.contextPath}/css/user/images/KangImg/${ar.productImg}"> </span>${ar.productName}</td>
        <td><em class="productPrice">${ar.productPrice}</em><em>원</em></td>
        <td>
          <form action="${pageContext.request.contextPath}/UserController?type=gocart" method="post">
            <input type="number" name="productQuant" class="quant"
                   value="${ar.total_quant}" min="1" max="10" oninput="updateQuant()"/>
            <input type="hidden" id="pIdx" name="pIdx" value="${ar.productIdx}">
            <input type="hidden" id="path"  class=path name="path" value="1">
            <input type="hidden" name="productImg" id="productImg" value="${ar.productImg}" >
            <input type="hidden" name="productName" id="productName" value="${ar.productName}">
            <input type="hidden" name="productPrice" id="productPrice" value="${ar.productPrice*ar.total_quant}">
            <input type="hidden" name="productCategory" id="productCategory" value="${ar.productCategory}">
            <button type="submit" id="changeQuantBtn" >변경</button>
          </form>
        </td>
        <c:set var="buyPrice" value="${ar.productPrice*ar.total_quant}"/>
        <td><em class="priceEm">${buyPrice}</em><em>원</em></td>
        <td>
          <button type="button"  class="buyBtn" >구매</button>
          <button type="button" id="delBtn" class="delBtn">삭제</button>
        </td>
      </tr>
      </c:forEach>
    </table>
    <p id="p">장바구니에 보관된 상품은 최대 30일까지 보관됩니다.</p>
    <%--<div id="totalPrice">
      <h1>총 결제금액</h1>
      <h2>10000원</h2>
      <button type="button">구매하기</button>
    </div>--%>
</c:if>



  </div>

</div>
<%--del 버튼 누르면 idx값만 가져가서 delete문 부르면 끝--%>
<%--체크박스 누르면 아래 가격 값 바꾸고 구매하기로 넘기자 여러 값 넘겨야함 (구현할지 물어보기)--%>

<!-- footer 영역 -->
<jsp:include page="../common/footer.jsp"/>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- script 영역 -->
<script>
  $(document).ready(function() {
    $(".delBtn").on("click", function () {
      /*여기에서 할 일 해당 idx값으로 검색해서 delete문을 호출해서 수행하고 다시 돌아오자*/
      /*0번째 폼의 액션이 해당 jsp로 다시 돌아오니까 재활용하자*/
      /*패스의 밸류를 바꿔서 던지자*/
      let row = $(this).closest("tr");
      let form = row.find("form");

      row.find(".path").val(2);

      form.submit();
    });

    $(document).on("click", ".buyBtn", function() {
      let pIdx=document.getElementById("pIdx").innerHTML.trim();
      let row = $(this).closest("tr"); // 현재 버튼이 속한 tr 찾기
      let form = row.find("form"); // 해당 tr 내부의 form 가져오기
      let price = row.find(".priceEm").text();
      row.find("#productPrice").val(price);

      form.attr("action", "${pageContext.request.contextPath}/UserController?type=payment");
      form.submit(); // 해당 form만 제출
    });

    // 수량 변경 시 가격 자동 업데이트
    $(".quant").on("input", function() {
      let price = parseInt($(this).closest("tr").find(".productPrice").text(), 10);/*현재 인풋에 가장 가까운 tr 요소를 찾고 그안에서 프로덕트프라이스 클래스를 가진 요소를 찾아서 문자열을 받아서 10진수로 변환*/
      let quantity = $(this).val(); /*현재 개수 값*/
      let totalPrice = price * quantity;

      $(this).closest("tr").find(".priceEm").text(totalPrice); // 해당 행의 가격 업데이트
    });


  });
</script>
</body>
</html>
