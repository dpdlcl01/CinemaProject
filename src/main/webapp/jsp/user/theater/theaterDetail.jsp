<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!Doctype html>
<html lang="ko">
<!-- head -->
<head>
    <jsp:include page="../common/head.jsp"/>
</head>

<body>
<!-- header 영역 -->
<jsp:include page="../common/header.jsp"/>

<style>
    /* 공통 스타일 */
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
    }

    /* 상단 이미지 섹션 */
    .theater-header {
        position: relative;
        width: 100%;
        height: 300px; /* 헤더 높이 */
        background: url('${pageContext.request.contextPath}/css/user/images/theater-image.jpg') center center/cover no-repeat;

        display: flex;
        flex-direction: column; /* 수직 정렬 */
        align-items: center;
        justify-content: center; /* 수평 중앙 정렬 */
        text-align: center;
    }
    .theater-header::before {
        content: "";
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background: url('https://img.megabox.co.kr/static/pc/images/movie/bg-movie-detail-mask.png') center top/cover no-repeat;
        z-index: 1;
        opacity: 0.9; /* 필요에 따라 투명도 조정 */
    }

    .theater-header h1 {
        position: relative;
        z-index: 2; /* 텍스트가 mask 위로 오도록 설정 */
        font-size: 40px;
        /*        font-weight: bold;*/
        margin: 0px; /* 극장 이름과 탭 사이 간격 조정 */
        text-shadow: 2px 2px 10px rgba(0, 0, 0, 0.7);
    }

    .theater-header .tabs {
        position: absolute;
        top: 0; /* 상단에 배치 */
        width: 1100px;
        display: flex;
        justify-content: space-around;
        padding: 10px 0;
        margin: 0;
        z-index: 2; /* 배경 위로 배치 */
        border-bottom: 1px solid #bbbbbb;
        /*border-radius: 10px;*/ /* 테두리 둥글게 */
    }

    .theater-name {
        width: 1100px;
        overflow: hidden;
        padding: 40px 0 0 0;
        text-align: center;
        color: #fff;
        font-size: 3.0666em;
        font-weight: 400;
        text-shadow: 2px 2px 10px rgba(0, 0, 0, .7);
    }

    .theater-header .tabs li {
        list-style: none;
        color: white;
        font-size: 16px;
        padding: 10px 20px;
        cursor: pointer;
        position: relative; /* 리스트의 위치 기준점 */
    }

    .theater-header .tabs li:hover {
        font-weight: bold;
        /*border-bottom: 3px solid white;*/
    }


    .content {
        display: none;
    }
    .content.active {
        display: block;
    }




    /* 공통 스타일 */
    .content {
        display: none;
    }
    .content.active {
        display: block;
    }

    .theater-tabs ul {
        display: flex;
        justify-content: center;
        padding: 0;
        margin: 0;
        list-style: none;
    }

    .theater-tabs ul li {
        padding: 10px 20px;
        cursor: pointer;
        font-size: 16px;
        text-align: center;
    }

    .theater-tabs ul li.active {
        font-weight: bold;
        border-bottom: 3px solid #5a3dd2;
        color: #5a3dd2;
    }


    .theater-tabs ul li:hover {
        color: #5a3dd2;
    }

    /* 상세 내용 */
    .theater-details {
        padding: 30px;
        text-align: center;
    }

    .theater-details h2 {
        font-size: 24px;
        margin-bottom: 10px;
    }

    .theater-details p {
        font-size: 16px;
        color: #555;
    }


    /* 공통 스타일 */
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        line-height: 1.6;
        color: #333;
    }

    h3 {
        font-size: 18px;
        color: #5a3dd2;
        border-bottom: 2px solid #5a3dd2;
        padding-bottom: 10px;
        margin-bottom: 20px;
    }

    h4 {
        font-size: 16px;
        color: #333;
        margin: 20px 0 10px;
    }

    p, li {
        font-size: 14px;
        color: #555;
    }

    strong {
        color: #333;
    }

    /* 컨테이너 */
    .facility-title, .transport-title, .schedule-title, .fees-title {
        font-size: 24px;
        color: #503396; /* 타이틀 색상 */
    }

    .facility-transport-container {
        max-width: 1100px;
        margin: 0 auto;
        padding: 30px 20px;
    }

    /* 시설안내 섹션 */
    .facility-guide {
        margin-bottom: 70px;
    }

    .facility-icons .icon {
        flex: 1;
    }

    .facility-icons .icon img {
        width: 111px;
        height: 111px;
        margin-bottom: 10px;
    }

    .facility-icons .icon p {
        font-size: 14px;
        margin: 0;
    }

    .floor-guide ul {
        padding-left: 0;
        list-style: none;
        margin: 0;
    }

    .floor-guide ul li {
        padding: 5px 0;
    }

    .floor-guide ul li strong {
        font-weight: bold;
    }

    /* 교통안내 섹션 */
    .transport-guide {
        margin-top: 70px;
    }

    .transport-details {
        margin-top: 10px;
        padding: 15px;
        background: #f9f9f9;
        border: 1px solid #ddd;
        border-radius: 5px;
    }

    .transport-details p {
        margin: 0 0 10px;
    }

    /* 컨테이너 */
    .schedule-container {
        width: 100%; /* 양쪽 테두리를 없애고 전체 너비로 확장 */
        margin: 20px 0;
        padding: 20px 0; /* 좌우 패딩 제거 */
        background-color: transparent; /* 배경 색상 제거 */
        border: none; /* 테두리 제거 */
    }

    /* 컨테이너 */
    .schedule-container:first-child{
        width: 100%; /* 양쪽 테두리를 없애고 전체 너비로 확장 */
        margin: 20px 0;
        padding: 20px 0; /* 좌우 패딩 제거 */
        background-color: transparent; /* 배경 색상 제거 */
        border: none; /* 테두리 제거 */
    }

    /* 영화 정보 */
    .movie-info {
        display: flex;
        align-items: center;
        padding: 10px 0;
        margin-bottom: 15px;
    }

    .movie-rating {
        width: 40px;
        height: 40px;
        display: flex;
        align-items: center;
        justify-content: center;
        background-color: #ffcc00;
        border-radius: 50%;
        font-size: 18px;
        font-weight: bold;
        color: white;
        margin-right: 10px;
    }

    .movie-details {
        display: flex;
        flex-direction: column;
        font-size: 16px;
    }

    .movie-details strong {
        font-size: 18px;
        margin-bottom: 5px;
    }

    /* 상영 시간표 */
    .showtimes {
        margin-top: 20px;
    }

    .theater {
        display: flex;
        align-items: flex-start;
        padding: 15px 0;
    }

    .theater-info {
        flex: 2;
        display: flex;
        flex-direction: column;
        font-size: 14px;
    }

    .time-slots {
        flex: 4;
        display: flex;
        flex-wrap: wrap;
        gap: 10px;
    }

    .time-slots a {
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        text-align: center;
        background-color: #f9f9f9;
        padding: 10px 15px;
        border-radius: 5px;
        font-size: 14px;
        color: #0078ff;
        text-decoration: none;
        border: 1px solid #ddd;
        transition: background-color 0.3s ease, border-color 0.3s ease;
    }

    .time-slots a:hover {
        background-color: #f0f0f0;
        border-color: #0078ff;
    }

    /* 전체 컨테이너 */
    .schedule-container {
        width: 100%;
        max-width: 1100px;
        margin: 20px auto;
        padding: 20px;
        background-color: #fff;
        /*border-top: 1px solid #ddd; !* 상단 보더만 유지 *!*/
        border-bottom: 1px solid #ddd; /* 하단 보더만 유지 */
        border-left: none; /* 왼쪽 보더 제거 */
        border-right: none; /* 오른쪽 보더 제거 */
        border-radius: 0; /* 테두리 둥근 모서리 제거 */
    }


    /* 영화 정보 */
    .movie-info {
        display: flex;
        align-items: center;
        padding: 10px 0;
        border-bottom: 2px solid #5a3dd2;
        margin-bottom: 15px;
    }

    .movie-rating {
        width: 40px;
        height: 40px;
        display: flex;
        align-items: center;
        justify-content: center;
        background-color: #ffcc00;
        border-radius: 50%;
        font-size: 18px;
        font-weight: bold;
        color: white;
        margin-right: 15px;
    }

    .movie-details {
        display: flex;
        flex-direction: column;
        font-size: 16px;
    }

    .movie-details strong {
        font-size: 18px;
        color: #333;
        margin-bottom: 5px;
    }

    .movie-details span {
        font-size: 14px;
        color: #777;
    }

    .theater {
        display: flex;
        align-items: flex-start;
        padding: 15px 0;
        border-bottom: 1px solid #ddd;
    }

    .theater-info {
        flex: 2;
        display: flex;
        flex-direction: column;
        font-size: 14px;
    }

    .theater-info strong {
        font-size: 16px;
        font-weight: bold;
        margin-bottom: 5px;
        color: #333;
    }

    .theater-info span {
        color: #555;
        font-size: 14px;
    }

    .format {
        flex: 0 0 auto; /* 고정 크기 유지 */
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 14px;
        font-weight: bold;
        color: #555;
        background-color: #f4f4f4;
        padding: 10px;
        height: 70px; /* 높이 증가 */
        width: 75px; /* 너비 감소 */
        text-align: center;
        border-radius: 5px;
        margin-right: 10px;
        border: 1px solid #ddd;
    }

    /* 상영 시간 버튼 */
    .time-slots {
        display: flex;
        flex-wrap: wrap; /* 여러 줄 정렬 가능 */
        gap: 0px; /* 버튼 간 간격 */
    }

    .time-slots a {
        display: flex;
        flex-direction: column; /* 시간과 좌석 수를 위아래로 배치 */
        justify-content: center;
        align-items: center;
        width: 80px; /* 고정 너비 */
        height: 70px; /* 고정 높이 */
        text-align: center;
        background-color: #fff;
        border-radius: 5px; /* 각진 모서리 */
        font-size: 14px;
        color: #0078ff;
        text-decoration: none;
        border: 1px solid #ddd;
        transition: background-color 0.3s ease, border-color 0.3s ease, color 0.3s ease; /* 글씨 색상 전환 추가 */
        box-sizing: border-box; /* 테두리 포함하여 크기 계산 */
    }

    .time-slots a span {
        font-size: 12px; /* 좌석 수 텍스트 크기 */
        color: #555;
    }

    .time-slots a:hover {
        background-color: #5a3dd2; /* 호버 시 배경색 */
        color: white; /* 호버 시 글씨 색상 */
        border-color: #5a3dd2; /* 테두리 색상 변경 */
    }
    .time-slots a:hover span {
        color: white; /* 호버 시 좌석 수 텍스트도 흰색으로 변경 */
    }

    /* 마지막 상영관 구분선 제거 */
    .theater:last-child {
        border-bottom: none;
    }

    /* 날짜 선택 바 컨테이너 */
    .date-picker {
        display: flex;
        align-items: center;
        justify-content: space-between;
        overflow: hidden;
        background-color: #fff;
        padding: 5px 0; /* 상하 패딩 축소 */
        margin-top: 15px;
        border-top: 1px solid #ddd; /* 위쪽 테두리 */
        border-bottom: 1px solid #ddd; /* 아래쪽 테두리 */
        width: 100%; /* 화면 너비에 맞춤 */
        box-sizing: border-box; /* 테두리와 패딩 포함 */
    }

    .date-list {
        display: flex;
        transition: transform 0.5s ease;
        margin: 0;
        padding: 0 10px; /* 좌우 여백 */
        list-style: none;
        width: 100%; /* 날짜 리스트 전체가 화면 너비를 채움 */
        justify-content: space-around; /* 날짜를 고르게 배치 */
    }

    .date-item {
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        width: 50px; /* 날짜 너비 고정 */
        padding: 5px; /* 상하 패딩 축소 */
        cursor: pointer;
        text-align: center;
        font-size: 14px;
        color: #666;
        transition: color 0.3s ease, transform 0.3s ease;
    }

    .date-item .date {
        font-size: 16px;
        font-weight: bold;
        color: #333;
    }

    .date-item .day {
        font-size: 12px; /* 요일 크기 축소 */
        color: #666;
    }

    .date-item.active {
        color: #5a3dd2;
        transform: scale(1.2); /* 선택된 날짜 강조 */
        font-weight: bold;
    }

    .nav-button {
        background: none;
        border: none;
        font-size: 18px;
        color: #333;
        cursor: pointer;
        padding: 5px;
        margin: 0 5px;
    }

    .nav-button:disabled {
        /*color: #ddd;*/
        cursor: not-allowed;
    }


    /* 비활성화된 날짜 */
    .date-item.disabled {
        color: #ddd;
        cursor: not-allowed;
    }

    /* 주말 날짜 */
    .date-item.weekend span{
        color: #ff4c4c; /* 빨간색 */
    }

    /* 공휴일 및 일요일 */
    .date-item.holiday {
        color: #ff4c4c; /* 빨간색 */
    }



    .date-item.active .day {
        font-weight: bold;
    }

    .fee-table-container {
        display: flex;
        flex-wrap: wrap;
        gap: 20px;
        margin-bottom: 100px;
        justify-content: space-between;
    }

    .fee-table {
        border-collapse: collapse;
        width: 45%;
        background-color: #fff;
        border: 1px solid #ddd;
    }

    .fee-table caption {
        font-size: 18px;
        font-weight: bold;
        color: #503396;
        /*margin-bottom: 10px;*/
        text-align: left;
        padding-top: 30px;
        caption-side: top;
    }

    .fee-table th,
    .fee-table td {
        border: 1px solid #ddd;
        padding: 10px;
        text-align: center;
        font-size: 14px;
        color: #333;
    }

    .fee-table th {
        background-color: #f9f9f9;
        font-weight: bold;
    }

    .fee-table tbody tr:nth-child(even) {
        background-color: #f7f7f7;
    }

    #cinema-list-container {
        position: absolute;
        top: 50px;
        left: 0;
        width: 100%;
        text-align: center;
        background: rgba(0, 0, 0, 0.8); /* 반투명 배경 */
        color: white;
        padding: 10px;
        border-radius: 5px;
        display: none; /* 초기에는 숨김 */
        z-index: 10; /* 다른 요소보다 위에 표시 */
    }

    #cinema-list-container span {
        margin: 0 5px;
        font-size: 14px;
        cursor: pointer;
    }

    #cinema-list-container span:hover {
        text-decoration: underline; /* 강조 효과 */
    }


    #cinema-list-container.visible {
        display: block;
    }

    /* 부모 컨테이너 */
    .theater-description-container {
        text-align: center; /* 텍스트 중앙 정렬 */
        margin: 30px 0; /* 위아래 간격 */
        border-bottom: 1px solid #ddd; /* 하단에 얇은 선 추가 */
    }

    /* 텍스트 스타일 */
    .theater-description {
        font-size: 26px; /* 적절한 텍스트 크기 */
        line-height: 1.6; /* 줄 간격 */
        color: #333; /* 텍스트 색상 */
        font-weight: 400; /* 일반적인 가독성 있는 굵기 */
        max-width: 1100px; /* 텍스트 최대 너비 제한 */
        margin: 0 auto; /* 중앙 배치 */
        padding-top: 20px;
        padding-bottom: 20px
    }


    /*영화관 이미지*/
    .theaterImage {
        width: 1100px;
        height: 420px;
        /*margin-right: 100px;*/
    }

    .movie-group{
        margin-bottom: 30px;
        border-bottom: 2px solid #ddd;
    }


