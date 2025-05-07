<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<table id="purchaseTable" class="table">
    <thead>
    <tr>
        <th>구매일시</th>
        <th>상품명</th>
        <th>구매금액</th>
    </tr>
    </thead>
    <tbody>
    <c:choose>
        <c:when test="${not empty requestScope.purchases}">
            <c:forEach var="purchase" items="${requestScope.purchases}">
                <tr>
                    <td>${purchase.purchaseDate}</td>
                    <td>${purchase.productName}</td>
                    <td>${purchase.purchaseAmount} 원</td>
                </tr>
            </c:forEach>
        </c:when>
        <c:otherwise>
            <tr>
                <td colspan="3" style="text-align:center;">구매내역이 없습니다.</td>
            </tr>
        </c:otherwise>
    </c:choose>
    </tbody>
</table>