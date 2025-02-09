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
        width: 100%;
        margin: 27px 40px 40px 40px;
    }

    /*상품관리 스타일*/
    #store{
        display: inline-block;
        width: 100%;
        margin-bottom: 10px;
    }
    #store h3{
        float: left;
    }
    table {
        font-size: 13px;
        width: 100%;
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
        border: none !important;
    }

    table th, table td {
        border: 1px solid;
        padding: 12px;
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
        background-color: #503396;
        height: 36px;
        width: 100%;
        /*background-color: #bbb;*/
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
        border: 1px solid #ccc;
        background-color: #dddddd;
        color: #1e1e1e;
        font-weight: bold;
        padding: 12px;
    }

    /* 테이블 셀 스타일 */
    table td {
        padding: 12px;
        border: 1px solid #ddd; /* 테두리 색상 */
    }

    /* 입력 필드와 셀렉트 박스 스타일 */
    #title td input, #title td select, #title td textarea {
        border: 1px solid #ddd;
        border-radius: 5px;
        padding: 8px;
        width: 100%;
        height: 100%;
        text-align: center;
        transition: border-color 0.3s ease;
    }

    #title td textarea {
        border: 1px solid #ddd;
        border-radius: 5px;
        padding: 12px;
        width: 100%;
        height: 50px;
        text-align: center;
        line-height: 1.5; /* 줄간격 */
        resize: none;
    }


    #title td input:focus, #title td select:focus, #title td textarea:focus {
        border-color: #000000; /* 포커스 시 테두리 색상 변경 */
        outline: none;
    }


    img, svg {
        height: 100px;
        vertical-align: middle;
    }

</style>

<body>
<%--  헤더  --%>
<jsp:include page="../common/header.jsp"></jsp:include>
<div class="admin-contents">
    <div class="total-main">
        <div class="myPage-container">
            <%--  사이드바  --%>
            <jsp:include page="../common/adminSideBar.jsp"></jsp:include>
            <%--  메인  --%>
            <div id="main">
                <div id="title">
                    <div id="store">
                        <h3>상품관리</h3>
                        <button id="addBtn" type="button" onclick="showAddProductForm()">새 상품 추가</button>
                    </div>
                    <%-- 테이블 추가 --%>
                    <table>
                        <colgroup>
                            <col style="width: 60px;">   <!-- 상품 ID -->
                            <col style="width: 90px;">  <!-- 카테고리 -->
                            <col style="width: 220px;">  <!-- 상품명 -->
                            <col style="width: 300px;">  <!-- 상품설명 -->
                            <col style="width: 220px;">  <!-- 상품이미지 -->
                            <col style="width: 100px;">  <!-- 가격 -->
                            <col style="width: 90px;">   <!-- 재고 -->
                            <col style="width: 130px;">  <!-- 상품 상태 -->
                            <col style="width: 75px;">   <!-- 관리 -->
                        </colgroup>
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
                                    <td><textarea name="productInfo" required>${product.productInfo}</textarea></td>
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