</style>

<!-- page-util -->
<div class="page-util">
    <div class="inner-wrap">
        <div class="location">
            <span>Home</span>
            <img src="https://img.megabox.co.kr/static/pc/images/common/bg/bg-location-arr.png" alt="극장"/>
            <label>극장</label>
            <img src="https://img.megabox.co.kr/static/pc/images/common/bg/bg-location-arr.png" alt="전체극장"/>
            <label>전체극장</label>
            <img src="https://img.megabox.co.kr/static/pc/images/common/bg/bg-location-arr.png" alt="상세정보"/>
            <label>상세정보</label>
        </div>
    </div>
</div>

<!-- 극장 상단 이미지 및 메뉴 -->
<!-- 상단 이미지 섹션 -->
<div class="theater-header">
    <ul class="tabs">
        <li class="tab" data-cinemas="강남, 센트럴, 코엑스, 홍대">서울</li>
        <li class="tab" data-cinemas="고양스타필드, 수원스타필드, 안성스타필드">경기</li>
        <li class="tab" data-cinemas="송도, 인천논현">인천</li>
        <li class="tab" data-cinemas="대전중앙로, 세종나성">대전/충청/세종</li>
        <li class="tab" data-cinemas="대구신세계, 해운대">부산/대구/경상</li>
        <li class="tab" data-cinemas="광주하남, 전주혁신">광주/전라</li>
        <li class="tab" data-cinemas="원주혁신">강원</li>
    </ul>
    <div id="cinema-list-container"></div>



    <div class="theater-name">
        <h1>${theater.theaterName}</h1>
    </div>
