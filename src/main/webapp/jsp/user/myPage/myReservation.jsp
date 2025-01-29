<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.Calendar" %>
<!Doctype html>
<html lang="ko">
<head>
<jsp:include page="../common/head.jsp"/>
    <style>
        *{
            padding: 0;
            margin: 0;
        }
        .contents {
            width: 1100px;
            display: flex;
            margin-left: auto;
            margin-right: auto;
            min-height: 590px;
            margin-bottom: 20px;
        }

        .content1 {
            width: 70%;
            flex-grow: 1;
            padding: 20px;
            box-sizing: border-box;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            margin-bottom: 50px;
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
    </style>
</head>
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
<div>
    <div class="contents">
        <%--  사이드바  --%>
        <jsp:include page="../common/sideBar.jsp"/>
    <div class="content1">
        <!-- Page Title -->
        <h1>예매/구매 내역</h1>
        <div class="tabs">
            <div class="tab active" data-target="ongoinReservation">예매내역</div>
            <div class="tab" data-target="ongoinPurchase">구매내역</div>
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
            <table id="reservationTable" class="table" style="<c:if test='${reservationType eq "cancelTable"}'>display: none;</c:if>">
                <thead>
                <tr>
                    <th>예매번호</th>
                    <th>영화명</th>
                    <th>극장</th>
                    <th>상영일시</th>
                    <th>좌석</th>
                    <th>결제금액</th>
                </tr>
                </thead>
                <tbody>
                <c:choose>
                    <c:when test="${not empty reservations}">
                        <c:forEach var="reservation" items="${requestScope.reservations}">
                            <tr>
                                <td>${reservation.formattedReservationIdx}</td>
                                <td>${reservation.movieTitle}</td>
                                <td>${reservation.theaterName}</td>
                                <td>${reservation.timetableStartTime}</td>
                                <td>
                                    <c:forEach var="seat" items="${reservation.seats}" varStatus="status">
                                        ${seat.seatNumber}
                                        <c:if test="${!status.last}">, </c:if>
                                    </c:forEach>
                                </td>
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
                            <td colspan="6" style="text-align:center;">예매내역이 없습니다.</td>
                        </tr>
                    </c:otherwise>
                </c:choose>
                </tbody>
            </table>

            <!-- ✅ 취소내역 테이블 (초기에는 숨김) -->
            <table id="cancelTable" class="table" style="<c:if test='${reservationType ne "cancelTable"}'>display: none;</c:if>">
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
                    <c:when test="${not empty reservations}">
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

                <table id="purchaseTable" class="table" style="<c:if test='${reservationType ne "purchaseTable"}'>display: none;</c:if>">
                    <thead>
                    <tr>
                        <th>구매일시</th>
                        <th>상품명</th>
                        <th>구매금액</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:choose>
                        <c:when test="${not empty purchaseHistory}">
                            <c:forEach var="purchase" items="${purchaseHistory}">
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

<footer>
    <jsp:include page="../common/footer.jsp"/>
</footer>

</body>
<script>
    // 탭 요소와 콘텐츠 섹션 선택
    const tabs = document.querySelectorAll('.tab');
    const contents = document.querySelectorAll('.content1 .ongoinReservation, .content1 .ongoinPurchase');

    // 초기 상태 설정
    contents.forEach(content => {
        content.style.display = 'none'; // 모든 콘텐츠 숨기기
    });
    document.querySelector('.ongoinReservation').style.display = 'block'; // 예매내역 기본 표시

    // 탭 클릭 이벤트 처리
    tabs.forEach(tab => {
        tab.addEventListener('click', function() {
            // 모든 탭에서 'active' 클래스 제거
            tabs.forEach(t => t.classList.remove('active'));

            // 클릭된 탭에 'active' 클래스 추가
            this.classList.add('active');

            // 모든 콘텐츠 숨기기
            contents.forEach(content => {
                content.style.display = 'none';
                content.classList.remove('active');
            });

            // 클릭된 탭과 연결된 콘텐츠 표시
            const target = this.getAttribute('data-target');
            const targetContent = document.querySelector('.'+target);

            if (targetContent) { // 대상 콘텐츠가 존재하는 경우만 실행
                targetContent.style.display = 'block';
                targetContent.classList.add('active');
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
