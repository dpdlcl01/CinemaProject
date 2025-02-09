<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <jsp:include page="../common/head.jsp"/>
    <style>
        /* 로그인 알림 다이얼로그 기본 숨김 */
        #loginNoticeDialog {
            display: none;
        }
        /* 공통 다이얼로그 스타일 */
        .dialog-common {
            padding: 0;
            font-weight: 600;
        }

        .dialog-common .ui-btn-div {
            margin: auto;
            text-align: center;
            margin-top: 20px;
        }

        .dialog-common button {
            width: 80px;
            height: 40px;
            border: 1px solid #503396;
            background-color: #503396;
            color: white;
            border-radius: 3px;
        }

        /* 타이틀 스타일 */
        .dialog-common .ui-dialog-titlebar {
            background-color: #503396; /* 타이틀 배경색 */
            color: white; /* 텍스트 색상 */
            border: 2px solid #503396;
        }

        /* 콘텐츠 스타일 */
        .dialog-common .ui-dialog-content {
            color: black; /* 텍스트 색상 */
            font-size: 14px; /* 적절한 폰트 크기 */
        }

        /* 닫기 버튼 숨김 */
        .dialog-common .ui-dialog-titlebar-close {
            display: none;
        }

        /* 버튼 정렬 */
        .dialog-common .ui-dialog-buttonpane {
            text-align: center !important;
        }

        .dialog-common .ui-dialog-buttonset {
            float: none !important;
            display: inline-block;
        }
        /* 공통 다이얼로그 스타일 */

        .pagination {
            clear: both;
            position: relative;
            margin: 0 auto;
            padding: 30px 0 0 0;
            display: flex;
            justify-content: center;
        }

        .pagination .active {
            color: #fff;
            background-color: #01738b;
            border-color: #01738b;
        }

        .pagination .control, .pagination a, .pagination strong {
            display: inline-block;
            position: relative;
            min-width: 32px;
            height: 32px;
            margin: 0;
            padding: 0 8px;
            border: 1px solid #ebebeb;
            text-decoration: none;
            line-height: 30px;
            color: #333;
            font-weight: 400;
            vertical-align: middle;
            border-radius: 4px;
        }

        .pagination .control.next {
            margin-left: 5px;
            background-position: -64px 0;
        }

        .pagination .control {
            overflow: hidden;
            width: 32px;
            height: 32px;
            background: url(https://img.megabox.co.kr/static/pc/images/common/btn/btn-paging.png) no-repeat 0 0;
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


    /* 모달 배경 */
        .modal-layer {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.7);
            display: flex;
            justify-content: center;
            align-items: center;
            z-index: 1000;
        }

        .modal-layer .wrap {
            background-color: white;
            border-radius: 10px;
            width: 500px;
            height: auto;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
            position: relative;
            overflow: hidden;
        }

        /* 모달 제목 왼쪽 정렬 */
        .layer-header {
            background-color: #503396;
            color: white;
            padding: 15px;
            text-align: left; /* 왼쪽 정렬 */
            font-size: 18px;
            position: relative;
        }

        /* 닫기 버튼 스타일 */
        .btn-modal-close {
            position: absolute;
            top: 10px;
            right: 10px;
            background: white; /* 흰색 배경 */
            border: none;
            font-size: 20px;
            cursor: pointer;
            border-radius: 50%; /* 둥글게 */
            padding: 5px;
        }

        /* 취소 버튼 스타일 */
        .button.close-layer {
            background-color: white; /* 흰색 배경 */
            color: #503396; /* 텍스트 색상 */
            border: 1px solid #ccc;
        }

        /* 별점 점수 부분 스타일 */
        .num {
            margin-top: 10px;
            font-size: 1.5em; /* 크기를 조금 더 키움 */
            color: #503396;
            font-weight: bold;
            text-align: center;
        }

        .layer-con {
            padding: 20px;
        }

        .regi-reply-score .score .tit {
            text-align: center;
            font-size: 1.4em;
            margin-bottom: 20px;
        }

        /* 별점 */
        .box-star-score .star {
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .box-star-score .group {
            display: flex;
            margin-right: 5px; /* 그룹 간 간격 */
        }

        .btn.left,
        .btn.right {
            width: 15px;
            height: 30px;
            border: none;
            background-size: cover;
            cursor: pointer;
        }

        /* 기본 상태 */
        .btn.left {
            background-image: url("https://img.megabox.co.kr/static/pc/images/common/btn/btn-star-left-off.png");
        }

        .btn.right {
            background-image: url("https://img.megabox.co.kr/static/pc/images/common/btn/btn-star-right-off.png");
        }

        /* 활성 상태 */
        .btn.left.active,
        .btn.left.hovered {
            background-image: url("https://img.megabox.co.kr/static/pc/images/common/btn/btn-star-left-review-on.png");
        }

        .btn.right.active,
        .btn.right.hovered {
            background-image: url("https://img.megabox.co.kr/static/pc/images/common/btn/btn-star-right-review-on.png");
        }




        .num {
            margin-top: 10px;
            font-size: 1.2em;
            color: #503396;
        }

        /* 텍스트 입력 */
        .textarea textarea {
            width: 100%;
            height: 100px;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            resize: none;
            margin-top: 10px;
        }

        .textarea .util {
            text-align: right;
            font-size: 12px;
            margin-top: 5px;
        }

        /* 버튼 */
        .btn-group-fixed {
            display: flex;
            justify-content: space-between;
            padding: 10px 20px;
        }

        .button {
            width: 45%;
            padding: 10px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }

        .button.close-layer {
            background-color: #ddd;
        }

        .button.purple {
            background-color: #503396;
            color: white;
        }

        .btn-modal-close {
            position: absolute;
            top: 10px;
            right: 10px;
            background: none;
            border: none;
            font-size: 20px;
            cursor: pointer;
        }

        .icon-heart {
            display: inline-block;
            vertical-align: middle;
            width: 17px;
            height: 15px;
            background-image: url("https://img.megabox.co.kr/static/pc/images/common/ico/ico-heart-line.png");
            background-position: 0 0;
            background-repeat: no-repeat;
        }

        .icon-heart.liked {
            background-image: url("https://img.megabox.co.kr/static/pc/images/common/ico/ico-heart-on.png");
        }

        .movie-detail-page .movie-detail-cont .btn-util .btn:hover .icon-heart {
            background-image: url("https://img.megabox.co.kr/static/pc/images/common/ico/ico-heart-on.png");
        }

    </style>

</head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/movieDetail.css">

<body>
<jsp:include page="../common/header.jsp"/>

<c:if test="${requestScope.mvo ne null }">
<!-- movie-detail -->
<div class="movie-detail-page">
    <div class="bg-img">영화 포스터</div>
    <div class="movie-detail-cont">
        <c:if test="${mvo.movieRank eq null}">
            <p class="d-day">상영종료</p>
        </c:if>
        <c:if test="${mvo.movieRank ne null}">
            <c:if test="${requestScope.dDay ne null}">
                <p class="d-day">
                    <c:choose>
                        <c:when test="${requestScope.dDay == 0}">개봉 D-Day</c:when>
                        <c:when test="${requestScope.dDay > 0}">개봉 D-${requestScope.dDay}</c:when>
                    </c:choose>
                </p>
            </c:if>
        </c:if>

        <p class="title">${mvo.movieTitle }</p>
        <p class="title-eng">${mvo.movieTitleEn }</p>
        <div class="btn-util">
            <!-- 찜하기 버튼을 누를 때 로그인 체크를 호출하며 영화 인덱스를 인자로 보낸다. -->
            <button type="button" class="btn" onclick="loginCheck(${mvo.movieIdx})">
                <i class="icon-heart"></i>
                <span title="보고싶어 한 명수" id="wantsee-${mvo.movieIdx}">
                        ${mvo.movieLikes}
                </span>
            </button>
        </div>
        <div class="screen-type2">
            <p>
                <img src="https://img.megabox.co.kr/static/pc/images/movie/type_dolbycinema_d.png" alt="dolby">
            </p>
        </div>
        <div class="info">
            <c:if test="${requestScope.dDay eq null }">
            <div class="score">
                <p class="tit">실관람 평점</p>
                <div class="number" id="mainScore">
                    <img src="https://img.megabox.co.kr/static/pc/images/common/ico/ico-megabox.png"/>
                    <p title="실관람 평점" class="before">
                        <c:if test="${fn:length(requestScope.reviewArray) eq 0 }">
                            <em>0</em>
                        </c:if>
                        <c:if test="${fn:length(requestScope.reviewArray) ne 0 }">
                            <em>${requestScope.averageRating }</em>
                        </c:if>
                        <span class="ir">점</span>
                    </p>
                </div>
            </div>
            </c:if>
            <div class="rate">
                <p class="tit">예매율</p>
                <p class="cont">
                    <img src="https://img.megabox.co.kr/static/pc/images/common/ico/ico-ticket-gray.png"/>
                    <c:choose>
                        <c:when test="${mvo.movieRank ne null}">
                            <em>${mvo.movieRank}</em> 위 (${mvo.movieReservationRate }%)
                        </c:when>
                        <c:otherwise>
                            <em>-</em> 위 (-%)
                        </c:otherwise>
                    </c:choose>
                </p>
            </div>
            <div class="audience">
                <div class="tit">누적관객수</div>
                <p class="cont">
                    <img src="https://img.megabox.co.kr/static/pc/images/common/ico/ico-person.png"/>
                    <c:choose>
                        <c:when test="${mvo.movieTotalAudience ne null}">
                            <em><fmt:formatNumber value="${mvo.movieTotalAudience }"/></em> 명
                        </c:when>
                        <c:otherwise>
                            <em>-</em> 명
                        </c:otherwise>
                    </c:choose>
                </p>
            </div>
        </div>
        <div class="poster">
            <div class="wrap">
                <img src="${mvo.moviePosterUrl }"
                     alt="${mvo.movieTitle }">
                <c:choose>
                    <c:when test="${mvo.movieGrade == 'ALL' }"><p class="movie-grade big age-all">전체 관람가</p></c:when>
                    <c:when test="${mvo.movieGrade == '12' }"><p class="movie-grade big age-12">12세 관람가</p></c:when>
                    <c:when test="${mvo.movieGrade == '15' }"><p class="movie-grade big age-15">15세 관람가</p></c:when>
                    <c:when test="${mvo.movieGrade == '19' }"><p class="movie-grade big age-19">청소년 관람 불가</p></c:when>
                </c:choose>
            </div>
        </div>
        <div class="reserve-type">
            <c:if test="${mvo.movieRank eq null}">
                <!-- 상영종료 버튼 -->
                <button type="button" class="reserve-btn disabled" disabled>
                    상영종료
                </button>
            </c:if>
            <c:if test="${mvo.movieRank ne null}">
                <!-- 예매 버튼 -->
                <form action="UserController?type=reservation&movieIdx=${mvo.movieIdx}" method="post">
                    <button type="submit" class="reserve-btn">
                        예매
                    </button>
                </form>
            </c:if>
        </div>

    </div>
</div>

<!--// movie-detail -->
<div class="contents">
    <div class="main-tab">
        <div class="tabs">
            <div class="tab ${activeTab == 'all' ? 'active' : ''}" data-target="all">주요정보</div>
            <div class="tab ${activeTab == 'megaPick' ? 'active' : ''}" data-target="megaPick">실관람평</div>
            <div class="tab ${activeTab == 'movies' ? 'active' : ''}" data-target="movies">예고편</div>
        </div>
        <div id="all" class="content ${activeTab == 'all' ? 'active' : ''}">
            <div class="movie-summary">
                <div class="text">
                    ${mvo.movieInfo }
                </div>
                <div class="btn-more">
                    <button type="button" class="btn">
                        <span>닫기</span>
                        <i class="icon-down"></i>
                    </button>
                </div>
            </div>
            <div class="movie-info">
                <p>${mvo.movieNation }</p>
                <div class="line">
                    <c:if test="${mvo.movieDirector ne null}">
                    <p>감독 : ${mvo.movieDirector }</p>
                    </c:if>
                    <p>장르 : ${mvo.movieGenre } / ${mvo.movieTime }분</p>
                    <p>등급 : ${movieGradeText }</p>
                    <p>개봉일 : ${openDate }</p>
                </div>
                <c:if test="${mvo.movieActors ne null}">
                <p>출연진 : ${mvo.movieActors }</p>
                </c:if>
            </div>
        </div>
        <div id="megaPick" class="content ${activeTab == 'megaPick' ? 'active' : ''}">
            <!-- 실관람평 -->
            <!-- 한줄평 없을 때 -->
            <div class="reviews">
                <c:choose>
                    <c:when test="${fn:length(requestScope.reviewArray) eq 0}">
                        <h2 class="titSmall">아직 남겨진 관람평이 없어요.</h2>
                    </c:when>
                    <c:otherwise>
                        <h2 class="titSmall">${mvo.movieTitle}에 대한 ${page.totalRecord}개의 이야기가 있어요!</h2>
                    </c:otherwise>
                </c:choose>

                <div class="oneLineReview">
                    <!-- 본 영화가 아닌경우 -->
                    <div class="storyBox">
                        <div class="storyWrap">
                            <c:if test="${fn:length(requestScope.reviewArray) eq 0 }">
                                첫번째
                                <span class="fontBlue">관람평</span>의 주인공이 되어 보세요.
                            </c:if>
                            <c:if test="${fn:length(requestScope.reviewArray) ne 0 }">
                                <span class="fontBlue">${mvo.movieTitle }</span> 재미있게 보셨나요? 영화의 어떤 점이 좋았는지 이야기해주세요.<br/>
                                관람평 등록 시 100P가 적립됩니다.
                            </c:if>
                        </div>

                        <div class="storyWrite">
                            <!-- 관람평 쓰기 버튼 -->
                            <a href="#tooltip" class="tooltipClick" data-movie-idx="${mvo.movieIdx}">
                                <i class="iconWrite"></i>
                                관람평쓰기
                            </a>
                        </div>
                    </div>

                    <c:forEach var="rvo" items="${requestScope.reviewArray }">
                    <div class="reviewed">
                        <div class="userName">
                            <i class="iconUser"> </i>
                            <div class="userId">${rvo.userId }</div>
                            <div class="writeTime">${rvo.reviewDate }</div>
                        </div>
                        <div class="reviewBox">
                            <div class="reviewWrap">
                                <div class="storyReview">관람평 <em>${rvo.reviewRating }</em></div>
                                <div class="storyText">
                                        ${rvo.reviewContent }
                                </div>
                            </div>
                        </div>
                    </div>
                    </c:forEach>
                </div>

                <nav class="pagination">
                    <c:if test="${requestScope.page ne null}">
                        <c:set var="pvo" value="${requestScope.page}" />

                        <!-- << (맨 처음으로) -->
                        <c:if test="${pvo.nowPage > 1 && pvo.totalPage > 10}">
                            <a href="UserController?type=movieDetail&movieIdx=${mvo.movieIdx}&cPage=1&activeTab=megaPick" class="control first" title="처음 페이지">&laquo;</a>
                        </c:if>

                        <!-- < (이전 페이지 블록) -->
                        <c:if test="${pvo.startPage > 1}">
                            <a href="UserController?type=movieDetail&movieIdx=${mvo.movieIdx}&cPage=${pvo.startPage - pvo.pagePerBlock}&activeTab=megaPick" class="control prev" title="이전 블록">&lt;</a>
                        </c:if>

                        <!-- 페이지 번호 -->
                        <c:forEach begin="${pvo.startPage}" end="${pvo.endPage}" varStatus="st">
                            <c:if test="${st.index eq pvo.nowPage}">
                                <strong class="active">${st.index}</strong>
                            </c:if>
                            <c:if test="${st.index ne pvo.nowPage}">
                                <a href="UserController?type=movieDetail&movieIdx=${mvo.movieIdx}&cPage=${st.index}&activeTab=megaPick" title="${st.index}페이지 보기">${st.index}</a>
                            </c:if>
                        </c:forEach>

                        <!-- > (다음 페이지 블록) -->
                        <c:if test="${pvo.endPage < pvo.totalPage}">
                            <a href="UserController?type=movieDetail&movieIdx=${mvo.movieIdx}&cPage=${pvo.startPage + pvo.pagePerBlock}&activeTab=megaPick" class="control next" title="다음 블록">&gt;</a>
                        </c:if>

                        <!-- >> (맨 마지막으로) -->
                        <c:if test="${pvo.nowPage < pvo.totalPage && pvo.totalPage > 10}">
                            <a href="UserController?type=movieDetail&movieIdx=${mvo.movieIdx}&cPage=${pvo.totalPage}&activeTab=megaPick" class="control last" title="마지막 페이지">&raquo;</a>
                        </c:if>
                    </c:if>
                </nav>

            </div>
            <section id="layer_regi_reply_review" class="modal-layer" style="display: none;">
                <div class="wrap">
                    <header class="layer-header">
                        <h3 class="tit"><span class="oneTitle">관람평</span> 작성하기</h3>
                    </header>
                    <div class="layer-con">
                        <div class="regi-reply-score review">
                            <!-- 별점 -->
                            <div class="score">
                                <p class="tit">
                                    "¿¿영화제목¿¿"<br>
                                    영화 어떠셨나요?
                                </p>
                                <div class="box-star-score">
                                    <div class="star">
                                        <div class="group">
                                            <button type="button" class="btn left" data-value="1"></button>
                                            <button type="button" class="btn right" data-value="2"></button>
                                        </div>
                                        <div class="group">
                                            <button type="button" class="btn left" data-value="3"></button>
                                            <button type="button" class="btn right" data-value="4"></button>
                                        </div>
                                        <div class="group">
                                            <button type="button" class="btn left" data-value="5"></button>
                                            <button type="button" class="btn right" data-value="6"></button>
                                        </div>
                                        <div class="group">
                                            <button type="button" class="btn left" data-value="7"></button>
                                            <button type="button" class="btn right" data-value="8"></button>
                                        </div>
                                        <div class="group">
                                            <button type="button" class="btn left" data-value="9"></button>
                                            <button type="button" class="btn right" data-value="10"></button>
                                        </div>
                                    </div>
                                    <div class="num">
                                        <em>0</em>
                                        <span>점</span>
                                    </div>
                                </div>


                            </div>

                            <!-- 한줄평 입력 -->
                            <div class="textarea">
                                <textarea id="textarea" rows="5" cols="30" placeholder="실관람평을 남겨주세요." class="input-textarea"></textarea>
                                <div class="util">
                                    <p class="count"><span>0</span> / 100</p>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- 버튼 -->
                    <div class="btn-group-fixed">
                        <button type="button" class="button close-layer">취소</button>
                        <button type="button" class="button purple">등록</button>
                    </div>
                    <button type="button" class="btn-modal-close">×</button>
                </div>
            </section>

            <!-- //실관람평 -->
        </div>


        <div id="movies" class="content ${activeTab == 'movies' ? 'active' : ''}">
            <!-- 예고편 -->
            <div class="trailer">
                <h2 class="trailerTitle">예고편</h2>

                <c:choose>
                    <%-- 예고편 데이터가 없는 경우 --%>
                    <c:when test="${empty tmdbTrailers}">
                        <div id="result-zero">해당 영화의 예고편이 존재하지 않습니다.</div>
                    </c:when>

                    <%-- 예고편 데이터가 있는 경우 --%>
                    <c:otherwise>
                        <c:if test="${not empty mainTrailer}">
                            <div class="mainTrailer" style="text-align: center; margin-bottom: 20px;">
                                <iframe id="mainTrailer" width="800" height="450" frameborder="0" allowfullscreen
                                        src="https://www.youtube.com/embed/${mainTrailer.videoKey}?rel=0&autoplay=1">
                                </iframe>
                            </div>
                        </c:if>

                        <div class="thumbnails" style="display: flex; gap: 10px; justify-content: center; flex-wrap: wrap;">
                            <c:forEach var="trailer" items="${tmdbTrailers}">
                                <div class="thumbnail"
                                     onclick="changeMainVideo('${trailer.videoKey}')"
                                     style="width: 120px; text-align: center; cursor: pointer;">
                                    <img src="https://img.youtube.com/vi/${trailer.videoKey}/hqdefault.jpg"
                                         alt="${trailer.videoName}"
                                         style="width: 100%; height: auto; border-radius: 8px;">
                                    <p style="font-size: 14px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis; margin-top: 5px;">
                                        <c:out value="${trailer.videoName}" />
                                    </p>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                    </c:otherwise>
            </c:choose>
            </div>

        <script>
            function changeMainVideo(videoKey) {
                var iframe = document.getElementById("mainTrailer");
                iframe.src = "https://www.youtube.com/embed/" + videoKey + "?rel=0&autoplay=1";
            }
        </script>
        </div>




    </div>
</div>
</c:if>
<!-- 로그인 필요 알림 다이얼로그 -->
<div id="loginNoticeDialog" title="알림" class="dialog-common">
    <p>로그인 후 이용 가능한 서비스입니다.</p>
    <div class="ui-btn-div">
        <button type="button" onclick="closeDialog('loginNoticeDialog')">확인</button>
    </div>
</div>
<div id="watchNoticeDialog" class="dialog-common" style="display: none;">
    <p>영화를 관람하신 후에만 관람평을 작성할 수 있습니다.</p>
    <div class="ui-btn-div">
        <button type="button" onclick="closeDialog('watchNoticeDialog')">확인</button>
    </div>
</div>
<div id="reviewCompleteNoticeDialog" class="dialog-common" style="display: none;">
    <p>이미 관람평을 작성하셨습니다.</p>
    <div class="ui-btn-div">
        <button type="button" onclick="closeDialog('reviewCompleteNoticeDialog')">확인</button>
    </div>
</div>
<input type="hidden" id="hidden-movie-idx" value="${requestScope.mvo.movieIdx}">
<script>
    // 다이얼로그 초기화
    $(document).ready(function () {
        $("#loginNoticeDialog, #watchNoticeDialog, #reviewCompleteNoticeDialog").dialog({
            autoOpen: false,
            modal: true,
            resizable: false,
            width: 400
        });
    });

    // 다이얼로그 열기 함수
    function openDialog(dialogId) {
        $("#" + dialogId).dialog("open");
    }

    // 다이얼로그 닫기 함수
    function closeDialog(dialogId) {
        const dialogElement = $("#" + dialogId);

        if (dialogElement.hasClass("ui-dialog-content")) {
            dialogElement.dialog("close");
        } else {
            dialogElement.hide();
        }
    }


    // 로그인 여부가 필요한 찜하기 버튼의 경우 로그인 체크 액션을 호출하여
    // 로그인 여부를 비동기식으로 판단하고, 이후 다시 비동기식으로 찜하기를 적용한다.
    function loginCheck(movieIdx) {
        // 1. 비동기로 로그인 체크
        $.ajax({
            url: 'UserController?type=loginCheck',
            type: 'POST',
            dataType: 'json',
            success: function (res) {
                if (res.login) {
                    // 2. 로그인된 상태 → 찜하기 로직 호출
                    updateMovieLike(movieIdx);
                } else {
                    // 3. 로그인되지 않은 상태 → 로그인 모달 창 띄우기
                    openDialog("loginNoticeDialog"); // 로그인 알림 다이얼로그 열기
                }
            }
        });
    }

    // 로그인된 상태라면 찜하기 버튼을 클릭할 때
    // 이미 찜했는지 여부를 확인 후 [선호 영화로 추가 및 숫자 1 증가] 또는 [선호 영화에서 삭제 및 숫자 1 감소]
    function updateMovieLike(movieIdx) {
        // 로그인된 상태에서 찜하기 처리
        $.ajax({
            url: 'UserController?type=movieLikes',
            type: 'POST',
            data: { movieIdx: movieIdx },
            dataType: 'json',
            success: function(res) {
                if (res.success) {
                    // 찜하기 성공 시 UI 업데이트
                    const likeCountSpan = document.getElementById("wantsee-" + movieIdx);
                    likeCountSpan.textContent = res.newLikeCount; // 새로운 찜하기 수로 업데이트

                    // 아이콘 상태 업데이트: liked 클래스 추가/제거
                    const iconHeart = likeCountSpan.previousElementSibling; // <i class="icon-heart"> 찾기
                    if (res.liked) {
                        iconHeart.classList.add("liked"); // 찜하기 상태로 변경
                    } else {
                        iconHeart.classList.remove("liked"); // 찜하기 해제 상태로 변경
                    }

                } else {
                    alert(res.message || "찜하기에 실패했습니다.");
                }
            },
            error: function() {
                alert("찜하기 처리 중 오류가 발생했습니다.");
            }
        });
    }

    // 관람평 관련 로그인 체크, 모달
    function writeReview(movieIdx) {
        if (!movieIdx) {
            alert("movieIdx 값이 유효하지 않습니다.");
            return;
        }
        // 1. 비동기로 로그인 체크
        $.ajax({
            url: 'UserController?type=loginCheck', // 로그인 체크 URL
            type: 'POST',
            dataType: 'json',
            success: function (res) {
                if (!res.login) {
                    // 로그인되지 않은 상태 → 로그인 안내 모달
                    openDialog("loginNoticeDialog");
                } else {
                    // 로그인된 상태 → 관람 여부 확인
                    checkWatchedMovie(res.userIdx, movieIdx);
                }
            }
        });
    }

    // 2. 관람 여부 확인
    function checkWatchedMovie(userIdx, movieIdx) {
        $.ajax({
            url: 'UserController?type=reviewCheckWatchedMovie',
            type: 'POST',
            data: { userIdx: userIdx, movieIdx: movieIdx },
            dataType: 'json',
            success: function (res) {
                if (!res.watched) {
                    // 관람 기록 없음 → 관람 필요 안내 모달
                    openDialog("watchNoticeDialog");
                } else {
                    // 관람 기록 있음 → 관람평 작성 여부 확인
                    checkReviewWritten(userIdx, movieIdx);
                }
            }
        });
    }

    // 3. 관람평 작성 여부 확인
    function checkReviewWritten(userIdx, movieIdx) {
        $.ajax({
            url: 'UserController?type=reviewCheckWritten',
            type: 'POST',
            data: { userIdx: userIdx, movieIdx: movieIdx },
            dataType: 'json',
            success: function (res) {
                if (res.reviewWritten) {
                    // 이미 관람평 작성 → 작성 완료 안내 모달
                    openDialog("reviewCompleteNoticeDialog");
                } else {
                    // 관람평 작성 가능 → 관람평 작성 모달 열기
                    openReviewWriteModal();
                }
            }
        });
    }

    // 관람평 작성 모달 열기
    function openReviewWriteModal() {
        document.getElementById("layer_regi_reply_review").style.display = "block";
    }

    // 관람평 작성 모달 닫기
    function closeReviewWriteModal() {
        document.getElementById("layer_regi_reply_review").style.display = "none";
    }


    document.addEventListener("DOMContentLoaded", function () {
        // 모든 .tooltipClick 요소에 이벤트 리스너 추가
        const tooltipLinks = document.querySelectorAll(".tooltipClick");
        tooltipLinks.forEach(link => {
            link.addEventListener("click", function (event) {
                event.preventDefault(); // 기본 동작 방지
                const movieIdx = this.getAttribute("data-movie-idx"); // data-movie-idx 값 읽기
                console.log(movieIdx);
                writeReview(movieIdx); // writeReview 함수 호출
            });
        });

        const modal = document.getElementById("layer_regi_reply_review");
        const closeButton = document.querySelector(".btn-modal-close");
        const cancelButton = document.querySelector(".close-layer");
        const stars = document.querySelectorAll(".btn.left, .btn.right");
        const scoreDisplay = document.querySelector(".num em");
        const textarea = document.getElementById("textarea");
        const charCount = document.querySelector(".count span");
        let selectedScore = 0;

        // 모달 닫기
        [closeButton, cancelButton].forEach(button => {
            button.addEventListener("click", function () {
                modal.style.display = "none";
            });
        });

        // 별점 선택
        stars.forEach(star => {
            star.addEventListener("mouseover", function () {
                const hoverValue = parseFloat(this.getAttribute("data-value"));
                stars.forEach(s => {
                    s.classList.toggle("hovered", parseFloat(s.getAttribute("data-value")) <= hoverValue);
                });
                scoreDisplay.textContent = hoverValue;
            });

            star.addEventListener("mouseout", function () {
                stars.forEach(s => s.classList.remove("hovered"));
                scoreDisplay.textContent = selectedScore || "0";
            });

            star.addEventListener("click", function () {
                selectedScore = parseFloat(this.getAttribute("data-value"));
                stars.forEach(s => {
                    s.classList.toggle("active", parseFloat(s.getAttribute("data-value")) <= selectedScore);
                });
                scoreDisplay.textContent = selectedScore;
            });
        });

        // 글자수 카운트
        textarea.addEventListener("input", function () {
            const textLength = textarea.value.length;
            charCount.textContent = textLength;
            charCount.style.color = textLength > 100 ? "red" : "black";
        });
    });


    document.addEventListener("DOMContentLoaded", function () {
        const tabs = document.querySelectorAll('.tab');
        const contents = document.querySelectorAll('.content');
        const urlParams = new URLSearchParams(window.location.search);
        const activeTab = urlParams.get('activeTab') || 'all'; // URL에서 activeTab 파라미터 가져오기, 기본값은 'all'

        // 초기화: URL 파라미터에 따라 탭 및 콘텐츠 활성화
        tabs.forEach(tab => {
            const target = tab.getAttribute('data-target');
            if (target === activeTab) {
                tab.classList.add('active');
                document.getElementById(target).classList.add('active');
            } else {
                tab.classList.remove('active');
                document.getElementById(target).classList.remove('active');
            }
        });

        // 탭 클릭 이벤트 리스너
        tabs.forEach(tab => {
            tab.addEventListener('click', () => {
                const target = tab.getAttribute('data-target');

                // 모든 탭과 콘텐츠의 활성화 상태 초기화
                tabs.forEach(t => t.classList.remove('active'));
                contents.forEach(c => c.classList.remove('active'));

                // 선택된 탭과 콘텐츠 활성화
                tab.classList.add('active');
                document.getElementById(target).classList.add('active');
            });
        });

        // 배경 이미지 설정
        document.querySelector('.bg-img').style.backgroundImage = `url('${mvo.moviePosterUrl}')`;
    });

    /* 더보기 부분 */
    const btn = document.querySelector('.btn-more .btn');
    const textElement = document.querySelector('.movie-summary');
    const iconBtn = document.querySelector('.movie-summary .icon-down');

    btn.addEventListener('click', function () {
        if (textElement.classList.contains('expanded')) {
            // 텍스트를 줄이고 버튼을 '더보기'로 변경
            textElement.classList.remove('expanded');
            btn.querySelector('span').textContent = '더보기';
        } else {
            // 텍스트를 확장하고 버튼을 '닫기'로 변경
            textElement.classList.add('expanded');
            btn.querySelector('span').textContent = '닫기';
        }
        iconBtn.classList.toggle('on');
    });





    document.querySelector(".button.purple").addEventListener("click", function () {
        const reviewRating = document.querySelector(".num em").textContent; // 선택된 별점
        const reviewContent = document.getElementById("textarea").value.trim(); // 리뷰 내용
        const movieIdx = document.getElementById("hidden-movie-idx").value; // 숨겨진 input에서 movieIdx 가져오기

        if (!reviewRating || reviewRating === "0") {
            alert("별점을 선택해주세요.");
            return;
        }

        if (!reviewContent || reviewContent.length === 0) {
            alert("관람평을 입력해주세요.");
            return;
        }

        if (reviewContent.length > 100) {
            alert("관람평은 100자 이하로 작성해주세요.");
            return;
        }

        // AJAX 요청으로 관람평 등록
        $.ajax({
            url: "UserController?type=reviewWrite",
            type: "POST",
            data: { movieIdx, reviewRating, reviewContent },
            dataType: "json",
            headers: {
                "X-Requested-With": "XMLHttpRequest"
            },
            success: function (res) {
                alert(res.message);
                if (res.success) {
                    location.reload();  // 성공 시 페이지 새로고침
                }
            },
            error: function () {
                alert("관람평 작성 중 오류가 발생했습니다.");
            }
        });
    });


</script>
<jsp:include page="../common/footer.jsp"/>
</body>
</html>