</div>


<div class="contents">
    <!-- 탭 메뉴 -->
    <div class="tabs">
        <div class="tab active" data-target="info">극장정보</div>
        <div class="tab" data-target="schedule">상영시간표</div>
        <div class="tab" data-target="fees">관람료</div>
    </div>

    <!-- 상세 내용 -->
    <div id="info" class="content active">
        <div class="theater-description-container">
            <div class="theater-description">
                ${theater.theaterInfo}
            </div>
        </div>
        <div class="facility-transport-container">
            <!-- 시설안내 섹션 -->
            <section class="facility-guide">
                <div class="theaterImage">
                    <img src="${pageContext.request.contextPath}/css/user/images/theater/${theater.theaterImageUrl}" alt="극장설명">
                </div>
            </section>

            <!-- 교통안내 섹션 -->
            <section class="transport-guide">
                <!-- 섹션 제목 -->
                <div class="transport-header">
                    <h2 class="transport-title">교통안내</h2>
                </div>
                <div class="transport-details">
                    <p><strong>도로명주소:</strong> ${theater.theaterAddress}</p>
                    <div id="map" style="width:auto;height:400px;"></div>
                </div>
            </section>
        </div>
    </div>

    <div id="schedule" class="content">
        <h2 class="schedule-title">상영스케줄</h2>
        <div class="date-picker">
            <button class="nav-button prev">&lt;</button>
            <ul id="date-list" class="date-list">
                <!-- JavaScript로 동적으로 날짜 생성 -->
            </ul>
            <button class="nav-button next">&gt;</button>
        </div>



        <div class="schedule-container">
            <!-- 영화 데이터가 없을 경우 -->
            <c:if test="${empty movie}">
                <p>영화 데이터가 없습니다.</p>
            </c:if>

            <!-- 영화 목록 반복 출력 -->
            <c:forEach var="item" items="${movie}">
            <!-- 영화 정보 -->

            <div class="movie-info">
                <div class="movie-rating">
                    <span>${item.movieGrade}</span> <%-- 영화 등급 --%>
                </div>
                <div class="movie-details">
                    <strong>${item.movieTitle}</strong>
                    <span>상영중 / 상영시간 ${item.movieTime}분</span>
                </div>
            </div> <!-- movie-info div 닫힘 -->

            <!-- 상영 시간표 -->
            <div class="showtimes">
                <div class="theater">
                    <div class="theater-info">
                        <strong>${item.screenName}</strong>
                        <span>${item.screenSeatCount}석"</span>
                    </div>
                    <div class="format">
                        <span>${item.screenType}</span>
                    </div>
                    <div class="time-slots">
                        <a href="#">${item.timetableStartTime} <span>${item.remainSeat}석</span></a>
                    </div>
                </div>
            </div>
        </div>
        </c:forEach>
    </div>
