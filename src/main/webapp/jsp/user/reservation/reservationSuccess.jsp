<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

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
    }
    #main{
      display: flex;
      width: 1100px;
      height: 375px;
      background-image:url("${pageContext.request.contextPath}/css/user/images/KangImg/payment.png");
    }
    #imgDiv{
      width: 270px;
      height: 375px;


    }
    #ticket{
      margin-top: 25px;
    }
    #imgDiv p{
      text-align: center;
      color: #D3D3D3;
    }
    #imgDiv p>strong{
      color: #55B0BA;
      font-size: 20px;
      margin-bottom: 10px;
    }

    #movieImg{
      padding-top: 20px;
      display: flex;
      margin: auto;
      width: 150px;
      height: 216px;
    }
    #successInfo{
      width: 830px;
      height: 335px;
      padding: 20px 60px;
    }
    #successInfo>p{
      margin-top: 10px;
      margin-bottom: 20px;
    }
    #successInfo>p>strong{
      color: #55B0BA;
      font-size: 25px;
      padding-right: 120px;
    }
    #successInfo>p>span{
      color: #D3D3D3;
      font-size: 14px;
    }
    #successInfo li{
      padding-top: 3px;
      padding-bottom: 3px;
      color: white;
      display: flex;
    }
    #successInfo li>p{
      color: #D3D3D3;
      width: 170px;
    }
    #btnDiv{
      margin-left: auto;
      margin-right: auto;
      width: 300px;
      display: flex;
    }
    #btnDiv>button{
      width: 129px;
      height: 46px;
      margin: 30px 5px;
      background-color: white;
      border: 2px solid #503396;
      border-radius: 4px;
      font-weight: 500;
      font-size: 16px;
    }
    #lastElement{
      padding-left: 20px;
      margin: 50px 20px;

    }
    #liDiv{
      margin: 20px 0;

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
<!-- contents 영역 -->
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
<div class="contents">
    <h1>예매완료</h1>
    <!-- 예매 내역 반복 출력 -->
    <c:forEach var="vo" items="${guestReservationList}">
        <div id="main">
            <div id="imgDiv">
                <div id="ticket">
                    <p>티켓 예매번호</p>
                    <p><strong>${vo.reservationIdx}</strong></p>
                    <p>${vo.movieTitle}</p>
                </div>
<%--                <img src="" id="movieImg" alt="영화 포스터">--%>
                <div>예매영화:${vo.movieTitle}</div>
            <div id="successInfo">
                <p><strong>예매가 완료되었습니다!</strong>
                    <span>고객님의 상영익일 적립예정 포인트는 ??? 입니다.</span>
                </p>
                <hr>
                <div id="liDiv">
                    <div>예매영화:${vo.movieTitle}</div>
                    <div><p>관람극장/상영관</p> ${vo.theaterName} / ${vo.screenName}</div>
                    <div><p>관람일시</p> ${vo.timetableStartTime}</div>
                    <div><p>관람인원</p> 성인 명 / 청소년 명</div>
                    <div><p>좌석번호</p> ${vo.seatNumber}</div>
                    <div><p>전화번호</p> </div>
                    <div><p>결제정보</p><strong></strong></div>
                </div>
                <hr>
            </div>
            <hr>
            <div id="btnDiv">
                <button type="button">교환권출력</button>
                <button type="button">예매내역</button>
            </div>
            <hr>
        </div>
        </div>
    </c:forEach>
    <!-- 반복 끝 -->
    <div id="lastElement">
        <li>※상영안내</li>
        <p>-쾌적한 관람 환경을 위해 상영시간 이전에 입장 부탁드립니다.</p>
        <p>-상영시간 20분전까지 취소 가능하며, 캡쳐화면으로는 입장하실 수 없습니다.</p>
    </div>
</div>

<!-- footer 영역 -->
<footer>
  <jsp:include page="../common/footer.jsp"/>
</footer>
<!-- script 영역 -->
<script>

</script>
</body>
</html>
