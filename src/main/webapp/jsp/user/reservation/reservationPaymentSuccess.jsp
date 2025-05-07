<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <style>
        * {
            padding: 0px;
            margin: 0px;
        }
        body {
            background-color: #f5f5f5;
        }
        #contents {
            margin: 50px auto;
            width: 1100px;
        }
        #main {
            display: flex;
            width: 1100px;
            height: auto;
            background-image: url("${pageContext.request.contextPath}/css/user/images/KangImg/payment.png");
            background-size: cover;
            background-repeat: no-repeat;
            padding: 20px;
            color: white;
            margin-bottom: 30px;
        }
        #imgDiv {
            width: 270px;
            text-align: center;
        }
        #ticket {
            margin-top: 10px;
        }
        #imgDiv p {
            padding-right: 30px;
            text-align: center;
            color: #FFF;
        }
        #imgDiv p>strong {
            color: #55B0BA;
            font-size: 20px;
            margin-bottom: 10px;
        }
        #movieImg {
            margin: 10px 30px 10px 0;
            width: 190px;
            height: 245px;
            border-radius: 8px;
        }
        #successInfo {
            width: calc(100% - 290px);
            padding: 20px 30px;
            color: white;
        }
        #successInfo>p {
            margin-top: 10px;
            margin-bottom: 20px;
        }
        #successInfo>p>strong {
            color: #55B0BA;
            font-size: 25px;
        }
        #liDiv {
            margin: 20px 0;
            line-height: 1.6;
            font-size: 16px;
        }
        #liDiv p {
            font-weight: bold;
            margin-right: 10px;
            display: inline;
        }
        .seat-list {
            display: inline;
        }
        #btnDiv {
            width: 100%;
            text-align: center;
            margin-top: 20px;
            margin-bottom: 40px;
        }
        #btnDiv>button {
            width: 150px;
            height: 46px;
            margin: 10px;
            background-color: white;
            border: 2px solid #339eb2;
            border-radius: 4px;
            font-weight: 500;
            font-size: 16px;
            cursor: pointer;
        }
        #btnDiv>button:hover {
            border: 2px solid #1e7f9a;
            background-color:  #ebebeb;
            color: #000000;
        }
        #lastElement {
            padding-left: 20px;
            margin: 50px 20px;
        }
        /* page-util 스타일 */
        .page-util {
            background-color: #fff;
            padding: 10px 0;
            border-bottom: 1px solid #ddd;
            margin-bottom: 20px;
        }
        .inner-wrap {
            width: 1100px;
            margin: 0 auto;
        }
        .location {
            display: flex;
            align-items: center;
            font-size: 14px;
            color: #666;
        }
        .location span,
        .location label {
            margin-right: 5px;
        }
    </style>
</head>

<!-- head -->
<head>
    <jsp:include page="../common/head.jsp"/>
</head>

<body>
<!-- header 영역 -->
<header>
    <jsp:include page="../common/header.jsp"/>
</header>

<!-- ✅ page-util 영역 추가 -->
<div class="page-util">
    <div class="inner-wrap">
        <div class="location">
            <span>Home</span>
            <img src="https://img.megabox.co.kr/static/pc/images/common/bg/bg-location-arr.png"/>
            <label>예매</label>
            <img src="https://img.megabox.co.kr/static/pc/images/common/bg/bg-location-arr.png"/>
            <label>빠른예매</label>
            <img src="https://img.megabox.co.kr/static/pc/images/common/bg/bg-location-arr.png"/>
            <label>예매완료</label>
        </div>
    </div>
</div>

<!-- contents 영역 -->
<div id="contents">
    <h1 style="margin-bottom: 30px">예매완료</h1>

    <!-- 예매 내역 반복 출력 -->
    <div id="main">
        <div id="imgDiv">
            <p>티켓 예매번호</p>
            <p><strong>${requestScope.vo.formattedReservationIdx}</strong></p>
            <img src="${requestScope.vo.moviePosterUrl}" id="movieImg" alt="영화 포스터">
            <p>${requestScope.vo.movieTitle}</p>
        </div>

        <div id="successInfo">
            <p><strong>예매가 완료되었습니다!</strong></p>
            <hr>
            <div id="liDiv">
                <div><p>예매영화 :</p> ${requestScope.vo.movieTitle}</div>
                <div><p>관람극장/상영관 :</p> ${requestScope.vo.theaterName} / ${requestScope.vo.screenName}</div>
                <div><p>관람일시 :</p> ${requestScope.vo.timetableStartTime}</div>

                <!-- ✅ 결제 가격 합계 변수 선언 -->
                <c:set var="totalPrice" value="0" />

                <!-- ✅ 좌석 정보를 한 줄로 표시하면서 가격 합산 -->
                <div><p>좌석번호 :</p>
                    <c:forEach var="seat" items="${requestScope.vo.seats}" varStatus="status">
                        <span class="seat-list">${seat.seatNumber} (${seat.seatAgeGroupText})</span>
                        <c:if test="${!status.last}">, </c:if>

                        <!-- ✅ 개별 좌석 가격 합산 -->
                        <c:set var="totalPrice" value="${totalPrice + seat.seatPrice}" />
                    </c:forEach>
                </div>

                <!-- ✅ 결제 가격 합계 출력 -->
                <div><p>결제정보 :</p> <strong>${totalPrice} 원 </strong></div>
                <div><p>할인금액 :</p> <strong>${requestScope.paymentDiscount} 원 </strong></div>
                <div><p>결제금액 :</p> <strong>${requestScope.paymentFinal} 원 </strong></div>
            </div>
        </div>
    </div>

    <!-- ✅ 버튼을 검은 배경 밑에 위치 -->
    <div id="btnDiv">
        <button type="button"><a href="${pageContext.request.contextPath}/UserController?type=myReservation">예매내역</a></button>
    </div>

    <div id="lastElement">
        <li>※상영안내</li>
        <p>- 쾌적한 관람 환경을 위해 상영시간 이전에 입장 부탁드립니다.</p>
        <p>- 상영시간 20분 전까지 취소 가능하며, 캡처화면으로는 입장하실 수 없습니다.</p>
    </div>
</div>

<!-- footer 영역 -->
<footer>
    <jsp:include page="../common/footer.jsp"/>
</footer>
</body>
</html>
