<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <jsp:include page="../common/head.jsp"/>
    <style>
    .pagination {
        clear: both;
        position: relative;
        margin: 0 auto;
        padding: 30px 0 0 0;
        text-align: center;
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
        min-width: 0;
        padding: 0;
        border: 0;
        font-size: 0;
        line-height: 0;
        text-indent: -9999px;
        background: url(https://img.megabox.co.kr/static/pc/images/common/btn/btn-paging.png) no-repeat 0 0;
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

    </style>
<%--    <style>
        /* 배경 어둡게 처리 */
        .layer-con {
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

        /* 모달 레이어 */
        .regi-reply-score {
            background: white;
            border-radius: 10px;
            padding: 20px;
            width: 400px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
            text-align: center;
        }

        /* 제목 스타일 */
        .regi-reply-score .tit {
            font-size: 18px;
            font-weight: bold;
            margin-bottom: 20px;
        }

        /* 별점 버튼 그룹 */
        .star {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            gap: 10px;
            margin-bottom: 10px;
        }

        .star .btn {
            width: 40px;
            height: 40px;
            border: none;
            border-radius: 50%;
            background-color: #ddd;
            color: #333;
            font-size: 14px;
            cursor: pointer;
        }

        .star .btn:hover,
        .star .btn.active {
            background-color: #ffd700;
            color: white;
        }

        /* 평점 점수 */
        .num {
            font-size: 20px;
            font-weight: bold;
            margin-bottom: 20px;
        }

        /* 텍스트 입력 */
        .textarea {
            position: relative;
            margin-bottom: 20px;
        }

        .textarea textarea {
            width: 100%;
            height: 80px;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 14px;
            resize: none;
        }

        .textarea .count {
            position: absolute;
            bottom: 5px;
            right: 10px;
            font-size: 12px;
            color: #999;
        }

        /* 관람 포인트 버튼 */
        .util {
            display: flex;
            justify-content: center;
            gap: 10px;
            margin-bottom: 20px;
        }

        .util button {
            border: 1px solid #ddd;
            border-radius: 20px;
            padding: 5px 15px;
            background-color: #f9f9f9;
            cursor: pointer;
        }

        .util button:hover,
        .util button.active {
            background-color: #ffd700;
            color: white;
        }

        /* 등록/취소 버튼 */
        .btn-submit {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
        }

        .btn-submit button {
            width: 48%;
            padding: 10px;
            border: none;
            border-radius: 5px;
            font-size: 14px;
            cursor: pointer;
        }

        .btn-submit .btn-cancel {
            background-color: #ddd;
            color: #333;
        }

        .btn-submit .btn-register {
            background-color: #5cb85c;
            color: white;
        }

    </style>--%>
</head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/movieDetail.css">

<body>
<jsp:include page="../common/header.jsp"/>

<c:if test="${requestScope.mvo ne null }">
<!-- movie-detail -->
<div class="movie-detail-page">
    <div class="bg-img">영화 포스터</div>
    <div class="movie-detail-cont">
        <c:if test="${requestScope.dDay ne null }">
            <p class="d-day">
            <c:choose>
                <c:when test="${requestScope.dDay == 0}">개봉 D-Day</c:when>
                <c:when test="${requestScope.dDay > 0}">개봉 D-${requestScope.dDay}</c:when>
            </c:choose>
            </p>
        </c:if>
        <p class="title">${mvo.movieTitle }</p>
        <p class="title-eng">${mvo.movieTitleEn }</p>
        <div class="btn-util">
            <button type="button" class="btn">
                <i class="icon-heart"></i>
                <%--          <img src="https://img.megabox.co.kr/static/pc/images/common/ico/ico-heart-line.png">--%>
                <span title="보고싶어 한 명수" id="wantsee">${mvo.movieLikes }</span>
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
                    <em>${requestScope.rank }</em>
                    위 (${mvo.movieReservationRate }%)
                </p>
            </div>
            <div class="audience">
                <div class="tit">누적관객수</div>
                <p class="cont">
                    <img src="https://img.megabox.co.kr/static/pc/images/common/ico/ico-person.png"/>
                    <em><fmt:formatNumber value="${mvo.movieTotalAudience }"/></em>
                    명
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
            <button type="button" class="reserve-btn">
                예매
            </button>
        </div>
    </div>
</div>

<!--// movie-detail -->
<div class="contents">
    <div class="main-tab">
        <div class="tabs">
            <div class="tab active" data-target="all">주요정보</div>
            <div class="tab" data-target="megaPick">실관람평</div>
            <div class="tab" data-target="movies">예고편</div>
        </div>
        <div id="all" class="content active">
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
        <div id="megaPick" class="content">
            <!-- 실관람평 -->
            <!-- 한줄평 없을 때 -->
            <div class="reviews">
                <c:if test="${fn:length(requestScope.reviewArray) eq 0 }">
                    <h2 class="titSmall">아직 남겨진 한줄평이 없어요.</h2>
                </c:if>
                <c:if test="${fn:length(requestScope.reviewArray) ne 0 }">
                    <h2 class="titSmall">${mvo.movieTitle }에 대한 ${pvo.totalRecord }개의 이야기가 있어요!</h2>
                </c:if>
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
                                관람일 기준 7일 이내 등록 시 100P 가 적립됩니다.
                            </c:if>
                        </div>

                        <div class="storyWrite">
                            <!-- 로그인 안되어있을때 -->
                            <a href="#tooltip" class="tooltipClick">
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
                            <a href="UserController?type=movieDetail&movieIdx=${mvo.movieIdx}&cPage=1" class="control first" title="처음 페이지">&laquo;</a>
                        </c:if>

                        <!-- < (이전 페이지 블록) -->
                        <c:if test="${pvo.startPage > 1}">
                            <a href="UserController?type=movieDetail&movieIdx=${mvo.movieIdx}&cPage=${pvo.startPage - pvo.pagePerBlock}" class="control prev" title="이전 블록">&lt;</a>
                        </c:if>

                        <!-- 페이지 번호 -->
                        <c:forEach begin="${pvo.startPage}" end="${pvo.endPage}" varStatus="st">
                            <c:if test="${st.index eq pvo.nowPage}">
                                <strong class="active">${st.index}</strong>
                            </c:if>
                            <c:if test="${st.index ne pvo.nowPage}">
                                <a href="UserController?type=movieDetail&movieIdx=${mvo.movieIdx}&cPage=${st.index}" title="${st.index}페이지 보기">${st.index}</a>
                            </c:if>
                        </c:forEach>

                        <!-- > (다음 페이지 블록) -->
                        <c:if test="${pvo.endPage < pvo.totalPage}">
                            <a href="UserController?type=movieDetail&movieIdx=${mvo.movieIdx}&cPage=${pvo.startPage + pvo.pagePerBlock}" class="control next" title="다음 블록">&gt;</a>
                        </c:if>

                        <!-- >> (맨 마지막으로) -->
                        <c:if test="${pvo.nowPage < pvo.totalPage && pvo.totalPage > 10}">
                            <a href="UserController?type=movieDetail&movieIdx=${mvo.movieIdx}&cPage=${pvo.totalPage}" class="control last" title="마지막 페이지">&raquo;</a>
                        </c:if>
                    </c:if>
                </nav>


            </div>

<%--
            <nav class="pagination">
                <strong class="active">1</strong>
                <a title="2페이지보기" href="javascript:void(0)" pagenum="2">2</a>
                <a title="3페이지보기" href="javascript:void(0)" pagenum="3">3</a>
                <a title="4페이지보기" href="javascript:void(0)" pagenum="4">4</a>
                <a title="5페이지보기" href="javascript:void(0)" pagenum="5">5</a>
                <a title="6페이지보기" href="javascript:void(0)" pagenum="6">6</a>
                <a title="7페이지보기" href="javascript:void(0)" pagenum="7">7</a>
                <a title="8페이지보기" href="javascript:void(0)" pagenum="8">8</a>
                <a title="9페이지보기" href="javascript:void(0)" pagenum="9">9</a>
                <a title="10페이지보기" href="javascript:void(0)" pagenum="10">10</a>
                <a title="이후 10페이지 보기" href="javascript:void(0)" class="control next" pagenum="11">next</a>
                <a title="마지막 페이지 보기" href="javascript:void(0)" class="control last" pagenum="1271">last</a>
            </nav>
--%>



            <!-- //한줄평 없을 때 -->
<%--            <!-- 관람평 창 -->
            <section id="layer_regi_reply_review" class="modal-layer on" style="z-index: 502;">
                <div class="wrap" style="width: 500px; height: 680px; margin-left: -250px; margin-top: -340px;">
                    <header class="layer-header">
                        <h3 class="tit"><span class="oneTitle">관람평</span> 작성하기</h3>
                    </header>

                    <div class="layer-con" style="height: 568px;">
                        <!-- regi-reply-score review -->
                        <div class="regi-reply-score review">
                            <!-- score -->
                            <div class="score">
                                <p class="tit">"${mvo.movieTitle }"<br>영화 어떠셨나요?</p>
                                <div class="box">
                                    <div class="box-star-score">
                                        <div class="star">
                                            <div class="group">
                                                <button type="button" class="btn left score-1">1</button>
                                                <button type="button" class="btn right score-2">2</button>
                                            </div>
                                            <div class="group">
                                                <button type="button" class="btn left score-3">3</button>
                                                <button type="button" class="btn right score-4">4</button>
                                            </div>
                                            <div class="group">
                                                <button type="button" class="btn left score-5">5</button>
                                                <button type="button" class="btn right score-6">6</button>
                                            </div>
                                            <div class="group">
                                                <button type="button" class="btn left score-7">7</button>
                                                <button type="button" class="btn right score-8">8</button>
                                            </div>
                                            <div class="group">
                                                <button type="button" class="btn left score-9">9</button>
                                                <button type="button" class="btn right score-10">10</button>
                                            </div>
                                        </div>
                                        <div class="num">
                                            <em>0</em>
                                            <span>점</span>
                                        </div>
                                    </div>

                                    <div class="textarea">
                                        <textarea id="textarea" rows="5" cols="30" title="한줄평 입력" placeholder="실관람평을 남겨주세요." class="input-textarea"></textarea>
                                        <div class="util">
                                            <p class="count"><span>0</span> / 100</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!--// score -->
                            <div class="txt-alert errText" style="display: none;">한줄평 내용을 입력해 주세요.</div>
                        </div>
                        <!--// regi-reply-score preview -->
                    </div>

                    <div class="btn-group-fixed">
                        <button type="button" class="button close-layer">취소</button>
                        <button type="button" class="button purple" id="regOneBtn" data-no="" data-cd="PREV" data-mno="24036700">등록</button>
                    </div>

                    <button type="button" class="btn-modal-close">레이어 닫기</button>
                </div>
            </section>--%>




            <!-- //실관람평 -->
        </div>
        <div id="movies" class="content">
            <!-- 예고편 -->
            <div class="trailer">
                <h2 class="trailerTitle">예고편</h2>
                <div class="mainTrailer">
                    <video class="mainVideo" controls
                           poster="https://img.megabox.co.kr/SharedImg/2025/01/06/zzqR43UsTMypGFC5MnNWhUAXTHwTj03L_1100.jpg">
                        <source src="https://s3550.smartucc.kr/encodeFile/3550/2025/01/06/4528a56245b5eff8dd1b225e527db15b_W.mp4">
                    </video>
                </div>
                <div class="thumbnails">
                    <!-- 첫 번째 썸네일 -->
                    <div class="thumbnail" onclick="changeMainVideo('https://s3550.smartucc.kr/encodeFile/3550/2025/01/06/4528a56245b5eff8dd1b225e527db15b_W.mp4'
                                , 'https://img.megabox.co.kr/SharedImg/2025/01/06/zzqR43UsTMypGFC5MnNWhUAXTHwTj03L_1100.jpg')">
                        <!-- 썸네일을 클릭할 때 해당 URL로 메인 영상을 변경하는 JavaScript 함수 실행 -->
                        <img src="https://img.megabox.co.kr/SharedImg/2025/01/06/zzqR43UsTMypGFC5MnNWhUAXTHwTj03L_1100.jpg"
                             alt="Video 1"> <!-- 썸네일 이미지 -->
                    </div>

                    <!-- 두 번째 썸네일 -->
                    <div class="thumbnail" onclick="changeMainVideo('https://s3550.smartucc.kr/encodeFile/3550/2025/01/10/4766006f1373165351b9eb69e5e5f04a_W.mp4'
                                , 'https://img.megabox.co.kr/SharedImg/2025/01/10/cJYxrKQNE9mdtVQLTNCnmmUxCqvZomlR_1100.jpg')">
                        <img src="https://img.megabox.co.kr/SharedImg/2025/01/10/cJYxrKQNE9mdtVQLTNCnmmUxCqvZomlR_1100.jpg"
                             alt="Video 2"> <!-- 썸네일 이미지 -->
                    </div>
                </div>
            </div>
            <!-- //예고편 -->
        </div>
    </div>
</div>
</c:if>
<script>
    // JavaScript 코드
    document.querySelector('.bg-img').style.backgroundImage = `url('${mvo.moviePosterUrl}')`;


    /* tab 부분 */
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
    /* //tab 부분 */

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
    /* //더보기 부분 */

    /* 관람평 로그인 부분*/
    // 모든 .tooltipClick과 .tooltipCont를 선택
    const tooltipClicks = document.querySelectorAll('.tooltipClick');
    const tooltipConts = document.querySelectorAll('.tooltipCont');

    // 각 .tooltipClick에 대해 클릭 이벤트 추가
    tooltipClicks.forEach((click, index) => {
        const cont = tooltipConts[index]; // 해당하는 .tooltipCont 요소를 가져옴

        click.addEventListener('click', function (event) {
            event.preventDefault(); // 기본 동작(링크 이동) 방지

            // .tooltipCont에 'on' 클래스를 토글
            if (cont.classList.contains('on')) {
                cont.classList.remove('on');
            } else {
                cont.classList.add('on');
            }
        });
    });
    /* //관람평 로그인 부분*/
    /* 예고편 부분 */
    function changeMainVideo(videoUrl, posterUrl) {

        const currentTab = document.querySelector('.content.active');
        const mainVideo = currentTab.querySelector('.mainVideo');
        const mainVideoSource = mainVideo.querySelector('source');

        mainVideoSource.src = videoUrl;

        mainVideo.poster = posterUrl;

        mainVideo.load();
    }

    /* //예고편 부분 */
</script>
<jsp:include page="../common/footer.jsp"/>
</body>
</html>
