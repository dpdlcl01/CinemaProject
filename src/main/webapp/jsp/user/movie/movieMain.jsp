<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!Doctype html>
<html lang="ko">
<!-- head -->

<head>
    <jsp:include page="../common/head.jsp"/>
    <style>
        .onair-condition .total-count {
            font-size: 16px;
        }
    </style>
</head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/movie.css">
<script src="https://kit.fontawesome.com/d7f530ec10.js" crossorigin="anonymous"></script>
<body>

<!-- header 영역 -->
<jsp:include page="../common/header.jsp"/>
<div class="page-util">
    <div class="inner-wrap">
        <div class="location">
            <span>Home</span>
            <a href="/movie" title="영화 페이지로 이동">영화</a>
            <a href="/movie" title="전체영화 페이지로 이동 이동" class="pageUtila">전체영화</a>
        </div>
    </div>
</div>

<!-- contents 영역 -->
<div id="contents">
    <main id="main">
        <input type="hidden" id="onairYn" name="onairYn" value="N">
        <!-- section01 -->
        <section id="section05" class="section main-movie">
            <!-- cont-area -->
            <div class="cont-area">
                <h1>전체영화</h1>
                <div class="tabs">
                    <div class="tab active" data-target="boxoffice">박스오피스</div>
                    <div class="tab" data-target="nowShowing">상영작</div>
                    <div class="tab" data-target="comingSoon">상영예정작</div>
                </div>
                <div class="search-link clearfix">
                    <div class="cell">
                        <div class="search">
                            <input type="text" placeholder="영화명 검색" title="영화 검색" class="input-text">
                            <button class="btn">
                                <i class="ico-search"></i>
                                검색
                            </button>
                        </div>
                    </div>

                    <div id="boxoffice" class="content active">
