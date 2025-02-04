<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!Doctype html>
<html lang="ko">
<head>
<%--  <jsp:include page="../../user/common/head.jsp"/>--%>

</head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/common.css">

<style>

   .admin-contents {
     width: 100%;
     min-height: 550px;
   }
  .page-util .inner-wrap {
    max-width: 100%; !important;
    padding: 20px 20px; !important;
  }

  #h2 h2{
    width: 760px;
  }
  #h2 button{
    height:32px ;
    width: 74px;
    border: none;
    background-color: white;
  }
  .top2 span{
    font-size: 14px;
  }

  .myPage-container{
    display: flex;
  }
  #contents{
    margin-left: auto;
    margin-right: auto;
    width: 1100px;
  }
  #main{
    margin: 50px 0 50px 50px;
  }

  /*상품관리 스타일*/
  #store{
    display: inline-block;
    width: 1400px;
    margin-bottom: 10px;
  }
  #store h3{
    float: left;
  }
  table {
    width: 1400px;
    text-align: center;
  }

  table th {
    background-color: #ddd;
    color: white;
    font-weight: bold;
  }

  #title td input, select {
    border: none;
    text-align: center;
  }

  /*상품번호*/
  #title table td:nth-of-type(1) {
    width: 70px;
  }

  #title table td:nth-of-type(1) input {
    width: 100%;
  }
  /*카테고리*/
  #title table td:nth-of-type(2) {
    width: 100px;
  }

  #title table td:nth-of-type(2) input {
    width: 100%;
  }

  /* 상품이미지 열 */
  #title table td:nth-of-type(3) {
    width: 220px; /* 원하는 width 값으로 수정 */
  }

  #title table td:nth-of-type(3) input {
    width: 100%; /* input 요소가 td의 너비를 채우도록 설정 */
  }

  /* 상품설명 */
   #title table td:nth-of-type(4) {
     width: 300px;
   }

   #title table td:nth-of-type(4) input {
     width: 100%;
   }

   /* 상품명(이미지) */
   #title table td:nth-of-type(5) {
     width: 150px;
   }

   #title table td:nth-of-type(5) input {
     margin-top: 5px;
     width: 100%;
   }


  /* 가격 열 */
  #title table td:nth-of-type(6) {
    width: 100px; /* 원하는 width 값으로 수정 */
  }

  #title table td:nth-of-type(6) input {
    width: 100%; /* input 요소가 td의 너비를 채우도록 설정 */
  }


  /* 재고 열 */
  #title table td:nth-of-type(7) {
    width: 90px; /* 원하는 width 값으로 수정 */
  }

  #title table td:nth-of-type(7) input {
    width: 100%; /* input 요소가 td의 너비를 채우도록 설정 */
  }

  /* 상품 상태 */
  #title table td:nth-of-type(8) {
    width: 130px; /* 원하는 width 값으로 수정 */
  }

  #title table td:nth-of-type(8) input {
    width: 100%;
  }

  #title table td:nth-of-type(9) {
    width: 75px;
  }

  #title table td:nth-of-type(9) input {
    width: 100%;
  }



  #addProductDialog table {
    width: 100%;
    max-width: 100%;
    border-collapse: collapse; /* 테두리가 겹치지 않도록 설정 */
  }

  #addProductDialog td, #addProductDialog th {
    box-sizing: border-box; /* 테두리를 포함한 너비 계산 */
    padding: 8px;
  }

  /* 닫기 버튼 */
  .close {
    color: #aaa;
    float: right;
    font-size: 28px;
    font-weight: bold;
    cursor: pointer;
  }

  .close:hover,
  .close:focus {
    color: black;
    text-decoration: none;
  }

  #addProductDialog td[colspan="2"] {
    text-align: right;
    border: none !important; /* !important 추가 */
  }

  table th, table td {
    border: 1px solid;
    padding: 12px;
  }

  #title td input, #title td select {
    border: 1px solid #ddd;
    border-radius: 5px;
    padding: 8px;
    width: 100%;
    text-align: center;
    transition: border-color 0.3s ease;
  }

  #addBtn {
    background-color: #503396;
    float: right;
    color: white;
    border: none;
    padding: 10px 20px;
    border-radius: 5px;
    text-align: right;
    cursor: pointer;
    transition: background-color 0.3s ease;
    margin-bottom: 10px;
  }

  button[type="submit"] {
    /*background-color: #503396;*/
    background-color: #bbb;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s ease;
  }

  /* 모달 스타일 */
  .dialog {
    display: none;
    position: fixed;
    z-index: 1000;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    overflow: auto;
    background-color: rgba(0, 0, 0, 0.5);
  }

  .dialogContent {
    background-color: #fff;
    margin: 10% auto;
    padding: 20px;
    border: none;
    width: 50%;
    max-width: 600px;
    border-radius: 10px;
    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
  }

  table tbody tr:nth-child(odd) {
    background-color: #ffffff; /* 홀수 행: 흰색 */
  }

  table tbody tr:nth-child(even) {
    background-color: #f9f9f9; /* 짝수 행: 연한 회색 */
  }

  /* 테이블 호버 효과 */
  table tbody tr:hover {
    background-color: #f1f1f1;
    transition: background-color 0.3s ease; /* 부드러운 전환 효과 */
  }

  /* 테이블 헤더 스타일 */
  table th {
    /*background-color: #503396; !* 헤더 배경색 *!*/
    background-color: #dddddd; /* 헤더 배경색 */
    color: white; /* 헤더 텍스트 색상 */
    font-weight: bold;
    padding: 12px;
  }

  /* 테이블 셀 스타일 */
  table td {
    padding: 12px;
    border: 1px solid #ddd; /* 테두리 색상 */
  }

  /* 입력 필드와 셀렉트 박스 스타일 */
  #title td input, #title td select {
    border: 1px solid #ddd;
    border-radius: 5px;
    padding: 8px;
    width: 100%;
    text-align: center;
    transition: border-color 0.3s ease;
  }

  #title td input:focus, #title td select:focus {
    border-color: #503396; /* 포커스 시 테두리 색상 변경 */
    outline: none;
  }

   img, svg {
     height: 100px;
     vertical-align: middle;
   }

