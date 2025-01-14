<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!Doctype html>
<html lang="ko">
<!-- head -->
<head>
    <jsp:include page="./common/head.jsp"/>
</head>

<body>
<!-- header 영역 -->
<jsp:include page="./common/header.jsp"/>

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
        height: 300px;
        background: url('https://via.placeholder.com/1500x300') center center/cover no-repeat;
        color: white;
        display: flex;
        align-items: center;
        justify-content: center;
        text-align: center;
    }

    .theater-header h1 {
        font-size: 48px;
        font-weight: bold;
        margin: 0;
    }

    .theater-header .tabs {
        position: absolute;
        bottom: 0;
        width: 100%;
        display: flex;
        justify-content: space-around;
        background: rgba(0, 0, 0, 0.7);
        padding: 10px 0;
        margin: 0;
    }

    .theater-header .tabs li {
        list-style: none;
        color: white;
        font-size: 16px;
        padding: 10px 20px;
        cursor: pointer;
    }

    .theater-header .tabs li:hover,
    .theater-header .tabs li.active {
        font-weight: bold;
        border-bottom: 3px solid #fff;
    }

    .content {
        display: none;
    }
    .content.active {
        display: block;
    }


    /* 탭 아래 섹션 */
    .theater-tabs {
        display: flex;
        justify-content: center;
        border-bottom: 1px solid #ddd;
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
        margin-bottom: 30px;
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

    .facility-icons {
        display: flex;
        justify-content: space-between;
        margin-bottom: 20px;
        text-align: center;
    }

    .facility-icons .icon {
        flex: 1;
    }

    .facility-icons .icon img {
        width: 60px;
        height: 60px;
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

    .navigate-btn {
        display: inline-block;
        background-color: #5a3dd2;
        color: white;
        padding: 10px 20px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-size: 14px;
        font-weight: bold;
    }

    .navigate-btn:hover {
        background-color: #4730a6;
    }



    /* 컨테이너 */
    .schedule-container {
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

    .format {
        flex: 1;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 14px;
        color: #555;
        background-color: #f4f4f4;
        padding: 10px;
        border-radius: 5px;
        margin-right: 10px;
    }




    /* 전체 컨테이너 */
    .schedule-container {
        width: 100%;
        max-width: 1100px;
        margin: 20px auto;
        padding: 20px;
        background-color: #fff;
        border-top: 1px solid #ddd; /* 상단 보더만 유지 */
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

    /* 상영 시간표 */
    .showtimes {
        margin-top: 20px;
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
        color: #555;
        background-color: #f4f4f4;
        padding: 10px;
        height: 70px; /* 높이 증가 */
        width: 60px; /* 너비 감소 */
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
        background-color: #fff;
        padding: 10px 0;
        margin: 0;
        border-top: 1px solid #ddd; /* 위쪽 보더 추가 */
        border-bottom: 1px solid #ddd; /* 아래쪽 보더 유지 */
    }

    /* 이전, 다음 버튼 */
    .nav-button {
        font-size: 18px;
        padding: 5px 10px;
        border: none;
        background: none;
        cursor: pointer;
    }

    .nav-button:hover {
        color: #5a3dd2;
    }

    /* 날짜 리스트 */
    .date-list {
        display: flex;
        flex: 1; /* 남은 공간 모두 사용 */
        justify-content: space-between; /* 날짜를 전체 너비에 고르게 배치 */
        list-style: none;
        padding: 0;
        margin: 0; /* 좌우 여백 제거 */
    }

    /* 개별 날짜 항목 */
    .date-item {
        display: flex;
        flex-direction: column;
        align-items: center;
        text-align: center;
        font-size: 14px;
        cursor: pointer;
        flex: 1; /* 각 날짜 항목의 너비를 동일하게 */
    }

    .date-item .date {
        font-size: 18px;
        margin-bottom: 3px;
    }

    .date-item .day {
        font-size: 14px;
        color: #666;
    }


    /* 비활성화된 날짜 */
    .date-item.disabled {
        color: #ddd;
        cursor: not-allowed;
    }

    /* 주말 날짜 (토요일) */
    .date-item .weekend {
        color: #0078ff; /* 파란색 */
    }

    /* 공휴일 및 일요일 */
    .date-item .holiday {
        color: #ff4c4c; /* 빨간색 */
    }

    /* 선택된 날짜 */
    .date-item.active {
        border-bottom: 2px solid #5a3dd2;
        color: #5a3dd2; /* 선택된 날짜는 기본 색상으로 유지 */
    }

    .date-item.active .day {
        font-weight: bold;
    }



    .fee-table-container {
        display: flex;
        flex-wrap: wrap;
        gap: 20px;
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
        margin-bottom: 10px;
        text-align: left;
        padding: 10px;
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



</style>

<!-- page-util -->
<div class="page-util">
    <div class="inner-wrap">
        <div class="location">
            <span>Home</span>
            <a href="/CinemaProject/jsp/user/theater.jsp" title="극장 페이지로 이동">극장</a>
            <a href="/CinemaProject/jsp/user/theater.jsp" title="전체극장 페이지로 이동">전체극장</a>
        </div>
    </div>
</div>

<!-- 극장 상단 이미지 및 메뉴 -->
<!-- 상단 이미지 섹션 -->
<div class="theater-header">
    <h1>강남</h1>
    <ul class="tabs">
        <li class="active">서울</li>
        <li>경기</li>
        <li>인천</li>
        <li>대전/충청/세종</li>
        <li>부산/대구/경상</li>
        <li>광주/전라</li>
        <li>강원</li>
    </ul>
</div>


<div class="contents">
    <!-- 탭 메뉴 -->
    <div class="theater-tabs">
        <ul>
            <li class="tab active" data-target="info">극장정보</li>
            <li class="tab" data-target="schedule">상영시간표</li>
            <li class="tab" data-target="fees">관람료</li>
        </ul>
    </div>

    <!-- 상세 내용 -->
    <div id="info" class="content active">
        <div class="theater-details">
            <h2>강남역 9번출구와 연결된 편리한 접근성과 위치!</h2>
            <p>강남을 한눈에 볼 수 있는 최상의 VIEW</p>
        </div>

        <div class="facility-transport-container">
            <!-- 시설안내 섹션 -->
            <section class="facility-guide">
                <!-- 섹션 제목 -->
                <div class="facility-header">
                    <h2 class="facility-title">시설안내</h2>
                </div>
                <div class="facility-icons">
                    <div class="icon">
                        <img src="comfort-icon.png" alt="컴포트">
                        <p>컴포트</p>
                    </div>
                    <div class="icon">
                        <img src="screen-icon.png" alt="일반상영관">
                        <p>일반상영관</p>
                    </div>
                    <div class="icon">
                        <img src="disabled-icon.png" alt="장애인석">
                        <p>장애인석</p>
                    </div>
                </div>
                <div class="floor-guide">
                    <h4>층별안내</h4>
                    <ul>
                        <li><strong>8층</strong>: 매표소, 매점, 에스컬레이터, 엘리베이터, 남자·여자 화장실, 비상계단 3</li>
                        <li><strong>9층</strong>: 1관, 2관, 남자·여자 화장실, 엘리베이터, 비상계단 3</li>
                        <li><strong>10층</strong>: 3관, 4관, 엘리베이터2, 남자·여자 화장실, 비상계단 3</li>
                        <li><strong>11층</strong>: 5관, 6관, 7관, 엘리베이터2, 남자·여자 화장실, 비상계단 3</li>
                    </ul>
                </div>
            </section>

            <!-- 교통안내 섹션 -->
            <section class="transport-guide">
                <!-- 섹션 제목 -->
                <div class="transport-header">
                    <h2 class="transport-title">교통안내</h2>
                </div>
                <div class="transport-details">
                    <p><strong>도로명주소:</strong> 서울특별시 서초구 서초대로 77길 3 (서초동) 아라타워 8층</p>
                    <button class="navigate-btn">오실시간 길찾기</button>
                </div>
            </section>
        </div>
    </div>

    <div id="schedule" class="content">
        <h2 class="schedule-title">상영스케줄</h2>
        <div class="date-picker">
            <button class="nav-button prev">&lt;</button>
            <ul class="date-list">
                <li class="date-item today">
                    <span class="date">14</span>
                    <span class="day">오늘</span>
                </li>
                <li class="date-item active">
                    <span class="date">15</span>
                    <span class="day">내일</span>
                </li>
                <li class="date-item">
                    <span class="date">16</span>
                    <span class="day">목</span>
                </li>
                <li class="date-item">
                    <span class="date">17</span>
                    <span class="day">금</span>
                </li>
                <li class="date-item">
                    <span class="date weekend">18</span>
                    <span class="day weekend">토</span>
                </li>
                <li class="date-item">
                    <span class="date holiday">19</span>
                    <span class="day holiday">일</span>
                </li>
                <li class="date-item">
                    <span class="date">20</span>
                    <span class="day">월</span>
                </li>
                <li class="date-item">
                    <span class="date">21</span>
                    <span class="day">화</span>
                </li>
                <li class="date-item">
                    <span class="date">22</span>
                    <span class="day">수</span>
                </li>
                <li class="date-item disabled">
                    <span class="date">23</span>
                    <span class="day">목</span>
                </li>
            </ul>
            <button class="nav-button next">&gt;</button>
        </div>



        <div class="schedule-container">
            <!-- 영화 정보 -->
            <div class="movie-info">
                <div class="movie-rating">
                    <span>15</span>
                </div>
                <div class="movie-details">
                    <strong>하얼빈</strong>
                    <span>상영중 / 상영시간 113분</span>
                </div>
            </div>

            <!-- 상영 시간표 -->
            <div class="showtimes">
                <!-- 상영관 -->
                <div class="theater">
                    <div class="theater-info">
                        <strong>1관</strong>
                        <span>총 232석</span>
                    </div>
                    <div class="format">
                        <span>2D</span>
                    </div>
                    <div class="time-slots">
                        <a href="#">11:30 <span>228석</span></a>
                        <a href="#">13:50 <span>225석</span></a>
                        <a href="#">16:10 <span>229석</span></a>
                        <a href="#">18:30 <span>228석</span></a>
                        <a href="#">20:50 <span>232석</span></a>
                    </div>
                </div>

                <!-- 다른 상영관 -->
                <div class="theater">
                    <div class="theater-info">
                        <strong>컴포트 4관 [리클라이너] [Laser]</strong>
                        <span>총 53석</span>
                    </div>
                    <div class="format">
                        <span>2D</span>
                    </div>
                    <div class="time-slots">
                        <a href="#">22:10 <span>53석</span></a>
                    </div>
                </div>
            </div>
        </div>


    </div>

    <div id="fees" class="content active">
        <h2 class="fees-title">영화관람료</h2>

        <div class="fee-table-container">
            <!-- 첫 번째 표 -->
            <table class="fee-table">
                <caption>2D</caption>
                <thead>
                <tr>
                    <th>요일</th>
                    <th>상영시간</th>
                    <th>일반</th>
                    <th>청소년</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>월~목</td>
                    <td>조조 (06:00~)</td>
                    <td>10,000</td>
                    <td>8,000</td>
                </tr>
                <tr>
                    <td>월~목</td>
                    <td>일반 (10:01~)</td>
                    <td>14,000</td>
                    <td>12,000</td>
                </tr>
                <tr>
                    <td>금~일<br>공휴일</td>
                    <td>조조 (06:00~)</td>
                    <td>11,000</td>
                    <td>9,000</td>
                </tr>
                <tr>
                    <td>금~일<br>공휴일</td>
                    <td>일반 (10:01~)</td>
                    <td>15,000</td>
                    <td>13,000</td>
                </tr>
                </tbody>
            </table>

            <!-- 두 번째 표 -->
            <table class="fee-table">
                <caption>3D</caption>
                <thead>
                <tr>
                    <th>요일</th>
                    <th>상영시간</th>
                    <th>일반</th>
                    <th>청소년</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>월~목</td>
                    <td>조조 (06:00~)</td>
                    <td>12,000</td>
                    <td>10,000</td>
                </tr>
                <tr>
                    <td>월~목</td>
                    <td>일반 (10:01~)</td>
                    <td>16,000</td>
                    <td>14,000</td>
                </tr>
                <tr>
                    <td>금~일<br>공휴일</td>
                    <td>조조 (06:00~)</td>
                    <td>13,000</td>
                    <td>11,000</td>
                </tr>
                <tr>
                    <td>금~일<br>공휴일</td>
                    <td>일반 (10:01~)</td>
                    <td>17,000</td>
                    <td>15,000</td>
                </tr>
                </tbody>
            </table>
        </div>

        <div class="fee-table-container">
            <!-- 세 번째 표 -->
            <table class="fee-table">
                <caption>COMFORT by MEGA 2D</caption>
                <thead>
                <tr>
                    <th>요일</th>
                    <th>상영시간</th>
                    <th>일반</th>
                    <th>청소년</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>월~목</td>
                    <td>조조 (06:00~)</td>
                    <td>11,000</td>
                    <td>9,000</td>
                </tr>
                <tr>
                    <td>월~목</td>
                    <td>일반 (10:01~)</td>
                    <td>15,000</td>
                    <td>13,000</td>
                </tr>
                <tr>
                    <td>금~일<br>공휴일</td>
                    <td>조조 (06:00~)</td>
                    <td>12,000</td>
                    <td>10,000</td>
                </tr>
                <tr>
                    <td>금~일<br>공휴일</td>
                    <td>일반 (10:01~)</td>
                    <td>16,000</td>
                    <td>14,000</td>
                </tr>
                </tbody>
            </table>

            <!-- 네 번째 표 -->
            <table class="fee-table">
                <caption>COMFORT by MEGA 3D</caption>
                <thead>
                <tr>
                    <th>요일</th>
                    <th>상영시간</th>
                    <th>일반</th>
                    <th>청소년</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>월~목</td>
                    <td>조조 (06:00~)</td>
                    <td>13,000</td>
                    <td>11,000</td>
                </tr>
                <tr>
                    <td>월~목</td>
                    <td>일반 (10:01~)</td>
                    <td>17,000</td>
                    <td>15,000</td>
                </tr>
                <tr>
                    <td>금~일<br>공휴일</td>
                    <td>조조 (06:00~)</td>
                    <td>14,000</td>
                    <td>12,000</td>
                </tr>
                <tr>
                    <td>금~일<br>공휴일</td>
                    <td>일반 (10:01~)</td>
                    <td>18,000</td>
                    <td>16,000</td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>

</div>


<!-- footer 영역 -->
<jsp:include page="./common/footer.jsp"/>

<!-- script 영역 -->
<script>
    document.addEventListener('DOMContentLoaded', () => {
        const tabs = document.querySelectorAll('.theater-tabs .tab');
        const contents = document.querySelectorAll('.content');

        tabs.forEach(tab => {
            tab.addEventListener('click', () => {
                // 모든 탭에서 active 제거
                tabs.forEach(t => t.classList.remove('active'));
                tab.classList.add('active');

                // 모든 콘텐츠에서 active 제거
                contents.forEach(content => content.classList.remove('active'));
                // 클릭된 탭의 콘텐츠 활성화
                const target = tab.getAttribute('data-target');
                document.getElementById(target).classList.add('active');
            });
        });
    });

</script>
</body>
</html>