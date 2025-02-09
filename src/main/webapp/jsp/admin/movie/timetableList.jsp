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

    /* 초기화 버튼 스타일 */
    .btn-reset {
        background-color: #f5f5f5; /* 연한 회색 */
        border: 1px solid #d1d1d1; /* 테두리 회색 */
        border-radius: 4px; /* 둥근 모서리 */
        cursor: pointer;
        padding: 6px 12px;
        font-size: 14px;
        font-weight: bold;
        color: #333;
        display: flex;
        align-items: center;
        justify-content: center;
    }

    /* 초기화 버튼 스타일 */
    .btn-add {
        background-color: #f5f5f5; /* 연한 회색 */
        border: 1px solid #d1d1d1; /* 테두리 회색 */
        border-radius: 4px; /* 둥근 모서리 */
        cursor: pointer;
        padding: 6px 12px;
        font-size: 14px;
        font-weight: bold;
        color: #333;
        display: flex;
        align-items: center;
        justify-content: center;
    }

    .movie-title-cell {
        max-width: 200px;  /* 원하는 너비로 조정 */
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
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

    #scheduleModal .info-text {
        font-size: 12px;
        color: #666;
        line-height: 1.5;
        font-weight: normal; /* 글씨 굵기 문제 해결 */
        text-align: left; /* 설명 텍스트 왼쪽 정렬 */
        margin: 10px 0 0 0;
    }


    #scheduleModal .info-section {
        display: flex;
        flex-direction: column;
        gap: 20px;
        padding: 20px;
        width: 100%;
    }

    #scheduleModal .field-row {
        display: flex;
        justify-content: flex-start; /* 중앙 정렬 제거 */
        align-items: center;
        width: 100%;
        gap: 10px;
    }

    #scheduleModal .field-row label {
        width: 140px; /* 일정 너비 지정 */
        font-weight: normal; /* 굵기 설정 변경 */
        text-align: right; /* 오른쪽 정렬 */
    }

    #scheduleModal .field-row input[type="number"] {
        flex: 1;
        padding: 6px;
        border: 1px solid #ccc;
        border-radius: 4px;
        box-sizing: border-box;
    }

    #scheduleModal .update-button {
        display: inline-block;
        padding: 15px 14px;
        font-size: 14px;
        font-weight: bold;
        text-align: center;
        color: white;
        background-color: #339eb2;
        border: none;
        border-radius: 6px;
        cursor: pointer;
    }

    #scheduleModal .update-button:hover {
        background-color: #005f6b;
    }

    .loading-message {
        font-size: 12px;
        color: #01738b;
        margin-left: 10px;  /* 버튼 옆에 여백 추가 */
        white-space: nowrap;
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
            <h1>상영 시간표 목록</h1>
            <div id="title">
                <div id="announcement" class="noticeboard">
                    <!-- 검색 및 필터링 -->
                    <div class="search-bar-container">
                        <div class="total-count">전체 ${requestScope.totalCount}건</div>

                        <!-- 검색어 입력 및 필터 섹션 -->
                        <div class="search-bar">
                            <form id="searchForm" action="AdminController" method="get">
                                <input type="hidden" name="type" value="timetableList" />

                                <button type="button" id="generateTimetableBtn" class="btn-add">상영 시간표 생성</button>
                                <!-- 상영일 필터 -->
                                <label for="screeningDate">상영일:</label>
                                <input type="date" id="screeningDate" name="screeningDate" style="padding: 5px;"
                                       value="${param.screeningDate}" />

                                <!-- 극장 선택 -->
                                <%-- 중복 제거를 위한 변수를 선언 --%>
                                <c:set var="prevTheaterIdx" value="" />

                                <select id="theaterSelect" name="theaterIdx">
                                    <option value="">극장 선택</option>
                                    <%-- 극장 목록 중복 제거 --%>
                                    <c:forEach var="theater" items="${theaterList}">
                                        <c:if test="${prevTheaterIdx != theater.theaterIdx}">
                                            <option value="${theater.theaterIdx}" ${param.theaterIdx == theater.theaterIdx ? 'selected' : ''}>
                                                    ${theater.theaterName}
                                            </option>
                                            <c:set var="prevTheaterIdx" value="${theater.theaterIdx}" />
                                        </c:if>
                                    </c:forEach>
                                </select>



                                <!-- 상영관 선택 -->
                                <select id="screenSelect" name="screenIdx">
                                    <option value="">상영관 선택</option>
                                    <!-- JavaScript로 극장에 맞는 상영관 목록을 동적으로 추가 -->
                                </select>

                                <!-- 검색어 입력 필드 -->
                                <div class="search-bar2">
                                    <input type="text" name="searchValue" placeholder="영화 제목을 입력해주세요." class="input-text"
                                           value="${fn:escapeXml(param.searchValue)}" />
                                    <button type="submit" class="btn" title="검색">
                                        <i class="ico-search"></i>
                                    </button>
                                </div>

                                <!-- 초기화 버튼 -->
                                <button type="button" class="btn-reset" title="검색 조건 초기화" onclick="resetSearch()">초기화</button>
                            </form>
                        </div>
                    </div>
                </div>
                    <!-- JavaScript: 극장에 따라 상영관 목록 동적 업데이트 -->
                    <script>
                        document.addEventListener('DOMContentLoaded', function () {
                            // 극장별 상영관 데이터를 수집
                            const screensByTheater = {};

                            <%-- 극장별 상영관 데이터를 자바스크립트 객체에 넣기 --%>
                            <c:forEach var="theater" items="${theaterList}">
                            if (!screensByTheater['${theater.theaterIdx}']) {
                                screensByTheater['${theater.theaterIdx}'] = [];
                            }
                            screensByTheater['${theater.theaterIdx}'].push({
                                id: '${theater.screenIdx}',
                                name: '${theater.screenName}'
                            });
                            </c:forEach>

                            const theaterSelect = document.getElementById('theaterSelect');
                            const screenSelect = document.getElementById('screenSelect');

                            // 상영관 옵션을 업데이트하는 함수
                            function updateScreenOptions() {
                                const selectedTheater = theaterSelect.value;

                                // 기존 옵션 제거 후 기본 옵션 추가
                                screenSelect.innerHTML = '<option value="">상영관 선택</option>';

                                // 선택된 극장의 상영관 데이터가 존재하는 경우 옵션 추가
                                if (screensByTheater[selectedTheater]) {
                                    screensByTheater[selectedTheater].forEach(screen => {
                                        const option = document.createElement('option');
                                        option.value = screen.id;
                                        option.textContent = screen.name;

                                        // 검색 결과 유지: 화면에 로드될 때 기존 검색 필터 값이 있으면 선택
                                        if ('${param.screenIdx}' === screen.id) {
                                            option.selected = true;
                                        }

                                        screenSelect.appendChild(option);
                                    });
                                }
                            }

                            // 페이지 로드 시 옵션 초기화
                            updateScreenOptions();

                            // 극장 선택 변경 시 상영관 옵션 업데이트
                            theaterSelect.addEventListener('change', updateScreenOptions);

                            // 초기화 버튼 클릭 시 폼 리셋
                            function resetSearch() {
                                document.querySelector('#searchForm').reset();
                                location.href = 'AdminController?type=timetableList';  // 초기화 후 기본 페이지로 이동
                            }

                            document.querySelector('.btn-reset').addEventListener('click', resetSearch);
                        });

                    </script>

                <!-- 상영 시간표 테이블 -->
                <table>
                    <thead>
                    <tr>
                        <th>번호</th>
                        <th>극장</th>
                        <th>상영관</th>
                        <th>영화 제목</th>
                        <th>상영일</th>
                        <th>시작 시간</th>
                        <th>종료 시간</th>
                        <th>잔여 좌석 / 총 좌석</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:set var="pvo" value="${requestScope.page}" />
                    <c:forEach var="vo" items="${timetableArray}" varStatus="vs">
                        <tr class="clickable-row" data-movie-idx="${vo.movieIdx}">
                            <td>${((pvo.nowPage - 1) * pvo.numPerPage + vs.index) + 1}</td>
                            <td>${vo.theaterName}</td>
                            <td>${vo.screenName}</td>
                            <td class="movie-title-cell" title="${vo.movieTitle}">
                                <c:choose>
                                    <c:when test="${fn:length(vo.movieTitle) > 20}">
                                        ${fn:substring(vo.movieTitle, 0, 20)}...
                                    </c:when>
                                    <c:otherwise>
                                        ${vo.movieTitle}
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td>${vo.timetableStartTime.substring(0, 10)}</td> <!-- 상영일 -->
                            <td>${vo.timetableStartTime.substring(11)}</td>    <!-- 시작 시간 -->
                            <td>${vo.timetableEndTime.substring(11)}</td>      <!-- 종료 시간 -->


                            <td>${vo.availableSeats} / ${vo.screenSeatCount}</td>
                        </tr>
                    </c:forEach>
                    <c:if test="${timetableArray eq null or fn:length(timetableArray) eq 0}">
                        <tr>
                            <td colspan="8">현재 등록된 상영 시간표가 없습니다.</td>
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
                            <a href="AdminController?type=timetableList&cPage=1&screeningDate=${param.screeningDate}&theaterIdx=${param.theaterIdx}&screenIdx=${param.screenIdx}&searchValue=${param.searchValue}"
                               class="control first" title="처음 페이지"></a>
                        </c:if>

                        <!-- < (이전 페이지 블록) -->
                        <c:if test="${pvo.startPage > 1}">
                            <a href="AdminController?type=timetableList&cPage=${pvo.startPage - pvo.pagePerBlock}&screeningDate=${param.screeningDate}&theaterIdx=${param.theaterIdx}&screenIdx=${param.screenIdx}&searchValue=${param.searchValue}"
                               class="control prev" title="이전 블록"></a>
                        </c:if>

                        <!-- 페이지 번호 -->
                        <c:forEach begin="${pvo.startPage}" end="${pvo.endPage}" varStatus="st">
                            <c:if test="${st.index eq pvo.nowPage}">
                                <strong class="active">${st.index}</strong>
                            </c:if>
                            <c:if test="${st.index ne pvo.nowPage}">
                                <a href="AdminController?type=timetableList&cPage=${st.index}&screeningDate=${param.screeningDate}&theaterIdx=${param.theaterIdx}&screenIdx=${param.screenIdx}&searchValue=${param.searchValue}"
                                   title="${st.index}페이지 보기">${st.index}</a>
                            </c:if>
                        </c:forEach>

                        <!-- > (다음 페이지 블록) -->
                        <c:if test="${pvo.endPage < pvo.totalPage}">
                            <a href="AdminController?type=timetableList&cPage=${pvo.startPage + pvo.pagePerBlock}&screeningDate=${param.screeningDate}&theaterIdx=${param.theaterIdx}&screenIdx=${param.screenIdx}&searchValue=${param.searchValue}"
                               class="control next" title="다음 블록"></a>
                        </c:if>

                        <!-- >> (맨 마지막으로) -->
                        <c:if test="${pvo.endPage < pvo.totalPage}">
                            <a href="AdminController?type=timetableList&cPage=${pvo.totalPage}&screeningDate=${param.screeningDate}&theaterIdx=${param.theaterIdx}&screenIdx=${param.screenIdx}&searchValue=${param.searchValue}"
                               class="control last" title="마지막 페이지"></a>
                        </c:if>
                    </c:if>
                </nav>
                <!--------------------- 페이지네이션 --------------------->

                <!-- 상영 시간표 생성 모달 -->
                <div id="scheduleModal" title="상영 시간표 생성">
                    <form id="scheduleForm">
                        <div class="info-section">
                            <!-- 영화 예매율 업데이트 버튼 및 메시지 -->
                            <div class="field-row">
                                <button type="button" id="updateBookingRateBtn" class="update-button">
                                    영화 업데이트
                                </button>
                                <span id="loadingMessage" class="loading-message" style="display: none;"></span>
                            </div>


                            <!-- 상영 시간표 생성 정보 -->
                            <div class="field-row">
                                <label for="scheduleDays">몇 일 후:</label>
                                <input type="number" id="scheduleDays" name="scheduleDays" min="1" value="7" />
                            </div>

                            <div class="field-row">
                                <label for="schedulePeriod">생성 일수:</label>
                                <input type="number" id="schedulePeriod" name="schedulePeriod" min="1" max="7" value="2" />
                            </div>

                            <!-- 규칙 설명 -->
                            <p class="info-text">
                                * 상영 시간표는 현재 예매율 순위에 따라 자동 생성됩니다.<br>
                                * 상영 시간대는 9:00, 11:30, 14:00, 16:30, 19:00, 21:30으로 고정됩니다.<br>
                                * 하루에 최대 90개의 영화가 상영됩니다.
                            </p>
                        </div>
                    </form>
                </div>

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
        // 모달 초기화
        $("#scheduleModal").dialog({
            autoOpen: false,
            modal: true,
            width: 500,
            classes: {
                "ui-dialog": "dialog-common"
            },
            buttons: {
                "생성": function() {
                    const scheduleDays = $("#scheduleDays").val();
                    const schedulePeriod = $("#schedulePeriod").val();

                    // 상영 시간표 생성 Ajax 요청
                    $.ajax({
                        url: "AdminController?type=generateTimetable",
                        type: "POST",
                        dataType: "json",
                        data: {
                            scheduleDays: scheduleDays,
                            schedulePeriod: schedulePeriod
                        },
                        success: function(response) {
                            if (response.success) {
                                alert("상영 시간표가 성공적으로 생성되었습니다.");
                                $("#scheduleModal").dialog("close");
                                location.reload();  // 새로고침하여 업데이트된 데이터 확인
                            } else {
                                alert("상영 시간표 생성 중 오류가 발생했습니다: " + response.message);
                            }
                        },
                        error: function() {
                            alert("상영 시간표 생성 요청에 실패했습니다.");
                        }
                    });
                },
                "취소": function() {
                    $(this).dialog("close");
                }
            }
        });

        $("#generateTimetableBtn").on("click", function(event) {
            event.preventDefault();  // 기본 동작 방지
            $("#scheduleModal").dialog("open");
        });


        let updateInterval;

        // 영화 예매율 업데이트 버튼 이벤트
        $("#updateBookingRateBtn").on("click", function(event) {
            event.preventDefault();  // 기본 동작 방지

            // 로딩 메시지 표시 및 상태 업데이트 시작
            showLoadingMessage("영화 예매율을 업데이트 중입니다...");
            startStatusPolling();

            // 영화 예매율 업데이트 Ajax 요청
            $.ajax({
                url: "AdminController?type=dbUpdate",
                type: "POST",
                dataType: "json",
                success: function(response) {
                    if (response.success) {
                        // 성공 메시지는 마지막 상태 메시지에서 처리하므로 별도로 alert 호출하지 않음
                    } else {
                        showErrorMessage("업데이트 중 오류가 발생했습니다: " + response.message);
                    }
                    hideLoadingMessage();
                },
                error: function() {
                    stopStatusPolling();
                    hideLoadingMessage();
                    showErrorMessage("영화 예매율 업데이트 요청에 실패했습니다.");
                }
            });
        });

        // 상태 메시지 주기적 요청 (Polling)
        function startStatusPolling() {
            updateInterval = setInterval(fetchUpdateStatus, 2000);  // 2초마다 상태 확인
        }

        function stopStatusPolling() {
            clearInterval(updateInterval);
        }

        function fetchUpdateStatus() {
            $.ajax({
                url: "AdminController?type=updateStatus",
                type: "GET",
                dataType: "json",
                success: function(response) {
                    if (response.statusMessage) {
                        $("#loadingMessage").text(response.statusMessage);  // 서버에서 받은 상태 메시지 표시

                        // 상태 메시지가 '업데이트가 완료되었습니다.'인 경우 폴링 중단
                        if (response.statusMessage === "영화 데이터 업데이트가 완료되었습니다.") {
                            stopStatusPolling();  // 폴링 중단
                            $("#loadingMessage").text(response.statusMessage);  // 메시지 그대로 유지
                        }
                    }
                },
                error: function() {
                    console.warn("상태 업데이트 중 오류 발생");
                }
            });
        }

        // 로딩 메시지 표시 함수
        function showLoadingMessage(message) {
            $("#loadingMessage").text(message).show();
        }

        // 로딩 메시지 숨김 함수
        function hideLoadingMessage() {
            $("#loadingMessage").hide();
        }

        // 성공 메시지 표시 함수
        function showSuccessMessage(message) {
            alert(message);
        }

        // 오류 메시지 표시 함수
        function showErrorMessage(message) {
            alert(message);
        }

        // 극장 선택 필터링 이벤트
        $("#theaterSelect").on("change", function() {
            const selectedTheater = $(this).val();
            location.href = "AdminController?type=timetableList&theaterIdx=" + selectedTheater;
        });
    });

</script>
</body>
</html>
