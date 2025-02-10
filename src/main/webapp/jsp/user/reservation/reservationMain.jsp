<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <jsp:include page="../common/head.jsp"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/common.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/reservation.css?v=1.0">
</head>
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
                    <button id="reset-selection" class="reset-button">
                        <img src="${pageContext.request.contextPath}/css/user/images/icon-reset.png" alt="초기화 버튼">
                    </button>
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
                        <p id="time-selection">영화와 극장을 선택하시면 <br> 상영 시간표를 비교하여 볼 수 있습니다.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- 예매 로그인 모달 창 -->
<jsp:include page="../login/reservationLoginModal.jsp"/>
<!-- (임시 버튼) -->
<c:set var="userMain_selectedMovieIdx" value="${userMain_selectedMovieIdx}" />
<c:set var="userMain_selectedDate" value="${userMain_selectedDate}" />
<script>
    document.addEventListener("DOMContentLoaded", () => {
        var contextPath = "${pageContext.request.contextPath}";
        var resetButton = document.getElementById("reset-selection");

        // userMain에서 받은 값 사용
        let userMain_selectedMovieIdx = "${userMain_selectedMovieIdx}";
        let userMain_selectedDate = "${userMain_selectedDate}";

        // 선택된 값 저장 변수
        let selectedMovieIdx = null;
        let selectedTheaterIdx = null;
        let globalAvailableTheaters = []; // 사용 가능한 극장 리스트

        if (userMain_selectedMovieIdx) {
            console.log("🎯 자동 실행 - 선택된 영화 ID:", userMain_selectedMovieIdx, " 선택된 날짜:", userMain_selectedDate);

            // 서버에서 전달받은 영화 값을 selectedMovieIdx에 할당
            selectedMovieIdx = userMain_selectedMovieIdx;

            // UI에서 영화 선택 스타일 적용
            let movieElements = document.querySelectorAll(".movie-list li");
            movieElements.forEach((li) => {
                if (li.getAttribute("data-movie-id") === userMain_selectedMovieIdx) {
                    li.classList.add("selected");
                }
            });

            // 날짜 선택 스타일 적용
            let dateElements = document.querySelectorAll("#date-list li");
            dateElements.forEach((li) => {
                if (li.dataset.date === userMain_selectedDate) {
                    li.classList.add("selected");
                }
            });

            // availableTheaters 자동 실행 (DOM 안정화를 위해 약간 지연)
            setTimeout(() => {
                updateTheaterList(userMain_selectedMovieIdx, userMain_selectedDate);
                updateShowtimes();
            }, 100);
        }

        // 지역 관련 변수
        const regionLinks = document.querySelectorAll(".region-link");

        // 영화 및 극장 선택 관련 변수
        const movieSelection = document.querySelector(".movie-list");
        const timeSelectionContainer = document.querySelector("#time-selection");

        // 현재 날짜
        const today = new Date();
        let currentDate = new Date(today);
        let currentDateStr = currentDate.getFullYear() + "-" + String(currentDate.getMonth() + 1).padStart(2, "0") + "-" + String(currentDate.getDate()).padStart(2, "0");

        console.log("오늘 날짜:", currentDateStr);

        // 지역 선택 이벤트
        regionLinks.forEach(link => {
            link.addEventListener("click", async (event) => {
                event.preventDefault();

                // 다른 지역 링크에서 selected 클래스 제거
                regionLinks.forEach(l => l.classList.remove("selected"));
                // 현재 클릭된 링크에 selected 클래스 추가
                link.classList.add("selected");

                const parentLi = link.closest("li");
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
                    if (!response.ok) { throw new Error("HTTP error! status: " + response.status); }

                    const theaterData = await response.json();

                    if (theaterData && theaterData.length > 0) {
                        theaterData.forEach(theater => {
                            const li = document.createElement("li");
                            const a = document.createElement("a");

                            a.textContent = theater.theaterName;
                            a.href = "#";
                            a.setAttribute("data-theater-id", theater.theaterIdx);

                            // 효과적인 영화 선택 값: 클라이언트에서 선택된 값이 있으면 그 값을, 없으면 userMain에서 넘어온 값을 사용
                            const effectiveMovieIdx = selectedMovieIdx ? selectedMovieIdx : userMain_selectedMovieIdx;

                            if (!effectiveMovieIdx || effectiveMovieIdx === "null" || effectiveMovieIdx === "") {
                                console.log("✅ 모든 극장 선택 가능 모드 (영화 미선택)");
                                a.classList.remove("disabled");
                                a.style.opacity = "1";
                                a.style.pointerEvents = "auto";

                                a.addEventListener("click", (e) => {
                                    e.preventDefault();

                                    // const parentUl = a.closest("li");
                                    //
                                    // parentUl.querySelectorAll("li").forEach(item => item.classList.remove("selected"));
                                    // parentUl.classList.add("selected");
                                    // 클릭된 요소(a)의 가장 가까운 li 요소를 구합니다.

                                    const clickedLi = a.closest("li");
                                    // 해당 li가 속한 부모 ul을 구합니다.
                                    const parentUl = clickedLi.closest("ul");

                                    // 부모 ul의 모든 li 요소에서 selected 클래스를 제거합니다.
                                    parentUl.querySelectorAll("li").forEach(item => item.classList.remove("selected"));
                                    // 클릭된 li에 selected 클래스를 추가합니다.
                                    clickedLi.classList.add("selected");

                                    selectedTheaterIdx = theater.theaterIdx;
                                    console.log("🎥 선택한 극장 ID:", selectedTheaterIdx);
                                    updateShowtimes();

                                    (async () => {
                                        await updateMovieList(selectedTheaterIdx, currentDateStr);
                                    })();
                                });
                            } else {
                                // 특정 영화 선택 시, globalAvailableTheaters에 있는 극장만 활성화
                                const isAvailable = globalAvailableTheaters.some(avTheater => avTheater.theaterIdx == theater.theaterIdx);

                                if (!isAvailable) {
                                    a.classList.add("disabled");
                                    a.style.opacity = "0.5";
                                    a.style.pointerEvents = "none";
                                } else {
                                    a.classList.remove("disabled");
                                    a.style.opacity = "1";
                                    a.style.pointerEvents = "auto";

                                    a.addEventListener("click", (e) => {
                                        e.preventDefault();
                                        selectedTheaterIdx = theater.theaterIdx;
                                        console.log("🎥 선택한 극장 ID:", selectedTheaterIdx);
                                        updateShowtimes();
                                    });
                                }
                            }
                            li.appendChild(a);
                            theaterRegionList.appendChild(li);
                        });
                    } else {
                        const noDataMessage = document.createElement("li");
                        noDataMessage.textContent = "해당 지역에 극장이 없습니다.";
                        theaterRegionList.appendChild(noDataMessage);
                    }
                } catch (err) {
                    console.error("🚨 극장 데이터 불러오기 오류:", err);
                    const errorMessage = document.createElement("li");
                    errorMessage.textContent = "데이터를 가져오는 데 실패했습니다.";
                    theaterRegionList.appendChild(errorMessage);
                }

                parentLi.appendChild(theaterRegionList);
            });
        });

        async function updateMovieList(theaterIdx, targetDate) {
            try {
                const url = contextPath + "/UserController?type=availableMovies&theaterIdx=" + theaterIdx + "&targetDate=" + targetDate;
                const response = await fetch(url);
                if (!response.ok) throw new Error("HTTP error! status: " + response.status);

                const availableMovies = await response.json();
                console.log("🎬 선택한 극장에서 상영하는 영화 목록:", availableMovies);

                if (!availableMovies || availableMovies.length === 0) {
                    console.warn("🚨 해당 극장에서 상영하는 영화가 없습니다!");
                }

                // 전역 변수에 저장
                globalAvailableMovies = availableMovies;

                // 영화 리스트 UI 업데이트 (해당 극장에서 상영하는 영화만 활성화)
                document.querySelectorAll(".movie-list li").forEach(li => {
                    const movieId = li.getAttribute("data-movie-id");
                    const isAvailable = globalAvailableMovies.some(availableMovie => availableMovie == movieId);

                    if (!isAvailable) {
                        li.classList.add("disabled");
                        li.style.opacity = "0.5";
                        li.style.pointerEvents = "none";
                    } else {
                        li.classList.remove("disabled");
                        li.style.opacity = "1";
                        li.style.pointerEvents = "auto";
                    }
                });

            } catch (error) {
                console.error("🎬 영화 목록 업데이트 오류:", error);
            }
        }

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

            // 최대 선택 가능한 날짜 (오늘 + 7일)
            const maxSelectableDate = new Date(todayNoTime);
            maxSelectableDate.setDate(maxSelectableDate.getDate() + 7);

            // 최소 선택 가능한 날짜 (오늘 - 3일)
            const minSelectableDate = new Date(todayNoTime);
            minSelectableDate.setDate(minSelectableDate.getDate() - 3);

            for (let i = -3; i <= 3; i++) {
                const date = new Date(selectedDate);
                date.setDate(date.getDate() + i);

                // 생성된 날짜에서 시간 정보를 0으로 초기화하여 비교
                const dateNoTime = new Date(date);
                dateNoTime.setHours(0, 0, 0, 0);

                const li = document.createElement("li");
                li.textContent = formatDay(date) + " · " + date.getDate();
                li.dataset.date = formatDate(date);
                li.style.color = isWeekend(date) ? "red" : "black";

                // 오늘보다 이전 날짜라면 클릭 불가 처리
                if (dateNoTime < todayNoTime) {
                    li.classList.add("disabled");
                    li.style.pointerEvents = "none";
                    li.style.opacity = "0.5";
                } else if (dateNoTime > maxSelectableDate) {
                    li.classList.add("disabled");
                    li.style.pointerEvents = "none";
                    li.style.opacity = "0.5";
                } else {
                    // 오늘 이후 또는 오늘인 경우 클릭 이벤트 등록
                    li.addEventListener("click", function () {
                        // 다른 날짜의 selected 클래스 제거
                        dateList.querySelectorAll("li").forEach(el => el.classList.remove("selected"));
                        li.classList.add("selected");

                        currentDate = new Date(li.dataset.date);
                        currentDateStr = formatDate(currentDate);
                        console.log("선택한 날짜:", currentDateStr);

                        if (selectedMovieIdx) {
                            console.log("🎬 선택된 영화 ID:", selectedMovieIdx, "📅 변경된 날짜:", currentDateStr);
                            (async () => {
                                await updateTheaterList(selectedMovieIdx, currentDateStr);
                            })();
                        }

                        updateShowtimes();
                    });
                }

                // userMain_selectedDate가 있으면 해당 날짜 자동 선택
                if (li.dataset.date === userMain_selectedDate) {
                    li.classList.add("selected");
                }

                // 오늘 날짜이면 selected 처리 (옵션)
                if (li.dataset.date === formatDate(todayNoTime)) {
                    li.classList.add("selected");
                }

                // prev/next 버튼 비활성화 처리
                if (selectedDate >= minSelectableDate && selectedDate <= maxSelectableDate) {
                    prevButton.classList.add("disabled");
                    prevButton.style.pointerEvents = "none";
                    prevButton.style.opacity = "0.5";
                } else {
                    prevButton.classList.remove("disabled");
                    prevButton.style.pointerEvents = "auto";
                    prevButton.style.opacity = "1";
                }

                if (selectedDate >= maxSelectableDate) {
                    nextButton.classList.add("disabled");
                    nextButton.style.pointerEvents = "none";
                    nextButton.style.opacity = "0.5";
                } else {
                    nextButton.classList.remove("disabled");
                    nextButton.style.pointerEvents = "auto";
                    nextButton.style.opacity = "1";
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

            // 현재 시간을 가져오는 변수
            const currentTime = new Date();

            // 상영관별 첫 번째 상영 여부를 추적하기 위한 Map
            const firstShowtime = new Map();

            showtimes.forEach(function(showtime) {
                console.log("showtime 데이터 확인:", showtime);

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

                // 상영 시작 시간 파싱
                const startTimeParts = showtime.timetableStartTime
                    ? showtime.timetableStartTime.split(" ")
                    : ["", "00:00:00"];
                const startHour = parseInt(startTimeParts[1]?.split(":")[0] || "0", 10);

                let isMorning = false;
                if (!firstShowtime.has(screenName)) {
                    firstShowtime.set(screenName, true);
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

                li.innerHTML += "<div class='time-info'>" +
                    "<span>" + showtime.timetableStartTime.split(" ")[1] + " ~ " + showtime.timetableEndTime.split(" ")[1] + "</span>" +
                    "&nbsp;&nbsp;" + "<span>" + showtime.screenName + "</span>" +
                    "</div>";

                li.innerHTML += "<div class='seat-info'>" +
                    "&nbsp;&nbsp;" + "<span>" + showtime.availableSeats + " / " + showtime.screenSeatCount + " 좌석</span>" +
                    "</div>";

                li.setAttribute("data-timetable-id", showtime.timetableIdx);
                li.setAttribute("data-theater-idx", showtime.theaterIdx);
                li.setAttribute("data-screen-idx", showtime.screenIdx);
                li.setAttribute("data-screen-type", showtime.screenType);
                li.setAttribute("data-morning", isMorning ? "0" : "1");
                ul.appendChild(li);
            });

            timeSelectionContainer.innerHTML = "";
            timeSelectionContainer.appendChild(ul);
        }

        movieSelection.addEventListener("click", async function(event) {
            const selectedElement = event.target.closest("li");

            if (selectedElement) {
                if (selectedElement.classList.contains("selected")) {
                    console.log("🎬 영화 선택 취소:", selectedMovieIdx);
                    selectedElement.classList.remove("selected");
                    selectedMovieIdx = null;
                    globalAvailableTheaters = [];

                    // 모든 극장 활성화 (영화 선택 취소)
                    document.querySelectorAll(".region-link").forEach(link => {
                        link.classList.remove("disabled", "selected");
                        link.style.opacity = "1";
                        link.style.pointerEvents = "auto";
                    });

                    // 하위 극장 목록 초기화
                    document.querySelectorAll(".theater-region-list").forEach(list => list.remove());

                    // 극장 활성화
                    globalAvailableTheaters = [];
                    document.querySelectorAll(".theater-selection ul li").forEach(a => {
                        a.classList.remove("disabled", "selected");
                        a.style.opacity = "1";
                        a.style.pointerEvents = "auto";
                    });

                    updateShowtimes();
                    return;
                }

                // 기존 선택된 영화의 스타일 초기화
                movieSelection.querySelectorAll(".selected").forEach(el => el.classList.remove("selected"));
                selectedElement.classList.add("selected");
                selectedMovieIdx = selectedElement.getAttribute("data-movie-id");

                console.log("🎬 선택된 영화 ID:", selectedMovieIdx);

                // 선택된 날짜 유지 (없으면 오늘 날짜)
                let selectedDateElement = document.querySelector("#date-list li.selected");
                if (!selectedDateElement) {
                    let todayStr = formatDate(new Date());
                    selectedDateElement = document.querySelector("#date-list li[data-date=" + todayStr + "]");
                    if (selectedDateElement) {
                        selectedDateElement.classList.add("selected");
                    }
                }
                let selectedDateStr = selectedDateElement ? selectedDateElement.dataset.date : formatDate(new Date());
                console.log("🎬 영화 선택 후 업데이트할 날짜:", selectedDateStr);


                // 극장이 아직 선택되지 않은 경우에만 updateTheaterList 호출
                if (!selectedTheaterIdx) {
                    await updateTheaterList(selectedMovieIdx, selectedDateStr);

                    // updateTheaterList 후, 지역 버튼들의 활성/비활성 처리
                    document.querySelectorAll(".region-link").forEach(link => {
                        const region = link.getAttribute("data-region").trim();
                        const regionLi = link.closest("li");

                        console.log("🔍 지역 비교 - 클릭 가능한 지역:", region);
                        console.log("🔍 globalAvailableTheaters의 theaterRegion 값:", globalAvailableTheaters.map(t => t.theaterRegion));

                        const theatersInRegion = globalAvailableTheaters.filter(theater => theater.theaterRegion === region);
                        console.log(theatersInRegion);

                        if (theatersInRegion.length > 0) {
                            regionLi.classList.remove("disabled");
                            regionLi.style.opacity = "1";
                            regionLi.style.pointerEvents = "auto";
                        } else {
                            regionLi.classList.add("disabled");
                            regionLi.style.opacity = "0.5";
                            regionLi.style.pointerEvents = "none";
                        }
                    });
                }
                // 극장이 이미 선택되어 있거나, 새로 업데이트한 후 바로 상영 시간표 업데이트
                updateShowtimes();
            } else {
                updateShowtimes();
            }
        });

        // 영화 선택 이벤트 내에서 availableTheaters 저장
        async function updateTheaterList(movieIdx, targetDate) {
            try {
                document.querySelectorAll(".theater-region-list").forEach(list => list.remove());
                selectedTheaterIdx = null;

                console.log("🎥 updateTheaterList 실행 - 영화:", movieIdx, "날짜:", targetDate);

                const url = contextPath + "/UserController?type=availableTheaters&movieIdx=" + movieIdx + "&targetDate=" + targetDate;
                const response = await fetch(url);
                if (!response.ok) throw new Error("HTTP error! status: " + response.status);

                const availableTheaters = await response.json();
                console.log("🎥 선택한 영화의 상영 극장 목록:", availableTheaters);

                if (availableTheaters && availableTheaters.length > 0) {
                    globalAvailableTheaters = availableTheaters;
                } else {
                    console.warn("🚨 해당 영화의 극장 데이터 없음, 기존 데이터 유지");
                }

                // 모든 극장 비활성화 해제 후 활성화
                document.querySelectorAll(".region-link").forEach(link => {
                    link.classList.remove("disabled");
                    link.style.opacity = "1";
                    link.style.pointerEvents = "auto";
                });

                if (!availableTheaters || availableTheaters.length === 0) {
                    console.warn("🚨 해당 영화의 극장 데이터가 없습니다!");
                    document.querySelectorAll(".region-link").forEach(link => {
                        link.classList.add("disabled");
                        link.style.opacity = "0.5";
                        link.style.pointerEvents = "none";
                    });
                    return;
                }

                document.querySelectorAll(".region-link").forEach(link => {
                    const region = link.getAttribute("data-region").trim();
                    const regionLi = link.closest("li");

                    const theatersInRegion = globalAvailableTheaters.filter(theater => theater.theaterRegion === region);

                    if (globalAvailableTheaters.length === 0 && !selectedMovieIdx) {
                        console.warn("🚨 globalAvailableTheaters가 비어 있고, 영화가 선택되지 않음 -> 모든 극장 선택 가능 모드 실행");
                    } else {
                        console.log("🎬 영화가 선택됨, '모든 극장 선택 가능 모드' 실행 안 함");
                    }

                    if (theatersInRegion.length > 0) {
                        regionLi.classList.remove("disabled");
                        regionLi.style.opacity = "1";
                        regionLi.style.pointerEvents = "auto";
                    } else {
                        regionLi.classList.add("disabled");
                        regionLi.style.opacity = "0.5";
                        regionLi.style.pointerEvents = "none";
                    }

                    if (selectedTheaterIdx) {
                        console.log("🎥 기존 선택된 극장 유지:", selectedTheaterIdx);
                        updateShowtimes();
                    }
                });
            } catch (error) {
                console.error("🎥 극장 목록 업데이트 오류:", error);
            }
        }

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

        resetButton.addEventListener("click", function () {
            console.log("선택 초기화 버튼 클릭됨!");

            // 영화 선택 초기화
            selectedMovieIdx = null;
            document.querySelectorAll(".movie-list li").forEach(li => {
                li.classList.remove("selected", "disabled");
                li.style.opacity = "1";
                li.style.pointerEvents = "auto";
            });

            // 날짜 선택 초기화 (오늘 날짜로)
            let todayStr = formatDate(new Date());
            currentDateStr = todayStr;
            document.querySelectorAll("#date-list li").forEach(li => {
                li.classList.remove("selected");
                if (li.dataset.date === todayStr) {
                    li.classList.add("selected");
                }
            });

            // 극장 선택 초기화
            selectedTheaterIdx = null;
            document.querySelectorAll(".region-link").forEach(link => {
                link.classList.remove("disabled", "selected");
                link.style.opacity = "1";
                link.style.pointerEvents = "auto";
            });

            // 하위 극장 목록 초기화
            document.querySelectorAll(".theater-region-list").forEach(list => list.remove());

            // 시간표 초기화
            document.getElementById("time-selection").innerHTML = "<p>영화와 극장을 선택하시면<br>상영 시간표를 비교하여 볼 수 있습니다.</p>";

            // 극장 활성화
            globalAvailableTheaters = [];
            document.querySelectorAll(".theater-selection ul li").forEach(a => {
                a.classList.remove("disabled", "selected");
                a.style.opacity = "1";
                a.style.pointerEvents = "auto";
            });

            console.log("선택 초기화 완료");
        });

        // 시간표 클릭 시 좌석 페이지로 이동
        timeSelectionContainer.addEventListener("click", async function (event) {
            const listItem = event.target.closest("li");
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
                        // 로그인 체크
                        const response = await fetch(contextPath + "/UserController?type=loginCheck");
                        const result = await response.json();

                        if (!result.login) {
                            $('#customLoginModal').modal('show');
                            sessionStorage.setItem('redirectUrl', url);
                            console.log("경로" + url);
                        } else {
                            window.location.href = url;
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