</style>

<body>
<header>
  <div class="page-util">
    <div class="inner-wrap" style="display: flex; justify-content: space-between; align-items: center;">
      <!-- 홍길동 관리자님 위치 -->
      <div class="location" style="flex-grow: 1;">
<%--        <span>홍길동 관리자님</span>--%>
        <span>${sessionScope.adminvo.adminId} 관리자님</span>
      </div>
      <!-- 로그인/로그아웃 버튼 -->
      <div style="display: flex; gap: 10px; flex-shrink: 0;">
        <c:choose>
          <c:when test="${not empty sessionScope.adminvo}">
            <a href="#" id="member-logout-btn" title="로그아웃">로그아웃</a>
          </c:when>
          <c:otherwise>
            <!-- 세션에 uservo가 없으면 로그인 버튼 -->
            <a href="#" id="member-login-btn" title="로그인" data-bs-toggle="modal" data-bs-target="#AdminLoginModal">로그인</a>
            <a href="${pageContext.request.contextPath}/UserController?type=register" title="회원가입">회원가입</a>
          </c:otherwise>
        </c:choose>
      </div>
    </div>
  </div>
</header>
<div class="admin-contents">
  <div class="total-main">
    <div class="myPage-container">
      <%--  사이드바  --%>
      <jsp:include page="../common/adminSideBar.jsp"></jsp:include>
      <%--  메인  --%>

      <div id="main">
