<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <jsp:include page="../common/head.jsp"/>
    <title>빠른 예매</title>
    <style>
    /* Dialog Container */
    .custom-dialog -container {
    width: 700px;
        max-width: 700px;
    height: 480px;
        max-height: 480px;
    background-color: #fff;
    border-radius: 3px;
    overflow: hidden;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);
    display: flex;
    flex-direction: column;
    }

    .custom-body {
        width: 100% !important;
        height: auto !important;
    }

    .content-body {
        height: auto !important;
    }

    /* Header */
    .custom-dialog -header {
    background-color: #6a5acd;
    color: white;
    padding: 15px;
    font-size: 18px;
    font-weight: bold;
    }

    /* Tabs */
    .custom-tabs {
    display: flex;
        width: 100%;
    background-color: #f4f4f4;
    border-bottom: 1px solid #ddd;
    }

    .custom-tab {
    flex: 1;
    text-align: center;
    padding: 10px;
    cursor: pointer;
    font-size: 16px;
    font-weight: bold;
    color: #6a5acd;
    border-bottom: 2px solid transparent;
    }

    .custom-tab.active {
    color: #000;
    border-bottom: 2px solid #6a5acd;
    }

    /* Content */
    .custom-content #customMemberLogin {
    display: none;
    flex: 1;
    padding: 20px;
    }

    .tab-content .active#customMemberLogin {
    display: grid;
    grid-template-columns: 1fr 1fr; /* 좌우 1:1 비율 */
    gap: 20px;
    align-items: center;
    }

    /* 로그인 영역 */
    .custom-login-container input,
    .custom-login-container button {
    width: 100%;
    padding: 10px;
    margin-bottom: 15px;
    font-size: 14px;
    box-sizing: border-box;
    }

    .custom-login-container button {
    background-color: #6a5acd;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    }

    .custom-login-container button:hover {
    background-color: #5a4cad;
    }

    .custom-login-footer {
    text-align: center;
    margin-top: 10px;
    }

    .custom-login-footer a {
    margin: 0 5px;
    color: #6a5acd;
    text-decoration: none;
    }

    .custom-login-footer a:hover {
    text-decoration: underline;
    }

    /* 이미지 영역 */
    .custom-image-container {
    width: 100%;
    height: 100%;
    display: flex;
    justify-content: center;
    overflow: hidden;
    }

    .custom-image-container img {
    max-width: 100%;
    max-height: 100%;
    object-fit: cover;
    }

    /* 비회원 로그인 섹션 */
    .custom-content #customNonMemberLogin {
    display: none;
    height: 100%;
    padding: 20px 20px 0px 20px;
    }

    .tab-content .active#customNonMemberLogin {
    display: grid; /* 그리드 레이아웃 */
    grid-template-columns: 1fr 1fr; /* 좌우 1:1 비율 */
    gap: 20px; /* 좌우 간격 */
    align-items: stretch; /* 높이를 동일하게 설정 */
    }

    /* 공통 폰트 크기 */
    .custom-info-box, .custom-info-box-table td {
    font-size: 12px; /* 전체적으로 폰트 크기 줄임 */
    }

    /* 왼쪽 테이블 컨테이너 */
    .custom-info-box-left {
    display: flex;
    flex-direction: column;
    justify-content: space-between; /* 상하 간격 균일 */
    background-color: #f5f5f5; /* 회색 배경 */
    border-radius: 10px;
    padding: 10px; /* 패딩 조정 */
    box-sizing: border-box;
    height: 100%; /* 부모 높이에 맞춤 */
    }

    /* 테이블 스타일 */
    .custom-info-box-table {
    width: 100%;
    border-collapse: collapse;
    }

    .custom-info-box-table td {
    padding: 6px; /* 패딩 축소 */
    font-size: 12px; /* 폰트 크기 축소 */
    vertical-align: middle; /* 텍스트 가운데 정렬 */
    background-color: #f5f5f5; /* 기본 회색 배경 */
    }

    .custom-info-box-table td:first-child {
    font-weight: bold;
    width: 30%; /* 첫 번째 열 폭 조정 */
    text-align: left;
    }

    .custom-info-box-table input {
    width: 100%;
    padding: 6px; /* 패딩 축소 */
    font-size: 12px; /* 폰트 크기 축소 */
    border: 1px solid #ddd;
    border-radius: 5px;
    box-sizing: border-box;
    background-color: white; /* Input만 흰색 배경 */
    }

    .custom-info-box-table button {
    padding: 6px 10px;
    background-color: #6a5acd;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 12px; /* 버튼 폰트 크기 축소 */
    }

    .custom-info-box-table button:hover {
    background-color: #5a4cad;
    }

    /* 오른쪽 정보 박스 */
    .custom-info-box {
    background-color: #f9f9f9;
    border-radius: 10px;
    padding: 10px; /* 패딩 축소 */
    box-sizing: border-box;
    height: 100%; /* 부모 높이에 맞춤 */
    }

    .custom-info-box h3 {
    font-size: 14px; /* 제목 크기 유지 */
    color: #333;
    margin-bottom: 10px;
    }

    .custom-info-box .radio-group {
    display: flex;
    gap: 10px;
    margin-top: 10px;
    }

    .custom-info-box .radio-group label {
    font-size: 12px; /* 라디오 버튼 폰트 축소 */
    color: #666;
    }

    .custom-info-box p {
    font-size: 12px; /* 설명 폰트 축소 */
    color: #555;
    margin-bottom: 8px;
    }

    .custom-info-box p:last-child {
    font-size: 10px; /* 마지막 문구 크기 더 축소 */
    color: #888;
    }

    /* 확인 버튼 스타일 */
    .custom-submit -button-container {
    grid-column: span 2; /* 버튼이 두 열을 차지 */
    text-align: center; /* 가운데 정렬 */
    }

    .custom-submit-button-container button {
    padding: 8px 16px;
    background-color: #6a5acd;
    color: white;
    border: none;
    border-radius: 5px;
    font-size: 14px; /* 버튼 폰트 크기 유지 */
    cursor: pointer;
    }

    .custom-submit-button-container button:hover {
    background-color: #5a4cad;
    }

    .btn-primary {
        margin-top: 70px;
    }

    .input-size {
        width: 130px !important;
    }
    </style>

