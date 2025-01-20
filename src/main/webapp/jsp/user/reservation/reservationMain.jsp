<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <jsp:include page="../common/head.jsp"/>
    <title>빠른 예매</title>
</head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/reservation.css">
<body>
<jsp:include page="../common/header.jsp"/>
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
                    <button>◀</button>
                    <ul>
                        <li>2025.01</li>
                        <li>21 · 화</li>
                        <li>22 · 수</li>
                        <li>23 · 목</li>
                        <li>24 · 금</li>
                        <li>25 · 토</li>
                        <li>26 · 일</li>
                    </ul>
                    <button>▶</button>
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
                                    <img src="${pageContext.request.contextPath}/css/user/images/ratings/${movie.movieRating}.png" class="rating-image" />
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
</div
<jsp:include page="../common/footer.jsp"/>
<script>
    // 전체 지역 > 세부지역 선택
    document.addEventListener("DOMContentLoaded", () => {
        const regionLinks = document.querySelectorAll(".region-link");
        const theaterRegionList = document.querySelector("#theater-region-list");

        regionLinks.forEach(link => {
            link.addEventListener("click", async (event) => {
                event.preventDefault();

                const region = link.getAttribute("data-region").trim();
                console.log("클릭한 지역: [" + region + "]");

                const url = "${pageContext.request.contextPath}/UserController?type=subregions&region=" + encodeURIComponent(region);

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
    });

    // 영화 선택 로직
    document.addEventListener("DOMContentLoaded", () => {
        const movieSelection = document.querySelector(".movie-list");
        const theaterSelection = document.querySelector("#theater-region-list");
        const timeSelectionContainer = document.querySelector("#time-selection");

        let selectedMovieIdx = null;
        let selectedTheaterIdx = null;

        // 영화 선택 이벤트 핸들러
        movieSelection.addEventListener("click", (event) => {
            if (event.target.tagName === "LI" || event.target.closest("li")) {
                const selectedElement = event.target.closest("li"); // 클릭된 LI 요소 찾기
                const previouslySelected = movieSelection.querySelector(".selected"); // 이전 선택된 항목 찾기

                if (previouslySelected) {
                    previouslySelected.classList.remove("selected"); // 이전 선택 해제
                }

                selectedElement.classList.add("selected"); // 새로 선택된 항목 강조
                selectedMovieIdx = selectedElement.getAttribute("data-movie-id"); // 영화 ID 저장
                console.log("선택한 영화 ID:", selectedMovieIdx);

                updateShowtimes(); // 상영 시간표 업데이트 시도
            }
        });

        // 극장 선택 이벤트 핸들러
        theaterSelection.addEventListener("click", (event) => {
            if (event.target.tagName === "A" || event.target.closest("a")) {
                const selectedElement = event.target.closest("a"); // 클릭된 A 요소 찾기
                const previouslySelected = theaterSelection.querySelector(".selected"); // 이전 선택된 항목 찾기

                if (previouslySelected) {
                    previouslySelected.classList.remove("selected"); // 이전 선택 해제
                }

                selectedElement.classList.add("selected"); // 새로 선택된 항목 강조
                selectedTheaterIdx = selectedElement.getAttribute("theaterIdx"); // 극장 ID 저장
                console.log("선택한 극장 ID:", selectedTheaterIdx);

                updateShowtimes(); // 상영 시간표 업데이트 시도
            }
        });

        // 상영 시간표 업데이트 함수
        async function updateShowtimes() {
            if (selectedMovieIdx && selectedTheaterIdx) {
                // 영화와 극장이 모두 선택된 경우 서버에 요청
                try {
                    const url = "${pageContext.request.contextPath}/UserController?type=timetable&theaterIdx=" + selectedTheaterIdx + "&movieIdx=" + selectedMovieIdx;

                    const response = await fetch(url);

                    if (!response.ok) {
                        throw new Error(`HTTP error! status: ${response.status}`);
                    }

                    const showtimes = await response.json();
                    console.log("받은 상영 시간표 데이터:", showtimes);

                    if (!showtimes || showtimes.length === 0) {
                        timeSelectionContainer.innerHTML = "<p>선택한 영화와 극장의 상영 시간이 없습니다.</p>";
                        return;
                    }

                    // 상영 시간표 렌더링
                    const ul = document.createElement("ul");
                    ul.classList.add("time-table");

                    showtimes.forEach((time) => {
                        const li = document.createElement("li");
                        const button = document.createElement("button");

                        // 시간표 시작/종료 시간 설정
                        button.textContent = time.timetableStartTime + " ~ " + time.timetableEndTime;
                        button.setAttribute("data-time", time.timetableIdx);

                        // li에 버튼 추가
                        li.appendChild(button);
                        ul.appendChild(li);
                    });

                    timeSelectionContainer.innerHTML = ""; // 기존 내용 초기화
                    timeSelectionContainer.appendChild(ul); // 상영 시간표 추가
                } catch (err) {
                    console.error("AJAX 요청 중 오류 발생:", err);
                    timeSelectionContainer.innerHTML = "<p>상영 시간표를 가져오는 데 실패했습니다.</p>";
                }
            } else {
                // 영화 또는 극장이 선택되지 않은 경우 기본 문구 표시
                timeSelectionContainer.innerHTML = "<p>영화와 극장을 선택하시면 상영 시간표를 비교하여 볼 수 있습니다.</p>";
            }
        }

        // 초기 기본 문구 유지
        timeSelectionContainer.innerHTML = "<p>영화와 극장을 선택하시면 상영 시간표를 비교하여 볼 수 있습니다.</p>";
    });
</script>
</body>
</html>