</div>

<!-- 영화관람료 -->
<div id="fees" class="content">
    <h2 class="fees-title">영화관람료</h2>
    <div class="fee-table-container">
        <%--상영관이 늘어나면 end를 늘려주면 됨--%>
        <c:forEach var="screenType" begin="1" end="5">
            <table class="fee-table">
                <caption>
                    <c:choose>
                        <c:when test="${screenType == 1}">COMFORT</c:when>
                        <c:when test="${screenType == 2}">VIP</c:when>
                        <c:when test="${screenType == 3}">DOLBY</c:when>
                        <c:when test="${screenType == 4}">4DX</c:when>
                        <c:when test="${screenType == 5}">IMAX</c:when>
                    </c:choose>
                </caption>
                <thead>
                <tr>
                    <th>요일</th>
                    <th>상영시간</th>
                    <th>일반</th>
                    <th>청소년</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="price" items="${price}">
                    <c:if test="${price.screenType == screenType}">
                        <tr>
                            <!-- 요일 구분 -->
                            <td>
                                <c:choose>
                                    <c:when test="${price.dayOfWeek == 1}">월~금</c:when>
                                    <c:when test="${price.dayOfWeek == 2}">주말<br>공휴일</c:when>
                                </c:choose>
                            </td>
                            <!-- 상영 시간 -->
                            <td>
                                <c:choose>
                                    <c:when test="${price.timeOfDay == 1}">조조 (09:00~)</c:when>
                                    <c:when test="${price.timeOfDay == 2}">일반 (10:30~)</c:when>
                                </c:choose>
                            </td>
                            <!-- 좌석 가격 -->
                            <td><fmt:formatNumber value="${price.generalPrice}" type="number"/></td>
                            <td><fmt:formatNumber value="${price.teenPrice}" type="number"/></td>
                        </tr>
                    </c:if>
                </c:forEach>
                </tbody>
            </table>
        </c:forEach>
    </div>