</head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/reservation.css">
<body>
<jsp:include page="../common/header.jsp"/>
<a href="#" id="reservation-login-btn" title="로그인" data-bs-toggle="modal" data-bs-target="#customLoginModal">비회원로그인</a>
<div id="contents">
    <!-- 추가된 page-util -->
    <div class="page-util">
        <div class="inner-wrap">
            <div class="location">
                <span>Home</span>
                <a href="/booking" title="예매 페이지로 이동">예매</a>
                <a href="/booking" title="빠른예매 페이지로 이동">빠른예매</a>
            </div>
        </div>
    </div>
    <div id="content">
        <div class="res-main">
            <h1 class="res-title">빠른 예매</h1>
            <div class="res-container">
                <nav class="date-navigation">
                    <button id="prev-button">◀</button>
                    <ul id="date-list">
                        <%-- 날짜 동적 --%>
                    </ul>
                    <button id="next-button">▶</button>
                </nav>
                <div class="content">
                    <div class="movie-selection">
                        <h2>영화</h2>
                        <ul class="movie-list">
                            <c:if test="${empty movies}">
                                <p>영화 데이터가 없습니다.</p>
                            </c:if>
                            <c:forEach var="movie" items="${movies}">
                                <li data-movie-id="${movie.movieIdx}">
                                    <img src="${pageContext.request.contextPath}/css/user/images/ratings/${movie.movieGrade}.png" class="rating-image" />
                                    ${movie.movieTitle}
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                    <div class="theater-selection">
                        <h2>극장</h2>
                        <ul id="region-list">
                            <c:forEach var="theater" items="${requestScope.theaters}">
                                <li>
                                    <!-- 큰 지역 클릭 시 Ajax 요청 -->
                                    <a href="#" class="region-link" data-region="${theater.key}">
                                            ${theater.key} (${theater.value})
                                    </a>
                                </li>
                            </c:forEach>
                        </ul>
                        <ul id="theater-region-list">
                            <a>지역을 선택해주세요.</a>
                        </ul>
                    </div>
                    <div class="time-selection">
                        <h2>시간</h2>
                        <p id="time-selection">영화와 극장을 선택하시면 상영 시간표를 비교하여 볼 수 있습니다.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="customLoginModal" tabindex="-1" aria-labelledby="customLoginModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg">
        <div class="modal-content content-body">
            <!-- 모달 헤더 -->
            <div class="modal-header">
                <h5 class="modal-title" id="customLoginModalLabel">로그인</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>

            <!-- 모달 바디 -->
            <div class="modal-body custom-body">
                <!-- 탭 메뉴 -->

                <div class="custom-tabs nav nav-tabs d-flex justify-content-center">
                    <a class="custom-tab nav-link active" data-bs-toggle="tab" href="#customMemberLogin">회원 로그인</a>
                    <a class="custom-tab nav-link" data-bs-toggle="tab" href="#customNonMemberLogin">비회원 로그인</a>
                </div>


                <!-- 탭 컨텐츠 -->
                <div class="tab-content mt-3">
                    <!-- 회원 로그인 -->
                    <div class="tab-pane fade show active" id="customMemberLogin">
                        <div class="custom-login-container">
                            <input type="text" class="custom-login-input form-control" placeholder="아이디">
                            <input type="password" class="custom-login-input form-control mt-3" placeholder="비밀번호">
                            <button class="custom-login-button btn btn-primary mt-3">로그인</button>
                            <div class="custom-login-footer mt-3">
                                <a href="#">ID/PW 찾기</a>
                                <a href="#" class="ms-3">회원가입</a>
                                <a href="#" class="ms-3">비회원 예매확인</a>
                            </div>
                        </div>
                        <div class="custom-image-container text-center mt-3">
                            <img src="${pageContext.request.contextPath}/css/user/images/event/렛미인포스터.png" alt="이미지" class="img-fluid">
                        </div>
                    </div>

                    <!-- 비회원 로그인 -->
                    <div class="tab-pane fade custom-content" id="customNonMemberLogin">
                        <div class="custom-info-box-left">
                            <table class="custom-info-box-table table">
                                <tr>
                                    <td>이름</td>
                                    <td><input type="text" class="form-control" placeholder="이름"></td>
                                </tr>
                                <tr>
                                    <td>생년월일</td>
                                    <td><input type="text" class="form-control" placeholder="생년월일 앞 6자리"></td>
                                </tr>
                                <tr>
                                    <td>휴대폰 번호</td>
                                    <td>
                                        <div class="d-flex gap-2">
                                            <input type="text" class="form-control input-size" placeholder="'-' 없이 입력">
                                            <button class="btn btn-outline-primary">인증요청</button>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>인증번호</td>
                                    <td>
                                        <div class="d-flex gap-2">
                                            <input type="text" class="form-control" placeholder="인증번호">
                                            <span class="text-danger" style="font-size: 12px;">3:00</span>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>비밀번호</td>
                                    <td><input type="password" class="form-control" placeholder="비밀번호 (숫자 4자리)"></td>
                                </tr>
                                <tr>
                                    <td>비밀번호 확인</td>
                                    <td><input type="password" class="form-control" placeholder="비밀번호 (숫자 4자리) 확인"></td>
                                </tr>
                            </table>
                        </div>

                        <!-- 개인정보 처리방침 -->
                        <div class="custom-info-box">
                            <h3>비회원 개인정보 처리방침</h3>
                            <p><strong>수집목적:</strong> 비회원 예매 서비스 제공, 이용자 식별, 구매 및 결제</p>
                            <p><strong>수집항목:</strong> 이름, 생년월일, 휴대폰 번호, 비밀번호</p>
                            <p><strong>보유기간:</strong> 관람 또는 취소 후 7일 이내</p>
                            <div class="radio-group">
                                <label><input type="radio" name="customAgree"> 동의</label>
                                <label><input type="radio" name="customAgree"> 미동의</label>
                            </div>
                            <p style="font-size: 10px; color: #888;">
                                정보 수집에 동의하지 않을 경우, 비회원 예매 서비스를 이용할 수 없습니다.
                            </p>
                            <div class="text-center mt-3">
                                <button class="btn btn-primary">확인</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="../common/footer.jsp"/>
