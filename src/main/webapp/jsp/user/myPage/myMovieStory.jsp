<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!Doctype html>
<html lang="en">
<!-- head -->
<head>
  <jsp:include page="../common/head.jsp"/>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/myMovieStory.css?v=1.0">
<style>

  *{
    padding: 0;
    margin: 0;
  }
  .contents {
    display: grid;
    grid-template-columns: 2fr 1fr;
  }

  .content1 {
    width: 850px;
  }
  .content1 h1 {
    font-size: 24px;
    margin-bottom: 20px;
  }
  .content1 .filter {
    display: flex;
    margin-bottom: 20px;
  }
  .content1 .filter select,
  .content1 .filter button {
    padding: 5px 10px;
    margin-right: 10px;
  }
  .content1 table {
    width: 100%;
    border-collapse: collapse;
  }
  .content1 table th,
  .content1 table td {
    border: 1px solid #ddd;
    padding: 10px;
    text-align: left;
  }
  .content1 table th {
    background-color: #f4f4f4;
  }

  .content1 > .ongoinReservation {
    display: block; /* 초기 상태로 예매 내역 표시 */
  }

  .content1 > div.active {
    display: block; /* active 클래스가 추가되면 표시 */
  }
</style>
</head>

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
<div class="total-main">
<div class="contents">
  <%--  사이드바  --%>
  <jsp:include page="../common/sideBar.jsp"/>

    <!-- contents 영역 -->
    <div class="content1">
      <!-- Page Title -->
      <h1>나의 무비 스토리</h1>
      <div class="tabs">
        <div class="tab active" data-target="review">관람평</div>
        <div class="tab" data-target="seeMovie">본영화</div>
        <div class="tab" data-target="want">보고싶어</div>
      </div>
    <div id="main">

        <%--여기서 rvo 받아서 아래 뿌려라--%>
        <div id="review" class="content active">
          <div class="my-appraisal">
            <ul id="myAppraisal">
              <c:if test="${empty rvo}">
                <li class="no-result">등록된 리뷰가 없습니다.</li>
              </c:if>
              <c:forEach items="${requestScope.rvo}" var="review">
                <li>
                  <p class="img posterImg">
                    <img src="${review.moviePosterUrl}" alt="영화 포스터">
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
          <div class="my-saw-movie" style="display: block;">
            <ul id="mySawMovie">
              <c:forEach items="${requestScope.reserveVO}" var="res">
                <li>
                  <p class="img posterImg">
                    <img src="${res.moviePosterUrl}" alt="영화포스터">
                  </p>
                  <div class="cont">
                  <div class="theater1">
                    <span>${res.movieTitle}</span> <%--영화제목--%>
                    <p>${res.theaterName}</p> <%--영화관--%>
                    <p>${res.screenName}</p> <%--상영관--%>
                    <p>${res.timetableStartTime}</p> <%--영화시간--%>
                  </div>
                </div>
                  <div class="btn-group">
                    <a href="${pageContext.request.contextPath}/UserController?type=movieDetail&movieIdx=${res.movieIdx}" class="btn review moveOneBtn" title="관람평쓰기">
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
          <section id="section06" class="section main-movie">
            <!-- cont-area -->
            <div class="cont-area">
              <div class="main-movie-list">
                <ol class="list clearfix movie-list" id="favorite">
                  <c:forEach items="${requestScope.fvo}" var="fvo">
                    <li data-status="open" id="favoriteLi">
                      <!-- movie-list-info -->
                      <a href="${pageContext.request.contextPath}/UserController?type=movieDetail&movieIdx=${fvo.movieIdx}" class="movie-list-info" title="영화상세 보기">
                        <img src="${fvo.moviePosterUrl}" alt="영화포스터" class="poster">
                      </a>
                      <div class="tit-area">
                        <p class="movie-grade age-${fvo.movieGrade}"></p>
                        <p title="영화제목" class="tit">${fvo.movieTitle}</p>
                      </div>
                      <!-- //movie-list-info -->
                      <!-- btn-util -->
                      <div class="btn-util">
                        <button type="button" class="button btn-like">
                          <i class="far fa-heart"></i>${fvo.movieLikes}
                        </button>
                        <div class="case">
                          <a href="${pageContext.request.contextPath}/UserController?type=reservation&movieIdx=${fvo.movieIdx}" class="button btn1" title="영화 예매하기">예매</a>
                        </div>
                      </div>
                      <!-- //btn-util -->
                    </li>
                  </c:forEach>
                </ol>
              </div>
            </div>
          </section>
        </div>
      </div>
    </div>
</div>
</div>


<jsp:include page="../common/footer.jsp"/>


<script src="${pageContext.request.contextPath}/js/myMovieStory.js"></script>
</body>
</html>