<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!Doctype html>
<html lang="ko">
<head>
</head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/common.css">
<link rel="stylesheet" href="https://code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">

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

    /* 검색 폼 요소를 가로로 나란히 배치 */
    #searchForm {
        display: flex;
        align-items: center;
        flex-wrap: wrap;
        gap: 10px;
    }

    /* 검색 대상 및 필터 요소 스타일 */
    #searchForm select,
    #searchForm input[type="month"] {
        padding: 6px 10px;
        font-size: 14px;
        border: 1px solid #ccc;
        border-radius: 4px;
        flex-shrink: 0;
        width: auto;
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

    /* 검색 바 컨테이너 */
    .search-bar {
        display: flex;
        align-items: center;
        flex-wrap: nowrap;
        gap: 10px;
    }

    .search-bar select {
        padding: 6px;
        font-size: 14px;
    }

    .search-bar2 {
        flex: 1;               /* 부모 컨테이너의 남은 공간을 차지 */
        max-width: 400px;      /* 최대 너비 */
        min-width: 200px;      /* 최소 너비 */
        height: 30px;
        position: relative;
        border-bottom: 1px solid #423e3e;
    }

    .search-bar2 .input-text {
        width: 100%;           /* 부모의 너비에 맞게 확장 */
        background-color: transparent;
        border: 0;
        color: #000;
        line-height: 25px;
        font-size: 16px;
        outline: none;
        padding: 0 35px 0 5px; /* 버튼과 충돌 방지 */
        box-sizing: border-box;
    }

    .search-bar2 .input-text:active {
        border: 0;
        outline: none;
    }

    .search-bar2 .btn {
        width: 30px;
        height: 100%;
        position: absolute;
        right: 0;
        top: 0;
        font-size: 0;
        border: 0;
        background-color: transparent;
        cursor: pointer;
    }