<script>
    document.addEventListener("DOMContentLoaded", () => {
        var contextPath = "${pageContext.request.contextPath}";

        // 지역 관련 변수
        const regionLinks = document.querySelectorAll(".region-link");
        const theaterRegionList = document.querySelector("#theater-region-list");

        // 영화 및 극장 선택 관련 변수
        const movieSelection = document.querySelector(".movie-list");
        const theaterSelection = document.querySelector("#theater-region-list");
        const timeSelectionContainer = document.querySelector("#time-selection");

        // 선택된 값 저장 변수
        let selectedMovieIdx = null;
        let selectedTheaterIdx = null;

        // 현재 날짜
        const today = new Date();
        let currentDate = new Date(today);
        let currentDateStr = currentDate.getFullYear() + "-" + String(currentDate.getMonth() + 1).padStart(2, "0") + "-" + String(currentDate.getDate()).padStart(2, "0");

        console.log("오늘 날짜:", currentDateStr);

        regionLinks.forEach(link => {
            link.addEventListener("click", async (event) => {
                event.preventDefault();

                const region = link.getAttribute("data-region").trim();
                console.log("클릭한 지역: [" + region + "]");

                const url = contextPath + "/UserController?type=subregions&region=" + encodeURIComponent(region);

                try {
                    const response = await fetch(url);
                    if (!response.ok) {
                        throw new Error("HTTP error! status: " + response.status);
                    }
                    const theaterName = await response.json();
                    theaterRegionList.innerHTML = "";
                    if (theaterName && theaterName.length > 0) {
                        theaterName.forEach(theater => {
                            const li = document.createElement("li");
                            const a = document.createElement("a");

                            // 극장 이름과 ID 추가
                            a.textContent = theater.theaterName;
                            a.setAttribute("theaterIdx", theater.theaterIdx);

                            // li에 a 추가
                            li.appendChild(a);
                            theaterRegionList.appendChild(li);
                        });
                    } else {
                        theaterRegionList.innerHTML = "<p>선택한 지역에 극장이 없습니다.</p>";
                    }
                } catch (err) {
                    console.error("AJAX 요청 중 오류 발생:", err);
                }
            });
        });

        // 시간표 업데이트
        async function updateShowtimes() {
            if (!selectedMovieIdx || !selectedTheaterIdx) {
                timeSelectionContainer.innerHTML = "<p>영화와 극장을 선택하면 시간표를 볼 수 있습니다.</p>";
                return;
            }
            try {
                const url = contextPath + "/UserController?type=timetable&movieIdx=" + selectedMovieIdx + "&theaterIdx=" + selectedTheaterIdx + "&targetDate=" + currentDateStr;
                const response = await fetch(url);

                if (!response.ok) throw new Error("HTTP error! status: " + response.status);

                const showtimes = await response.json();
                renderTimetable(showtimes);
            } catch (err) {
                console.error("시간표 업데이트 중 오류:", err);
                timeSelectionContainer.innerHTML = "<p>상영 시간표를 가져오는 데 실패했습니다.</p>";
            }
        }

        // 시간표 렌더링
        function renderTimetable(showtimes) {
            if (!showtimes || showtimes.length === 0) {
                timeSelectionContainer.innerHTML = "<p>" + currentDateStr + " 상영 데이터 조회중</p>";
                return;
            }

            const screenTypeMapping = {
                1: "COMFORT",
                2: "VIP",
                3: "DOLBY",
                4: "4DX",
                5: "IMAX"
            };

            const ul = document.createElement("ul");
            ul.classList.add("time-table");

            // 현재 시간을 가져오는 변수 추가
            const currentTime = new Date();

            // 상영관별 첫 번째 상영 여부를 추적하기 위한 Map
            const firstShowtime = new Map();

            showtimes.forEach(function(showtime) {
                console.log("showtime 데이터 확인:", showtime); // 데이터 확인

                // 상영 시작 시간을 Date 객체로 변환
                const startTime = new Date(showtime.timetableStartTime);

                // 지난 시간 제외
                if (startTime < currentTime) {
                    console.log("지난 시간 제외:", showtime.timetableStartTime);
                    return;
                }

                const li = document.createElement("li");
                const screenTypeText = screenTypeMapping[showtime.screenType];
                const screenName = showtime.screenName;

                // 상영 시작 시간을 시간 단위로 파싱
                const startTimeParts = showtime.timetableStartTime
                    ? showtime.timetableStartTime.split(" ")
                    : ["", "00:00:00"]; // 기본 값 설정
                // 시간 단위 추출 (split(":") 적용)
                const startHour = parseInt(startTimeParts[1]?.split(":")[0] || "0", 10);


                // 조조 여부 판단
                let isMorning = false;
                // 상영관별로 첫 번째 상영인지 확인
                if (!firstShowtime.has(screenName)) {
                    firstShowtime.set(screenName, true); // 첫 번째 상영 등록

                    // 조조 시간대 여부 판단 (9시 이전 시작)
                    if (startHour === 9) {
                        console.log("조조 아이콘 추가 중...");
                        isMorning = true;

                        const morningIcon = document.createElement("img");
                        morningIcon.src = contextPath + "/css/user/images/ico-sun.png";
                        morningIcon.alt = "조조";
                        morningIcon.style.width = "14px";
                        morningIcon.style.height = "14px";
                        morningIcon.style.margin = "3px 5px 0 0";
                        morningIcon.style.display = "inline-block";

                        li.insertBefore(morningIcon, li.firstChild);
                        console.log("조조 아이콘 추가 완료");
                    }
                }

                // 상영 시간과 화면 정보 업데이트
                li.innerHTML += showtime.timetableStartTime.split(" ")[1] + " ~ " + showtime.timetableEndTime.split(" ")[1] + " [" + showtime.screenName + "] [" + screenTypeText + "]";
                // li.textContent = showtime.timetableStartTime.split(" ")[1] + " ~ " + showtime.timetableEndTime.split(" ")[1] + " [" + showtime.screenName + "] [" + screenTypeText + "]";

                li.setAttribute("data-timetable-id", showtime.timetableIdx);
                li.setAttribute("data-screen-idx", showtime.screenIdx);
                li.setAttribute("data-screen-type", showtime.screenType);
                // 조조(0) 또는 일반(1) 정보 추가
                li.setAttribute("data-morning", isMorning ? "0" : "1");
                ul.appendChild(li);
            });

            timeSelectionContainer.innerHTML = "";
            timeSelectionContainer.appendChild(ul);
        }

        // 영화 선택 이벤트
        movieSelection.addEventListener("click", function(event) {
            const selectedElement = event.target.closest("li");
            if (selectedElement) {
                movieSelection.querySelectorAll(".selected").forEach(function(el) {
                    el.classList.remove("selected");
                });
                selectedElement.classList.add("selected");

                selectedMovieIdx = selectedElement.getAttribute("data-movie-id");
                console.log("선택한 영화 ID:", selectedMovieIdx);

                updateShowtimes();
            }
        });

        // 극장 선택 이벤트
        theaterSelection.addEventListener("click", function(event) {
            const selectedElement = event.target.closest("a");
            if (selectedElement) {
                theaterSelection.querySelectorAll(".selected").forEach(function(el) {
                    el.classList.remove("selected");
                });
                selectedElement.classList.add("selected");

                selectedTheaterIdx = selectedElement.getAttribute("theaterIdx");
                console.log("선택한 극장 ID:", selectedTheaterIdx);

                updateShowtimes();
            }
        });

        // 시간표 클릭 시 좌석 페이지로 이동
        timeSelectionContainer.addEventListener("click", function(event) {
            const listItem = event.target.closest("li"); // 'li' 요소 확인
            if (listItem) {
                const timetableIdx = listItem.getAttribute("data-timetable-id");
                const screenIdx = listItem.getAttribute("data-screen-idx");
                const screenType = listItem.getAttribute("data-screen-type");
                const isMorning = listItem.getAttribute("data-morning");
                const isWeekend = (currentDate.getDay() === 0 || currentDate.getDay() === 6) ? true : false;

                console.log("클릭된 시간표 데이터:", {
                    timetableIdx: timetableIdx,
                    screenIdx: screenIdx,
                    screenType: screenType,
                    selectedMovieIdx: selectedMovieIdx,
                    selectedTheaterIdx: selectedTheaterIdx,
                    isMorning: isMorning,
                    isWeekend: isWeekend,
                });

                if (timetableIdx && screenIdx && selectedMovieIdx && selectedTheaterIdx) {
                    const url = contextPath + "/UserController?type=seat&movieIdx=" + selectedMovieIdx +
                        "&screenIdx=" + screenIdx +
                        "&timetableIdx=" + timetableIdx +
                        "&screenType=" + screenType +
                        "&isMorning=" + isMorning +
                        "&isWeekend=" + isWeekend;

                    console.log("생성된 URL:", url);
                    window.location.href = url;
                } else {
                    console.error("필수 데이터가 누락되었습니다.");
                }
            }
        });

        // 날짜 네비게이션 실행
        const dateList = document.querySelector("#date-list");
        const prevButton = document.querySelector("#prev-button");
        const nextButton = document.querySelector("#next-button");

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
            return day === 0 || day === 6;
        }

        // 날짜 목록 생성
        function generateDateList(selectedDate) {
            dateList.innerHTML = "";

            for (let i = -3; i <= 3; i++) {
                const date = new Date(selectedDate);
                date.setDate(date.getDate() + i);

                const li = document.createElement("li");
                li.textContent = formatDay(date) + " · " + date.getDate();
                li.dataset.date = formatDate(date);
                li.style.color = isWeekend(date) ? "red" : "black";

                if (formatDate(date) === formatDate(currentDate)) {
                    li.classList.add("selected");
                }

                li.addEventListener("click", function() {
                    dateList.querySelectorAll("li").forEach(function(el) {
                        el.classList.remove("selected");
                    });
                    li.classList.add("selected");

                    currentDate = new Date(date);
                    currentDateStr = formatDate(currentDate);
                    console.log("선택한 날짜:", currentDateStr);

                    updateShowtimes();
                });

                dateList.appendChild(li);
            }
        }

        // 이전 버튼 클릭 이벤트
        prevButton.addEventListener("click", function() {
            currentDate.setDate(currentDate.getDate() - 7);
            generateDateList(currentDate);
        });

        // 다음 버튼 클릭 이벤트
        nextButton.addEventListener("click", function() {
            currentDate.setDate(currentDate.getDate() + 7);
            generateDateList(currentDate);
        });

        // 초기화
        generateDateList(today);
    });
</script>
</body>
</html>