<%--                        <h2>전체영화</h2>--%>
                        <div class="movie-list-util mt40">
                            <div class="onair-condition">
                                <button type="button" title="전체 영화 보기" class="btn-onair btnOnAir">개봉작만</button>
                                <div class="total-count">전체 ${requestScope.totalMovieCount}개의 영화가 검색되었습니다.</div>
                            </div>
                        </div>
                        <!-- main-movie-list boxRankList -->
                        <div class="main-movie-list">
                            <ol class="list clearfix movie-list">

                            <!-- movie-list-info -->
                            <c:if test="${requestScope.movieArray ne null }">
                                <c:forEach var="mvo" items="${requestScope.movieArray }" varStatus="st">
                                    <li class="movie-item" data-status="open">
                                        <a href="UserController?type=movieDetail&movieIdx=${mvo.movieIdx }" class="movie-list-info" title="영화상세 보기">
                                        <p class="rank">${st.index+1 }</p>
                                        <img src="${mvo.moviePosterUrl }" alt="${mvo.movieTitle }" class="poster">
                                        <div class="wrap">
                                            <div class="summary">
                                                ${mvo.movieInfo }
                                            </div>
                                        </div>
                                        </a>
                                        <div class="tit-area">
                                            <c:choose>
                                                <c:when test="${mvo.movieGrade == 'ALL' }"><p class="movie-grade age-all">전체 관람가</p></c:when>
                                                <c:when test="${mvo.movieGrade == '12' }"><p class="movie-grade age-12">12세 관람가</p></c:when>
                                                <c:when test="${mvo.movieGrade == '15' }"><p class="movie-grade age-15">15세 관람가</p></c:when>
                                                <c:when test="${mvo.movieGrade == '19' }"><p class="movie-grade age-19">청소년 관람 불가</p></c:when>
                                            </c:choose>
                                            <p title="${mvo.movieTitle }" class="tit">${mvo.movieTitle }</p>
                                        </div>
                                        <div class="rate-date">    <span class="rate">예매율 ${mvo.movieReservationRate }%</span>    <span class="date">개봉일 ${mvo.movieDate }</span></div>
                                        <!-- //movie-list-info -->
                                        <!-- btn-util -->
                                        <div class="btn-util">
                                            <button type="button" class="button btn-like">
                                                <i class="far fa-heart"></i>${mvo.movieLikes }
                                            </button>
                                            <div class="case">
                                                <a href="UserController?type=reservation&movieIdx=${mvo.movieIdx }" class="button btn1" title="영화 예매하기">예매</a>
                                            </div>
                                        </div>
                                        <!-- //btn-util -->
                                    </li>
                                </c:forEach>
                            </c:if>
                                <%------------------------------여기부터 더보기라인----------------------------%>
                                <li class="movie-item" style="display: none;">

                                </li>
                            </ol>
                        </div>
                    </div>
                    <div class="btn-more v1" id="addMovieDiv" style="">
                        <button type="button" class="btn" id="btnAddMovie">더보기 <i class="iconset ico-btn-more-arr"></i></button>
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
    // 등급 클래스 반환 함수
    function getMovieGradeClass(grade) {
        switch (grade) {
            case "ALL":
                return "age-all";
            case "12":
                return "age-12";
            case "15":
                return "age-15";
            case "19":
                return "age-19";
            default:
                return "";
        }
    }

    // 등급 텍스트 반환 함수
    function getMovieGradeText(grade) {
        switch (grade) {
            case "ALL":
                return "전체 관람가";
            case "12":
                return "12세 관람가";
            case "15":
                return "15세 관람가";
            case "19":
                return "청소년 관람 불가";
            default:
                return "";
        }
    }

    document.addEventListener("DOMContentLoaded", function () {
        let offset = 20; // 초기 데이터 오프셋 값
        const pageSize = 20; // 한 번에 가져올 데이터 개수
        let totalMovieCount = 0; // 서버에서 반환된 총 영화 개수

        const loadMoreButton = document.querySelector("#btnAddMovie");
        const movieList = document.querySelector(".movie-list");

        if (!loadMoreButton || !movieList) {
            console.error("필수 요소를 찾을 수 없습니다.");
            return;
        }

        const fetchData = async function () {
            const url = "UserController?type=movieMain&offset=" + offset + "&pageSize=" + pageSize;
            console.log("Fetching data from URL:", url);

            try {
                const response = await fetch(url);
                if (!response.ok) {
                    throw new Error("HTTP error! status: " + response.status);
                }

                const data = await response.json();
                console.log("받은 데이터:", data);

                // 총 데이터 개수 설정
                if (totalMovieCount === 0) {
                    totalMovieCount = data.totalMovieCount;
                }

                const movies = data.movieArray;

                // 영화 목록 추가
                if (movies && movies.length > 0) {
                    movies.forEach(function (movie, index) {
                        const li = document.createElement("li");
                        li.classList.add("movie-item");
                        li.innerHTML =
                            '<a href="UserController?type=movieDetail&movieIdx=' + movie.movieIdx + '" class="movie-list-info" title="영화상세 보기">' +
                            '<p class="rank">' + (offset + index + 1) + '</p>' +
                            '<img src="' + movie.moviePosterUrl + '" alt="' + movie.movieTitle + '" class="poster">' +
                            '<div class="wrap">' +
                            '<div class="summary">' + movie.movieInfo + '</div>' +
                            '</div>' +
                            '</a>' +
                            '<div class="tit-area">' +
                            '<p class="movie-grade ' + getMovieGradeClass(movie.movieGrade) + '">' + getMovieGradeText(movie.movieGrade) + '</p>' +
                            '<p title="' + movie.movieTitle + '" class="tit">' + movie.movieTitle + '</p>' +
                            '</div>' +
                            '<div class="rate-date">' +
                            '<span class="rate">예매율 ' + movie.movieReservationRate + '%</span>' +
                            '<span class="date">개봉일 ' + movie.movieDate + '</span>' +
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

                    offset += pageSize; // offset 증가

                    // 모든 데이터를 로드한 경우 버튼 숨기기
                    if (offset >= totalMovieCount) {
                        console.log("모든 데이터를 불러왔습니다.");
                        loadMoreButton.style.display = "none";
                    }
                } else {
                    console.log("더 이상 불러올 데이터가 없습니다.");
                    loadMoreButton.style.display = "none";
                }
            } catch (error) {
                console.error("데이터 로드 중 오류 발생:", error);
            }
        };

        // "더보기" 버튼 클릭 이벤트
        loadMoreButton.addEventListener("click", fetchData);
    });





    const tabs = document.querySelectorAll('.tab');
    const contents = document.querySelectorAll('.content');

    tabs.forEach(tab => {
        tab.addEventListener('click', () => {
            tabs.forEach(t => t.classList.remove('active'));
            tab.classList.add('active');

            const target = tab.getAttribute('data-target');
            contents.forEach(content => {
                content.classList.remove('active');
                if (content.id === target) {
                    content.classList.add('active');
                }
            });
        });
    });



</script>
</body>
</html>
