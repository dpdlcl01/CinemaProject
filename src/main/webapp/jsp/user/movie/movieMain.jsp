<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!Doctype html>
<html lang="ko">
<!-- head -->

<head>
    <jsp:include page="../common/head.jsp"/>
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
                            </div>
                        </div>
                        <!-- main-movie-list boxRankList -->
                        <div class="main-movie-list">
                            <ol class="list clearfix movie-list">

                            <!-- movie-list-info -->
                            <c:if test="${requestScope.movieArray ne null }">
                            <c:forEach var="mvo" items="${requestScope.movieArray }" varStatus="st">
                                <li data-status="open">

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
                </div>
                <div id="nowShowing" class="content">
                    <h2>상영작</h2>
                    <p>상영작 내용이 표시됩니다..</p>
                </div>
                <div id="comingSoon" class="content">
                    <h2>상영예정작</h2>
                    <p>상영예정작 내용이 표시됩니다.</p>
                </div>
                <div class="btn-more v1" id="addMovieDiv" style="">
                    <button type="button" class="btn" id="btnAddMovie">더보기 <i class="iconset ico-btn-more-arr"></i></button>
                </div>
            </div>


        </section>
    </main>
</div>

<!-- footer 영역 -->
<jsp:include page="../common/footer.jsp"/>

<!-- script 영역 -->
<script>
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

    const itemsPerPage = 20; // 한 번에 표시할 영화 수
    let currentCount = 0; // 현재 표시된 영화 수

    // 더보기 버튼 클릭 이벤트
    document.getElementById('btnAddMovie').addEventListener('click', () => {
        const movieItems = document.querySelectorAll('.movie-item');

        // 숨겨진 영화 중 표시할 영화 선택
        for (let i = currentCount; i < currentCount + itemsPerPage && i < movieItems.length; i++) {
            movieItems[i].style.display = 'block'; // 숨김 해제
        }

        // 현재 카운트 업데이트
        currentCount += itemsPerPage;

        // 모든 영화가 표시되면 "더보기" 버튼 숨김
        if (currentCount >= movieItems.length) {
            document.getElementById('addMovieDiv').style.display = 'none';
        }
    });

    /* 개봉작만 보기버튼 */
    document.addEventListener('DOMContentLoaded', function () {
        const hiddenInput = document.getElementById('onairYn');
        const button = document.querySelector('.btnOnAir');
        const movieListItems = document.querySelectorAll('.movie-list li');



        button.addEventListener('click', function () {
            if (hiddenInput.value === 'N') {
                hiddenInput.value = 'Y';
                button.textContent = '개봉작만';
                button.title = '개봉작만 보기';
                button.classList.add('on');

                // 개봉작만 표시 (data-status="open")
                movieListItems.forEach(li => {
                    if (li.getAttribute('data-status') === 'open') {
                        li.style.display = 'list-item'; // 개봉작 표시
                    } else {
                        li.style.display = 'none'; // 전체 영화 숨기기
                    }
                });


            } else {
                hiddenInput.value = 'N';
                button.textContent = '개봉작만';
                button.title = '전체 영화 보기';
                button.classList.remove('on');

                // 모든 영화(li) 보이기
                movieListItems.forEach(li => {
                    li.style.display = 'list-item'; // 모든 영화 표시
                });
            }
        });
    });


</script>
</body>
</html>