</div>
</div>
<input type="hidden" id="theaterIdx" value="${theaterIdx}" />
<%--비회원 로그인 모달--%>
<a href="#" id="member-login-btn" title="로그인" data-bs-toggle="modal" data-bs-target="#customLoginModal" style="display: none;">비회원</a>
<jsp:include page="../login/reservationLoginModal.jsp"/>
<div id="customLoginModal" style="display: none;">
    <%-- 로그인 모달 --%>
</div>

<!-- footer 영역 -->
<jsp:include page="../common/footer.jsp"/>


<!-- script 영역 -->
<script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=dc04bf5e499b3bbf3bd615ac599cba19&libraries=services"></script>
<script>
    /* 카카오지도 API */
    var container = document.getElementById('map');

    // 극장의 주소 또는 이름 (예: request에서 가져온 값)
    var theaterAddress = "${theater.theaterAddress}"; // JSP에서 VO의 주소를 가져오는 방식

    var options = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 기본 좌표
        level: 3
    };

    var map = new kakao.maps.Map(container, options);

    // Geocoder 객체 생성
    var geocoder = new kakao.maps.services.Geocoder();

    // 주소를 좌표로 변환
    geocoder.addressSearch(theaterAddress, function(result, status) {
        if (status === kakao.maps.services.Status.OK) {
            var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

            // 지도 중심을 결과값으로 이동
            map.setCenter(coords);

            // 마커 추가
            var marker = new kakao.maps.Marker({
                map: map,
                position: coords
            });

            // 주소값 나오는 창
            var infowindow = new kakao.maps.InfoWindow({
                content: '<div style="padding:5px;">' + theaterAddress + '</div>'
            });
            infowindow.open(map, marker);
        } else {
            console.error('주소 검색 실패: ' + status);
        }
    });

    document.addEventListener("DOMContentLoaded", () => {
        // 기존 탭 시스템 (data-target 사용하는 탭들)
        const legacyTabs = document.querySelectorAll(".tabs .tab[data-target]");
        const contents = document.querySelectorAll(".contents > .content, #info");

        // 영화관 탭 시스템 (data-cinemas 사용하는 탭들)
        const cinemaTabs = document.querySelectorAll(".tabs .tab[data-cinemas]");
        const cinemaListContainer = document.getElementById("cinema-list-container");

        // 기존 탭 시스템 동작
        legacyTabs.forEach((tab) => {
            tab.addEventListener("click", () => {
                // 모든 기존 탭 & 콘텐츠 비활성화
                legacyTabs.forEach((t) => t.classList.remove("active"));
                contents.forEach((content) => content.classList.remove("active"));

                // 클릭된 탭 활성화
                tab.classList.add("active");

                // 해당 콘텐츠 활성화
                const targetId = tab.getAttribute("data-target");
                const targetContent = document.getElementById(targetId);
                if (targetContent) targetContent.classList.add("active");
            });
        });

        // 영화관 탭 시스템 동작 (별도 처리)
        cinemaTabs.forEach((tab) => {
            // 마우스 오버 시 영화관 목록 표시
            tab.addEventListener("mouseover", () => {
                cinemaListContainer.innerHTML = tab.dataset.cinemas.split(", ").join(" | ");
                cinemaListContainer.style.display = "block";
            });

            // 마우스 아웃 시 영화관 목록 숨김
            tab.addEventListener("mouseout", () => {
                cinemaListContainer.style.display = "none";
            });
        });

        // 3. 컨테이너 호버 상태 유지
        cinemaListContainer.addEventListener("mouseover", () => {
            cinemaListContainer.style.display = "block";
        });

        cinemaListContainer.addEventListener("mouseout", () => {
            cinemaListContainer.style.display = "none";
        });

        // 초기화
        legacyTabs[0]?.classList.add("active");
        contents[0]?.classList.add("active");
    });


    // 초기 설정
    document.addEventListener("DOMContentLoaded", () => {
        const dateList = document.querySelector("#date-list");
        const prevButton = document.querySelector(".nav-button.prev");
        const nextButton = document.querySelector(".nav-button.next");

        // 오늘 날짜
        const today = new Date();
        today.setHours(0, 0, 0, 0); // 날짜 비교를 위해 시간 초기화

        let currentDate = new Date(today); // 현재 선택된 날짜

        // 날짜 포맷 함수
        function formatDate(date) {
            const year = date.getFullYear();
            const month = String(date.getMonth() + 1).padStart(2, "0");
            const day = String(date.getDate()).padStart(2, "0");
            return year + "-" + month + "-" + day;
        }

        // 요일 포맷 함수
        function formatDay(date) {
            const days = ["일", "월", "화", "수", "목", "금", "토"];
            return days[date.getDay()];
        }

        // 주말 확인 함수
        function isWeekend(date) {
            const day = date.getDay();
            return day === 0 || day === 6; // 일요일(0) 또는 토요일(6)
        }

        // 공휴일 확인 함수
        function isHoliday(date) {
            const holidays = ["2025-01-29", "2025-01-30, 2025-01-31"]; // 공휴일 목록
            return holidays.includes(formatDate(date));
        }

        // 날짜 비교용 함수
        function isToday(date) {
            const today = new Date();
            return date.getDate() === today.getDate() &&
                date.getMonth() === today.getMonth() &&
                date.getFullYear() === today.getFullYear();
        }

        /* 영화 상영시간표 */
        function updateShowtimes() {
            const formattedDate = formatDate(currentDate);
            const theaterIdx = document.querySelector("#theaterIdx").value;
            const contextPath = "${pageContext.request.contextPath}";
            const url = contextPath + "/UserController?type=theaterMovie&theaterIdx=" + theaterIdx + "&targetDate=" + formattedDate;
            console.log(formattedDate); //  오늘날짜 확인용

            fetch(url)
                .then(response => response.json())
                .then(data => {
                    // 현재 날짜인 경우 시간 필터링
                    if (isToday(currentDate)) {
                        const now = new Date();
                        data = data.filter(item => {
                            const showTime = new Date(item.timetableStartTime);
                            return showTime > now; // 현재 시간 이후만 나오도록 설정
                        });
                    }
                    const scheduleContainer = document.querySelector(".schedule-container");
                    scheduleContainer.innerHTML = "";

                    // screenType 매핑 객체 추가
                    const screenType = {
                        1: "COMFORT",
                        2: "VIP",
                        3: "DOLBY",
                        4: "4DX",
                        5: "IMAX"
                    };

                    if (Array.isArray(data) && data.length > 0) {
                        // 영화명 + 상영관 기준으로 2중 그룹화
                        const groupedData = data.reduce((acc, item) => {
                            // 영화 제목 그룹
                            const movieKey = item.movieTitle;
                            if (!acc[movieKey]) {
                                acc[movieKey] = {
                                    movieGrade: item.movieGrade,
                                    movieTime: item.movieTime,
                                    screens: {}
                                };
                            }
                            // 상영관 이름 그룹
                            const screenKey = item.screenName;
                            if (!acc[movieKey].screens[screenKey]) {
                                acc[movieKey].screens[screenKey] = {
                                    seatCount: item.screenSeatCount,
                                    screenType: item.screenType,
                                    times: []
                                };
                            }
                            // 시간 추가
                            acc[movieKey].screens[screenKey].times.push({
                                time: item.startTime, // 시간만 전시
                                timetable: item.timetableStartTime,
                                screenIdx: item.screenIdx,
                                remainSeat: item.remainSeat,
                                movieIdx: item.movieIdx,
                                timetableIdx: item.timetableIdx
                            });
                            return acc;
                        }, {});
                        // console.log("현재날짜:"+currentDate);



                        // 영화정보
                        Object.entries(groupedData).forEach(([movieTitle, movieInfo]) => {
                            const movieGroup = document.createElement("div");
                            movieGroup.className = "movie-group";

                            const movieElement = document.createElement("div");
                            movieElement.className = "movie-info";
                            // movieGrade 값에 따라 배경색 설정
                            let bgColor = "";
                            switch (movieInfo.movieGrade) {
                                case "ALL":
                                    bgColor = "#4CAF50"; // 초록색
                                    break;
                                case "12":
                                    bgColor = "#FFC107"; // 노란색
                                    break;
                                case "15":
                                    bgColor = "#FF7E00"; // 주황색
                                    break;
                                case "19":
                                    bgColor = "#F44444"; // 빨간색
                                    break;
                                default:
                                    bgColor = "#ddd"; // 기본 배경색 (회색)
                            }
                            movieElement.innerHTML =
                                '<div class="movie-rating" style="background-color:' + bgColor + ';">' + movieInfo.movieGrade + '</span></div>' +
                                '<div class="movie-details">' +
                                '<strong>' + movieTitle + '</strong>' +
                                '<span>상영중 / 상영시간 ' + movieInfo.movieTime + '분</span>' +
                                '</div>';

                            const showtimes = document.createElement("div");
                            showtimes.className = "showtimes";

                            // 상영관별 처리
                            Object.entries(movieInfo.screens).forEach(([screenName, screen]) => {
                                const theater = document.createElement("div");
                                theater.className = "theater";
                                theater.innerHTML =
                                    '<div class="theater-info">' +
                                    '<strong>' + screenName + '</strong>' +
                                    '<span>총&nbsp;' + screen.seatCount + '석</span>' +
                                    '</div>' +
                                    '<div class="format">' +
                                    '<span>' + screenType[screen.screenType] +'</span>'+
                                    '</div>' +
                                    '<div class="time-slots">' +
                                    screen.times.map(time =>
                                        '<a href="#" ' +
                                        'data-timetable-idx="' + time.timetableIdx + '" ' +
                                        'data-screen-idx="' + time.screenIdx + '" ' + //
                                        'data-screen-type="'+ screen.screenType +'" ' +
                                        'data-movie-idx="' + time.movieIdx + '" ' +
                                        'data-screen-name="' + screenName + '" ' +
                                        'data-timetable-start="' + time.timetable +'">' +
                                        time.time + ' <span>' + time.remainSeat + '석</span>' + // db변경시 수정할 곳
                                        '</a>'
                                    ).join('') +
                                    '</div>';
                                showtimes.appendChild(theater);
                            });
                            movieGroup.appendChild(movieElement);
                            movieGroup.appendChild(showtimes);

                            scheduleContainer.appendChild(movieGroup);

                        });
                    } else {
                        scheduleContainer.innerHTML = "<p>영화 데이터가 없습니다.</p>";
                    }
                })
                .catch(error => console.error("Error:", error));
        }
        // 날짜 클릭 이벤트
        document.querySelector('.schedule-container').addEventListener('click', async function(e) {
            const target = e.target.closest('.time-slots a');
            if (!target) return;
            e.preventDefault();

            const timetableStart = target.dataset.timetableStart;

            // URL 파라미터 생성
            const timetableIdx = target.dataset.timetableIdx;
            const screenIdx = target.dataset.screenIdx;
            const screenType = target.dataset.screenType;
            const movieIdx = target.dataset.movieIdx;
            const theaterIdx = document.querySelector("#theaterIdx").value;
            const isWeekendDay = isWeekend(currentDate);
            const timeString = target.textContent.split(' ')[0];
            const [datePart, timePart] = timetableStart.split(' ');
            const [hours] = timeString.split(':').map(Number);
            const isMorning = hours < 12;
            const contextPath = "${pageContext.request.contextPath}";

            //  클릭 시 이동할 경로
            const url = contextPath + "/UserController?type=seat" +
                "&movieIdx=" + movieIdx +
                "&screenIdx=" + screenIdx +
                "&timetableIdx=" + timetableIdx +
                "&screenType=" + screenType +
                "&isMorning=" + isMorning +
                "&isWeekend=" + isWeekendDay +
                "&theaterIdx=" + theaterIdx;

            try {
                // 3. 로그인 체크
                const response = await fetch(contextPath + "/UserController?type=loginCheck");
                const result = await response.json();

                if (!result.login) {
                    $('#customLoginModal').modal('show');
                    sessionStorage.setItem('redirectUrl', url);  // 로그인 후 돌아갈 URL 저장
                } else {
                    window.location.href = url
                }
            } catch (error) {
                console.error("로그인 체크 실패:", error);
            }
        });


        // 날짜 목록 생성
        function generateDateList(targetDate) {
            dateList.innerHTML = ""; // 기존 목록 초기화

            for (let i = 0; i <= 7; i++) {
                const date = new Date(targetDate);
                date.setDate(targetDate.getDate() + i);

                const li = document.createElement("li");
                li.classList.add("date-item");

                // 주말인 경우
                if (isWeekend(date)) {
                    li.classList.add("weekend");
                }
                // 공휴일인 경우
                if (isHoliday(date)) {
                    li.classList.add("holiday");
                }
                li.innerHTML = '<span class="date">' + date.getDate() + '</span>' +
                    '<span class="day">' + formatDay(date) + '</span>';
                // }

                // 날짜 클릭 이벤트
                li.addEventListener("click", () => {
                    // 모든 날짜에서 active 제거
                    dateList.querySelectorAll("li").forEach(item => item.classList.remove("active"));
                    li.classList.add("active"); // 클릭된 날짜 활성화

                    // 선택된 날짜 업데이트
                    currentDate = new Date(date);
                    targetDate = new Date(date); // 기준점도 함께 업데이트
                    console.log("선택한 날짜:", formatDate(currentDate));

                    // 선택된 날짜에 맞는 상영 시간표 조회
                    updateShowtimes();
                });

                dateList.appendChild(li); // 날짜 목록에 추가
            }
            // 이전 버튼 상태 업데이트
            prevButton.disabled = currentDate <= today;
        }


        let targetDate = new Date(); // 초기 날짜를 오늘로 설정

        const today1 = new Date();
        today1.setHours(0, 0, 0, 0);

        // 이전 버튼 클릭 이벤트
        prevButton.addEventListener("click", function () {
            const newTargetDate = new Date(targetDate);
            newTargetDate.setDate(newTargetDate.getDate() - 7);
            console.log("날짜"+newTargetDate);

            // 오늘보다 이전인지 확인
            if (newTargetDate >= today1) {
                targetDate = newTargetDate;
                generateDateList(targetDate); // 날짜 목록 갱신
                currentDate = new Date(targetDate); // 현재 선택 날짜 업데이트
                // updateShowtimes(); // 상영시간표 갱신
            } else {
                console.log("이전 날짜");
            }
        });

        // 다음 버튼 클릭 이벤트
        nextButton.addEventListener("click", function () {
            const newTargetDate = new Date(targetDate);
            newTargetDate.setDate(newTargetDate.getDate() + 7);
            targetDate = newTargetDate;
            generateDateList(targetDate); // 날짜 목록 갱신
            currentDate = new Date(targetDate); // 현재 선택 날짜 업데이트
            // updateShowtimes(); // 상영시간표 갱신
        });

        // 초기화
        generateDateList(today);

        updateShowtimes();
    });


    document.addEventListener("DOMContentLoaded", () => {
        const tabs = document.querySelectorAll(".tabs .tab");
        const cinemaListContainer = document.getElementById("cinema-list-container");

        const theaterMap = {
            "강남": 1,
            "센트럴": 2,
            "코엑스": 3,
            "홍대": 4,
            "고양스타필드": 5,
            "수원스타필드": 6,
            "안성스타필드": 7,
            "송도": 8,
            "인천논현": 9,
            "대전중앙로": 10,
            "세종나성": 11,
            "대구신세계": 12,
            "해운대": 13,
            "광주하남": 14,
            "전주혁신": 15,
            "원주혁신": 16
        }

        tabs.forEach((tab) => {
            tab.addEventListener("mouseover", () => {
                const cinemas = tab.getAttribute("data-cinemas");
                console.log("Hovered Tab Cinemas:", cinemas); // 디버깅: data-cinemas 값 확인
                if (cinemas) {
                    cinemaListContainer.innerHTML = cinemas
                        .split(", ")
                        .map(function (cinema) {
                            const theaterIdx = theaterMap[cinema];
                            if(theaterIdx) {
                                return "<a href='UserController?type=theaterDetail&theaterIdx=" + theaterIdx +"'><span>"+ cinema +"</span></a>";
                            }else {
                                return "<span>" + cinema + " (경로 없음)</span>"; // 매핑되지 않은 경우 처리
                            }
                            // .map((cinema) => ("<span>" + cinema + "</span>"))
                        })

                        .join(" | ");
                    console.log("Cinema List Container Content:", cinemaListContainer.innerHTML); // 디버깅:
                    cinemaListContainer.style.display = "block"; // 리스트 표시
                }
            });

            tab.addEventListener("mouseout", () => {
                cinemaListContainer.style.display = "none"; // 리스트 숨김
            });
        });

        cinemaListContainer.addEventListener("mouseover", () => {
            cinemaListContainer.style.display = "block"; // 리스트 유지
        });

        cinemaListContainer.addEventListener("mouseout", () => {
            cinemaListContainer.style.display = "none"; // 리스트 숨김
        });
    });

</script>

</body>
</html>