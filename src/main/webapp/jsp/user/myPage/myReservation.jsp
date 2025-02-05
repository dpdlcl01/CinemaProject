<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.Calendar" %>
<!Doctype html>
<html lang="ko">
<head>
<jsp:include page="../common/head.jsp"/>
</head>
    <style>
        *{
            padding: 0;
            margin: 0;
        }
        .contents {
            display: grid;
            grid-template-columns: 2fr 1fr;
        }

        .content1 {
            width: 850px;
        }
        .content1 h1 {
            font-size: 24px;
            margin-bottom: 20px;
        }
        .content1 .filter {
            display: flex;
            margin-bottom: 20px;
        }
        .content1 .filter select,
        .content1 .filter button {
            padding: 5px 10px;
            margin-right: 10px;
        }
        .content1 table {
            width: 100%;
            border-collapse: collapse;
        }
        .content1 table th,
        .content1 table td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: left;
        }
        .content1 table th {
            background-color: #f4f4f4;
        }

        .content1 > .ongoinReservation {
            display: block; /* 초기 상태로 예매 내역 표시 */
        }

        .content1 > div.active {
            display: block; /* active 클래스가 추가되면 표시 */
        }

        /*25.02.06 추가 스타일*/
        #myReserv {
            display: flex;
            width: 840px;
            height: 140px;
            /*margin-bottom: 50px;*/
            align-items: center;
            border-bottom: 1px solid #eeeeee;
        }

        #myReserv>img {
            width: 70px;
            height: 100px;
        }

        #reservInfo p {
            margin: 0 30px;
            width: 640px;
        }

        #reservInfo em {
            color: #01738b;
        }

        button {
            color: #fff;
            border: none;
            border-radius: 5px;
            background-color: #503396 ;

            width: 74px;
            height: 32px;
        }

        button:hover {
            color: #fff;
            background-color: #01738b;
        }

        #notice {
            display: none;
        }

    </style>

<body>
<jsp:include page="../common/header.jsp"/>
<div class="page-util">
    <div class="inner-wrap">
        <div class="location">
            <span>Home</span>
            <img src="https://img.megabox.co.kr/static/pc/images/common/bg/bg-location-arr.png"/>
            <label>마이페이지</label>
            <img src="https://img.megabox.co.kr/static/pc/images/common/bg/bg-location-arr.png"/>
            <label>예매/구매내역</label>
        </div>
    </div>
</div>
<div class="total-main">
    <div class="contents">
        <%--  사이드바  --%>
        <jsp:include page="../common/sideBar.jsp"/>
    <div class="content1">
        <!-- Page Title -->
        <h1>예매/구매 내역</h1>
        <div class="tabs">
            <a href="${pageContext.request.contextPath}/UserController?type=myReservation" class="tab active" data-target="ongoinReservation">예매내역</a>
            <a href="${pageContext.request.contextPath}/UserController?type=myReservation&reservationType=purchaseTable" class="tab" data-target="ongoinPurchase">구매내역</a>
        </div>
        <div class = "ongoinReservation" style="display : block;">
            <div class="filter">
                <form id="reservationForm" action="UserController" method="get">
                    <input type="hidden" name="type" value="myReservation">
                    <input type="hidden" name="selectedYear" id="selectedYear">
                    <input type="hidden" name="selectedMonth" id="selectedMonth">

                    <!-- ✅ name 추가하여 선택한 타입도 함께 전송 -->
                    <select id="reservationType" name="reservationType">
                        <option value="reservationTable" <c:if test="${param.reservationType eq 'reservationTable'}">selected</c:if>>예매내역</option>
                        <option value="cancelTable" <c:if test="${param.reservationType eq 'cancelTable'}">selected</c:if>>취소내역</option>
                    </select>

                    <select id="monthSelect" name="selectedMonth">
                        ${monthOptions}
                    </select>
                    <button type="submit">조회</button>
                </form>
            </div>

            <!-- ✅ 예매내역 테이블 -->
