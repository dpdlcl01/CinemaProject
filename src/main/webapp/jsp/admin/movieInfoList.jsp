<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!Doctype html>
<html lang="ko">
<head>
</head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/common.css">

<style>
    .admin-contents {
        width: 100%;
        min-height: 550px;
    }
    .page-util .inner-wrap {
        max-width: 100%; !important;
        padding: 20px 20px; !important;
    }

  #h2 h2{
    width: 760px;
  }
  #h2 button{
    height:32px ;
    width: 74px;
    border: none;
    background-color: white;
  }

  .myPage-container{
    display: flex;

  }
  #main{
      width: 100%;
    margin: 27px 40px 40px 40px;
  }
  #main h1{
      font-size: 30px;
  }



    .noticeboard {
        margin-top: 20px;
    }

    .noticeboard.active {
        display: block;
    }

    .search-bar-container {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 20px;
    }

    .search-bar-container .total-count {
        font-size: 16px;
    }

    .search-bar {
        display: flex;
        justify-content: flex-end;
        align-items: center;
        gap: 10px;
    }

    .search-bar select {
        padding: 6px;
        font-size: 14px;
    }

    .search-bar2 {
        border-bottom: 1px solid #423e3e;
        display: inline-block;
        position: relative;
        width: 200px;
        height: 30px;
    }

    .search-bar2 .input-text {
        display: inline-block;
        background-color: transparent;
        border: 0;
        color: #000;
        line-height: 25px;
        font-size: 16px;
        outline: none;
    }

    .search-bar2 .input-text:active {
        border: 0;
        outline: none;
    }

    .search-bar2 .btn {
        display: block;
        width: 30px;
        height: 100%;
        position: absolute;
        right: 0;
        top: 0;
        font-size: 0;
        line-height: 0;
        border: 0;
        background-color: transparent;
    }

    .search-bar2 .btn:hover {
        background-color: #0056b3;
    }

    .search-bar2 .btn .ico-search {
        display: inline-block;
        width: 18px;
        height: 18px;
        background-image: url(https://img.megabox.co.kr/static/pc/images/common/ico/ico-search-white.png);
        vertical-align: middle;
    }

    table {
        width: 100%;
        /*height: 100%;*/
        border-collapse: collapse;
        margin-top: 20px;
    }

    table, th {
        border-top: 2px solid #333;
        border-bottom: 0;
    }

    th {
        text-align: center !important;
    }


    th, td {
        padding: 15px;
        text-align: center;

    }

    td {
        border-top: 1px solid #ddd !important;
        border-bottom: 1px solid #ddd !important;
    }

    /* 제목 왼쪽 정렬 필요할 경우 */
/*    td:nth-child(4) {
        text-align: left;
        padding-left: 15px;
    }*/

    td a {
        color: inherit; /* 부모 요소의 색상을 따르도록 설정 */
        text-decoration: none; /* 밑줄 제거 */
    }


    td a:hover {
        color: #666;
    }

    th {
        background-color: #f4f4f4;
        font-weight: bold;
    }

    /* 페이지네이션 */
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
</style>

<body>
<header>
    <div class="page-util">
        <div class="inner-wrap" style="display: flex; justify-content: space-between; align-items: center;">
            <!-- 홍길동 관리자님 위치 -->
            <div class="location" style="flex-grow: 1;">
                <span>홍길동 관리자님</span>
            </div>
            <!-- 로그인/로그아웃 버튼 -->
            <div style="display: flex; gap: 10px; flex-shrink: 0;">
                <a href="/login" title="로그인 페이지로 이동" style="text-decoration: none; color: black; font-weight: 600;">
                    로그인
                </a>
                <a href="/logout" title="로그아웃" style="text-decoration: none; color: black; font-weight: 600;">
                    로그아웃
                </a>
            </div>
        </div>
    </div>
</header>
<div class="admin-contents">
  <div class="total-main">
    <div class="myPage-container">
      <%--  사이드바  --%>
      <jsp:include page="./common/adminSideBar.jsp"></jsp:include>
      <%--  메인  --%>

      <div id="main">
        <h1>영화 정보 관리</h1>
        <div id="title">
            <div id="announcement" class="noticeboard">
                <div class="search-bar-container">
                    <div class="total-count">전체 ${requestScope.totalCount}건</div>
                    <!-- 검색어 입력 섹션 -->
                    <div class="search-bar">
                        <select>
                            <option>지역 선택</option>
                            <option>서울</option>
                            <option>경기</option>
                            <option>인천</option>
                            <option>부산</option>
                        </select>
                        <select>
                            <option>극장 선택</option>
                            <option>코엑스</option>
                            <option>미사강변</option>
                            <option>안성스타필드</option>
                        </select>
                        <div class="search-bar2">
                            <input type="text" placeholder="검색어를 입력해주세요." title="영화 검색" class="input-text">
                            <button class="btn">
                                <i class="ico-search"></i>
                                검색
                            </button>
                        </div>
                    </div>
                </div>

                <!-- 영화 정보 테이블 -->
                <table>
                    <thead>
                    <tr>
                        <th>순위</th>
                        <th>KOFIC 영화코드</th>
                        <th>제목</th>
                        <th>예매율</th>
                        <th>상영시간</th>
                        <th>관람등급</th>
                        <th>개봉일</th>
                        <th>영화상태</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:set var="pvo" value="${requestScope.page}"/>
                    <c:forEach var="vo" items="${movieArray }" varStatus="vs">
                        <%-- 페이지가 바뀌면 pvo가 바뀌므로 vo도 새롭게 들어와서 vs도 다시 0부터 시작 --%>
                        <tr>
                            <td>${((pvo.nowPage - 1) * pvo.numPerPage + vs.index)+1 }</td>
                            <td>${vo.movieCd }</td>
                            <td>
                                <a href="AdminController?type=movieInfoView&movieIdx=${vo.movieIdx }">${vo.movieTitle }</a>
                            </td>
                            <td>${vo.movieReservationRate }%</td>
                            <td>${vo.movieTime }분</td>
                            <td>
                                <c:choose>
                                    <c:when test="${vo.movieGrade == 'ALL' }"><p class="movie-grade age-all">전체 관람가</p></c:when>
                                    <c:when test="${vo.movieGrade == '12' }"><p class="movie-grade age-12">12세 관람가</p></c:when>
                                    <c:when test="${vo.movieGrade == '15' }"><p class="movie-grade age-15">15세 관람가</p></c:when>
                                    <c:when test="${vo.movieGrade == '19' }"><p class="movie-grade age-19">청소년 관람 불가</p></c:when>
                                </c:choose>
                            </td>
                            <td>${vo.movieDate }</td>
                            <td>
                                <c:choose>
                                    <c:when test="${vo.movieStatus == 0 }">개봉</c:when>
                                    <c:when test="${vo.movieStatus == 1 }">개봉 예정</c:when>
                                    <c:when test="${vo.movieStatus == 2 }">종료</c:when>
                                </c:choose>
                            </td>
                        </tr>
                    </c:forEach>
                    <c:if test="${movieArray eq null or fn:length(movieArray) eq 0 }">
                        <tr>
                            <td colspan="5">현재 등록된 데이터가 없습니다.</td>
                        </tr>
                    </c:if>

                    </tbody>
                </table>

                <!--------------------- 페이지네이션 -------------------->
                <nav class="pagination">
                    <c:if test="${requestScope.page ne null}">
                        <c:set var="pvo" value="${requestScope.page}" />

                        <!-- << (맨 처음으로) -->
                        <c:if test="${pvo.nowPage > 1 && pvo.totalPage > 10}">
                            <a href="AdminController?type=movieInfoList&cPage=1" class="control first" title="처음 페이지">&laquo;</a>
                        </c:if>

                        <!-- < (이전 페이지 블록) -->
                        <c:if test="${pvo.startPage > 1}">
                            <a href="UAdminController?type=movieInfoList&cPage=${pvo.startPage - pvo.pagePerBlock}" class="control prev" title="이전 블록">&lt;</a>
                        </c:if>

                        <!-- 페이지 번호 -->
                        <c:forEach begin="${pvo.startPage}" end="${pvo.endPage}" varStatus="st">
                            <c:if test="${st.index eq pvo.nowPage}">
                                <strong class="active">${st.index}</strong>
                            </c:if>
                            <c:if test="${st.index ne pvo.nowPage}">
                                <a href="AdminController?type=movieInfoList&cPage=${st.index}" title="${st.index}페이지 보기">${st.index}</a>
                            </c:if>
                        </c:forEach>

                        <!-- > (다음 페이지 블록) -->
                        <c:if test="${pvo.endPage < pvo.totalPage}">
                            <a href="AdminController?type=movieInfoList&cPage=${pvo.startPage + pvo.pagePerBlock}" class="control next" title="다음 블록">&gt;</a>
                        </c:if>

                        <!-- >> (맨 마지막으로) -->
                        <c:if test="${pvo.nowPage < pvo.totalPage && pvo.totalPage > 10}">
                            <a href="AdminController?type=movieInfoList&cPage=${pvo.totalPage}" class="control last" title="마지막 페이지">&raquo;</a>
                        </c:if>
                    </c:if>
                </nav>
                <!--------------------- 페이지네이션 -------------------->

            </div>
        </div>
      </div>
    </div>
  </div>
</div>

</body>
</html>