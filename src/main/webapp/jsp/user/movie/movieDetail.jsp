<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <jsp:include page="../common/head.jsp"/>
    <style>
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
                        <h2 class="titSmall">아직 남겨진 한줄평이 없어요.</h2>
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
                            <!-- 로그인 안되어있을때 -->
                            <a href="#tooltip" class="tooltipClick" id="openModal">
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
<!-- 로그인 필요 알림 다이얼로그 -->
<div id="loginNoticeDialog" title="알림" class="dialog-common">
    <p>로그인 후 이용 가능한 서비스입니다.</p>
    <div class="ui-btn-div">
        <button type="button" onclick="closeDialog('loginNoticeDialog')">확인</button>
    </div>
</div>
<script>
    // 다이얼로그 열기 함수
    function openDialog(dialogId) {
        $("#" + dialogId).dialog({
            modal: true, // 모달 형태
            resizable: false, // 크기 조정 불가
            width: 400, // 다이얼로그 너비
        });
    }

    // 다이얼로그 닫기 함수
    function closeDialog(dialogId) {
        $("#" + dialogId).dialog("close"); // jQuery UI의 close 메서드 호출
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
                    const likeCountSpan = document.getElementById(`wantsee-${movieIdx}`);
                    likeCountSpan.textContent = res.newLikeCount; // 새로운 찜하기 수로 업데이트
                } else {
                    alert(res.message || "찜하기에 실패했습니다.");
                }
            },
            error: function() {
                alert("찜하기 처리 중 오류가 발생했습니다.");
            }
        });

        console.log(`Updating movieLikes for movieIdx: ${movieIdx}`);
        console.log(`Element ID: wantsee-${movieIdx}`);
        console.log(document.getElementById(`wantsee-${movieIdx}`)); // null이면 선택자가 문제

    }



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

    /* 관람평 로그인 부분 */
    const tooltipClicks = document.querySelectorAll('.tooltipClick');
    const tooltipConts = document.querySelectorAll('.tooltipCont');

    tooltipClicks.forEach((click, index) => {
        const cont = tooltipConts[index];

        click.addEventListener('click', function (event) {
            event.preventDefault();
            cont.classList.toggle('on');
        });
    });

    /* 예고편 변경 부분 */
    function changeMainVideo(videoUrl, posterUrl) {
        const currentTab = document.querySelector('.content.active');
        const mainVideo = currentTab.querySelector('.mainVideo');
        const mainVideoSource = mainVideo.querySelector('source');

        mainVideoSource.src = videoUrl;
        mainVideo.poster = posterUrl;
        mainVideo.load();
    }

    document.addEventListener("DOMContentLoaded", function () {
        const modal = document.getElementById("layer_regi_reply_review");
        const openButton = document.querySelector(".tooltipClick");
        const closeButton = document.querySelector(".btn-modal-close");
        const cancelButton = document.querySelector(".close-layer");
        const stars = document.querySelectorAll(".btn.left, .btn.right"); // 왼쪽, 오른쪽 버튼
        const scoreDisplay = document.querySelector(".num em");
        const textarea = document.getElementById("textarea");
        const charCount = document.querySelector(".count span");
        let selectedScore = 0; // 선택된 점수

        // 모달 열기
        openButton.addEventListener("click", function (event) {
            event.preventDefault();
            modal.style.display = "flex";
        });

        // 모달 닫기
        [closeButton, cancelButton].forEach(button => {
            button.addEventListener("click", function () {
                modal.style.display = "none";
            });
        });

        // 별점 선택
        stars.forEach(star => {
            // 마우스 오버로 별점 미리보기
            star.addEventListener("mouseover", function () {
                const hoverValue = parseFloat(this.getAttribute("data-value"));

                // 별점 미리보기 상태 변경
                stars.forEach(s => {
                    s.classList.toggle("hovered", parseFloat(s.getAttribute("data-value")) <= hoverValue);
                });

                // 점수 업데이트
                scoreDisplay.textContent = hoverValue;
            });

            // 마우스가 별에서 벗어났을 때 초기화
            star.addEventListener("mouseout", function () {
                // 별점 초기화 (선택된 점수로 복구)
                stars.forEach(s => s.classList.remove("hovered"));

                // 점수 디스플레이를 선택된 점수로 복구
                scoreDisplay.textContent = selectedScore || "0";
            });

            // 클릭 시 별점 고정
            star.addEventListener("click", function () {
                selectedScore = parseFloat(this.getAttribute("data-value"));

                // Active 상태 업데이트
                stars.forEach(s => {
                    s.classList.toggle("active", parseFloat(s.getAttribute("data-value")) <= selectedScore);
                });

                // 점수 디스플레이 업데이트
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
</script>
<jsp:include page="../common/footer.jsp"/>
</body>
</html>