/*    .search-bar2 .btn:hover {
        background-color: #0056b3;
    }*/

    .search-bar2 .btn .ico-search {
        display: inline-block;
        width: 18px;
        height: 18px;
        background-image: url(https://img.megabox.co.kr/static/pc/images/common/ico/ico-search-white.png);
        vertical-align: middle;
    }

    /* 초기화 아이콘 스타일 */
    .search-bar2 .btn-reset {
        position: absolute;
        right: 30px; /* 검색 버튼 옆에 위치 */
        top: 0;
        width: 30px;
        height: 100%;
        border: 0;
        background-color: transparent;
        cursor: pointer;
    }

    .ico-reset {
        display: inline-block;
        width: 18px;
        height: 18px;
        background-image: url("${pageContext.request.contextPath}/css/user/images/reload.png");
        background-size: contain;
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

    /* 클릭 가능한 행 스타일 */
    .clickable-row {
        cursor: pointer;
        transition: background-color 0.2s ease;
    }

    /* 마우스를 가져갔을 때 배경색 변경 */
    .clickable-row:hover {
        background-color: #f0f0f0;
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
        margin: 0 2px;
        padding: 0 8px;
        border: 1px solid #ebebeb;
        text-decoration: none;
        line-height: 30px;
        color: #333;
        font-weight: 400;
        vertical-align: middle;
        border-radius: 4px;
    }

    .pagination .control.first {
        background-position: 0 0;
    }

    .pagination .control.prev {
        background-position: -32px 0;
    }

    .pagination .control.next {
        background-position: -64px 0;
    }

    .pagination .control.last {
        background-position: -96px 0;
    }

    .pagination .control {
        overflow: hidden;
        width: 32px;
        height: 32px;
        background: url('${pageContext.request.contextPath}/css/user/images/btn-paging.png') no-repeat 0 0;
    }

    .modal-body {
        display: flex;
        gap: 20px;
    }

    .poster-section {
        flex: 1;
        text-align: center;
    }

    .poster-section img {
        width: 100%;
        max-width: 200px;
        height: auto;
        border: 1px solid #ccc;
        border-radius: 8px;
    }

    .form-section {
        flex: 2;
    }

    /* 필드 그룹: KOFIC 코드와 TMDB ID를 한 줄에 배치 */
    .field-group {
        display: flex;
        justify-content: space-between;
        gap: 10px;
    }

    .field-group label {
        width: 48%;
    }

    .field-group input {
        width: 48%;
        padding: 8px;
        margin-bottom: 10px;
        border: 1px solid #ccc;
        border-radius: 4px;
    }

    label {
        display: block;
        margin: 10px 0 5px;
    }

    input, select, textarea {
        width: 100%;
        padding: 8px;
        margin-bottom: 10px;
        border: 1px solid #ccc;
        border-radius: 4px;
    }

    /* 영어 제목과 예매 순위/예매율 사이 간격 추가 */
    #movieTitleEn {
        margin-bottom: 20px;  /* 영어 제목 필드 아래 간격 */
    }


</style>

<body>
<%--  헤더  --%>
<jsp:include page="../common/header.jsp"></jsp:include>

<div class="admin-contents">
  <div class="total-main">
    <div class="myPage-container">
      <%--  사이드바  --%>
      <jsp:include page="../common/adminSideBar.jsp"></jsp:include>
      <%--  메인  --%>

      <div id="main">
        <h1>영화 정보 관리</h1>
        <div id="title">
            <div id="announcement" class="noticeboard">
                <div class="search-bar-container">
                    <div class="total-count">전체 ${requestScope.totalCount}건</div>

                    <!-- 검색어 입력 및 필터 섹션 -->
                    <div class="search-bar">
                        <form id="searchForm" action="AdminController" method="get">
                            <input type="hidden" name="type" value="movieInfoList" />

                            <!-- 개봉일 월별 검색 -->
                            <label for="searchMonth">개봉월:</label>
                            <input type="month" id="searchMonth" name="searchMonth" style="padding: 5px;"
                                   value="${param.searchMonth}" />

                            <!-- 영화 상태 선택 -->
                            <select id="movieStatus" name="movieStatus">
                                <option value="">영화 상태 (전체)</option>
                                <option value="0" ${param.movieStatus == '0' ? 'selected' : ''}>개봉</option>
                                <option value="1" ${param.movieStatus == '1' ? 'selected' : ''}>개봉 예정</option>
                                <option value="2" ${param.movieStatus == '2' ? 'selected' : ''}>종료</option>
                            </select>

                            <!-- 영화 관람 등급 선택 -->
                            <select id="movieGrade" name="movieGrade">
                                <option value="">관람 등급 (전체)</option>
                                <option value="ALL" ${param.movieGrade == 'ALL' ? 'selected' : ''}>전체 관람가</option>
                                <option value="12" ${param.movieGrade == '12' ? 'selected' : ''}>12세 이상 관람가</option>
                                <option value="15" ${param.movieGrade == '15' ? 'selected' : ''}>15세 이상 관람가</option>
                                <option value="19" ${param.movieGrade == '19' ? 'selected' : ''}>청소년 관람 불가</option>
                            </select>

                            <!-- 검색 대상 선택 -->
                            <select id="searchType" name="searchType">
                                <option value="all" ${param.searchType == 'all' ? 'selected' : ''}>검색 대상 (전체)</option>
                                <option value="title" ${param.searchType == 'title' ? 'selected' : ''}>영화 제목</option>
                                <option value="director" ${param.searchType == 'director' ? 'selected' : ''}>감독</option>
                                <option value="actor" ${param.searchType == 'actor' ? 'selected' : ''}>배우</option>
                                <option value="genre" ${param.searchType == 'genre' ? 'selected' : ''}>장르</option>
                                <option value="nation" ${param.searchType == 'nation' ? 'selected' : ''}>제작 국가</option>
                            </select>

                            <!-- 검색어 입력 필드 -->
                            <div class="search-bar2">
                                <input type="text" name="searchValue" placeholder="검색어를 입력해주세요." class="input-text"
                                       value="${fn:escapeXml(param.searchValue)}" />
                                <button type="submit" class="btn" title="검색">
                                    <i class="ico-search"></i> 검색
                                </button>
                            </div>

                            <!-- 초기화 버튼 (아이콘) -->
                            <button type="button" class="btn btn-reset" title="검색 조건 초기화" onclick="resetSearch()">
                                <i class="ico-reset"></i>
                            </button>
                        </form>
                        <script>
                            function resetSearch() {
                                document.querySelector('#searchForm').reset();  // 폼 초기화
                                location.href = 'AdminController?type=movieInfoList';  // 초기화 후 기본 목록 페이지로 이동
                            }
                        </script>

                    </div>
                </div>


                <!-- 영화 정보 테이블 -->
                <table>
                    <thead>
                    <tr>
                        <th>번호</th>
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
                        <tr class="clickable-row" data-movie-idx="${vo.movieIdx}">
                            <td>${((pvo.nowPage - 1) * pvo.numPerPage + vs.index)+1 }</td>
                            <td>${vo.movieTitle}</td>

                            <td>
                                <c:if test="${vo.movieRank ne null}">
                                    ${vo.movieReservationRate }%
                                </c:if>
                            </td>
                            <td>${vo.movieTime }분</td>
                            <td>
                                <c:choose>
                                    <c:when test="${vo.movieGrade == 'ALL' }"><span class="movie-grade age-all">전체 관람가</span></c:when>
                                    <c:when test="${vo.movieGrade == '12' }"><span class="movie-grade age-12">12세 관람가</span></c:when>
                                    <c:when test="${vo.movieGrade == '15' }"><span class="movie-grade age-15">15세 관람가</span></c:when>
                                    <c:when test="${vo.movieGrade == '19' }"><span class="movie-grade age-19">청소년 관람 불가</span></c:when>
                                </c:choose>
                            </td>
                            <td>${vo.movieDate }</td>
                            <td>
                                <c:choose>
                                    <c:when test="${vo.movieRank eq null}">
                                        종료
                                    </c:when>
                                    <c:when test="${vo.movieStatus == 0 }">개봉</c:when>
                                    <c:when test="${vo.movieStatus == 1 }">개봉 예정</c:when>
                                    <c:when test="${vo.movieStatus == 2 }">종료</c:when>
                                </c:choose>
                            </td>
                        </tr>
                    </c:forEach>
                    <c:if test="${movieArray eq null or fn:length(movieArray) eq 0 }">
                        <tr>
                            <td colspan="7">현재 등록된 데이터가 없습니다.</td>
                        </tr>
                    </c:if>

                    </tbody>
                </table>



                <!--------------------- 페이지네이션 --------------------->
                <nav class="pagination">
                    <c:if test="${requestScope.page ne null}">
                        <c:set var="pvo" value="${requestScope.page}" />

                        <!-- << (맨 처음으로) -->
                        <c:if test="${pvo.startPage > 1}">
                            <a href="AdminController?type=movieInfoList&cPage=1&searchType=${param.searchType}&searchValue=${param.searchValue}&searchMonth=${param.searchMonth}&movieStatus=${param.movieStatus}&movieGrade=${param.movieGrade}"
                               class="control first" title="처음 페이지"></a>
                        </c:if>

                        <!-- < (이전 페이지 블록) -->
                        <c:if test="${pvo.startPage > 1}">
                            <a href="AdminController?type=movieInfoList&cPage=${pvo.startPage - pvo.pagePerBlock}&searchType=${param.searchType}&searchValue=${param.searchValue}&searchMonth=${param.searchMonth}&movieStatus=${param.movieStatus}&movieGrade=${param.movieGrade}"
                               class="control prev" title="이전 블록"></a>
                        </c:if>

                        <!-- 페이지 번호 -->
                        <c:forEach begin="${pvo.startPage}" end="${pvo.endPage}" varStatus="st">
                            <c:if test="${st.index eq pvo.nowPage}">
                                <strong class="active">${st.index}</strong>
                            </c:if>
                            <c:if test="${st.index ne pvo.nowPage}">
                                <a href="AdminController?type=movieInfoList&cPage=${st.index}&searchType=${param.searchType}&searchValue=${param.searchValue}&searchMonth=${param.searchMonth}&movieStatus=${param.movieStatus}&movieGrade=${param.movieGrade}"
                                   title="${st.index}페이지 보기">${st.index}</a>
                            </c:if>
                        </c:forEach>

                        <!-- > (다음 페이지 블록) -->
                        <c:if test="${pvo.endPage < pvo.totalPage}">
                            <a href="AdminController?type=movieInfoList&cPage=${pvo.startPage + pvo.pagePerBlock}&searchType=${param.searchType}&searchValue=${param.searchValue}&searchMonth=${param.searchMonth}&movieStatus=${param.movieStatus}&movieGrade=${param.movieGrade}"
                               class="control next" title="다음 블록"></a>
                        </c:if>

                        <!-- >> (맨 마지막으로) -->
                        <c:if test="${pvo.endPage < pvo.totalPage}">
                            <a href="AdminController?type=movieInfoList&cPage=${pvo.totalPage}&searchType=${param.searchType}&searchValue=${param.searchValue}&searchMonth=${param.searchMonth}&movieStatus=${param.movieStatus}&movieGrade=${param.movieGrade}"
                               class="control last" title="마지막 페이지"></a>
                        </c:if>
                    </c:if>
                </nav>
                <!--------------------- 페이지네이션 --------------------->


            </div>
        </div>
      </div>
    </div>
  </div>
</div>
<div id="movieModal" class="dialog-common" title="영화 상세 정보">
    <div class="modal-body">
        <!-- 포스터 및 기본 정보 영역 -->
        <div class="poster-section">
            <img id="moviePoster" src="" alt="영화 포스터" />
            <label for="posterInput">포스터 이미지 URL:</label>
            <input type="text" id="posterInput" name="moviePosterUrl" />
        </div>

        <!-- 상세 정보 폼 영역 -->
        <div class="form-section">
            <form id="movieForm">
                <!-- 기본 정보 (읽기 전용) -->
                <fieldset disabled>
                    <div class="field-group">
                        <label>KOFIC Code:</label>
                        <input type="text" id="movieCd" readonly />

                        <label>TMDB Id:</label>
                        <input type="text" id="movieTmdbId" readonly />
                    </div>
                    <label>제목:</label>
                    <input type="text" id="movieTitle" readonly />
                    <label>영어 제목:</label>
                    <input type="text" id="movieTitleEn" readonly />
                    <div class="field-group">
                        <label>예매 순위:</label>
                        <input type="text" id="movieRank" readonly />

                        <label>예매율:</label>
                        <input type="text" id="movieReservationRate" readonly />
                    </div>
                    <div class="field-group">
                        <label>누적 관객수:</label>
                        <input type="text" id="movieTotalAudience" readonly />

                        <label>좋아요 수:</label>
                        <input type="text" id="movieLikes" readonly />
                    </div>
                </fieldset>

                <!-- 변경 가능한 정보 -->
                <label>영화 장르:</label>
                <input type="text" name="movieGenre" />

                <label>상영 시간 (분):</label>
                <input type="number" name="movieTime" />

                <label>관람 등급:</label>
                <select name="movieGrade">
                    <option value="ALL">전체 관람가</option>
                    <option value="12">12세 이상 관람가</option>
                    <option value="15">15세 이상 관람가</option>
                    <option value="19">청소년 관람 불가</option>
                </select>

                <label>개봉일:</label>
                <input type="date" name="movieDate" />

                <label>감독:</label>
                <input type="text" name="movieDirector" />

                <label>주요 배우:</label>
                <textarea name="movieActors"></textarea>

                <label>영화 상세 설명:</label>
                <textarea name="movieInfo"></textarea>
            </form>
        </div>
    </div>
</div>



<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js"></script>
<script>
    $(document).ready(function() {
        // 영화 데이터 로드 함수
        function loadMovieData(currentMovieIdx) {
            $.ajax({
                url: "AdminController?type=getMovieInfo&movieIdx=" + currentMovieIdx,
                method: "GET",
                dataType: "json",
                headers: {
                    "X-Requested-With": "XMLHttpRequest"
                },
                success: function(data) {
                    // 기본 정보 채우기
                    $("#movieCd").val(data.movieCd);
                    $("#movieTmdbId").val(data.movieTmdbId);
                    $("#movieTitle").val(data.movieTitle);
                    $("#movieTitleEn").val(data.movieTitleEn);
                    $("#movieRank").val(data.movieRank + "위" || "N/A");
                    $("#movieReservationRate").val(data.movieReservationRate + "%");
                    $("#movieTotalAudience").val(data.movieTotalAudience.toLocaleString() + "명");
                    $("#movieLikes").val(data.movieLikes + "개");

                    // 변경 가능한 정보 채우기
                    $("[name='movieGenre']").val(data.movieGenre);
                    $("[name='movieTime']").val(data.movieTime);
                    $("[name='movieGrade']").val(data.movieGrade);
                    $("[name='movieDate']").val(data.movieDate);
                    $("[name='movieDirector']").val(data.movieDirector);
                    $("[name='movieActors']").val(data.movieActors);
                    $("[name='movieInfo']").val(data.movieInfo);
                    $("#posterInput").val(data.moviePosterUrl);
                    $("#moviePoster").attr("src", data.moviePosterUrl);
                },
                error: function() {
                    alert("영화 정보를 불러오는 데 실패했습니다.");
                }
            });
        }

        // jQuery UI 모달 초기화
        $("#movieModal").dialog({
            autoOpen: false,
            modal: true,
            width: 800,
            classes: {
                "ui-dialog": "dialog-common"
            },
            buttons: {
                "저장": function() {
                    // 폼 데이터 수집 및 인코딩
                    const formData = $("#movieForm").serialize();

                    // AJAX 요청 전송
                    $.ajax({
                        url: "AdminController?type=updateMovieInfo&movieIdx=" + currentMovieIdx,
                        type: "POST",
                        data: formData,
                        headers: {
                            "X-Requested-With": "XMLHttpRequest"
                        },
                        success: function() {
                            alert("영화 정보가 저장되었습니다.");
                            $("#movieModal").dialog("close");
                        },
                        error: function(xhr, status, error) {
                            console.error("저장 실패:", status, error);
                        }
                    });
                },
                "취소": function() {
                    $(this).dialog("close");
                }
            }
        });

        // <tr> 클릭 이벤트 설정 (ready 내부로 이동)
        $(".clickable-row").on("click", function() {
            currentMovieIdx = $(this).data("movie-idx");

            // 영화 데이터 로드 후 모달 열기
            loadMovieData(currentMovieIdx);
            $("#movieModal").dialog("open");
        });
    });

</script>
</body>
</html>