<%--            <table id="reservationTable" class="table" style="<c:if test='${requestScope.reservationType eq "cancelTable"}'>display: none;</c:if>">--%>
<%--                <thead>--%>
<%--                <tr>--%>
<%--                    <th>예매번호</th>--%>
<%--                    <th>영화명</th>--%>
<%--                    <th>극장</th>--%>
<%--                    <th>상영일시</th>--%>
<%--                    <th>좌석</th>--%>
<%--                    <th>결제금액</th>--%>
<%--                </tr>--%>
<%--                </thead>--%>
<%--                <tbody>--%>
<%--                <c:choose>--%>
<%--                    <c:when test="${not empty requestScope.reservations}">--%>
<%--                        <c:forEach var="reservation" items="${requestScope.reservations}">--%>
<%--                            <tr>--%>
<%--                                <td>${reservation.formattedReservationIdx}</td>--%>
<%--                                <td>${reservation.movieTitle}</td>--%>
<%--                                <td>${reservation.theaterName}</td>--%>
<%--                                <td>${reservation.timetableStartTime}</td>--%>
<%--                                <td>--%>
<%--                                    <c:forEach var="seat" items="${reservation.seats}" varStatus="status">--%>
<%--                                        ${seat.seatNumber}--%>
<%--                                        <c:if test="${!status.last}">, </c:if>--%>
<%--                                    </c:forEach>--%>
<%--                                </td>--%>
<%--                                <td>--%>
<%--                                    <c:set var="totalPrice" value="0"/>--%>
<%--                                    <c:forEach var="seat" items="${reservation.seats}">--%>
<%--                                        <c:set var="totalPrice" value="${totalPrice + seat.seatPrice}"/>--%>
<%--                                    </c:forEach>--%>
<%--                                        ${totalPrice} 원--%>
<%--                                </td>--%>
<%--                            </tr>--%>
<%--                        </c:forEach>--%>
<%--                    </c:when>--%>
<%--                    <c:otherwise>--%>
<%--                        <tr>--%>
<%--                            <td colspan="6" style="text-align:center;">예매내역이 없습니다.</td>--%>
<%--                        </tr>--%>
<%--                    </c:otherwise>--%>
<%--                </c:choose>--%>
<%--                </tbody>--%>
<%--            </table>--%>

            <div>
                <c:if test="${requestScope.rvo ne null}">
                    <c:forEach items="${requestScope.rvo}" var="rvo" begin="0" end="5">
                        <div id="myReserv">
                            <img src="${rvo.moviePosterUrl}">
                            <div id="reservInfo">
                                <p>결제일시: ${rvo.reservationDate}</p>
                                <p><em>${rvo.customReservationIdx}</em><span>&nbsp;|&nbsp;${rvo.movieTitle}</span></p>
                                <p>${rvo.theaterName} ${rvo.screenName}</p>
                                <p>${rvo.timetableStartTime}</p>
                            </div>
                            <button type="button" class="reservCancel">취소</button>
                            <input type="hidden" class="reservationIdx" value="${rvo.reservationIdx}"></input>
                        </div>
                    </c:forEach>
                </c:if>
                <c:if test="${requestScope.rvo eq null}">
                    <div id="noResult">
                        예매 내역이 없습니다
                    </div>
                </c:if>
            </div>

            <!-- ✅ 취소내역 테이블 (초기에는 숨김) -->
            <table id="cancelTable" class="table" style="<c:if test='${requestScope.reservationType ne "cancelTable"}'>display: none;</c:if>">
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
        </div>
            <div class = "ongoinPurchase" style="display : none;">
        <div class="filter">
            <select name="month">
                ${monthOptions} <%-- 서버에서 완성된 <option> 리스트 출력 --%>
            </select>
            <button>조회</button>
        </div>

                <table id="purchaseTable" class="table" style="<c:if test='${requestScope.reservationType ne "purchaseTable"}'>display: none;</c:if>">
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
    </div>
    </div>
    </div>
</div>
<article id="notice" title="다이얼로그">
    <p>
        취소 시 유효기간 경과된 관람권, 쿠폰, 포인트는 복구되지 않습니다. <br/>
        예매취소 하시겠습니까?
    </p>
</article>


<footer>
    <jsp:include page="../common/footer.jsp"/>
</footer>

</body>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/ui/1.14.1/jquery-ui.js"></script>
<script>
    // 취소 버튼 클릭 이벤트
    $('.reservCancel').on('click', function () {
        let reservationIdx = $(this).siblings('.reservationIdx').val();
        // 해당 버튼과 같은 div 내의 숨겨진 input 값 가져오기 siblings 같은 부모요소를 가진 형제요소 중 클래스가 idx인 것을 선택

        $('#notice').dialog({
            modal: true,
            title: "예매 취소 확인",
            closeText: "닫기",
            buttons: {
                "확인": function () {
                    $.ajax({
                        type: "POST",
                        url: "${pageContext.request.contextPath}/UserController?type=reservationCancel", // action에 맞게 수정
                        data: { reservationIdx: reservationIdx },
                        dataType: "json",
                        success: function (response) {
                            if (response.success) {
                                alert("예매가 취소되었습니다.");
                                location.reload(); // UI 업데이트를 위해 새로고침
                            } else {
                                alert("예매 취소 실패: " + response.message);
                            }
                        },
                        error: function (xhr, status, error) {
                            alert("서버 오류 발생: " + error);
                        }
                    });

                    $(this).dialog("close");
                },
                "취소": function () {
                    $(this).dialog("close");
                }
            }
        });
    });




    document.addEventListener("DOMContentLoaded", function () {
      let reservationType = document.getElementById("reservationType").value;

      // ✅ 페이지 로드 후, 선택한 타입에 따라 테이블 표시
      if (reservationType === "reservationTable") {
        document.getElementById("reservationTable").style.display = "table";
        document.getElementById("cancelTable").style.display = "none";
      } else if (reservationType === "cancelTable") {
        document.getElementById("reservationTable").style.display = "none";
        document.getElementById("cancelTable").style.display = "table";
      }
    });

    document.getElementById("reservationForm").addEventListener("submit", function (event) {
      event.preventDefault();

      let selectedValue = document.getElementById("monthSelect").value;
      let parts = selectedValue.split("-");
      document.getElementById("selectedYear").value = parts[0];
      document.getElementById("selectedMonth").value = parts[1];

      let selectedType = document.getElementById("reservationType").value;
      let hiddenTypeInput = document.getElementById("hiddenReservationType");

      if (!hiddenTypeInput) {
        hiddenTypeInput = document.createElement("input");
        hiddenTypeInput.setAttribute("type", "hidden");
        hiddenTypeInput.setAttribute("name", "reservationType");
        hiddenTypeInput.setAttribute("id", "hiddenReservationType");
        this.appendChild(hiddenTypeInput);
      }
      hiddenTypeInput.value = selectedType;

      console.log("Submitting with:", {
        selectedYear: parts[0],
        selectedMonth: parts[1],
        reservationType: selectedType
      });

      this.submit();
    });
</script>
</html>
