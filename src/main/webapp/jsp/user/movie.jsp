<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!Doctype html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <!-- 사용자의 환경에 맞게 화면의 크기를 조정할 수 있도록 함. -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>라이프시어터, 메가박스</title>
    <meta property="name" id="metaTagTitle" content="라이프시어터,메가박스">

    <!-- 해당 페이지의 설명(검색 시 페이지의 제목 아래 페이지 내용의 요약 부분) -->
    <meta property="description" id="metaTagDtls" content="삶의 의미와 즐거움을 소통하는 공간, 함께 더 행복한 가치있는 콘텐츠를 추구하는 만남과 소통의 즐거움이 가득한 공간 메가박스 입니다.">

    <!-- 해당 컨텐츠 내용의 대표적인 키워드를 지정 -->
    <meta property="keywords" id="metaTagKeyword" content="메가박스,megabox,영화,영화관,극장,티켓,박스오피스,상영예정작,예매,오페라,싱어롱,큐레이션,필름소사이어티,이벤트,Movie,theater,Cinema,film,Megabox">

    <!-- OpenGraph -->
    <!-- 웹페이지가 소셜 미디어 또는 오픈그래프를 활용한 사이트로 공유될 때 사용되어지는 정보 -->
    <meta property="fb:app_id" id="fbAppId" content="546913502790694">
    <meta property="og:site_name" id="fbSiteName" content="메가박스">
    <meta property="og:type" id="fbType" content="movie">
    <meta property="og:url" id="fbUrl" content="https://www.megabox.co.kr/">
    <meta property="og:title" id="fbTitle" content="라이프시어터, 메가박스">
    <meta property="og:description" id="fbDtls" content="삶의 의미와 즐거움을 소통하는 공간, 함께 더 행복한 가치있는 콘텐츠를 추구하는 만남과 소통의 즐거움이 가득한 공간 메가박스 입니다.">
    <meta property="og:image" id="fbImg" content="https://img.megabox.co.kr/SharedImg/metaTag/2020/02/04/gFfTzMwwiCxhBwcUV5TRGMFX9Cmoj64W.jpg">
    <link rel="stylesheet" href="../../css/user/reset.css">
    <link rel="stylesheet" href="../../css/user/style.css">
    <script src="https://kit.fontawesome.com/d7f530ec10.js" crossorigin="anonymous"></script>
    <script src="../../js/app.js"></script>
    <style>
        /*body {*/
        /*    font-family: Arial, sans-serif;*/
        /*    margin: 0;*/
        /*    padding: 0;*/
        /*}*/
        .hightab {
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
        }
        .content.active {
            display: block;
        }
        .movie-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            padding: 2rem;
        }
        .movie-card {
            background-color: white;
            border: 1px solid #ddd;
            border-radius: 5px;
            width: 200px;
            margin: 1rem;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
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
<main id="main">
    <!-- section01 -->
    <section id="section05" class="section main-movie">
        <!-- cont-area -->
        <div class="cont-area">
<%--        <div class="hightab">--%>
            <h1>전체영화</h1>
            <div class="tabs">
                <div class="tab active" data-target="boxoffice">박스오피스</div>
                <div class="tab" data-target="nowShowing">상영작</div>
                <div class="tab" data-target="comingSoon">상영예정작</div>
            </div>
    <!-- //main-movie-list megaScoreList -->
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
                <h2>전체</h2>
                        <!-- main-movie-list boxRankList -->
                        <div class="main-movie-list">
                            <ol class="list clearfix">
                                <li>
                                    <!-- movie-list-info -->
                                    <a href="#" class="movie-list-info" title="영화상세 보기">
                                        <p class="rank">1</p>
                                        <img src="https://img.megabox.co.kr/SharedImg/2025/01/06/veoYkRw8THPbrE9FobWUP1BVmEbMOXnp_420.jpg" alt="말할 수 없는 비밀" class="poster">
                                        <div class="wrap">
                                            <div class="summary">
                                                “연주할 때만 느껴지는 감정이 있거든. 그게 널 만나면 느껴져”
                                                유학 중이던 피아니스트 유준은 팔목 치료를 위해 한국에 교환 학생으로 오게 된다.
                                                학교에 처음 간 그날, 신비로운 피아노 선율에 이끌려 도착한 연습실에서
                                                유준은 정아와 마주치고, 운명처럼 끌린 두 사람은 시간을 보내며 가까워진다.
                                                하지만, 연락처조차 알려주지 않는 정아와의 만남은 계속 엇갈리고,
                                                유준의 시선이 늘 자신을 향해 있다고 생각한
                                                인희의 갑작스러운 고백은 정아에게 큰 상처를 입힌다.
                                                그날 이후 사라진 정아의 행방을 찾던 유준은 정아의 비밀을 마주하게 되는데…
                                                “너와 나의 시간을 이어 준 연주곡 ‘시크릿’
                                                그렇게 마법 같은 사랑은 시작된 거야”
                                            </div>
                                        </div>
                                    </a>
                                    <div class="tit-area">
                                        <p class="movie-grade age-all">,</p>
                                        <p title="말할 수 없는 비밀" class="tit">말할 수 없는 비밀</p>
                                    </div>
                                    <div class="rate-date">    <span class="rate">예매율 30.3%</span>    <span class="date">개봉일 2025.01.28</span></div>
                                    <!-- //movie-list-info -->
                                    <!-- btn-util -->
                                    <div class="btn-util">
                                        <button type="button" class="button btn-like">
                                            <i class="far fa-heart"></i>1.2k
                                        </button>
                                        <div class="case col2">
                                            <a href="" class="button btn1" title="영화 예매하기">예매</a>
                                            <a href="" class="button btn2" title="MX관 예매하기">MX</a>
                                        </div>
                                    </div>
                                    <!-- //btn-util -->
                                </li>
                                <li>
                                    <a href="#" class="movie-list-info" title="영화상세 보기">
                                        <p class="rank">2</p>
                                        <img src="https://img.megabox.co.kr/SharedImg/2025/01/06/0XDjkXDLm7waDVJ9leltSNNBOrEpLGEU_420.jpg" alt="검은 수녀들" class="poster">
                                        <div class="wrap">
                                            <div class="summary">
                                                금지된 곳으로 갈 준비가 되었습니다.
                                                ‘유니아’ 수녀(송혜교)는
                                                ‘희준’(문우진)의 몸에 숨어든 악령이 12형상 중 하나라고 확신한다.
                                                당장 올 수 없는 구마 사제를 기다리다가 부마자가 희생될 것이 분명한 상황.
                                                결국 ‘유니아’는 소년을 구하기 위해
                                                ‘서품을 받지 못한 수녀는 구마를 할 수 없다’는 금기를 깨기로 결심한다.
                                                하지만 담당의는 ‘희준’을 살릴 수 있는 것은 오직 의학이라 믿는 ‘바오로’ 신부(이진욱).
                                                우연한 기회에 그의 제자 ‘미카엘라’ 수녀(전여빈)의 비밀을 알아챈 ‘유니아’는
                                                ‘희준’을 병원에서 빼내기 위해 막무가내로 도움을 요청한다.
                                                ‘미카엘라’는 거침없는 ‘유니아’ 에게 반발심을 느끼지만,
                                                동질감이 느껴지는 ‘희준’을 위해 힘을 보태기로 한다.
                                                마침내 두 수녀는
                                                수단과 방법을 가리지 않고 오직 소년을 살리기 위한 위험한 의식을 시작하는데...
                                                원칙은 단 하나, 무조건 살린다!
                                            </div>
                                        </div>
                                    </a>
                                    <div class="tit-area">
                                        <p class="movie-grade age-15">,</p>
                                        <p title="검은 수녀들" class="tit">검은 수녀들</p>
                                    </div>
                                    <div class="rate-date">    <span class="rate">예매율 13%</span>    <span class="date">개봉일 2025.01.24</span></div>
                                    <div class="btn-util">
                                        <button type="button" class="button btn-like">
                                            <i class="far fa-heart"></i>1.1k
                                        </button>

                                        <div class="case col2">
                                            <a href="" class="button btn1" title="영화 예매하기">예매</a>
                                            <a href="" class="button btn2" title="MX관 예매하기">MX</a>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <a href="#" class="movie-list-info" title="영화상세 보기">
                                        <p class="rank">3</p>
                                        <img src="https://img.megabox.co.kr/SharedImg/2024/12/31/nj18f6ZDFpLxKy433HhWPsP39RPpTFrM_420.jpg" alt="보고타: 마지막 기회의 땅" class="poster">
                                        <div class="wrap">
                                            <div class="summary">
                                                희망 없는 인생,
                                                기회는 바로 그 곳에 있었다.
                                                1997년 IMF의 후폭풍을 피하지 못한 국희(송중기)와 가족들은 지구 반대편 콜롬비아 보고타로 향한다.
                                                낯선 땅에서 살아남기 위해, 한인 상인회의 권력을 쥔 박병장(권해효) 밑에서 일을 시작한 국희.
                                                성실함으로 박병장의 눈에 띈 국희는 박병장의 테스트로 의류 밀수 현장에 가담하게 되고,
                                                콜롬비아 세관에게 걸릴 위기 상황 속에서 목숨 걸고 박병장의 물건을 지켜내며
                                                박병장은 물론 통관 브로커 수영(이희준)에게도 강렬하게 존재감을 각인시킨다.
                                                곧 수영이 국희에게 위험한 제안을 하고, 이를 눈치 챈 박병장 또한 새로운 계획을 세우며 국희를 시험에 들게 한다.
                                                본인의 선택으로 보고타 한인 사회의 판도를 바꿀 수 있음을 체감한 국희는 점점 더 큰 성공을 열망하게 되는데…
                                            </div>
                                        </div>
                                    </a>
                                    <div class="tit-area">
                                        <p class="movie-grade age-15">,</p>
                                        <p title="보고타: 마지막 기회의 땅" class="tit">보고타: 마지막 기회의 땅</p>
                                    </div>
                                    <div class="rate-date">    <span class="rate">예매율 10.3%</span>    <span class="date">개봉일 2024.12.31</span></div>
                                    <div class="btn-util">
                                        <button type="button" class="button btn-like">
                                            <i class="far fa-heart"></i>6.2k
                                        </button>
                                        <div class="case">
                                            <a href="" class="button btn1" title="영화 예매하기">예매</a>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <a href="#" class="movie-list-info" title="영화상세 보기">
                                        <p class="rank">4</p>
                                        <img src="https://img.megabox.co.kr/SharedImg/2025/01/08/voFgSlrB9J2LLJqj7p6L6Zx03X3qFf6O_420.jpg" alt="하얼빈" class="poster">
                                        <div class="wrap">
                                            <div class="summary">
                                                1908년 함경북도 신아산에서 안중근이 이끄는 독립군들은 일본군과의 전투에서 큰 승리를 거둔다.
                                                대한의군 참모중장 안중근은 만국공법에 따라 전쟁포로인 일본인들을 풀어주게 되고,
                                                이 사건으로 인해 독립군 사이에서는 안중근에 대한 의심과 함께 균열이 일기 시작한다.
                                                1년 후, 블라디보스토크에는 안중근을 비롯해 우덕순, 김상현, 공부인, 최재형, 이창섭 등
                                                빼앗긴 나라를 되찾기 위해 마음을 함께하는 이들이 모이게 된다.
                                                이토 히로부미가 러시아와 협상을 위해 하얼빈으로 향한다는 소식을 접한 안중근과 독립군들은 하얼빈으로 향하고,
                                                내부에서 새어 나간 이들의 작전 내용을 입수한 일본군들의 추격이 시작되는데…
                                                하얼빈을 향한 단 하나의 목표,
                                                늙은 늑대를 처단하라
                                            </div>
                                        </div>
                                    </a>
                                    <div class="tit-area">
                                        <p class="movie-grade age-15">,</p>
                                        <p title="하얼빈" class="tit">하얼빈</p>
                                    </div>
                                    <div class="rate-date">    <span class="rate">예매율 8.6%</span>    <span class="date">개봉일 2024.12.24</span></div>
                                    <div class="btn-util">
                                        <button type="button" class="button btn-like">
                                            <i class="far fa-heart"></i>424
                                        </button>
                                        <div class="case">
                                            <a href="" class="button btn1" title="영화 예매하기">예매</a>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <!-- movie-list-info -->
                                    <a href="#" class="movie-list-info" title="영화상세 보기">
                                        <p class="rank">1</p>
                                        <img src="https://img.megabox.co.kr/SharedImg/2025/01/06/veoYkRw8THPbrE9FobWUP1BVmEbMOXnp_420.jpg" alt="말할 수 없는 비밀" class="poster">
                                        <div class="wrap">
                                            <div class="summary">
                                                “연주할 때만 느껴지는 감정이 있거든. 그게 널 만나면 느껴져”
                                                유학 중이던 피아니스트 유준은 팔목 치료를 위해 한국에 교환 학생으로 오게 된다.
                                                학교에 처음 간 그날, 신비로운 피아노 선율에 이끌려 도착한 연습실에서
                                                유준은 정아와 마주치고, 운명처럼 끌린 두 사람은 시간을 보내며 가까워진다.
                                                하지만, 연락처조차 알려주지 않는 정아와의 만남은 계속 엇갈리고,
                                                유준의 시선이 늘 자신을 향해 있다고 생각한
                                                인희의 갑작스러운 고백은 정아에게 큰 상처를 입힌다.
                                                그날 이후 사라진 정아의 행방을 찾던 유준은 정아의 비밀을 마주하게 되는데…
                                                “너와 나의 시간을 이어 준 연주곡 ‘시크릿’
                                                그렇게 마법 같은 사랑은 시작된 거야”
                                            </div>
                                        </div>
                                    </a>
                                    <div class="tit-area">
                                        <p class="movie-grade age-all">,</p>
                                        <p title="말할 수 없는 비밀" class="tit">말할 수 없는 비밀</p>
                                    </div>
                                    <div class="rate-date">    <span class="rate">예매율 30.3%</span>    <span class="date">개봉일 2025.01.28</span></div>
                                    <!-- //movie-list-info -->
                                    <!-- btn-util -->
                                    <div class="btn-util">
                                        <button type="button" class="button btn-like">
                                            <i class="far fa-heart"></i>1.2k
                                        </button>
                                        <div class="case col2">
                                            <a href="" class="button btn1" title="영화 예매하기">예매</a>
                                            <a href="" class="button btn2" title="MX관 예매하기">MX</a>
                                        </div>
                                    </div>
                                    <!-- //btn-util -->
                                </li>
                                <li>
                                    <a href="#" class="movie-list-info" title="영화상세 보기">
                                        <p class="rank">2</p>
                                        <img src="https://img.megabox.co.kr/SharedImg/2025/01/06/0XDjkXDLm7waDVJ9leltSNNBOrEpLGEU_420.jpg" alt="검은 수녀들" class="poster">
                                        <div class="wrap">
                                            <div class="summary">
                                                금지된 곳으로 갈 준비가 되었습니다.
                                                ‘유니아’ 수녀(송혜교)는
                                                ‘희준’(문우진)의 몸에 숨어든 악령이 12형상 중 하나라고 확신한다.
                                                당장 올 수 없는 구마 사제를 기다리다가 부마자가 희생될 것이 분명한 상황.
                                                결국 ‘유니아’는 소년을 구하기 위해
                                                ‘서품을 받지 못한 수녀는 구마를 할 수 없다’는 금기를 깨기로 결심한다.
                                                하지만 담당의는 ‘희준’을 살릴 수 있는 것은 오직 의학이라 믿는 ‘바오로’ 신부(이진욱).
                                                우연한 기회에 그의 제자 ‘미카엘라’ 수녀(전여빈)의 비밀을 알아챈 ‘유니아’는
                                                ‘희준’을 병원에서 빼내기 위해 막무가내로 도움을 요청한다.
                                                ‘미카엘라’는 거침없는 ‘유니아’ 에게 반발심을 느끼지만,
                                                동질감이 느껴지는 ‘희준’을 위해 힘을 보태기로 한다.
                                                마침내 두 수녀는
                                                수단과 방법을 가리지 않고 오직 소년을 살리기 위한 위험한 의식을 시작하는데...
                                                원칙은 단 하나, 무조건 살린다!
                                            </div>
                                        </div>
                                    </a>
                                    <div class="tit-area">
                                        <p class="movie-grade age-15">,</p>
                                        <p title="검은 수녀들" class="tit">검은 수녀들</p>
                                    </div>
                                    <div class="rate-date">    <span class="rate">예매율 13%</span>    <span class="date">개봉일 2025.01.24</span></div>
                                    <div class="btn-util">
                                        <button type="button" class="button btn-like">
                                            <i class="far fa-heart"></i>1.1k
                                        </button>

                                        <div class="case col2">
                                            <a href="" class="button btn1" title="영화 예매하기">예매</a>
                                            <a href="" class="button btn2" title="MX관 예매하기">MX</a>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <a href="#" class="movie-list-info" title="영화상세 보기">
                                        <p class="rank">3</p>
                                        <img src="https://img.megabox.co.kr/SharedImg/2024/12/31/nj18f6ZDFpLxKy433HhWPsP39RPpTFrM_420.jpg" alt="보고타: 마지막 기회의 땅" class="poster">
                                        <div class="wrap">
                                            <div class="summary">
                                                희망 없는 인생,
                                                기회는 바로 그 곳에 있었다.
                                                1997년 IMF의 후폭풍을 피하지 못한 국희(송중기)와 가족들은 지구 반대편 콜롬비아 보고타로 향한다.
                                                낯선 땅에서 살아남기 위해, 한인 상인회의 권력을 쥔 박병장(권해효) 밑에서 일을 시작한 국희.
                                                성실함으로 박병장의 눈에 띈 국희는 박병장의 테스트로 의류 밀수 현장에 가담하게 되고,
                                                콜롬비아 세관에게 걸릴 위기 상황 속에서 목숨 걸고 박병장의 물건을 지켜내며
                                                박병장은 물론 통관 브로커 수영(이희준)에게도 강렬하게 존재감을 각인시킨다.
                                                곧 수영이 국희에게 위험한 제안을 하고, 이를 눈치 챈 박병장 또한 새로운 계획을 세우며 국희를 시험에 들게 한다.
                                                본인의 선택으로 보고타 한인 사회의 판도를 바꿀 수 있음을 체감한 국희는 점점 더 큰 성공을 열망하게 되는데…
                                            </div>
                                        </div>
                                    </a>
                                    <div class="tit-area">
                                        <p class="movie-grade age-15">,</p>
                                        <p title="보고타: 마지막 기회의 땅" class="tit">보고타: 마지막 기회의 땅</p>
                                    </div>
                                    <div class="rate-date">    <span class="rate">예매율 10.3%</span>    <span class="date">개봉일 2024.12.31</span></div>
                                    <div class="btn-util">
                                        <button type="button" class="button btn-like">
                                            <i class="far fa-heart"></i>6.2k
                                        </button>
                                        <div class="case">
                                            <a href="" class="button btn1" title="영화 예매하기">예매</a>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <a href="#" class="movie-list-info" title="영화상세 보기">
                                        <p class="rank">4</p>
                                        <img src="https://img.megabox.co.kr/SharedImg/2025/01/08/voFgSlrB9J2LLJqj7p6L6Zx03X3qFf6O_420.jpg" alt="하얼빈" class="poster">
                                        <div class="wrap">
                                            <div class="summary">
                                                1908년 함경북도 신아산에서 안중근이 이끄는 독립군들은 일본군과의 전투에서 큰 승리를 거둔다.
                                                대한의군 참모중장 안중근은 만국공법에 따라 전쟁포로인 일본인들을 풀어주게 되고,
                                                이 사건으로 인해 독립군 사이에서는 안중근에 대한 의심과 함께 균열이 일기 시작한다.
                                                1년 후, 블라디보스토크에는 안중근을 비롯해 우덕순, 김상현, 공부인, 최재형, 이창섭 등
                                                빼앗긴 나라를 되찾기 위해 마음을 함께하는 이들이 모이게 된다.
                                                이토 히로부미가 러시아와 협상을 위해 하얼빈으로 향한다는 소식을 접한 안중근과 독립군들은 하얼빈으로 향하고,
                                                내부에서 새어 나간 이들의 작전 내용을 입수한 일본군들의 추격이 시작되는데…
                                                하얼빈을 향한 단 하나의 목표,
                                                늙은 늑대를 처단하라
                                            </div>
                                        </div>
                                    </a>
                                    <div class="tit-area">
                                        <p class="movie-grade age-15">,</p>
                                        <p title="하얼빈" class="tit">하얼빈</p>
                                    </div>
                                    <div class="rate-date">    <span class="rate">예매율 8.6%</span>    <span class="date">개봉일 2024.12.24</span></div>
                                    <div class="btn-util">
                                        <button type="button" class="button btn-like">
                                            <i class="far fa-heart"></i>424
                                        </button>
                                        <div class="case">
                                            <a href="" class="button btn1" title="영화 예매하기">예매</a>
                                        </div>
                                    </div>
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
        </div>

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
        </script>
    </section>
</main>
<!-- footer -->
<footer id="footer">
    <!-- footer-top -->
    <div class="footer-top">
        <div class="inner-wrap">
            <ul class="fnb">
                <li><a href="#" title="회사소개 페이지로 이동">회사소개</a></li>
                <li><a href="#" title="인재채용 페이지로 이동">인재채용</a></li>
                <li><a href="#" title="사회공헌 페이지로 이동">사회공헌</a></li>
                <li><a href="#" title="제휴/광고/부대사업문의 페이지로 이동">제휴/광고/부대사업문의</a></li>
                <li><a href="#" title="이용약관 페이지로 이동">이용약관</a></li>
                <li class="privacy"><a href="#" title="개인정보처리방침 페이지로 이동">개인정보처리방침</a></li>
                <li><a href="#" title="윤리경영 페이지로 이동">윤리경영</a></li>
            </ul>
            <a href="#" title="극장찾기" class="looking-theather"><i class="iconset ico-footer-search"></i>극장찾기</a>
        </div>
    </div>
    <!-- //footer-top -->
    <!-- footer-bottom -->
    <div class="footer-bottom">
        <div class="inner-wrap">
            <div class="ci">MEGABOX : Life Theater</div>
            <div class="footer-info">
                <div>
                    <address>서울특별시 성동구 왕십리로 50, 6층(성수동 1가, 메가박스스퀘어)</address>
                    <p>ARS 1544-0070</p>
                </div>
                <p>대표자명 김진선</p>
                <p> · 개인정보보호책임자 BP본부 본부장 박영진</p>
                <p> · 사업자등록번호 211-86-59478</p>
                <p> · 통신판매업신고번호 제 833호</p>
                <p class="copy">COPYRIGHT © MegaboxJoongAng, Inc. All rights reserved</p>
            </div>
            <div class="footer-sns">
                <a href="https://twitter.com/megaboxon" target="_blank" title="트위터 페이지로 이동">
                    <i class="iconset ico-twitter">트위터</i>
                </a>
                <a href="https://www.facebook.com/megaboxon" target="_blank" title="페이스북 페이지로 이동">
                <i class="iconset ico-facebook">페이스북</i>
                </a>
                <a href="https://instagram.com/megaboxon" target="_blank" title="인스타그램 페이지로 이동">
                    <i class="iconset ico-instagram">인스타그램</i>
                </a>
                <a href="https://play.google.com/store/apps/details?id=com.megabox.mop" target="_blank" title="구글플레이 페이지로 이동">
                    <i class="iconset ico-googleplay">구글플레이</i>
                </a>
                <a href="https://itunes.apple.com/kr/app/megabox/id894443858?l=ko&ls=1&mt=8" target="_blank" title="메가박스 앱스토어 페이지로 이동">
                    <i class="iconset ico-appstore">메가박스 앱스토어</i>
                </a>
            </div>
        </div>
    </div>
    <!-- //footer-bottom -->
</footer>
<!-- //footer -->
</body>
</html>
