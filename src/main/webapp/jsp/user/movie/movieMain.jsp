<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!Doctype html>
<html lang="ko">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/movieMain.css">
<script src="https://kit.fontawesome.com/d7f530ec10.js" crossorigin="anonymous"></script>
<head>
    <jsp:include page="../common/head.jsp"/>
    <style>
        .onair-condition .total-count {
            font-size: 16px;
        }

        .onair-condition {
            display: flex; /* 버튼과 결과 메시지를 한 줄에 배치 */
            align-items: center; /* 버튼과 메시지 수직 정렬 */
            gap: 20px; /* 버튼과 메시지 사이 간격 */
        }

        .result-message {
            font-size: 16px; /* 메시지 텍스트 크기 */
            color: #333; /* 메시지 텍스트 색상 */
            font-weight: normal; /* 텍스트 굵기 */
        }

        #result-zero {
            margin: 50px auto; /* 위아래 여백과 가로 중앙 정렬 */
            padding: 50px 0; /* 내부 여백 */
            text-align: center; /* 텍스트 가운데 정렬 */
            font-size: 18px; /* 글자 크기 */
            font-weight: bold; /* 글자 굵게 */
            color: #333; /* 글자 색상 */
            border-top: 1px solid #ddd; /* 위쪽 구분선 */
            border-bottom: 1px solid #ddd; /* 아래쪽 구분선 */
            width: 100%; /* 가로 너비 (부모 요소 대비) */
            box-sizing: border-box; /* 패딩 포함한 크기 조정 */
        }
    </style>
</head>

<body>
<!-- header 영역 -->
<jsp:include page="../common/header.jsp"/>
<div class="page-util">
    <div class="inner-wrap">
        <div class="location">
            <span>Home</span>
            <img src="https://img.megabox.co.kr/static/pc/images/common/bg/bg-location-arr.png"/>
            <label>영화</label>
            <img src="https://img.megabox.co.kr/static/pc/images/common/bg/bg-location-arr.png"/>
            <label>전체영화</label>
        </div>
    </div>
</div>

<!-- contents 영역 -->
<div class="contents">
    <main id="main">
        <!-- 영화 섹션 -->
        <section id="section05" class="section main-movie">
            <!-- 컨테이너 -->
            <div class="cont-area">
                <h1>전체영화</h1>

                <!-- 탭 영역 -->
                <div class="tabs">
                    <div class="tab active" data-status="all" data-target="tab1">박스오피스</div>
                    <div class="tab" data-status="0" data-target="tab2">상영작</div>
                    <div class="tab" data-status="1" data-target="tab3">상영예정작</div>
                </div>

                <div class="cell">
                    <div class="total-count">
                        <span id="totalMovieCount">0</span>개의 영화가 검색되었습니다.
                    </div>
                </div>

                <!-- 검색 영역 -->
                <div class="search-link clearfix">
                    <div class="cell">
                        <form id="searchForm" action="UserController?type=movieSearch" method="post">
                            <div class="search">
                                <input type="text" name="movieKeyword" placeholder="영화명을 입력해 주세요" title="영화 검색" class="input-text">
                                <button type="submit" class="btn"><i class="ico-search"></i>검색</button>
                            </div>
                        </form>
                    </div>
                </div>

                <!-- 탭 콘텐츠 영역 -->
                <div class="tab-content">
                    <!-- 박스오피스 탭 -->
                    <div id="tab1" class="content active">
                        <div class="main-movie-list">
                            <ol class="list clearfix movie-list" id="movieList1"></ol>
                            <div class="btn-more v1" id="addMovieDiv1" style="display: none;">
                                <button type="button" class="btn" id="btnAddMovie1">더보기 <i class="iconset ico-btn-more-arr"></i></button>
                            </div>
                        </div>
                    </div>

                    <!-- 상영작 탭 -->
                    <div id="tab2" class="content">
                        <div class="main-movie-list">
                            <ol class="list clearfix movie-list" id="movieList2"></ol>
                            <div class="btn-more v1" id="addMovieDiv2" style="display: none;">
                                <button type="button" class="btn" id="btnAddMovie2">더보기 <i class="iconset ico-btn-more-arr"></i></button>
                            </div>
                        </div>
                    </div>

                    <!-- 상영예정작 탭 -->
                    <div id="tab3" class="content">
                        <div class="main-movie-list">
                            <ol class="list clearfix movie-list" id="movieList3"></ol>
                            <div class="btn-more v1" id="addMovieDiv3" style="display: none;">
                                <button type="button" class="btn" id="btnAddMovie3">더보기 <i class="iconset ico-btn-more-arr"></i></button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </main>
</div>

<!-- footer 영역 -->
<jsp:include page="../common/footer.jsp"/>

