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
<main>
    <section>
        <div class="hightab">
            <h1>공지사항</h1>
            <div class="tabs">
                <div class="tab active" data-target="all">전체</div>
                <div class="tab" data-target="megaPick">메가픽</div>
                <div class="tab" data-target="movies">영화</div>
            </div>

            <div id="all" class="content active">
                <h2>전체</h2>
                <p>전체 내용이 표시됩니다.</p>
            </div>
            <div id="megaPick" class="content">
                <h2>공지사항</h2>
                <p>공지사항 내용이 표시됩니다.</p>
            </div>
            <div id="movies" class="content">
                <h2>이벤트</h2>
                <p>이벤트 내용이 표시됩니다.</p>
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
