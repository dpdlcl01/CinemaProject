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

        .table>:not(caption)>*>* {
            padding: 0;
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
            border-radius: 5px;
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
                <a href="${pageContext.request.contextPath}/UserController?type=myReservation" class="tab" data-target="ongoinReservation">예매내역</a>
                <a href="${pageContext.request.contextPath}/UserController?type=myReservation&reservationType=purchaseTable" class="tab active" data-target="ongoinPurchase">구매내역</a>
            </div>
            <div class = "ongoinPurchase">
                <div class="filter">
                    <form id="purchaseForm" action="UserController" method="get">
                        <input type="hidden" name="type" value="myReservation">
                        <input type="hidden" name="reservationType"  id="reservationType" value="purchaseTable">
                        <input type="hidden" name="selectedYear" id="selectedYear">
                        <input type="hidden" name="selectedMonth" id="selectedMonth">

                        <select id="monthSelect" name="selectedMonth">
                            ${monthOptions}
                        </select>
                        <button type="submit">조회</button>
                    </form>
                </div>

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
                                    <td>${purchase.paymentDate}</td>
                                    <td>${purchase.productName}</td>
                                    <td>${purchase.paymentFinal}원</td>
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
  document.getElementById("purchaseForm").addEventListener("submit", function (event) {
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
