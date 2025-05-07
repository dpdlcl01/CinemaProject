<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<table id="cancelTable" class="table">
    <thead>
    <tr>
        <th>취소일시</th>
        <th>영화명</th>
        <th>극장</th>
        <th>상영일시</th>
        <th>취소금액</th>
    </tr>
    </thead>
    <tbody>
    <c:choose>
        <c:when test="${not empty requestScope.reservations}">
            <c:forEach var="reservation" items="${requestScope.reservations}">
                <tr>
                    <td>${reservation.reservationDate}</td>
                    <td>${reservation.movieTitle}</td>
                    <td>${reservation.theaterName}</td>
                    <td>${reservation.timetableStartTime}</td>
                    <td>
                        <c:set var="totalPrice" value="0"/>
                        <c:forEach var="seat" items="${reservation.seats}">
                            <c:set var="totalPrice" value="${totalPrice + seat.seatPrice}"/>
                        </c:forEach>
                            ${totalPrice} 원
                    </td>
                </tr>
            </c:forEach>
        </c:when>
        <c:otherwise>
            <tr>
                <td colspan="5" style="text-align:center;">취소내역이 없습니다.</td>
            </tr>
        </c:otherwise>
    </c:choose>
    </tbody>
</table>
