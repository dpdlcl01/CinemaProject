<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <jsp:include page="../common/head.jsp"/>
</head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/reservation.css?v=1.0">
<body>
<jsp:include page="../common/header.jsp"/>
    <!-- 추가된 page-util -->
    <div class="page-util">
        <div class="inner-wrap">
            <div class="location">
                <span>Home</span>
                <img src="https://img.megabox.co.kr/static/pc/images/common/bg/bg-location-arr.png"/>
                <label>예매</label>
                <img src="https://img.megabox.co.kr/static/pc/images/common/bg/bg-location-arr.png"/>
                <label>빠른예매</label>
            </div>
        </div>
    </div>
<div class="contents">
    <div id="content">
        <div class="res-main">
            <h1 class="res-title">빠른예매</h1>
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
<!-- 예매 로그인 모달 창 -->
<jsp:include page="../login/reservationLoginModal.jsp"/>
<!-- (임시 버튼) -->
<script>
    document.addEventListener("DOMContentLoaded", () => {
        var contextPath = "${pageContext.request.contextPath}";

        // 지역 관련 변수
        const regionLinks = document.querySelectorAll(".region-link");

        // 영화 및 극장 선택 관련 변수
        const movieSelection = document.querySelector(".movie-list");
        // const theaterSelection = document.querySelector(".theater-region-list");
        const timeSelectionContainer = document.querySelector("#time-selection");

        // 선택된 값 저장 변수
        let selectedMovieIdx = null;
        let selectedTheaterIdx = null;

        // 현재 날짜
        const today = new Date();
        let currentDate = new Date(today);
        let currentDateStr = currentDate.getFullYear() + "-" + String(currentDate.getMonth() + 1).padStart(2, "0") + "-" + String(currentDate.getDate()).padStart(2, "0");

        console.log("오늘 날짜:", currentDateStr);

        // 지역 선택
        regionLinks.forEach(link => {
            link.addEventListener("click", async (event) => {
                event.preventDefault();

                const parentLi = link.closest("li"); // 클릭한 지역의 <li> 요소
                const existingList = parentLi.querySelector(".theater-region-list");

                // 이미 하위 리스트가 있으면 삭제 (토글 기능)
                if (existingList) {
                    existingList.remove();
                    return;
                }

                // 다른 열린 리스트 닫기
                document.querySelectorAll(".theater-region-list").forEach(list => {
                    list.remove();
                });

                // 새로운 하위 리스트 생성
                const theaterRegionList = document.createElement("ul");
                theaterRegionList.classList.add("theater-region-list");
                theaterRegionList.style.margin = "-10px 20px";
                theaterRegionList.style.height = "auto";

                const region = link.getAttribute("data-region").trim();
                console.log("클릭한 지역: " + region);

                try {
                    const url = contextPath + "/UserController?type=subregions&region=" + encodeURIComponent(region);
                    const response = await fetch(url);

                    if (!response.ok) {throw new Error("HTTP error! status: " + response.status);}

                    const theaterData = await response.json();

                    if (theaterData && theaterData.length > 0) {
                        theaterData.forEach(theater => {
                            const li = document.createElement("li");
                            const a = document.createElement("a");

                            a.textContent = theater.theaterName;
                            a.href = "#";
                            a.setAttribute("data-theater-id", theater.theaterIdx);

                            a.addEventListener("click", (e) => {
                                e.preventDefault();
                                selectedTheaterIdx = theater.theaterIdx;
                                console.log("선택한 극장 ID:", selectedTheaterIdx);
                                updateShowtimes(); // 극장 선택 후 시간표 업데이트
                            });

                            li.appendChild(a);
                            theaterRegionList.appendChild(li);
                        });
                    } else {
                        const noDataMessage = document.createElement("li");
                        noDataMessage.textContent = "해당 지역에 극장이 없습니다.";
                        theaterRegionList.appendChild(noDataMessage);
                    }
                } catch (err) {
                    console.error("AJAX 요청 중 오류 발생:", err);
                    const errorMessage = document.createElement("li");
                    errorMessage.textContent = "데이터를 가져오는 데 실패했습니다.";
                    theaterRegionList.appendChild(errorMessage);
                }

                parentLi.appendChild(theaterRegionList); // 리스트를 클릭한 지역 아래에 추가
            });
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
            console.log("generateDateList 실행됨");
            dateList.innerHTML = "";

            // 오늘 날짜의 시간 정보를 제거 (00:00:00 기준)
            const todayNoTime = new Date();
            todayNoTime.setHours(0, 0, 0, 0);

            for (let i = -3; i <= 3; i++) {
                const date = new Date(selectedDate);
                date.setDate(date.getDate() + i);

                // 생성된 날짜에서도 시간 정보를 0으로 초기화하여 비교할 변수 생성
                const dateNoTime = new Date(date);
                dateNoTime.setHours(0, 0, 0, 0);

                const li = document.createElement("li");
                li.textContent = formatDay(date) + " · " + date.getDate();
                li.dataset.date = formatDate(date);
                li.style.color = isWeekend(date) ? "red" : "black";

                console.log("📆 생성된 날짜:", li.dataset.date, "현재 날짜:", formatDate(todayNoTime));

                // 오늘보다 이전 날짜라면 클릭 불가로 처리
                if (dateNoTime < todayNoTime) {
                    li.classList.add("disabled");
                    li.style.pointerEvents = "none";  // 클릭 방지
                    li.style.opacity = "0.5";          // 시각적으로 비활성화 표시
                } else {
                    // 오늘 이후 또는 오늘인 경우 클릭 이벤트 등록
                    li.addEventListener("click", function () {
                        // 다른 날짜의 selected 클래스 제거
                        dateList.querySelectorAll("li").forEach(function(el) {
                            el.classList.remove("selected");
                        });
                        li.classList.add("selected");

                        currentDate = new Date(li.dataset.date);
                        currentDateStr = formatDate(currentDate);
                        console.log("선택한 날짜:", currentDateStr);

                        updateShowtimes();
                    });
                }

                // 오늘 날짜이면 selected 처리 (옵션)
                if (li.dataset.date === formatDate(todayNoTime)) {
                    li.classList.add("selected");
                }

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

        // 시간표 렌더링
        function renderTimetable(showtimes) {
            if (!showtimes || showtimes.length === 0) {
                timeSelectionContainer.innerHTML = "<p> 해당 일자에 상영 시간표가 없습니다. </p>";
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

                // 첫 번째 줄: 상영 시간 + 상영관 정보
                li.innerHTML += "<div class='time-info'>" +
                    "<span>" + showtime.timetableStartTime.split(" ")[1] + " ~ " + showtime.timetableEndTime.split(" ")[1] + "</span>" +
                    "<span>" + showtime.screenName + "</span>" +
                    "</div>";

                // 두 번째 줄: 좌석 정보 (우측 정렬)
                li.innerHTML += "<div class='seat-info'>" +
                    "<span>" + showtime.availableSeats + " / " + showtime.screenSeatCount + " 좌석</span>" +
                    "</div>";

                li.setAttribute("data-timetable-id", showtime.timetableIdx);
                li.setAttribute("data-theater-idx", showtime.theaterIdx);
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
        movieSelection.addEventListener("click", async function(event) {
            const selectedElement = event.target.closest("li");
            if (selectedElement) {
                movieSelection.querySelectorAll(".selected").forEach(function(el) {
                    el.classList.remove("selected");
                });
                selectedElement.classList.add("selected");

                selectedMovieIdx = selectedElement.getAttribute("data-movie-id");
                console.log("선택한 영화 ID:", selectedMovieIdx);

                // 🎯 영화가 선택되면 해당 영화가 상영하는 극장 리스트 가져오기
                await updateTheaterList(selectedMovieIdx);

                // 강제로 UI 업데이트
                autoClickFirstAvailableRegion();
                updateShowtimes();
            }
        });

        async function updateTheaterList(movieIdx) {
            try {
                const url = contextPath + "/UserController?type=availableTheaters&movieIdx=" + movieIdx;
                const response = await fetch(url);

                if (!response.ok) throw new Error("HTTP error! status: " + response.status);

                const availableTheaters = await response.json();
                console.log("🎥 선택한 영화의 상영 극장 목록:", availableTheaters);

                // 🚨 추가: 서버에서 데이터가 비어 있으면 콘솔에 경고 메시지 출력
                if (!availableTheaters || availableTheaters.length === 0) {
                    console.warn("🚨 서버에서 해당 영화의 극장 데이터를 내려주지 않음!");
                    return;
                }

                // `availableTheaters` 배열에서 `theaterIdx` 값만 추출하여 새로운 배열 생성
                const availableTheaterIds = availableTheaters.map(theater => String(theater.theaterIdx)); // 문자열 변환

                // 🎯 theaterRegion(지역) 목록 추출
                const availableRegions = new Set(availableTheaters.map(theater => theater.theaterRegion));

                document.querySelectorAll(".region-link").forEach(link => {
                    const region = link.getAttribute("data-region").trim();
                    const regionLi = link.closest("li");
                    const theaters = regionLi.querySelectorAll("ul.theater-region-list li a");

                    let hasActiveTheater = false;

                    // 🎯 현재 지역이 활성화 대상인지 확인 후 적용
                    if (availableRegions.has(region)) {
                        regionLi.classList.remove("disabled");
                        regionLi.style.opacity = "1";
                        regionLi.style.pointerEvents = "auto";
                    } else {
                        regionLi.classList.add("disabled");
                        regionLi.style.opacity = "0.5";
                        regionLi.style.pointerEvents = "none";
                    }

                    // 🎯 지역 안의 극장 개별 활성화
                    if (theaters.length > 0) {
                        theaters.forEach(theater => {
                            const theaterIdx = String(theater.getAttribute("data-theater-id"));

                            if (availableTheaterIds.includes(theaterIdx)) {
                                // 상영하는 극장은 활성화
                                theater.classList.remove("disabled");
                                theater.style.opacity = "1";
                                theater.style.pointerEvents = "auto";
                                hasActiveTheater = true;
                            } else {
                                // 상영하지 않는 극장은 비활성화 (클릭 불가)
                                theater.classList.add("disabled");
                                theater.style.opacity = "0.5";
                                theater.style.pointerEvents = "none";
                            }
                        });
                    }
                });

            } catch (error) {
                console.error("🎥 극장 목록 업데이트 오류:", error);
            }
        }

        // // 🎯 자동으로 첫 번째 활성화된 지역을 클릭하는 함수 추가
        // function autoClickFirstAvailableRegion() {
        //     const firstAvailableRegion = document.querySelector(".region-link:not(.disabled)");
        //     if (firstAvailableRegion) {
        //         firstAvailableRegion.click();
        //     }
        // }

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

        // 시간표 클릭 시 좌석 페이지로 이동
        timeSelectionContainer.addEventListener("click", async function (event) {
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
                        "&theaterIdx=" + selectedTheaterIdx +
                        "&screenIdx=" + screenIdx +
                        "&timetableIdx=" + timetableIdx +
                        "&screenType=" + screenType +
                        "&isMorning=" + isMorning +
                        "&isWeekend=" + isWeekend;

                    try {
                        // 3. 로그인 체크
                        const response = await fetch(contextPath + "/UserController?type=loginCheck");
                        const result = await response.json();

                        if (!result.login) {
                            $('#customLoginModal').modal('show');
                            sessionStorage.setItem('redirectUrl', url);  // 로그인 후 돌아갈 URL 저장
                            console.log("경로"+url);
                        } else {
                            window.location.href = url
                        }
                    } catch (error) {
                        console.error("로그인 체크 실패:", error);
                    }

                } else {
                    console.error("필수 데이터가 누락되었습니다.");
                }
            }
        });
    });
</script>
<a href="#" id="member-login-btn" title="로그인" data-bs-toggle="modal" data-bs-target="#customLoginModal" style="display: none;">예매 비회원 로그인</a>
<jsp:include page="../common/footer.jsp"/>
</body>
</html>