<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!Doctype html>
<html lang="ko">
<!-- head -->

<head>
    <jsp:include page="../common/head.jsp"/>
</head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/movie.css">
<script src="https://kit.fontawesome.com/d7f530ec10.js" crossorigin="anonymous"></script>
<body>

<!-- header 영역 -->
<jsp:include page="../common/header.jsp"/>
<div class="page-util">
    <div class="inner-wrap">
        <div class="location">
            <span>Home</span>
            <a href="/movie" title="영화 페이지로 이동">영화</a>
            <a href="/movie" title="전체영화 페이지로 이동 이동" class="pageUtila">전체영화</a>
        </div>
    </div>
</div>

<!-- contents 영역 -->
<div id="contents">
    <main id="main">
        <input type="hidden" id="onairYn" name="onairYn" value="N">
        <!-- section01 -->
        <section id="section05" class="section main-movie">
            <!-- cont-area -->
            <div class="cont-area">
                <h1>전체영화</h1>
                <div class="tabs">
                    <div class="tab active" data-target="boxoffice">박스오피스</div>
                    <div class="tab" data-target="nowShowing">상영작</div>
                    <div class="tab" data-target="comingSoon">상영예정작</div>
                </div>
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
<%--                        <h2>전체영화</h2>--%>
                        <div class="movie-list-util mt40">
                            <div class="onair-condition">
                                <button type="button" title="전체 영화 보기" class="btn-onair btnOnAir">개봉작만</button>
                            </div>
                        </div>
                        <!-- main-movie-list boxRankList -->
                        <div class="main-movie-list">
                            <ol class="list clearfix movie-list">

                            <!-- movie-list-info -->
                            <c:if test="${requestScope.movieArray ne null }">
                            <c:forEach var="mvo" items="${requestScope.movieArray }" varStatus="st">
                                <li data-status="open">

                                    <a href="UserController?type=movieDetail&movieIdx=${mvo.movieIdx }" class="movie-list-info" title="영화상세 보기">
                                    <p class="rank">${st.index+1 }</p>
                                    <img src="${mvo.moviePosterUrl }" alt="${mvo.movieTitle }" class="poster">
                                    <div class="wrap">
                                    <div class="summary">
                                    ${mvo.movieInfo }
                                    </div>
                                    </div>
                                    </a>
                                    <div class="tit-area">
                                        <p class="movie-grade age-all">,</p>
                                        <p title="${mvo.movieTitle }" class="tit">${mvo.movieTitle }</p>
                                    </div>
                                    <div class="rate-date">    <span class="rate">예매율 ${mvo.movieReservationRate }%</span>    <span class="date">개봉일 ${mvo.movieDate }</span></div>
                                    <!-- //movie-list-info -->
                                    <!-- btn-util -->
                                    <div class="btn-util">
                                        <button type="button" class="button btn-like">
                                            <i class="far fa-heart"></i>1.2k
                                        </button>
                                        <div class="case">
                                            <a href="UserController?type=reservation&movieIdx=${mvo.movieIdx }" class="button btn1" title="영화 예매하기">예매</a>
                                        </div>
                                    </div>
                                    <!-- //btn-util -->
                                </li>
                            </c:forEach>
                            </c:if>
                                <%------------------------------여기부터 더보기라인----------------------------%>
                                <li class="movie-item" style="display: none;">
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
                                        <div class="case">
                                            <a href="" class="button btn1" title="영화 예매하기">예매</a>
                                        </div>
                                    </div>
                                    <!-- //btn-util -->
                                </li>
                                <li class="movie-item" style="display: none;">
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

                                        <div class="case">
                                            <a href="" class="button btn1" title="영화 예매하기">예매</a>
                                        </div>
                                    </div>
                                </li>
                                <li class="movie-item" style="display: none;">
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
                                <li class="movie-item" style="display: none;">
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
                                <li class="movie-item" style="display: none;">
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
                                        <div class="case">
                                            <a href="" class="button btn1" title="영화 예매하기">예매</a>
                                        </div>
                                    </div>
                                    <!-- //btn-util -->
                                </li>
                                <li class="movie-item" style="display: none;">
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

                                        <div class="case">
                                            <a href="" class="button btn1" title="영화 예매하기">예매</a>
                                        </div>
                                    </div>
                                </li>
                                <li class="movie-item upcoming" style="display: none;">
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
                                <li class="movie-item" style="display: none;">
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
                <div class="btn-more v1" id="addMovieDiv" style="">
                    <button type="button" class="btn" id="btnAddMovie">더보기 <i class="iconset ico-btn-more-arr"></i></button>
                </div>
            </div>


        </section>
    </main>
</div>

<!-- footer 영역 -->
<jsp:include page="../common/footer.jsp"/>

<!-- script 영역 -->
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

    const itemsPerPage = 20; // 한 번에 표시할 영화 수
    let currentCount = 0; // 현재 표시된 영화 수

    // 더보기 버튼 클릭 이벤트
    document.getElementById('btnAddMovie').addEventListener('click', () => {
        const movieItems = document.querySelectorAll('.movie-item');

        // 숨겨진 영화 중 표시할 영화 선택
        for (let i = currentCount; i < currentCount + itemsPerPage && i < movieItems.length; i++) {
            movieItems[i].style.display = 'block'; // 숨김 해제
        }

        // 현재 카운트 업데이트
        currentCount += itemsPerPage;

        // 모든 영화가 표시되면 "더보기" 버튼 숨김
        if (currentCount >= movieItems.length) {
            document.getElementById('addMovieDiv').style.display = 'none';
        }
    });

    /* 개봉작만 보기버튼 */
    document.addEventListener('DOMContentLoaded', function () {
        const hiddenInput = document.getElementById('onairYn');
        const button = document.querySelector('.btnOnAir');
        const movieListItems = document.querySelectorAll('.movie-list li');



        button.addEventListener('click', function () {
            if (hiddenInput.value === 'N') {
                hiddenInput.value = 'Y';
                button.textContent = '개봉작만';
                button.title = '개봉작만 보기';
                button.classList.add('on');

                // 개봉작만 표시 (data-status="open")
                movieListItems.forEach(li => {
                    if (li.getAttribute('data-status') === 'open') {
                        li.style.display = 'list-item'; // 개봉작 표시
                    } else {
                        li.style.display = 'none'; // 전체 영화 숨기기
                    }
                });


            } else {
                hiddenInput.value = 'N';
                button.textContent = '개봉작만';
                button.title = '전체 영화 보기';
                button.classList.remove('on');

                // 모든 영화(li) 보이기
                movieListItems.forEach(li => {
                    li.style.display = 'list-item'; // 모든 영화 표시
                });
            }
        });
    });


</script>
</body>
</html>
