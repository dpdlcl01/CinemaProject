<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">

<!-- head 영역 -->
<head>
    <jsp:include page="./common/head.jsp"/>
</head>

<body class="main-page">

<!-- header 영역 -->
<jsp:include page="./common/header.jsp"/>

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
            <a href="#" class="more-movie" title="더 많은 영화보기">
                더 많은 영화보기
                <i class="iconset ico-more-corss gray"></i>
            </a>
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
                        <!-- //movie-list-info -->
                        <!-- btn-util -->
                        <div class="btn-util">
                            <button type="button" class="button btn-like">
                                <i class="far fa-heart"></i>1.2k
                            </button>
                            <div class="case">
                                <a href="" class="button btn1" title="영화 예매하기">예매</a>
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
                        <div class="btn-util">
                            <button type="button" class="button btn-like">
                                <i class="far fa-heart"></i>1.1k
                            </button>
                            <div class="case">
                                <a href="" class="button btn1" title="영화 예매하기">예매</a>
                            </div>
                        </div>
                    </li>
                    <li>
                        <a href="#" class="movie-list-info" title="영화상세 보기">
                            <p class="rank">3</p>
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
                    <a href="#" title="박스오피스 보기">
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
                <h2 class="tit">혜택</h2>
                <a href="" title="혜택 더보기" class="btn-more">더보기</a>
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
<jsp:include page="./common/footer.jsp"/>
</body>
</html>