<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!Doctype html>
<html lang="en">
<!-- head -->
<head>
  <meta charset="UTF-8">
  <jsp:include page="../common/head.jsp"/>
</head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/movieMain.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/myMovieStory.css">

<style>

</style>
<body>
<!-- header 영역 -->
<jsp:include page="../common/header.jsp"/>
<div class="page-util">
  <div class="inner-wrap">
    <div class="location">
      <span>Home</span>
      <img src="https://img.megabox.co.kr/static/pc/images/common/bg/bg-location-arr.png"/>
      <label>마이페이지</label>
      <img src="https://img.megabox.co.kr/static/pc/images/common/bg/bg-location-arr.png"/>
      <label>무비스토리</label>
    </div>
  </div>
</div>
<!-- contents 영역 -->
<div class="contents">
  <article id="wrap">
    <%--  사이드바  --%>
    <jsp:include page="../common/sideBar.jsp"/>
    <div id="main">
      <h2>나의 무비 스토리</h2>
      <div>
        <div class="tabs">
          <div class="tab active" data-target="movieTimeline">무비타임라인</div>
          <div class="tab" data-target="review">관람평</div>
          <div class="tab" data-target="seeMovie">본영화</div>
          <div class="tab" data-target="want">보고싶어</div>
        </div>
        <div id="movieTimeline" class="content active">
          <div class="YearTabs-container">
            <!-- 이전 화살표 버튼 -->
            <button class="arrow prev" aria-label="Previous tab">
              <img src="https://img.megabox.co.kr/static/pc/images/mypage/btn-timeline-prev.png" alt="Previous">
            </button>
            <!-- 탭 버튼들 -->
            <div class="YearTabs">
              <div class="YearTab" data-target="2022">2022</div>
              <div class="YearTab" data-target="2023">2023</div>
              <div class="YearTab" data-target="2024">2024</div>
              <div class="YearTab active" data-target="2025">2025</div>
            </div>

            <!-- 다음 화살표 버튼 -->
            <button class="arrow next" aria-label="Next tab">
              <img src="https://img.megabox.co.kr/static/pc/images/mypage/btn-timeline-next.png" alt="Next">
            </button>
          </div>

          <!-- 각 탭에 연결된 콘텐츠 -->
          <div class="YearContents">
            <div class="YearContent" id="2022">
              <div class="my-timeline-list myTimeline" style="display: block;">
                <ol>
                  <li>
                    <div class="date">
                      <p>2022.08.13</p>
                    </div>
                    <ul class="movie">
                      <li>
                        <a href="#" title="헌트 상세보기" class="img">
                          <img src="https://img.megabox.co.kr/SharedImg/2022/08/05/QDUC0cjm2bnWDCCQPYpQvelnoFe1CCfH_230.jpg" alt="헌트">
                        </a>
                        <div class="cont">
                          <p class="label">본영화</p>
                          <p class="tit"><a href="#" title="헌트 상세보기">헌트</a></p>
                          <div class="theater">
                            <p>수원남문</p>
                            <p>컴포트 3관(리클라이너)</p>
                            <p>2022.08.13(토) 13:40 (3회차)</p>
                          </div>
                        </div>
                      </li>
                    </ul>
                  </li>
                  <li>
                    <div class="date">
                      <p>2022.05.28</p>
                    </div>
                    <ul class="movie">
                      <li>
                        <a href="#" title="범죄도시 2 상세보기" class="img">
                          <img src="https://img.megabox.co.kr/SharedImg/2022/05/23/oZfETtpEvKGpdY2JQo2Z6wFL0S4cpKy5_230.jpg" alt="범죄도시 2">
                        </a>
                        <div class="cont">
                          <p class="label">본영화</p>
                          <p class="tit"><a href="#" title="범죄도시 2 상세보기">범죄도시 2</a>
                          </p><div class="theater">
                          <p>수원남문</p>
                          <p>컴포트 4관(리클라이너)</p>
                          <p>2022.05.28(토) 18:30 (5회차)</p>
                        </div>
                        </div>
                      </li>
                    </ul>
                  </li>
                </ol>
              </div>
            </div>
            <div class="YearContent" id="2023">
              <div class="my-appraisal">
                <ul>
                  <li class="no-result">등록된 타임라인이 없습니다.</li>
                </ul>
              </div>
            </div>
            <div class="YearContent" id="2024">
              <div class="my-appraisal">
                <ul>
                  <li class="no-result">등록된 타임라인이 없습니다.</li>
                </ul>
              </div>
            </div>
            <div class="YearContent" id="2025">
              <div class="my-appraisal">
                <ul>
                  <li class="no-result">나의 무비타임라인을 만들어보세요!</li>
                </ul>
              </div>
            </div>
          </div>
        </div>

        <%--여기서 rvo 받아서 아래 뿌려라--%>


        <div id="review" class="content">
          <div class="my-appraisal">
            <ul id="myAppraisal">
              <c:if test="${empty rvo}">
                <li class="no-result">등록된 리뷰가 없습니다.</li>
              </c:if>
              <c:forEach items="${requestScope.rvo}" var="review">
                <li>
                  <p class="img posterImg">
                    <img src="${review.moviePosterUrl}" alt="헌트">
                  </p>
                  <div class="cont">
                    <p class="tit">
                      <a href="#" title="한줄평 상세보기">${review.movieTitle}</a>
                    </p>
                    <p class="oneData">${review.reviewContent}</p>
                    <div class="modify-area updateData" style="display: none;">
                      <textarea rows="5" cols="30" title="한줄평 수정 내용 입력" class="input-textarea">.</textarea>
                    </div>
                    <div class="util">
                      <div class="right">
                        <span><button type="button" id="updateRealCommentBtn" class="btn modify updateBtn">수정</button></span>
                        <span><button type="button" class="btn del deleteBtn">삭제</button></span>
                      </div>
                    </div>
                  </div>
                </li>
              </c:forEach>


            </ul>
          </div>
        </div>

        <div id="seeMovie" class="content">
          <div class="mypage-infomation mt20" style="display: block;">
            <ul class="dot-list mb20">
              <li>극장에서 발권하신 티켓 바코드 하단의 거래번호를 통해 본 영화 등록을 하실 수 있습니다.</li>
              <li>본영화는 관람한 인원수에 한해 등록이 가능합니다.</li>
            </ul>
            <div class="btn-group right" style="display: block;">
              <a href="#" class="SeeMovieButton" title="본 영화 등록">본 영화 등록</a>
            </div>
          </div>
          <div class="my-saw-movie" style="display: block;">
            <ul id="mySawMovie">
              <c:forEach items="${requestScope.reserveVO}" var="res">
                <li>
                  <p class="img posterImg">
                    <img src="${res.moviePosterUrl}" alt="헌트">
                  </p>    <div class="cont">
                  <p class="tit"><a href="#" title="헌트 상세보기"></a></p>
                  <div class="theater">
                    <p></p>
                    <p></p>
                    <p></p>
                  </div>
                </div>
                  <div class="btn-group">
                    <a href="#" class="btn review moveOneBtn" title="관람평쓰기">
                      <i class="iconset ico-pencil"></i> 관람평쓰기</a>
                    <button type="button" class="btn del deleteBtn">삭제</button>
                  </div>
                </li>
              </c:forEach>

            </ul>
          </div>
        </div>



        <div id="want" class="content">
          <%--            <div class="my-appraisal">--%>
          <section id="section05" class="section main-movie">
            <!-- cont-area -->
            <div class="cont-area">
              <div class="main-movie-list">
                <ol class="list clearfix movie-list" id="favorite">
                  <c:forEach items="${requestScope.fvo}" var="fvo">
                    <li data-status="open" id="favoriteLi">
                      <!-- movie-list-info -->
                      <a href="#" class="movie-list-info" title="영화상세 보기">
                        <img src="${fvo.moviePosterUrl}" alt="말할 수 없는 비밀" class="poster">
                      </a>
                      <div class="tit-area">
                        <p class="movie-grade age-all">,</p>
                        <p title="말할 수 없는 비밀" class="tit">${fvo.movieTitle}</p>
                      </div>
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
                  </c:forEach>

                </ol>
              </div>
            </div>
          </section>
          <%--                <li class="no-result">보고싶은 영화를 등록 해 주세요</li>--%>
        </div>
      </div>
    </div>

  </article>
</div>


<jsp:include page="../common/footer.jsp"/>


<script src="${pageContext.request.contextPath}/js/myMovieStory.js"></script>
</body>
</html>