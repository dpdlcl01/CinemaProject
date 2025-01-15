<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <!-- 사용자의 환경에 맞게 화면의 크기를 조정할 수 있도록 함. -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>라이프시어터, 메가박스</title>
    <meta property="name" id="metaTagTitle" content="라이프시어터,메가박스">

    <!-- 해당 페이지의 설명(검색 시 페이지의 제목 아래 페이지 내용의 요약 부분) -->
    <meta property="description" id="metaTagDtls"
          content="삶의 의미와 즐거움을 소통하는 공간, 함께 더 행복한 가치있는 콘텐츠를 추구하는 만남과 소통의 즐거움이 가득한 공간 메가박스 입니다.">

    <!-- 해당 컨텐츠 내용의 대표적인 키워드를 지정 -->
    <meta property="keywords" id="metaTagKeyword"
          content="메가박스,megabox,영화,영화관,극장,티켓,박스오피스,상영예정작,예매,오페라,싱어롱,큐레이션,필름소사이어티,이벤트,Movie,theater,Cinema,film,Megabox">

    <!-- OpenGraph -->
    <!-- 웹페이지가 소셜 미디어 또는 오픈그래프를 활용한 사이트로 공유될 때 사용되어지는 정보 -->
    <meta property="fb:app_id" id="fbAppId" content="546913502790694">
    <meta property="og:site_name" id="fbSiteName" content="메가박스">
    <meta property="og:type" id="fbType" content="movie">
    <meta property="og:url" id="fbUrl" content="https://www.megabox.co.kr/">
    <meta property="og:title" id="fbTitle" content="라이프시어터, 메가박스">
    <meta property="og:description" id="fbDtls"
          content="삶의 의미와 즐거움을 소통하는 공간, 함께 더 행복한 가치있는 콘텐츠를 추구하는 만남과 소통의 즐거움이 가득한 공간 메가박스 입니다.">
    <meta property="og:image" id="fbImg"
          content="https://img.megabox.co.kr/SharedImg/metaTag/2020/02/04/gFfTzMwwiCxhBwcUV5TRGMFX9Cmoj64W.jpg">
    <link rel="stylesheet" href="../../css/user/reset.css">
    <link rel="stylesheet" href="../../css/user/style.css">
    <script src="https://kit.fontawesome.com/d7f530ec10.js" crossorigin="anonymous"></script>
    <script src="../../js/app.js"></script>
    <style>
        body {
            font: normal 15px D2Coding
        }

        /*.contents {
          width: 1100px;
          !*margin: 50px auto;*!
        }*/
        .movie-detail-page {
            position: relative;
            height: 520px;
            margin: 0 0 40px 0;
            background-color: #151515;
            color: #ccc;
            /*z-index: -1;*/
        }

        .movie-detail-page .bg-img {
            text-indent: -9999px;
            position: absolute;
            background-image: url('https://img.megabox.co.kr/SharedImg/2025/01/10/5icStMtQmSW7nxUfWzd7AbGr9cCxS49m_570.jpg');
            background-position: center 0;
            background-repeat: no-repeat;
            background-size: 100% auto;
            left: 50%;
            width: 1100px;
            height: 100%;
            margin: 0 0 0 -550px;
            opacity: .3;
            /*z-index: -1;*/
        }

        .movie-detail-page .bg-img:after {
            content: '';
            display: block;
            position: absolute;
            left: 0;
            top: 0;
            /*z-index: 0;*/
            width: 100%;
            height: 100%;
            background-color: rgba(15, 15, 15, .5);
        }

        .movie-detail-page .movie-detail-cont {
            position: relative;
            width: 1100px;
            height: 100%;
            margin: 0 auto;
            padding: 55px 0 0 0;
        }

        .movie-detail-page .movie-detail-cont .d-day {
            background-color: #432e75;
            display: inline-block;
            padding: 0 10px;
            font-size: .8667em;
            line-height: 22px;
            color: #fff;
            border-radius: 3px;
            vertical-align: middle;
        }

        .movie-detail-page .movie-detail-cont .title {
            color: #fff;
            font-size: 3.0666em;
            font-weight: 400;
            line-height: 1.2;
            padding: 15px 0 0 0;
        }

        .movie-detail-page .movie-detail-cont .title-eng {
            color: #fff;
            width: 800px;
            padding: 10px 0 0 0;
            font-size: 1.3333em;
            line-height: 1.1;
            overflow: hidden;
        }

        .movie-detail-page .movie-detail-cont .btn-util {
            padding: 15px 0 0 0;
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

        .movie-detail-page .movie-detail-cont .btn-util .btn:hover .icon-heart {
            background-image: url("https://img.megabox.co.kr/static/pc/images/common/ico/ico-heart-on.png");
        }

        .movie-detail-page .movie-detail-cont .btn-util .btn:hover {
            color: #000;
            background-color: #fff;
        }

        .movie-detail-page .movie-detail-cont .btn-util .btn img {
            vertical-align: middle;
            margin-bottom: 3px;
            margin-right: 5px;
        }

        .movie-detail-page .movie-detail-cont .btn-util .btn {
            display: inline-block;
            min-width: 100px;
            height: 36px;
            font-size: .9333em;
            text-align: center;
            color: #fff;
            border: 1px solid #706f72;
            border-radius: 4px;
            background-color: transparent;
        }

        .movie-detail-page .movie-detail-cont .screen-type2 {
            display: flex;
            margin-top: 15px;
        }

        .movie-detail-page .movie-detail-cont .screen-type2 img {
            display: block;
            width: 68px;
            height: 24px;
        }

        .movie-detail-page .movie-detail-cont .info {
            position: absolute;
            bottom: 45px;
        }

        .movie-detail-page .movie-detail-cont .info .score {
            float: left;
            padding: 0;
        }

        .movie-detail-page .movie-detail-cont .info .tit {
            display: block;
            padding: 0 0 10px 0;
            line-height: 1.1;
            font-size: .9333em;
        }

        .movie-detail-page .movie-detail-cont .info .score .number {
            display: flex;
            align-items: center;
        }

        .movie-detail-page .movie-detail-cont .info .score .number img {
            margin-right: 7px;
        }

        .movie-detail-page .movie-detail-cont .info .score .number .before {
            font-size: 2.1333em;
            color: #59bec9;
        }

        .ir {
            text-indent: -9999px;
            position: fixed;
            opacity: 0;
        }

        .movie-detail-page .movie-detail-cont .info .rate {
            float: left;
            padding: 0 0 0 35px;
        }

        .movie-detail-page .movie-detail-cont .info .rate .cont img {
            margin-right: 7px;
        }

        .movie-detail-page .movie-detail-cont .info .cont {
            display: inline-block;
        }

        .movie-detail-page .movie-detail-cont .info .cont em {
            margin: 0 4px 0 0;
            color: #fff;
            font-size: 2.1333em;
        }

        .movie-detail-page .movie-detail-cont .info .audience {
            float: left;
            padding: 0 0 0 35px;
        }

        .movie-detail-page .movie-detail-cont .poster {
            position: absolute;
            right: 0;
            top: 45px;
            width: 260px;
            height: 374px;
            border-radius: 8px;
        }

        .movie-detail-page .movie-detail-cont .poster .wrap {
            position: relative;
            width: 100%;
            height: 100%;
            font-size: 0;
        }

        .movie-detail-page .movie-detail-cont .poster .wrap .movie-grade {
            overflow: hidden;
            position: absolute;
            right: 9px;
            bottom: 9px;
            z-index: 1;
        }

        .movie-grade.big.age-all {
            background-image: url("https://img.megabox.co.kr/static/pc/images/common/txt/ALL_56x56.png");
            background-size: 28px 28px;
            background-repeat: no-repeat;
            width: 28px;
            height: 28px;
        }

        .movie-detail-page .movie-detail-cont .poster .wrap img {
            display: block;
            width: 100%;
            height: 100%;
            z-index: 0;
            position: relative;
        }

        .movie-detail-page .movie-detail-cont .reserve-type {
            display: block;
            position: absolute;
            right: 0;
            bottom: 45px;
            width: 260px;
        }

        .movie-detail-page .movie-detail-cont .reserve-type .reserve-btn {
            display: block;
            float: left;
            height: 46px;
            font-size: 1.2em;
            color: #fff;
            background-color: #329eb1;
            width: 100%;
            text-align: center;
            border-radius: 5px;
            border: 1px solid #706f72;
        }

        /* --- tab 부분 --- */
        .main-tab {
            width: 1000px;
            margin: 0 auto;
        }

        .tabs {
            display: flex;
            justify-content: space-around;
            margin: 20px 0;
            border-bottom: 2px solid #ccc;
        }

        .tab {
            padding: 10px 0;
            width: 150px; /* 탭의 고정 너비 */
            text-align: center;
            cursor: pointer;
            border-bottom: 2px solid transparent;
            font-size: 16px;
        }

        .tab.active {
            border-bottom: 2px solid #6a5acd;
            color: #6a5acd;
        }

        .content {
            display: none;
            margin-top: 20px;
            height: 2000px; /* 임시 */
        }

        .content.active {
            display: block;
        }

        /* //--- tab 부분 --- */

        /* movie-summary 부분 */
        .movie-summary .text {
            overflow: hidden;
            height: 140px;
            position: relative;
        }

        .movie-summary.expanded .text {
            height: auto; /* expanded 클래스가 추가되면 텍스트가 확장됨 */
        }

        .movie-summary .text:first-line {
            color: #222;
            font-size: 2em;
            font-weight: 400;
            line-height: 70px;
        }

        .movie-summary .btn-more {
            padding: 30px 0 0 0;
        }

        .btn-more .btn {
            display: block;
            width: 100%;
            margin: 0;
            padding: 0;
            height: 40px;
            border: 0;
            border-bottom: 1px solid #eaeaea;
            background-color: transparent;
            color: #666;
        }

        .icon-down {
            background-image: url("https://img.megabox.co.kr/static/pc/images/common/ico/ico-btn-more-arr.png");
            display: inline-block;
            width: 12px;
            height: 7px;

        }

        .icon-down.on {
            transform: rotate(180deg);

        }
        /* //movie-summary 부분 */

        /* movie-info 부분 */
        .movie-info {
            padding: 30px 0;
            color: #222;
        }

        .movie-info p {
            margin: 0;
            padding: 0;
        }

        .movie-info .line p {
            display: inline-block;
            position: relative;
            margin: 0;
            padding: 0 0 0 20px;
        }

        .movie-info .line p:first-child {
            padding: 0;
        }

        .movie-info .line p:first-child:before {
            content: none; /* :before 요소를 제거 */
        }

        /* 나머지 p 태그에는 :before 스타일 적용 */

        .movie-info .line p:before {
            content: '';
            display: block;
            position: absolute;
            left: 9px;
            top: 50%;
            width: 1px;
            height: 13px;
            margin: -6px 0 0 0;
            background-color: #d8d9db;
        }
        /* //movie-info 부분 */

        /* 한줄 리뷰 */
        .reviews{
            min-height: 400px;
            margin-bottom: 50px;
        }
        .titSmall{
            padding: 0 0 16px 0;
            font-size: 1.4666em;
            color: #503396;
            margin-top: 70px;
        }
        .oneLineReview .storyBox {
            display: table;
            border: 1px solid #eaeaea;
            width: 100%;
            height: 84px;
            vertical-align: middle;
            padding-left: 30px;
            color: #666;

        }
        .oneLineReview .storyBox .storyWrap{
            display: table-cell;
            vertical-align: middle;
            width: 850px;
        }
        .fontBlue{
            color: #01738b;
        }
        .oneLineReview .storyBox .storyWrite{
            position: relative;
            display: table-cell;
            vertical-align: middle;
            text-align: center;
        }
        .tooltipClick{
            display: inline-flex;
            padding-left: 0;
        }
        .iconWrite{
            display: inline-block;
            width: 18px;
            height: 18px;
            background-image: url("https://img.megabox.co.kr/static/pc/images/common/ico/ico-story-write.png");
            margin-right: 5px;
            vertical-align: text-bottom;
        }
        .tooltipCont{
            display: none;
            position: absolute;
            left: -50px;
            top: -62px;
            width: 250px;
            height: 80px;
            padding: 20px;
            color: #222;
            font-size: 0.9em;
            text-align: center;
            line-height: 1.5;
            border: 1px solid #d8d9db;
            border-radius: 5px;
            background-color: #fff;
        }
        .tooltipCont.on{
            display: block;
        }
        .fontGreen{
            color: #037b94;
        }
        .iconRight{
            background-image: url("https://img.megabox.co.kr/static/pc/images/common/ico/ico-arr-right-green.png");
            display: inline-block;
            width: 6px;
            height: 10px;
            margin: -1px 0 0 0;
            vertical-align: middle;
            background-repeat: no-repeat;
        }
        /* //한줄 리뷰 */

        /* 예고편 */
        .trailer .trailerTitle{
            margin: 0 0 30px 0;
            padding: 20px 0;
            /*border-top: 1px solid #555;*/
            border-bottom: 1px solid #ebebeb;
            font-size: 1.46666em;
            color: #351f67;
        }
        .trailer .mainTrailer{
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .trailer .mainTrailer .mainVideo{
            width: 800px;
            height: 450px;
        }
        .trailer .thumbnails{
            display: flex;
            justify-content: flex-start;
            gap: 10px;
            margin: 20px 40px 20px 40px;
            padding-top: 20px;
            border-top: 1px solid #eaeaea;
        }
        .trailer .thumbnails .thumbnail{
            cursor: pointer;
        }
        .trailer .thumbnails .thumbnail img{
            width: 240px;
            height: 136px;
            opacity: .7;
        }

        /* //예고편 */
        #footer {
            display: block;
            position: absolute;
            bottom: 0;
            width: 100%;
        }
    </style>
</head>
<body>
<!-- header -->
<header id="header">
    <!-- container -->
    <div class="container">
        <h1 class="logo">
            <a href="#" title="MEGABOX 메인으로 가기">MEGABOX : Life Theater</a>
        </h1>
        <!-- util-area -->
        <div class="util-area">
            <div class="left-link">
                <a href="#" title="VIP LOUNGE">VIP LOUNGE</a>
                <a href="#" title="멤버십">멤버십</a>
                <a href="#" title="고객센터">고객센터</a>
            </div>
            <div class="right-link">
                <a href="#" title="로그인">로그인</a>
                <a href="#" title="회원가입">회원가입</a>
                <a href="#" title="빠른예매">빠른예매</a>
            </div>
        </div>
        <!-- //util-area -->
        <!-- link-area -->
        <div class="link-area">
            <a href="#" title="사이트맵" class="sitemap">사이트맵</a>
            <a href="#" title="검색" class="search">검색</a>
            <a href="#" title="상영시간표" class="timetable">상영시간표</a>
            <a href="#" title="나의 메가박스" class="mymega">나의 메가박스</a>
        </div>
        <!-- //link-area -->
        <!-- gnb -->
        <nav id="gnb">
            <ul class="gnb-depth1">
                <li title="영화">
                    <a href="#" class="movie">영화</a>
                    <div class="gnb-depth2 movie-snb">
                        <ul class="clearfix">
                            <li><a href="" title="전체영화">전체영화</a></li>
                            <li><a href="" title="큐레이션">큐레이션</a></li>
                            <li><a href="" title="영화제">영화제</a></li>
                            <li><a href="" title="무비포스트">무비포스트</a></li>
                        </ul>
                    </div>
                </li>
                <li title="예매">
                    <a href="#" class="reserve">예매</a>
                    <div class="gnb-depth2 reserve-snb">
                        <ul>
                            <li><a href="">빠른예매</a></li>
                            <li><a href="">상영시간표</a></li>
                            <li><a href="">더 부티크 프라이빗 예매</a></li>
                        </ul>
                    </div>
                </li>
                <li title="극장">
                    <a href="#" class="theater">극장</a>
                    <div class="gnb-depth2 theater-snb">
                        <ul>
                            <li><a href="">전체극장</a></li>
                            <li><a href="">특별관</a></li>
                        </ul>
                    </div>
                </li>
                <li title="이벤트">
                    <a href="#" class="event">이벤트</a>
                    <div class="gnb-depth2 event-snb">
                        <ul>
                            <li><a href="">진행중 이벤트</a></li>
                            <li><a href="">지난 이벤트</a></li>
                            <li><a href="">당첨자발표</a></li>
                        </ul>
                    </div>
                </li>
                <li title="스토어">
                    <a href="#" class="store">스토어</a>
                </li>
                <li title="혜택">
                    <a href="#" class="benefit">혜택</a>
                    <div class="gnb-depth2 benefit-snb">
                        <ul>
                            <li><a href="">메가박스 멤버십</a></li>
                            <li><a href="">제휴/할인</a></li>
                        </ul>
                    </div>
                </li>
            </ul>
        </nav>
        <!-- //gnb -->
        <!-- 레이어 : 사이트맵 -->
        <!-- //레이어 : 사이트맵 -->
        <!-- 레이어 : 검색 -->
        <!-- //레이어 : 검색 -->
        <!-- 레이어 : 마이페이지 -->
        <!-- //레이어 : 마이페이지 -->
    </div>
    <!-- //container -->
</header>
<!-- //header -->
<div class="contents">
    <!-- movie-detail -->
    <div class="movie-detail-page">
        <div class="bg-img">영화 포스터</div>
        <div class="movie-detail-cont">
            <p class="d-day">개봉 D-?</p>
            <p class="title">영화 제목</p>
            <p class="title-eng">영화 영문 제목</p>
            <div class="btn-util">
                <button type="button" class="btn">
                    <i class="icon-heart"></i>
                    <%--          <img src="https://img.megabox.co.kr/static/pc/images/common/ico/ico-heart-line.png">--%>
                    <span title="보고싶어 한 명수" id="wantsee">3.2k</span>
                </button>
            </div>
            <div class="screen-type2">
                <p>
                    <img src="https://img.megabox.co.kr/static/pc/images/movie/type_dolbycinema_d.png" alt="dolby">
                </p>
            </div>
            <div class="info">
                <div class="score">
                    <p class="tit">실관람 평점</p>
                    <div class="number" id="mainScore">
                        <img src="https://img.megabox.co.kr/static/pc/images/common/ico/ico-megabox.png"/>
                        <p title="실관람 평점" class="before">
                            <em>??</em>
                            <span class="ir">점</span>
                        </p>
                    </div>
                </div>
                <div class="rate">
                    <p class="tit">예매율</p>
                    <p class="cont">
                        <img src="https://img.megabox.co.kr/static/pc/images/common/ico/ico-ticket-gray.png"/>
                        <em>??</em>
                        위 (?.?%)
                    </p>
                </div>
                <div class="audience">
                    <div class="tit">누적관객수</div>
                    <p class="cont">
                        <img src="https://img.megabox.co.kr/static/pc/images/common/ico/ico-person.png"/>
                        <em>???,???</em>
                        명
                    </p>
                </div>
            </div>
            <div class="poster">
                <div class="wrap">
                    <img src="https://img.megabox.co.kr/SharedImg/2025/01/06/veoYkRw8THPbrE9FobWUP1BVmEbMOXnp_420.jpg"
                         alt="말할 수 없는 비밀">
                    <p class="movie-grade big age-all">전체 관람가</p>
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
    <div class="main-tab">
        <div class="tabs">
            <div class="tab active" data-target="all">주요정보</div>
            <div class="tab" data-target="megaPick">실관람평</div>
            <div class="tab" data-target="movies">예고편</div>
        </div>
        <div id="all" class="content active">
            <div class="movie-summary">
                <div class="text">
                    "연주할 때만 느껴지는 감정이 있거든. 그게 널 만나면 느껴져"
                    <br>
                    <br>
                    유학 중이던 피아니스트 유준은 팔목 치료를 위해 한국에 교환 학생으로 오게 된다.
                    <br>
                    학교에 처음 간 그날, 신비로운 피아노 선율에 이끌려 도착한 연습실에서
                    <br>
                    유준은 정아와 마주치고, 운명처럼 끌린 두 사람은 시간을 보내며 가까워진다.
                    <br>
                    <br>
                    하지만, 연락처조차 알려주지 않는 정아와의 만남은 계속 엇갈리고,
                    <br>
                    유준의 시선이 늘 자신을 향해 있다고 생각한
                    <br>
                    인희의 갑작스러운 고백은 정아에게 큰 상처를 입힌다.
                    <br>
                    <br>
                    그날 이후 사라진 정아의 행방을 찾던 유준은 정아의 비밀을 마주하게 되는데...
                    <br>
                    <br>
                    “너와 나의 시간을 이어 준 연주곡 ‘시크릿’
                    <br>
                    그렇게 마법 같은 사랑은 시작된 거야"
                </div>
                <div class="btn-more">
                    <button type="button" class="btn">
                        <span>닫기</span>
                        <i class="icon-down"></i>
                    </button>
                </div>
            </div>
            <div class="movie-info">
                <p>상영타입 : 2D</p>
                <div class="line">
                    <p>감독 : 서유민</p>
                    <p>장르 : 판타지 / 103 분</p>
                    <p>등급 : 전체관람가</p>
                    <p>개봉일 : 2025.01.28</p>
                </div>
                <p>출연진 : 도경수, 원진아, 신예은</p>
            </div>

            <!-- 실관람평 -->
            <!-- 한줄평 없을 때 -->
            <div class="reviews">
            <h2 class="titSmall">아직 남겨진 한줄평이 없어요.</h2>
            <div class="oneLineReview">
                <!-- 본 영화가 아닌경우 -->
                <div class="storyBox">
                    <div class="storyWrap">
                        <div class="storyCont"></div>
                        첫번째
                        <span class="fontBlue">관람평</span>의 주인공이 되어 보세요.
                    </div>
                    <div class="storyWrite">
                        <!-- 로그인 안되어있을때 -->
                        <a href="#tooltip" class="tooltipClick">
                            <i class="iconWrite"></i>
                            관람평쓰기
                        </a>
                        <div id="tooltip" class="tooltipCont">
                            <div class="loginTag">
                                로그인이 필요한 서비스 입니다.
                                <br>
                                <a href="로그인화면" class="fontGreen">
                                    로그인 바로가기
                                    <i class="iconRight"></i>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            </div>
            <!-- //한줄평 없을 때 -->
            <!-- //실관람평 -->

            <!-- 예고편 -->
                <div class="trailer">
                    <h2 class="trailerTitle">예고편</h2>
                    <div class="mainTrailer">
                        <video class="mainVideo" controls poster="https://img.megabox.co.kr/SharedImg/2025/01/06/zzqR43UsTMypGFC5MnNWhUAXTHwTj03L_1100.jpg">
                            <source src="https://s3550.smartucc.kr/encodeFile/3550/2025/01/06/4528a56245b5eff8dd1b225e527db15b_W.mp4">
                        </video>
                    </div>
                    <div class="thumbnails">
                        <!-- 첫 번째 썸네일 -->
                        <div class="thumbnail" onclick="changeMainVideo('https://s3550.smartucc.kr/encodeFile/3550/2025/01/06/4528a56245b5eff8dd1b225e527db15b_W.mp4'
                                , 'https://img.megabox.co.kr/SharedImg/2025/01/06/zzqR43UsTMypGFC5MnNWhUAXTHwTj03L_1100.jpg')">
                            <!-- 썸네일을 클릭할 때 해당 URL로 메인 영상을 변경하는 JavaScript 함수 실행 -->
                            <img src="https://img.megabox.co.kr/SharedImg/2025/01/06/zzqR43UsTMypGFC5MnNWhUAXTHwTj03L_1100.jpg" alt="Video 1"> <!-- 썸네일 이미지 -->
                        </div>

                        <!-- 두 번째 썸네일 -->
                        <div class="thumbnail" onclick="changeMainVideo('https://s3550.smartucc.kr/encodeFile/3550/2025/01/10/4766006f1373165351b9eb69e5e5f04a_W.mp4'
                                , 'https://img.megabox.co.kr/SharedImg/2025/01/10/cJYxrKQNE9mdtVQLTNCnmmUxCqvZomlR_1100.jpg')">
                            <img src="https://img.megabox.co.kr/SharedImg/2025/01/10/cJYxrKQNE9mdtVQLTNCnmmUxCqvZomlR_1100.jpg" alt="Video 2"> <!-- 썸네일 이미지 -->
                    </div>
                    </div>
                </div>
            <!-- //예고편 -->
            </div>
        <div id="megaPick" class="content">
            <!-- 한줄평 없을 때 -->
            <div class="reviews">
                <h2 class="titSmall">아직 남겨진 한줄평이 없어요.</h2>
                <div class="oneLineReview">
                    <!-- 본 영화가 아닌경우 -->
                    <div class="storyBox">
                        <div class="storyWrap">
                            <div class="storyCont"></div>
                            첫번째
                            <span class="fontBlue">관람평</span>의 주인공이 되어 보세요.
                        </div>
                        <div class="storyWrite">
                            <!-- 로그인 안되어있을때 -->
                            <a href="#tooltip1" class="tooltipClick">
                                <i class="iconWrite"></i>
                                관람평쓰기
                            </a>
                            <div id="tooltip1" class="tooltipCont">
                                <div class="loginTag">
                                    로그인이 필요한 서비스 입니다.
                                    <br>
                                    <a href="로그인화면" class="fontGreen">
                                        로그인 바로가기
                                        <i class="iconRight"></i>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- //한줄평 없을 때 -->
        </div>
        <div id="movies" class="content">
            <!-- 예고편 -->
            <div class="trailer">
                <h2 class="trailerTitle">예고편</h2>
                <div class="mainTrailer">
                    <video class="mainVideo" controls poster="https://img.megabox.co.kr/SharedImg/2025/01/06/zzqR43UsTMypGFC5MnNWhUAXTHwTj03L_1100.jpg">
                        <source src="https://s3550.smartucc.kr/encodeFile/3550/2025/01/06/4528a56245b5eff8dd1b225e527db15b_W.mp4">
                    </video>
                </div>
                <div class="thumbnails">
                    <!-- 첫 번째 썸네일 -->
                    <div class="thumbnail" onclick="changeMainVideo('https://s3550.smartucc.kr/encodeFile/3550/2025/01/06/4528a56245b5eff8dd1b225e527db15b_W.mp4'
                                , 'https://img.megabox.co.kr/SharedImg/2025/01/06/zzqR43UsTMypGFC5MnNWhUAXTHwTj03L_1100.jpg')">
                        <!-- 썸네일을 클릭할 때 해당 URL로 메인 영상을 변경하는 JavaScript 함수 실행 -->
                        <img src="https://img.megabox.co.kr/SharedImg/2025/01/06/zzqR43UsTMypGFC5MnNWhUAXTHwTj03L_1100.jpg" alt="Video 1"> <!-- 썸네일 이미지 -->
                    </div>

                    <!-- 두 번째 썸네일 -->
                    <div class="thumbnail" onclick="changeMainVideo('https://s3550.smartucc.kr/encodeFile/3550/2025/01/10/4766006f1373165351b9eb69e5e5f04a_W.mp4'
                                , 'https://img.megabox.co.kr/SharedImg/2025/01/10/cJYxrKQNE9mdtVQLTNCnmmUxCqvZomlR_1100.jpg')">
                        <img src="https://img.megabox.co.kr/SharedImg/2025/01/10/cJYxrKQNE9mdtVQLTNCnmmUxCqvZomlR_1100.jpg" alt="Video 2"> <!-- 썸네일 이미지 -->
                    </div>
                </div>
            </div>
            <!-- //예고편 -->
        </div>
            <script>
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

                /* 관람평 로그인 부분 */
                /* 전체 탭 */
                const click = document.querySelector('.tooltipClick');
                const cont = document.querySelector('.tooltipCont');

                click.addEventListener('click', function (event) {
                    event.preventDefault(); // 기본 동작(링크 이동) 방지

                    if(cont.classList.contains('on')){
                        cont.classList.remove('on');
                    } else {
                        cont.classList.add('on');
                    }
                })
                /* //전체 탭 */

                /* 실관람평 탭 */
                const click1 = document.querySelector('.tooltipClick');
                const cont1 = document.querySelector('.tooltipCont');

                click1.addEventListener('click', function (event) {
                    event.preventDefault(); // 기본 동작(링크 이동) 방지

                    if(cont.classList.contains('on')){
                        cont.classList.remove('on');
                    } else {
                        cont.classList.add('on');
                    }
                })
                /* //실관람평 탭 */
                /* //관람평 로그인 부분*/

                /* 예고편 부분 */
                function changeMainVideo(videoUrl, posterUrl) {

                    const mainVideo = document.querySelector('.mainVideo');
                    const mainVideoSource = mainVideo.querySelector('source');

                    mainVideoSource.src = videoUrl;

                    mainVideo.poster = posterUrl;

                    mainVideo.load();
                }

                /* //예고편 부분 */
            </script>

    </div>
</div>
</body>
</html>