<!-- script 영역 -->
<script>
    function formatNumber(number) {
        return number.toLocaleString('ko-KR');  // 한국어 숫자 포맷: 1,234,567
    }

    document.addEventListener("DOMContentLoaded", function () {
        const tabs = document.querySelectorAll(".tab");
        const searchForm = document.getElementById("searchForm");
        let currentTab = "all"; // 초기 상태
        let offsets = { all: 0, 0: 0, 1: 0 }; // 각 탭 상태별 오프셋 관리
        const pageSize = 20; // 한 번에 가져올 데이터 수

        // **URL 파라미터에서 검색어 가져오기**
        const urlParams = new URLSearchParams(window.location.search);
        const movieKeyword = urlParams.get("movieKeyword");

        // 검색어가 존재할 경우 검색 호출 후 URL 파라미터 제거
        if (movieKeyword) {
            searchMovieWithKeyword(movieKeyword, function () {
                // URL에서 검색어 파라미터 제거
                const newUrl = window.location.pathname + "?type=movieMain";
                window.history.replaceState({}, document.title, newUrl);
            });
        } else {
            // 검색어가 없을 경우 전체 목록 로드
            fetchMovies(currentTab, offsets[currentTab], pageSize);
        }

        // 검색어로 영화 검색
        function searchMovieWithKeyword(keyword) {
            const url = "UserController?type=movieSearch&movieKeyword=" + encodeURIComponent(keyword) +
                "&status=" + (currentTab || "all") + "&offset=0&pageSize=" + pageSize;

            fetch(url, {
                method: "GET",
                headers: { "X-Requested-With": "XMLHttpRequest" },
            })
                .then(response => response.json())
                .then(data => {
                    const listId = "movieList" + (currentTab === "all" ? 1 : parseInt(currentTab) + 2);
                    const buttonId = "addMovieDiv" + (currentTab === "all" ? 1 : parseInt(currentTab) + 2);

                    updateMovieList(data.movieArray, listId, buttonId, data.totalMovieCount, currentTab);

                    const totalMovieCountElement = document.getElementById("totalMovieCount");
                    if (totalMovieCountElement) {
                        totalMovieCountElement.textContent = data.totalMovieCount;
                    }

                    if (callback) callback();
                })
                .catch(error => console.error("Error fetching search results:", error));
        }


        // 검색 이벤트 리스너
        if (searchForm) {
            searchForm.addEventListener("submit", function (event) {
                event.preventDefault();
                offsets[currentTab] = 0; // 검색 시 현재 탭 오프셋 초기화
                searchMovie();
            });
        }

        // 탭 전환 이벤트 리스너
        tabs.forEach(function (tab) {
            tab.addEventListener("click", function () {
                tabs.forEach(function (t) {
                    t.classList.remove("active");
                });
                this.classList.add("active");

                currentTab = this.getAttribute("data-status") || "all";
                offsets[currentTab] = 0; // 탭 전환 시 오프셋 초기화

                // 콘텐츠 숨기기 및 선택된 탭 활성화
                document.querySelectorAll(".content").forEach(function (content) {
                    content.classList.remove("active");
                });
                const target = this.getAttribute("data-target");
                document.getElementById(target).classList.add("active");

                // 검색어가 없으므로 기본 목록 로드
                fetchMovies(currentTab, offsets[currentTab], pageSize);
            });
        });

        // "더보기" 버튼 이벤트 리스너
        document.querySelectorAll(".btn-more .btn").forEach(function (button) {
            button.addEventListener("click", function () {
                const status = currentTab;
                if (!status || offsets[status] === undefined) {
                    console.error("Invalid status or offset:", status, offsets[status]);
                    return;
                }
                fetchMovies(status, offsets[status], pageSize);
            });
        });

        // 영화 데이터 검색
        function searchMovie() {
            const formData = new FormData(searchForm);
            const movieKeyword = formData.get("movieKeyword");

            if (!movieKeyword) {
                alert("검색어를 입력하세요.");
                return;
            }

            const url = "UserController?type=movieSearch&movieKeyword=" +
                encodeURIComponent(movieKeyword) +
                "&status=" + (currentTab || "all") +  // currentTab이 null일 경우 기본값 "all"
                "&offset=0&pageSize=" + pageSize;


            fetch(url, {
                method: "GET",
                headers: {
                    "X-Requested-With": "XMLHttpRequest",
                },
            })
                .then(function (response) {
                    if (!response.ok) {
                        throw new Error("HTTP error! status: " + response.status);
                    }
                    return response.json();
                })
                .then(function (data) {
                    const listId = "movieList" + (currentTab === "all" ? 1 : parseInt(currentTab) + 2);
                    const buttonId = "addMovieDiv" + (currentTab === "all" ? 1 : parseInt(currentTab) + 2);

                    // 현재 탭의 영화 리스트 업데이트
                    updateMovieList(data.movieArray, listId, buttonId, data.totalMovieCount, currentTab);

                    // 현재 탭의 검색 결과 메시지 업데이트
                    const totalMovieCountElement = document.getElementById("totalMovieCount");
                    if (totalMovieCountElement) {
                        totalMovieCountElement.textContent = data.totalMovieCount;
                    }
                })
                .catch(function (error) {
                    console.error("Error fetching search results:", error);
                });
        }



        // 영화 데이터 가져오기
        function fetchMovies(status, offset, limit) {
            const url = "UserController?type=movieMain&status=" + status + "&offset=" + offset + "&pageSize=" + limit;

            fetch(url, {
                method: "GET",
                headers: {
                    "X-Requested-With": "XMLHttpRequest",
                },
            })
                .then(function (response) {
                    if (!response.ok) {
                        throw new Error("HTTP error! status: " + response.status);
                    }
                    return response.json();
                })
                .then(function (data) {
                    const listId = "movieList" + (status === "all" ? 1 : parseInt(status) + 2);
                    const buttonId = "addMovieDiv" + (status === "all" ? 1 : parseInt(status) + 2);

                    // 영화 목록 업데이트
                    updateMovieList(data.movieArray, listId, buttonId, data.totalMovieCount, status);

                    // 영화 개수 업데이트
                    const totalMovieCountElement = document.getElementById("totalMovieCount");
                    if (totalMovieCountElement) {
                        totalMovieCountElement.textContent = data.totalMovieCount;
                    }
                })
                .catch(function (error) {
                    console.error("Error fetching movies:", error);
                });
        }

        // 영화 목록 업데이트
        function updateMovieList(movieArray, listId, buttonId, totalMovieCount, status) {
            const movieList = document.getElementById(listId);
            const addMovieDiv = document.getElementById(buttonId);

            if (!movieList || !addMovieDiv) {
                console.error("Elements not found:", listId, buttonId);
                return;
            }

            if (offsets[status] === 0) {
                movieList.innerHTML = ""; // 초기 로드 시 기존 데이터 초기화
            }

            if (movieArray && movieArray.length > 0) {
                movieArray.forEach(function (movie, index) {
                    const li = document.createElement("li");
                    li.classList.add("movie-item");
                    li.innerHTML =
                        '<a href="UserController?type=movieDetail&movieIdx=' + movie.movieIdx + '" class="movie-list-info" title="영화상세 보기">' +
                        '<p class="rank">' + (offsets[status] + index + 1) + '</p>' +
                        '<img src="' + movie.moviePosterUrl + '" alt="' + movie.movieTitle + '" class="poster">' +
                        '<div class="wrap">' +
                        '<div class="summary">' + movie.movieInfo + '</div>' +
                        '<div class="score">' +
                        '<div class="preview">' +
                        '<p class="tit">관객수</p>' +
                        '<p class="number">' + formatNumber(Number(movie.movieTotalAudience)) + '<span class="ir"></span></p>' +
                        '</div>' +
                        '</div>' +
                        '</div>' +
                        '</a>' +
                        '<div class="tit-area">' +
                        (movie.movieGrade === "ALL" ? '<p class="movie-grade age-all">전체 관람가</p>' : '') +
                        (movie.movieGrade === "12" ? '<p class="movie-grade age-12">12세 관람가</p>' : '') +
                        (movie.movieGrade === "15" ? '<p class="movie-grade age-15">15세 관람가</p>' : '') +
                        (movie.movieGrade === "19" ? '<p class="movie-grade age-19">청소년 관람 불가</p>' : '') +
                        '<p title="' + movie.movieTitle + '" class="tit ellipsis">' + movie.movieTitle + '</p>' +  // ellipsis 클래스 추가
                        '</div>' +
                        '<div class="rate-date">' +
                        '<span class="rate">예매율 ' + movie.movieReservationRate + '%</span>' +
                        '<span class="divider"></span>' +  // 구분선 추가
                        '<span class="date">개봉일 ' + formatDate(movie.movieDate) + '</span>' + // 포맷 적용
                        '</div>' +
                        '<div class="btn-util">' +
                        '<button type="button" class="button btn-like">' +
                        '<i class="far fa-heart"></i>' + movie.movieLikes +
                        '</button>' +
                        '<div class="case">' +
                        '<a href="UserController?type=reservation&movieIdx=' + movie.movieIdx + '" class="button btn1" title="영화 예매하기">예매</a>' +
                        '</div>' +
                        '</div>';
                    movieList.appendChild(li);
                });

                offsets[status] += movieArray.length;

                if (offsets[status] >= totalMovieCount) {
                    addMovieDiv.style.display = "none";
                } else {
                    addMovieDiv.style.display = "block";
                }
            } else {
                if (offsets[status] === 0) {
                    movieList.innerHTML = "<div id='result-zero'>현재 상영중인 영화가 없습니다.</div>";
                }
                addMovieDiv.style.display = "none";
            }
        }
    });

    // 날짜 포맷 변경 함수
    function formatDate(dateString) {
        if (!dateString) return ""; // 값이 없을 때 빈 문자열 반환
        var dateParts = dateString.split("-"); // 'YYYY-MM-DD' 형태를 '-'로 분리
        if (dateParts.length === 3) {
            return dateParts[0] + "." + dateParts[1] + "." + dateParts[2]; // 'YYYY.MM.DD' 형식으로 변환
        }
        return dateString; // 포맷이 다를 경우 그대로 반환
    }

</script>
</body>
</html>