<%--        <h1>관리자 정보</h1>--%>
        <div id="title">
          <div id="store">
            <h3>상품관리</h3>
            <button id="addBtn" type="button" onclick="showAddProductForm()">새 상품 추가</button>
          </div>
          <%-- 테이블 추가 --%>
          <table>
            <thead>
            <tr>
              <th>상품ID</th>
              <th>카테고리</th>
              <th>상품명</th>
              <th>상품설명</th>
              <th>상품이미지</th>
              <th>가격</th>
              <th>재고</th>
              <th>상품상태</th>
              <th>관리</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="product" items="${product}">
              <tr>
                <form action="AdminController?type=productUpdate" method="post">
                  <td><input type="text" name="productIdx" value="${product.productIdx}" readonly /></td>
                  <td>
                    <select name="productCategory">
                      <option value="1" ${product.productCategory == 1 ? 'selected':''}>굿즈</option>
                      <option value="2" ${product.productCategory == 2 ? 'selected':''}>스낵</option>
                    </select>
                  </td>
                  <td><input type="text" name="productName" value="${product.productName}" required /></td>
                  <td><input type="text" name="productInfo" value="${product.productInfo}" required /></td>
                  <td>
                    <img src="${pageContext.request.contextPath}/css/user/images/KangImg/${product.productImg}">
                    <input type="text" name="productImg" value="${product.productImg}" required />
                  </td>
                  <td><input type="number" name="productPrice" value="${product.productPrice}" required /></td>
                  <td><input type="number" name="productStock" value="${product.productStock}" required /></td>
                  <td>
                    <select name="productStatus">
                      <option value="0" ${product.productStatus == 0 ? 'selected' :''}>판매중</option>
                      <option value="1" ${product.productStatus == 1 ? 'selected' :''}>품절</option>
                      <option value="2" ${product.productStatus == 2 ? 'selected' :''}>판매종료</option>
                    </select>
                  </td>
                  <td><button type="submit">수정</button></td>
                </form>
              </tr>
            </c:forEach>
            </tbody>
          </table>




          <!-- 상품 추가 다이얼로그 -->
          <div id="addProductDialog" class="dialog" style="display:none;">
            <div class="dialogContent">
              <span class="close" onclick="closeAddProductDialog()">&times;</span>
              <h3>새 상품 추가</h3>
              <form action="AdminController?type=productAdd" method="post">
                <table>
                  <tr>
                    <td>카테고리:</td>
                    <td>
                      <select name="productCategory">
                        <option value="1">굿즈</option>
                        <option value="2">스낵</option>
                      </select>
                    </td>
                  </tr>
                  <tr>
                    <td>상품 이름:</td>
                    <td><input type="text" name="productName" required /></td>
                  </tr>
                  <tr>
                    <td>상품 설명:</td>
                    <td><input type="text" name="productInfo" /></td>
                  </tr>
                  <tr>
                    <td>가격:</td>
                    <td><input type="number" name="productPrice" required /></td>
                  </tr>
                  <tr>
                    <td>재고:</td>
                    <td><input type="number" name="productStock" required /></td>
                  </tr>
                  <tr>
                    <td>상품 이미지:</td>
                    <td><input type="text" name="productImg"/></td>
                  </tr>
                  <tr>
                    <td>상품 상태:</td>
                    <td>
                      <select name="productStatus">
                        <option value="0">판매중</option>
                        <option value="1">품절</option>
                        <option value="2">판매종료</option>
                      </select>
                    </td>
                  </tr>
                  <tr>
                    <td colspan="2"><button type="submit">상품 추가</button></td>
                  </tr>
                </table>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<a href="#" id="member-login-btn" title="로그인" data-bs-toggle="modal" data-bs-target="#AdminLoginModal" style="display: none;">어드민로그인</a>
<jsp:include page="../login/adminLoginModal.jsp"/>

<%--<jsp:include page="../../user/common/footer.jsp"/>--%>

<script>
  // 상품 추가 다이얼로그 열기
  function showAddProductForm() {
    console.log('Add Product Form is displayed');
    var dialog = document.getElementById('addProductDialog');
    dialog.style.display = 'block';
  }

  // 상품 추가 다이얼로그 닫기
  function closeAddProductDialog() {
    var dialog = document.getElementById('addProductDialog');
    dialog.style.display = 'none';
  }

</script>
</body>
</html>