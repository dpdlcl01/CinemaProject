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
<%@ page import="java.text.SimpleDateFormat, java.util.Date" %>
<%
    String todayDate = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
    request.setAttribute("todayDate", todayDate);

    // 터미널(서버 콘솔)에 출력
    System.out.println("🚀 [DEBUG] 오늘 날짜: " + todayDate);
%>
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
                        <a href="UserController?type=movieDetail&movieIdx=${mvo.movieIdx}" class="movie-list-info" title="영화상세 보기">
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
                                <a href="UserController?type=reservation&movieIdx=${mvo.movieIdx}&date=${todayDate}"
                                   class="button btn1" title="영화 예매하기">예매</a>
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
                    <a href="${pageContext.request.contextPath}/UserController?type=reservation" title="빠른예매 보기">
                        <i class="quickreserve"></i>
                        빠른예매
                    </a>
                </div>
                <div class="cell">
                    <a href="${pageContext.request.contextPath}/UserController?type=theater" title="극장 보기">
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
                <a href="${pageContext.request.contextPath}/UserController?type=event&offset=0&pageSize=5" title="이벤트 더보기" class="btn-more">더보기</a>
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
                                <a href="" title="">
                                    <img src="https://img.megabox.co.kr/SharedImg/BnftMng/2025/01/22/LtSV5OaUV0j7ZRViEfVXGoHH7XwJ8cbE.jpg" alt="">
                                </a>
                            </div>
                            <div class="bg" style="left: 300px; opacity: 1;">
                                <a href="" title="">
                                    <img src="https://img.megabox.co.kr/SharedImg/BnftMng/2025/01/22/ebKckKothF6d7wKeHm7eLmUBsQ9zhJuz.jpg" alt="">
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
                                <a href="" title="">
                                    <img src="https://img.megabox.co.kr/SharedImg/BnftMng/2024/12/31/XeOIoBtvrXMFmhMpgfksu048yVbtuZZp.jpg" alt="">
                                </a>
                            </div>
                            <div class="bg" style="left: 450px; opacity: 1;">
                                <a href="" title="">
                                    <img src="https://img.megabox.co.kr/SharedImg/BnftMng/2024/12/31/Iv48B8KKcN2iKsLHLANxPW4LJOmp8QLp.jpg" alt="">
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
                                <a href="" title="">
                                    <img src="https://img.megabox.co.kr/SharedImg/BnftMng/2024/10/25/rJ952a8JpbgmHSsjPXbA20pIogJjmUJZ.jpg" alt="">
                                </a>
                            </div>
                            <div class="bg" style="left: 300px; opacity: 1;">
                                <a href="" title="">
                                    <img src="https://img.megabox.co.kr/SharedImg/BnftMng/2024/10/25/8pnfD3MnGMMamzUSvBzGKTFHfARuRIXW.jpg" alt="">
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
                        <a href="" title="">
                            <img src="https://img.megabox.co.kr/SharedImg/event/2025/01/17/h8nUUAwSBq48DWZf0E6PcMZpl7IWTSFh.jpg" alt="[메가박스X신세계포인트] 다시 돌아온 영화 같은 새해 이벤트">
                        </a>
                    </div>
                    <div class="size small">
                        <a href="" title="">
                            <img src="https://img.megabox.co.kr/SharedImg/event/2025/01/17/ai3avxVyRya1GaSiymBsBV3cQ06rPVkQ.jpg" alt="[메가박스X신세계포인트] 다시 돌아온 영화 같은 새해 이벤트">
                        </a>
                    </div>
                </div>
                <!-- //banner -->
                <div class="ad-img">
                    <img src="https://mlink-cdn.netinsight.co.kr/2025/01/07/6b54ae7a722f8b4293bbcc22881cfab6.jpg" alt="">
                </div>
            </div>
            <!-- brn-ad -->
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
    <script src="${pageContext.request.contextPath}/js/userMain.js"></script>
</body>
</html>