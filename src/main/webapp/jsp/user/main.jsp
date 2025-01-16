<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<jsp:include page="./common/head.jsp"/>
</head>
<link rel="stylesheet" href="../../css/user/common.css">

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
                <button type="button" class="on" sort="boxRankList" name="btnSort">박스오피스순</button>
                <button type="button" sort="accmAdncList" name="btnSort">누적관객순</button>
                <button type="button" sort="megaScoreList" name="btnSort">메가스코어순</button>
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
                            <img src="https://img.megabox.co.kr/SharedImg/asis/system/mop/poster/2020/76/FBE76F-02F5-4061-A4C4-40EC14210B46.large.jpg" alt="클로젯" class="poster">
                            <div class="wrap">
                                <div class="summary">
                                    벽장 문이 열리고, 아이가 사라졌다!<br><br>
                                    갑작스러운 사고로 아내를 잃은 상원(하정우)과 그의 딸 이나(허율)<br>
                                    상원은 소원해진 이나와의 관계를 회복하기 위해 새집으로 이사를 간다.<br><br>
                                    상원은 이나와 가까워지기 위해 노력하지만 어긋난 사이는 좀처럼 회복되지 않는다.<br>
                                    그러던 어느 날 이나가 새로운 친구가 생겼다며 웃기 시작한다.<br>
                                    하지만 평온도 잠시, 이나의 방 안에 있는 벽장에서 기이한 소리들이 들려오고<br>
                                    이나에게 이상 증세가 나타난다.<br>
                                    그리고 상원마저 이상한 꿈을 꾸기 시작한 지 얼마 후, 이나가 흔적도 없이 사라진다.
                                </div>
                            </div>
                        </a>
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
                            <img src="https://img.megabox.co.kr/SharedImg/asis/system/mop/poster/2020/27/D46298-4010-43BD-9419-D1ED4FD245C1.large.jpg" alt="버즈 오브 프레이(할리 퀸의 황홀한 해방)" class="poster">
                            <div class="wrap">
                                <div class="summary">
                                    똑같으면 재미없지<br>
                                    깨부수고 벗어 던져, 너답게!<br><br>
                                    오랜 연인이던 조커와 헤어진 ‘할리 퀸(마고 로비)’은 처음 맞이한 해방에 황홀함을 느낀다. 하지만 조커라는 방패막이 사라지자 평생 처음 무방비 상태에 놓인 할리 퀸을 고담시에서 가장 비열한 범죄왕 로만 시오니스(이완 맥그리거)와 고담의 모든 갱들이 노린다.<br>
                                </div>
                            </div>
                        </a>
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
                            <img src="https://img.megabox.co.kr/SharedImg/asis/system/mop/poster/2020/45/7CC62E-B845-44D8-AC0A-7E994F91F506.large.jpg" alt="남산의 부장들" class="poster">
                            <div class="wrap">
                                <div class="summary">
                                    “각하, 제가 어떻게 하길 원하십니까”<br><br>
                                    1979년 10월 26일, 중앙정보부장 김규평(이병헌)이 대한민국 대통령을 암살한다.<br><br>
                                    이 사건의 40일전, 미국에서는 전 중앙정보부장 박용각(곽도원)이<br>
                                    청문회를 통해 전 세계에 정권의 실체를 고발하며 파란을 일으킨다.
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
                            <img src="https://img.megabox.co.kr/SharedImg/asis/system/mop/poster/2020/C0/3B7BB2-7663-4AF8-AFBC-B433C4140906.large.jpg" alt="조조 래빗" class="poster">
                            <div class="wrap">
                                <div class="summary">
                                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Corporis cumque excepturi harum dolorem eveniet, iste nam labore deleniti quasi ab modi culpa officiis, enim iure, laborum explicabo nulla fugit rerum!
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
            <!-- main-movie-list accmAdncList -->
            <div class="main-movie-list" style="display: none;">
                <ol class="list clearfix">
                    <li>
                        <a href="#" class="movie-list-info" title="영화상세 보기">
                            <p class="rank">2</p>
                            <img src="https://img.megabox.co.kr/SharedImg/asis/system/mop/poster/2020/27/D46298-4010-43BD-9419-D1ED4FD245C1.large.jpg" alt="버즈 오브 프레이(할리 퀸의 황홀한 해방)" class="poster">
                            <div class="wrap">
                                <div class="summary">
                                    똑같으면 재미없지<br>
                                    깨부수고 벗어 던져, 너답게!<br><br>
                                    오랜 연인이던 조커와 헤어진 ‘할리 퀸(마고 로비)’은 처음 맞이한 해방에 황홀함을 느낀다. 하지만 조커라는 방패막이 사라지자 평생 처음 무방비 상태에 놓인 할리 퀸을 고담시에서 가장 비열한 범죄왕 로만 시오니스(이완 맥그리거)와 고담의 모든 갱들이 노린다.<br>
                                </div>
                            </div>
                        </a>
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
                            <p class="rank">1</p>
                            <img src="https://img.megabox.co.kr/SharedImg/asis/system/mop/poster/2020/76/FBE76F-02F5-4061-A4C4-40EC14210B46.large.jpg" alt="클로젯" class="poster">
                            <div class="wrap">
                                <div class="summary">
                                    벽장 문이 열리고, 아이가 사라졌다!<br><br>
                                    갑작스러운 사고로 아내를 잃은 상원(하정우)과 그의 딸 이나(허율)<br>
                                    상원은 소원해진 이나와의 관계를 회복하기 위해 새집으로 이사를 간다.<br><br>
                                    상원은 이나와 가까워지기 위해 노력하지만 어긋난 사이는 좀처럼 회복되지 않는다.<br>
                                    그러던 어느 날 이나가 새로운 친구가 생겼다며 웃기 시작한다.<br>
                                    하지만 평온도 잠시, 이나의 방 안에 있는 벽장에서 기이한 소리들이 들려오고<br>
                                    이나에게 이상 증세가 나타난다.<br>
                                    그리고 상원마저 이상한 꿈을 꾸기 시작한 지 얼마 후, 이나가 흔적도 없이 사라진다.
                                </div>
                            </div>
                        </a>
                        <div class="btn-util">
                            <button type="button" class="button btn-like">
                                <i class="far fa-heart"></i>1.2k
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
                            <img src="https://img.megabox.co.kr/SharedImg/asis/system/mop/poster/2020/45/7CC62E-B845-44D8-AC0A-7E994F91F506.large.jpg" alt="남산의 부장들" class="poster">
                            <div class="wrap">
                                <div class="summary">
                                    “각하, 제가 어떻게 하길 원하십니까”<br><br>
                                    1979년 10월 26일, 중앙정보부장 김규평(이병헌)이 대한민국 대통령을 암살한다.<br><br>
                                    이 사건의 40일전, 미국에서는 전 중앙정보부장 박용각(곽도원)이<br>
                                    청문회를 통해 전 세계에 정권의 실체를 고발하며 파란을 일으킨다.
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
                            <img src="https://img.megabox.co.kr/SharedImg/asis/system/mop/poster/2020/C0/3B7BB2-7663-4AF8-AFBC-B433C4140906.large.jpg" alt="조조 래빗" class="poster">
                            <div class="wrap">
                                <div class="summary">
                                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Corporis cumque excepturi harum dolorem eveniet, iste nam labore deleniti quasi ab modi culpa officiis, enim iure, laborum explicabo nulla fugit rerum!
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
            <!-- //main-movie-list accmAdncList -->
            <!-- main-movie-list megaScoreList-->
            <div class="main-movie-list" style="display: none;">
                <ol class="list clearfix">
                    <li>
                        <a href="#" class="movie-list-info" title="영화상세 보기">
                            <p class="rank">1</p>
                            <img src="https://img.megabox.co.kr/SharedImg/asis/system/mop/poster/2020/76/FBE76F-02F5-4061-A4C4-40EC14210B46.large.jpg" alt="클로젯" class="poster">
                            <div class="wrap">
                                <div class="summary">
                                    벽장 문이 열리고, 아이가 사라졌다!<br><br>
                                    갑작스러운 사고로 아내를 잃은 상원(하정우)과 그의 딸 이나(허율)<br>
                                    상원은 소원해진 이나와의 관계를 회복하기 위해 새집으로 이사를 간다.<br><br>
                                    상원은 이나와 가까워지기 위해 노력하지만 어긋난 사이는 좀처럼 회복되지 않는다.<br>
                                    그러던 어느 날 이나가 새로운 친구가 생겼다며 웃기 시작한다.<br>
                                    하지만 평온도 잠시, 이나의 방 안에 있는 벽장에서 기이한 소리들이 들려오고<br>
                                    이나에게 이상 증세가 나타난다.<br>
                                    그리고 상원마저 이상한 꿈을 꾸기 시작한 지 얼마 후, 이나가 흔적도 없이 사라진다.
                                </div>
                            </div>
                        </a>
                        <div class="btn-util">
                            <button type="button" class="button btn-like">
                                <i class="far fa-heart"></i>1.2k
                            </button>
                            <div class="case col2">
                                <a href="" class="button btn1" title="영화 예매하기">예매</a>
                                <a href="" class="button btn2" title="MX관 예매하기">MX</a>
                            </div>
                        </div>
                    </li>
                    <li>
                        <a href="#" class="movie-list-info" title="영화상세 보기">
                            <p class="rank">2</p>
                            <img src="https://img.megabox.co.kr/SharedImg/asis/system/mop/poster/2020/27/D46298-4010-43BD-9419-D1ED4FD245C1.large.jpg" alt="버즈 오브 프레이(할리 퀸의 황홀한 해방)" class="poster">
                            <div class="wrap">
                                <div class="summary">
                                    똑같으면 재미없지<br>
                                    깨부수고 벗어 던져, 너답게!<br><br>
                                    오랜 연인이던 조커와 헤어진 ‘할리 퀸(마고 로비)’은 처음 맞이한 해방에 황홀함을 느낀다. 하지만 조커라는 방패막이 사라지자 평생 처음 무방비 상태에 놓인 할리 퀸을 고담시에서 가장 비열한 범죄왕 로만 시오니스(이완 맥그리거)와 고담의 모든 갱들이 노린다.<br>
                                </div>
                            </div>
                        </a>
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
                            <p class="rank">4</p>
                            <img src="https://img.megabox.co.kr/SharedImg/asis/system/mop/poster/2020/C0/3B7BB2-7663-4AF8-AFBC-B433C4140906.large.jpg" alt="조조 래빗" class="poster">
                            <div class="wrap">
                                <div class="summary">
                                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Corporis cumque excepturi harum dolorem eveniet, iste nam labore deleniti quasi ab modi culpa officiis, enim iure, laborum explicabo nulla fugit rerum!
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
                    <li>
                        <a href="#" class="movie-list-info" title="영화상세 보기">
                            <p class="rank">3</p>
                            <img src="https://img.megabox.co.kr/SharedImg/asis/system/mop/poster/2020/45/7CC62E-B845-44D8-AC0A-7E994F91F506.large.jpg" alt="남산의 부장들" class="poster">
                            <div class="wrap">
                                <div class="summary">
                                    “각하, 제가 어떻게 하길 원하십니까”<br><br>
                                    1979년 10월 26일, 중앙정보부장 김규평(이병헌)이 대한민국 대통령을 암살한다.<br><br>
                                    이 사건의 40일전, 미국에서는 전 중앙정보부장 박용각(곽도원)이<br>
                                    청문회를 통해 전 세계에 정권의 실체를 고발하며 파란을 일으킨다.
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
                </ol>
            </div>
            <!-- //main-movie-list megaScoreList -->
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
                <div class="open-cont">
                    <div class="open-pagination swiper-pagination-bullets">
                        <span class="swiper-pagination-bullet swiper-pagination-bullet-active"></span>
                    </div>
                    <div class="open-control">
                        <button type="button" class="open-prev">이전 이벤트 보기</button>
                        <button type="button" class="open-next">다음 이벤트 보기</button>
                        <button type="button" class="open-pause">일시정지</button>
                        <button type="button" class="open-play">자동재생</button>
                    </div>
                    <div class="count-num">
                        <span title="현재 페이지" class="active">1</span> /
                        <span title="전체 페이지" class="total">1</span>
                    </div>
                    <div class="open-swiper swiper-container-initialized swiper-container-horizontal">
                        <a href="" title="우리동네 놀이극장~ 메가박스 세종나성점 2020년 1월 20일 오픈! 페이지로 이동">
                <span class="label">
                  <em>신규오픈</em>
                </span>
                            <p class="area">
                                <span>대전/충청/세종</span>
                                <strong>세종나성</strong>
                            </p>
                            <p class="date">2020.01.20</p>
                            <img src="https://www.megabox.co.kr/static/pc/images/common/bg/bg-noimage-main.png" alt="">
                        </a>
                    </div>
                </div>
            </div>
            <!-- //grand-open -->
        </div>
        <!-- //wrap -->
    </section>
    <!-- //section02 -->
    <!-- section03 -->
    <section id="section03" class="section main-curation">
        <!-- wrap -->
        <div class="wrap">
            <div class="tit-util clearfix">
                <h2 class="tit">큐레이션</h2>
                <a href="#" title="큐레이션 더보기">큐레이션 더보기<i class="iconset ico-more-corss gray"></i></a>
            </div>
            <!-- curation-area -->
            <div class="curation-area">
                <!-- curr-img -->
                <div class="curr-img">
                    <p class="bage film">메가박스 필름소사이어티</p>
                    <!-- img -->
                    <div class="img">
                        <a href="" title="영화상세 보기">
                            <img src="https://img.megabox.co.kr/SharedImg/asis/system/mop/poster/2020/6F/7D3A85-E138-4D71-859F-2FF5A853BC32.large.jpg" alt="">
                        </a>
                    </div>
                    <!-- //img -->
                    <!-- btn-group -->
                    <div class="btn-group justify clearfix">
                        <div class="left">
                            <a href="" title="영화상세 보기" class="button">상세정보</a>
                        </div>
                        <div class="right">
                            <a href="" title="예매하기" class="button">예매</a>
                        </div>
                    </div>
                    <!-- //btn-group -->
                    <!-- info -->
                    <div class="info film">
                        <p class="txt">#<span>필름소사이어티</span></p>
                        <p class="tit">타오르는 여인의 초상</p>
                        <p class="summary">
                            "후회하지 말고 기억해"<br><br>
                            초상화를 그리는 화가 마리안느(노에미 멜랑)는<br>
                            원치 않는 결혼을 앞둔 귀족 아가씨 엘로이즈(아델 에넬)의 결혼 초상화 의뢰를 받는다.<br>
                            엘로이즈 모르게 그림을 완성해야 하는 마리안느는 비밀스럽게 그녀를 관찰하며<br>
                            알 수 없는 묘한 감정의 기류에 휩싸이게 된다.<br><br>
                            잊을 수 없는, 잊혀지지 않을 사랑의 기억을 마주하게 할 걸작을 만난다!
                        </p>
                    </div>
                    <!-- //info -->
                    <div class="list">
                        <ul>
                            <li>
                                <a href="" title="영화상세 보기">
                                    <p class="bage film">필름 소사이어티</p>
                                    <div class="img">
                                        <img src="https://img.megabox.co.kr/SharedImg/asis/system/mop/poster/2020/C0/3B7BB2-7663-4AF8-AFBC-B433C4140906.medium.jpg" alt="조조 래빗">
                                    </div>
                                    <p class="tit">조조 래빗</p>
                                </a>
                            </li>
                            <li>
                                <a href="" title="영화상세 보기">
                                    <p class="bage film">필름 소사이어티</p>
                                    <div class="img">
                                        <img src="https://img.megabox.co.kr/SharedImg/asis/system/mop/poster/2020/AD/91A5F0-1FAB-470D-8F23-904F21FEE1B6.medium.jpg" alt="졸업">
                                    </div>
                                    <p class="tit">졸업</p>
                                </a>
                            </li>
                            <li>
                                <a href="" title="영화상세 보기">
                                    <p class="bage classic">필름 소사이어티</p>
                                    <div class="img">
                                        <img src="https://img.megabox.co.kr/SharedImg/asis/system/mop/poster/2020/88/3AE4B6-4E71-4828-B553-2A48ECC8B3EE.medium.jpg" alt="[오페라] 투란도트 @ The Met">
                                    </div>
                                    <p class="tit">[오페라] 투란도트 @ The Met</p>
                                </a>
                            </li>
                            <li>
                                <a href="" title="영화상세 보기">
                                    <p class="bage film">필름 소사이어티</p>
                                    <div class="img">
                                        <img src="https://img.megabox.co.kr/SharedImg/asis/system/mop/poster/2020/1B/098639-C076-43FB-B3EC-5180E42EAC5B.medium.jpg" alt="페인 앤 글로리">
                                    </div>
                                    <p class="tit">페인 앤 글로리</p>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
                <!-- //curr-img -->
            </div>
            <!-- //curation-area -->
        </div>
        <!-- //wrap -->
    </section>
    <!-- //section03 -->
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
        <!-- info-notice -->
        <div class="info-notice">
            <div class="wrap">
                <p class="tit">메가박스</p>
                <p class="link">
                    <a href="" title="공지사항 상세보기">
                        <strong>[라이브뷰잉]</strong> 아이돌 마스터 신데렐라 걸즈(7th) 진행안내
                    </a>
                </p>
                <p class="date">2020.02.07</p>
                <p class="more">
                    <a href="" title="전체공지 더보기">
                        더보기<i class="fas fa-chevron-right" style="color: #999;"></i>
                    </a>
                </p>
            </div>
        </div>
        <!-- //info-notice -->
        <!-- info-link -->
        <div class="info-link">
            <div class="table">
                <div class="cell">
                    <a href="" title="고객센터 페이지로 이동">
                        <i class="iconset ico-main-customer"></i>
                        <span>고객센터</span>
                    </a>
                </div>
                <div class="cell">
                    <a href="" title="자주 묻는 질문 페이지로 이동">
                        <i class="iconset ico-main-faq"></i>
                        <span>자주 묻는 질문</span>
                    </a>
                </div>
                <div class="cell">
                    <a href="" title="1:1 문의 페이지로 이동">
                        <i class="iconset ico-main-qna"></i>
                        <span>1:1 문의</span>
                    </a>
                </div>
                <div class="cell">
                    <a href="" title="단체/대관문의 페이지로 이동">
                        <i class="iconset ico-main-group"></i>
                        <span>단체/대관문의</span>
                    </a>
                </div>
                <div class="cell">
                    <a href="" title="분실물 문의/접수 페이지로 이동">
                        <i class="iconset ico-main-lost"></i>
                        <span>분실물 문의/접수</span>
                    </a>
                </div>
                <div class="cell">
                    <a href="" title="더 부티크 프라이빗 대관예매 페이지로 이동">
                        <i class="iconset ico-main-boutique"></i>
                        <span>더 부티크 프라이빗<br>대관예매</span>
                    </a>
                </div>
            </div>
        </div>
        <!-- //info-link -->
    </section>
    <!-- //section04 -->
</main>
<jsp:include page="./common/footer.jsp"/>
</body>
</html>