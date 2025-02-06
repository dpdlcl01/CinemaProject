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
</style>

<body>
<%--  헤더  --%>
<jsp:include page="../common/header.jsp"></jsp:include>

<div class="admin-contents">
    <div class="total-main">
        <div class="myPage-container">

        <%--  사이드바  --%>
        <jsp:include page="../common/adminSideBar.jsp"></jsp:include>

        <div id="main">
            <h1>상영 시간표 관리</h1>
            <div id="title">
                <div id="announcement" class="noticeboard">
                    <!-- 검색 및 필터링 -->
                    <div class="search-bar-container">
                        <div class="total-count">전체 ${requestScope.totalCount}건</div>
                        <div class="search-bar">
                            <select id="theaterSelect">
                                <option value="">극장 선택</option>
                                <option value="1">강남</option>
                                <option value="2">센트럴</option>
                                <option value="3">코엑스</option>
                            </select>
                            <button id="generateTimetableBtn">상영 시간표 자동 생성</button>
                        </div>
                    </div>

                    <!-- 상영 시간표 테이블 -->
                    <table>
                        <thead>
                        <tr>
                            <th>번호</th>
                            <th>극장</th>
                            <th>상영관</th>
                            <th>영화 제목</th>
                            <th>시작 시간</th>
                            <th>종료 시간</th>
                            <th>예매율</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:set var="pvo" value="${requestScope.page}"/>
                        <c:forEach var="vo" items="${timetableArray}" varStatus="vs">
                            <tr class="clickable-row" data-movie-idx="${vo.theaterIdx}">
                                <td>${((pvo.nowPage - 1) * pvo.numPerPage + vs.index)+1 }</td>
                                <td>${vo.theaterName}</td>
                                <td>${vo.screenName}</td>
                                <td>${vo.movieTitle}</td>
                                <td>${vo.timetableStartTime}</td>
                                <td>${vo.timetableEndTime}</td>
                                <td>${vo.movieReservationRate}%</td>
                            </tr>
                        </c:forEach>
                        <c:if test="${timetableArray  eq null or fn:length(timetableArray) eq 0 }">
                            <tr>
                                <td colspan="5">현재 등록된 상영 시간표가 없습니다.</td>
                            </tr>
                        </c:if>
                        </tbody>
                    </table>

                    <!--------------------- 페이지네이션 -------------------->
                    <nav class="pagination">
                        <c:if test="${requestScope.page ne null}">
                            <c:set var="pvo" value="${requestScope.page}" />

                            <!-- << (맨 처음으로) -->
                            <c:if test="${pvo.nowPage > 1}">
                                <a href="AdminController?type=timetableList&cPage=1" class="control first" title="처음 페이지"></a>
                            </c:if>

                            <!-- < (이전 페이지 블록) -->
                            <c:if test="${pvo.startPage > 1}">
                                <a href="AdminController?type=timetableList&cPage=${pvo.startPage - pvo.pagePerBlock}" class="control prev" title="이전 블록"></a>
                            </c:if>

                            <!-- 페이지 번호 -->
                            <c:forEach begin="${pvo.startPage}" end="${pvo.endPage}" varStatus="st">
                                <c:if test="${st.index eq pvo.nowPage}">
                                    <strong class="active">${st.index}</strong>
                                </c:if>
                                <c:if test="${st.index ne pvo.nowPage}">
                                    <a href="AdminController?type=timetableList&cPage=${st.index}" title="${st.index}페이지 보기">${st.index}</a>
                                </c:if>
                            </c:forEach>

                            <!-- > (다음 페이지 블록) -->
                            <c:if test="${pvo.endPage < pvo.totalPage}">
                                <a href="AdminController?type=timetableList&cPage=${pvo.endPage + 1}" class="control next" title="다음 블록"></a>
                            </c:if>

                            <!-- >> (맨 마지막으로) -->
                            <c:if test="${pvo.nowPage < pvo.totalPage}">
                                <a href="AdminController?type=timetableList&cPage=${pvo.totalPage}" class="control last" title="마지막 페이지"></a>
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

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js"></script>
<script>
    $(document).ready(function() {
        // 상영 시간표 자동 생성 버튼 클릭 이벤트
        $("#generateTimetableBtn").on("click", function() {
            if (confirm("2일치 상영 시간표를 생성하시겠습니까?")) {
                $.ajax({
                    url: "AdminController?type=generateTimetable",
                    method: "POST",
                    success: function(response) {
                        alert(response.message);
                        location.reload();  // 새로고침하여 업데이트된 데이터 확인
                    },
                    error: function() {
                        alert("상영 시간표 생성 중 오류가 발생했습니다.");
                    }
                });
            }
        });

        // 극장 선택 필터링
        $("#theaterSelect").on("change", function() {
            const selectedTheater = $(this).val();
            location.href = "AdminController?type=timetableList&theaterIdx=" + selectedTheater ;
        });
    });
</script>
</body>
</html>
