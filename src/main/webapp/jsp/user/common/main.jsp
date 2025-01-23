<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">

<!-- head 영역 -->
<head>
    <jsp:include page="head.jsp"/>
</head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/common.css">

<body class="main-page">

<!-- header 영역 -->
<jsp:include page="header.jsp"/>

<main id="main">
    <!-- section01 -->
    <section id="section01" class="section main-movie">
        <!-- cont-area -->
        <div class="cont-area">
            <!-- tab-sorting -->
            <div class="tab-sorting">
                <button type="button" class="on" sort="boxRankList" name="btnSort">박스오피스</button>
            </div>
            <!-- //tab-sorting -->
            <a href="${pageContext.request.contextPath}/UserController?type=movieMain&offset=0&pageSize=20" class="more-movie" title="더 많은 영화보기">
                더 많은 영화보기
                <i class="iconset ico-more-corss gray"></i>
            </a>
            <!-- main-movie-list boxRankList -->
            <div class="main-movie-list">
                <ol class="list clearfix">

                    <!-- movie-list-info -->
                    <c:if test="${requestScope.movieArray ne null }">
                    <c:forEach var="mvo" items="${requestScope.movieArray }" varStatus="st">
                    <li>
                        <a href="UserController?type=movieDetail&movieIdx=${mvo.movieIdx }" class="movie-list-info" title="영화상세 보기">
                            <p class="rank">${st.index+1 }</p>
                            <img src="${mvo.moviePosterUrl }" alt="${mvo.movieTitle }" class="poster">
                            <div class="wrap">
                                <div class="summary">
                                    ${mvo.movieInfo }
                                </div>
                            </div>
                        </a>
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
                </ol>
            </div>
            <!-- //main-movie-list boxRankList -->

            <div class="search-link clearfix">
                <div class="cell">
                    <div class="search">
                        <input type="text" placeholder="영화명을 입력해 주세요" title="영화 검색" class="input-text">
                        <button class="btn">
                            <i class="ico-search"></i>
                            검색
                        </button>
                    </div>
                </div>
                <div class="cell">
                    <a href="${pageContext.request.contextPath}/UserController?type=movieMain&offset=0&pageSize=20" title="박스오피스 보기">
                        <i class="boxoffice"></i>
                        박스오피스
                    </a>
                </div>
                <div class="cell">
                    <a href="#" title="빠른예매 보기">
                        <i class="quickreserve"></i>
                        빠른예매
                    </a>
                </div>
                <div class="cell">
                    <a href="#" title="극장 보기">
                        <i class="schedule"></i>
                        극장
                    </a>
                </div>
            </div>
        </div>
        <!-- //cont-area -->
    </section>
    <!-- //section01 -->
    <!-- section02 -->
    <section id="section02" class="section main-benefit">
        <!-- wrap -->
        <div class="wrap">
            <div class="tit-util clearfix">
                <h2 class="tit">이벤트</h2>
                <a href="" title="이벤트 더보기" class="btn-more">더보기</a>
            </div>
            <!-- slider -->
            <div class="slider main-condition">
                <!-- slider-view -->
                <div class="slider-view" style="width: 1100px;">
                    <!-- cell -->
                    <div class="cell" style="display: block; position: absolute; float: none;">
                        <!-- position -->
                        <div class="position">
                            <div class="txt" style="top: 0; opacity: 1;">
                                <a href="" title="메가박스 오리지널 티켓 N0.4 버즈 오브 프레이(할리퀸의 황홀한 해방)을 가장 잘 간직하는 방법">
                                    <img src="https://img.megabox.co.kr/SharedImg/BnftMng/2020/02/04/WVTfxUcof8BncupJOcezc5QyPd0qBDEu.jpg" alt="">
                                </a>
                            </div>
                            <div class="bg" style="left: 300px; opacity: 1;">
                                <a href="" title="메가박스 오리지널 티켓 N0.4 버즈 오브 프레이(할리퀸의 황홀한 해방)을 가장 잘 간직하는 방법">
                                    <img src="https://img.megabox.co.kr/SharedImg/BnftMng/2020/02/04/H6zaA0lnR8DwbafHONjYXL5hUOwbquFS.jpg" alt="">
                                </a>
                            </div>
                        </div>
                        <!-- //position -->
                    </div>
                    <!-- //cell -->
                    <!-- cell -->
                    <div class="cell" style="display: none; position: absolute; float: none;">
                        <!-- position -->
                        <div class="position">
                            <div class="txt" style="top: 100px; opacity: 1;">
                                <a href="" title="메가박스 오리지널 티켓북 출시">
                                    <img src="https://img.megabox.co.kr/SharedImg/BnftMng/2020/02/04/jIx6azAbreahaBC4Ax1uCtovoUWu3Cky.jpg" alt="">
                                </a>
                            </div>
                            <div class="bg" style="left: 450px; opacity: 1;">
                                <a href="" title="메가박스 오리지널 티켓북 출시">
                                    <img src="https://img.megabox.co.kr/SharedImg/BnftMng/2020/02/04/J907IQ97HGyZbAU8IYEijq0FAx2QckCd.jpg" alt="">
                                </a>
                            </div>
                        </div>
                        <!-- //position -->
                    </div>
                    <!-- //cell -->
                    <!-- cell -->
                    <div class="cell" style="display: none; position: absolute; float: none;">
                        <!-- position -->
                        <div class="position">
                            <div class="txt" style="top: 0; opacity: 1;">
                                <a href="" title="별별닉네임상영관 메가픽 홍대">
                                    <img src="https://img.megabox.co.kr/SharedImg/BnftMng/2020/02/04/XAcNkLSSGU1PPpeFjVAjsxSBtLjUMxRx.jpg" alt="">
                                </a>
                            </div>
                            <div class="bg" style="left: 300px; opacity: 1;">
                                <a href="" title="별별닉네임상영관 메가픽 홍대">
                                    <img src="https://img.megabox.co.kr/SharedImg/BnftMng/2020/02/04/wLVouIgIpeYVfhs3MuG8fhwZreUgHBoQ.jpg" alt="">
                                </a>
                            </div>
                        </div>
                        <!-- //position -->
                    </div>
                    <!-- //cell -->
                </div>
                <!-- //slider-view -->
                <!-- slider-control -->
                <div class="slider-control">
                    <div class="page">
                        <span class="on" style="width: 33.333333333%;"></span>
                        <span style="width: 33.333333333%;"></span>
                        <span style="width: 33.333333333%;"></span>
                    </div>
                    <div class="util">
                        <button type="button" class="btn-prev" style="opacity: 0.5;" disabled="true">이전 이벤트 보기</button>
                        <button type="button" class="btn-next" style="opacity: 1;">다음 이벤트 보기</button>
                        <button type="button" class="btn-pause on">일시정지</button>
                        <button type="button" class="btn-play">자동재생</button>
                    </div>
                    <div class="page-count">1 / 3</div>
                </div>
                <!-- //slider-control -->
            </div>
            <!-- //slider -->
            <!-- brn-ad -->
            <div class="brn-ad">
                <!-- banner -->
                <div class="banner clearfix">
                    <div class="size">
                        <a href="" title="특전 이벤트 하이큐!">
                            <img src="https://img.megabox.co.kr/SharedImg/event/2020/02/04/89hw0U9G7GNAVUqnoP1BP0YZehxo7GKe.jpg" alt="">
                        </a>
                    </div>
                    <div class="size small">
                        <a href="" title="시그니처 특별관 MX편">
                            <img src="https://img.megabox.co.kr/SharedImg/event/2020/02/04/a9XWSZ4sDkluJJEq6x3hTd8cT6bT3rOI.jpg" alt="">
                        </a>
                    </div>
                </div>
                <!-- //banner -->
                <div class="ad-img">
                    <img src="https://mlink-cdn.netinsight.co.kr/2020/02/03/0d1e122f5dd9231ff5b1e17f90d7a8dd.jpg" alt="">
                </div>
            </div>
            <!-- brn-ad -->
            <!-- grand-open -->
            <div class="grand-open">
                <p class="tit">
                    <span>LIFE THEATER MEGABOX</span>
                    <strong>GRAND<br>OPENING</strong>
                </p>
            </div>
            <!-- //grand-open -->
        </div>
        <!-- //wrap -->
    </section>
    <!-- //section02 -->


    <!-- section04 -->
    <section id="section04" class="section main-info">
        <h2 class="tit">메가박스 안내</h2>
        <!-- info-special -->
        <div class="info-special">
            <a href="" title="부띠크 페이지로 이동" class="butique">부띠크</a>
            <a href="" title="MX 페이지로 이동" class="mx">MX</a>
            <a href="" title="COMFORT 페이지로 이동" class="comfort">COMFORT</a>
            <a href="" title="MEGA KIDS BOX 페이지로 이동" class="mega-kids-box">MEGA KIDS BOX</a>
            <a href="" title="THE FIRST CLUB 페이지로 이동" class="the-first-club">THE FIRST CLUB</a>
        </div>
        <!-- //info-special -->
    </section>
    <!-- //section04 -->
</main>
<!-- footer 영역 -->
<jsp:include page="footer.jsp"/>
<jsp:include page="modalscript.jsp"/>
</body>
</html>