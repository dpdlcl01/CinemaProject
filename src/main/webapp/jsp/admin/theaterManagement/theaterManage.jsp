<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!Doctype html>
<html lang="ko">
<head>
    <%--  <jsp:include page="../../user/common/head.jsp"/>--%>

</head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/common.css">
<!-- jQuery UI 기본 테마 CSS 추가 -->
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


    .noticeboard {
        margin-top: 20px;
    }

    .noticeboard.active {
        display: block;
    }

    /* form 내의 요소들을 나란히 배치 */
    #searchForm {
        display: flex;
        align-items: center;
        gap: 10px; /* 간격 설정 */
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

    .search-bar label {
        display: flex;
        align-items: center;
        gap: 5px; /* 텍스트와 입력 필드 사이 간격 */
        font-size: 14px;
        white-space: nowrap; /* 텍스트 줄바꿈 방지 */
    }

    .search-bar2 {
        flex: 1;               /* 부모 컨테이너의 남은 공간을 차지 */
        max-width: 400px;      /* 최대 너비 */
        min-width: 200px;      /* 최소 너비 */
        height: 30px;
        position: relative;
        display: flex;
        border-bottom: 1px solid #423e3e;
    }

    .search-bar2 .input-text {
        width: 100%;           /* 부모의 너비에 맞게 확장 */
        height: 25px;
        background-color: transparent;
        border: 0;
        color: #000;
        line-height: 25px;
        font-size: 16px;
        outline: none;
        padding: 0 35px 0 5px; /* 버튼과 충돌 방지 */
        box-sizing: border-box;
    }
    /* 🔄 수정: 날짜 입력, 셀렉트 박스, 검색 필드 높이 동일하게 설정 */
    .search-bar input[type="date"],
    .search-bar select {
        height: 30px;   /* 🔄 높이를 40px로 통일 */
        padding: 6px;
        font-size: 14px;
        border: 1px solid #ccc;
        border-radius: 4px;
        vertical-align: middle; /* 🔹 추가: 요소 수직 정렬 */
    }

    .search-bar2 .input-text:active {
        border: 0;
        outline: none;
    }

    .search-bar2 .btn {
        width: 30px;
        height: 30px;
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

    .poster-section img {
        width: 100%;
        max-width: 200px;
        height: auto;
        border: 1px solid #ccc;
        border-radius: 8px;
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

    /*  모달  */
    #theaterModal .modal-body,
    #theaterAddModal .modal-body {
        display: flex;
        justify-content: center;
        align-items: flex-start;
        flex-direction: column;
        padding: 20px;
    }

    #theaterModal .info-section,
    #theaterAddModal .info-section {
        width: 100%;
        max-width: 450px;
        margin: 0 auto;
        display: flex;
        flex-direction: column;
        gap: 15px;
    }

    #theaterModal .field-row,
    #theaterAddModal .field-row {
        display: flex;
        justify-content: flex-start;
        align-items: center;
        gap: 10px;
    }


    #theaterModal .field-row label,
    #theaterAddModal .field-row label {
        width: 140px;
        font-weight: bold;
        text-align: right;
    }

    /* 수정 가능한 필드 */
    #theaterModal input:not([readonly]),
    #theaterModal select,
    #theaterAddModal input:not([readonly]),
    #theaterAddModal select {
        background-color: white;
    }

    /* 읽기 전용 필드 */
    #theaterModal input[readonly],
    #theaterAddModal input[readonly] {
        background-color: #f4f4f4;
        color: #888;
    }

    #theaterModal .field-row,
    #theaterAddModal .field-row {
        display: flex;
        justify-content: flex-start;
        align-items: center;
        gap: 10px;
    }

    #theaterModal .field-row label,
    #theaterAddModal .field-row label {
        width: 140px;
        font-weight: bold;
        text-align: right;
    }

    #theaterModal .field-row input[type="text"],
    #theaterModal .field-row input[type="email"],
    #theaterModal .field-row select,
    #theaterAddModal .field-row input[type="text"],
    #theaterAddModal .field-row input[type="email"],
    #theaterAddModal .field-row select {
        flex: 1;
        padding: 6px;
        border: 1px solid #ccc;
        border-radius: 4px;
        box-sizing: border-box;
    }

    #theaterModal button,
    #theaterAddModal button {
        margin-top: 20px;
        padding: 8px 12px;
        font-size: 14px;
        border: none;
        border-radius: 4px;
        background-color: #01738b;
        color: white;
        cursor: pointer;
    }

    #theaterModal button:hover,
    #theaterAddModal button:hover {
        background-color: #005f6b;
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
                <h1>극장 / 상영관 관리</h1>
                <div id="title">
                    <!-- 검색 폼 -->
                    <div id="announcement" class="noticeboard">
                        <div class="search-bar-container">
                            <div class="total-count">전체 ${requestScope.totalCount}건</div>
                            <div class="search-bar">
                                <!-- 검색 유형 선택 -->
                                <form id="searchForm" action="AdminController" method="get">
                                    <input type="hidden" name="type" value="searchTheater"/>
                                    <select id="searchType" name="searchType">
                                        <option value="" ${empty searchType ? 'selected' : ''}>검색 유형 선택</option>
                                        <option value="region" ${searchType == 'region' ? 'selected' : ''}>지역</option>
                                        <option value="theater" ${searchType == 'theater' ? 'selected' : ''}>상영관</option>
                                        <option value="screen" ${searchType == 'screen' ? 'selected' : ''}>스크린 이름</option>
                                        <option value="screenType" ${searchType == 'screenType' ? 'selected' : ''}>상영관 유형</option>
                                    </select>
                                    <div class="search-bar2">
                                        <input type="text" id="searchKeyword" name="searchKeyword" placeholder="검색어 입력" value="${searchKeyword}" class="input-text">

                                        <button class="btn" title="검색" onclick="searchLogs()">
                                            <i class="ico-search"></i> 검색
                                        </button>
                                    </div>
                                </form>
                                <button type="button" class="btn-reset" title="검색 조건 초기화" onclick="resetSearch()">초기화</button>
                            </div>
                        </div>


                        <table>
                            <thead>
                            <tr>
                                <th style="width: 7%;">지역</th>
                                <th style="width: 7%;">상영관</th>
                                <th style="width: 13%;">스크린 이름</th>
                                <th style="width: 8%;">상영관 유형</th>
                                <th style="width: 10%;">날짜</th>
                                <th style="width: 10%;">시작 시간</th>
                                <th style="width: 10%;">종료시간</th>
                                <th style="width: 11%;">잔여 좌석 / 총좌석</th>
                            </tr>
                            </thead>

                            <tbody>
                            <c:choose>
                                <c:when test="${empty theaterList}">
                                    <tr>
                                        <td colspan="8">상영관 데이터가 없습니다.</td>
                                    </tr>
                                </c:when>
                                <c:otherwise>
                                    <c:forEach var="theater" items="${theaterList}">
                                        <tr class="clickable-row"
                                            data-id="${theater.theaterIdx}"
                                            data-theatername="${theater.theaterName}"
                                            data-theaterregion="${theater.theaterRegion}"
                                            data-theaterstatus="${theater.theaterStatus}"
                                            data-screenstatus="${theater.screenStatus}">
                                            <td>${theater.theaterRegion}</td>
                                            <td>${theater.theaterName}</td>
                                            <td>${theater.screenName}</td>
                                            <td>${theater.screenType}</td>
                                            <td>${theater.date}</td>
                                            <td>${theater.startTime}</td>
                                            <td>${theater.endTime}</td>
                                            <td>${theater.remainingSeats}/${theater.totalSeats}</td>
                                        </tr>
                                    </c:forEach>
                                </c:otherwise>
                            </c:choose>
                            </tbody>
                        </table>

                        <!--------------------- 페이지네이션 --------------------->
                        <nav class="pagination">
                            <c:if test="${requestScope.page ne null}">
                                <c:set var="pvo" value="${requestScope.page}" />

                                <!-- 첫 페이지로 이동 버튼 -->
                                <c:if test="${pvo.startPage > 1}">
                                    <a href="AdminController?type=theaterManage&cPage=1" class="control first" title="처음 페이지"></a>
                                </c:if>

                                <!-- 이전 페이지 블록으로 이동 버튼 -->
                                <c:if test="${pvo.startPage > 1}">
                                    <a href="AdminController?type=theaterManage&cPage=${pvo.startPage - pvo.pagePerBlock}" class="control prev" title="이전 블록"></a>
                                </c:if>

                                <!-- 페이지 번호 목록 -->
                                <c:forEach begin="${pvo.startPage}" end="${pvo.endPage}" varStatus="st">
                                    <c:if test="${st.index eq pvo.nowPage}">
                                        <strong class="active">${st.index}</strong>
                                    </c:if>
                                    <c:if test="${st.index ne pvo.nowPage}">
                                        <a href="AdminController?type=theaterManage&cPage=${st.index}" title="${st.index}페이지 보기">${st.index}</a>
                                    </c:if>
                                </c:forEach>

                                <!-- 다음 페이지 블록으로 이동 버튼 -->
                                <c:if test="${pvo.endPage < pvo.totalPage}">
                                    <a href="AdminController?type=theaterManage&cPage=${pvo.startPage + pvo.pagePerBlock}" class="control next" title="다음 블록"></a>
                                </c:if>

                                <!-- 마지막 페이지로 이동 버튼 -->
                                <c:if test="${pvo.endPage < pvo.totalPage}">
                                    <a href="AdminController?type=theaterManage&cPage=${pvo.totalPage}" class="control last" title="마지막 페이지"></a>
                                </c:if>
                            </c:if>
                        </nav>
                        <!--------------------- 페이지네이션 --------------------->
                        <!-- 수정 모달 -->
                        <div id="theaterModal" class="dialog-common" title="극장 / 상영관 상세 정보" style="display: none;">
                            <form id="updateAdminForm">
                                <div class="modal-body">
                                    <div class="info-section">

                                        <!-- 지역 -->
                                        <div class="field-row">
                                            <label>지역:</label>
                                            <input type="text" id="theaterRegion" name="theaterRegion" />
                                        </div>

                                        <!-- 극장 고유 ID -->
                                        <div class="field-row">
                                            <label>극장 고유 ID:</label>
                                            <input type="text" id="theaterIdx" name="theaterIdx" />
                                        </div>

                                        <!-- 극장명 -->
                                        <div class="field-row">
                                            <label>상영관:</label>
                                            <input type="text" id="theaterName" name="theaterName" />
                                        </div>

                                        <!-- 극장 상태 (0: 운영 중, 1: 점검, 2: 폐쇄) -->
                                        <div class="field-row">
                                            <label>극장 상태:</label>
                                            <select id="theaterStatus" name="theaterStatus">
                                                <option value="0">운영 중</option>
                                                <option value="1">점검</option>
                                                <option value="2">폐쇄</option>
                                            </select>
                                        </div>

                                        <!-- 상영관 상태 (0: 운영 중, 1: 점검, 2: 폐쇄) -->
                                        <div class="field-row">
                                            <label>상영관 상태:</label>
                                            <select id="screenStatus" name="screenStatus">
                                                <option value="0">운영 중</option>
                                                <option value="1">점검</option>
                                                <option value="2">폐쇄</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>

<%--                        <!-- 추가 모달 -->--%>
<%--                        <div id="theaterModal" class="dialog-common" title="극장 / 상영관 상세 정보" style="display: none;">--%>
<%--                            <form id="addAdminForm">--%>
<%--                                <div class="modal-body">--%>
<%--                                    <div class="info-section">--%>
<%--                                        <!-- 관리자 고유 ID (자동 지정) -->--%>
<%--                                        <div class="field-row">--%>
<%--                                            <label>관리자 고유 ID:</label>--%>
<%--                                            <input type="text" id="adminIdx1" name="adminIdx" readonly value="자동으로 지정됩니다."/>--%>
<%--                                        </div>--%>

<%--                                        <!-- 로그인 ID -->--%>
<%--                                        <div class="field-row">--%>
<%--                                            <label>로그인 ID:</label>--%>
<%--                                            <input type="text" id="adminId1" name="adminId" />--%>
<%--                                        </div>--%>

<%--                                        <!-- 패스워드 PW -->--%>
<%--                                        <div class="field-row">--%>
<%--                                            <label>패스워드 PW:</label>--%>
<%--                                            <input type="text" id="adminPW1" name="adminPassword" />--%>
<%--                                        </div>--%>

<%--                                        <!-- 관리자 등급 (수정 가능) -->--%>
<%--                                        <div class="field-row">--%>
<%--                                            <label>관리자 등급:</label>--%>
<%--                                            <select id="adminLevel1" name="adminLevel">--%>
<%--                                                <option value="SUPER">SUPER</option>--%>
<%--                                                <option value="MANAGER">MANAGER</option>--%>
<%--                                            </select>--%>
<%--                                        </div>--%>

<%--                                        <!-- 관리자 상태 (기본값 1) -->--%>
<%--                                        <div class="field-row">--%>
<%--                                            <label>관리자 상태:</label>--%>
<%--                                            <input type="text" id="adminStatus1" name="adminStatus" readonly value="0"/>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </form>--%>
<%--                        </div>--%>

                        <!-- jQuery 및 jQuery UI 추가 -->
                        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
                        <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js"></script>

                        <script>
                            $(document).ready(function() {
                                let selectedTheaterIdx = null; // 전역 변수로 설정

                                // 테이블 행 클릭 시 극장 정보 수정 모달 열기
                                $(".clickable-row").on("click", function() {
                                    // data 속성 값 읽기
                                    let theaterIdx = $(this).data("id");
                                    let theaterName = $(this).data("theatername");
                                    let theaterRegion = $(this).data("theaterregion");
                                    let theaterStatus = $(this).data("theaterstatus");
                                    let screenStatus = $(this).data("screenstatus");

                                    // 전역 변수에 저장
                                    selectedTheaterIdx = theaterIdx;

                                    // 모달 필드에 값 채우기
                                    $("#theaterIdx").val(theaterIdx);
                                    $("#theaterName").val(theaterName);
                                    $("#theaterRegion").val(theaterRegion);
                                    $("#theaterStatus").val(theaterStatus);
                                    $("#screenStatus").val(screenStatus);

                                    // 모달 열기
                                    $("#theaterModal").dialog("open");
                                });

                                // jQuery UI 모달 초기화 (극장 수정 모달)
                                $("#theaterModal").dialog({
                                    autoOpen: false,
                                    modal: true,
                                    resizable: false,
                                    draggable: false,
                                    width: 600,
                                    classes: {
                                        "ui-dialog": "dialog-common"
                                    },
                                    buttons: {
                                        "저장": function() {
                                            // 수정 폼 데이터 직렬화 및 AJAX 요청 전송
                                            let formData = $("#updateTheaterForm").serialize();
                                            // 업데이트 요청 시 type 파라미터를 updateTheater로 전달
                                            $.ajax({
                                                url: "AdminController",
                                                type: "POST",
                                                data: formData + "&type=updateTheater",
                                                dataType: "json",
                                                headers: {
                                                    "X-Requested-With": "XMLHttpRequest"
                                                },
                                                success: function(response) {
                                                    if (response.error) {
                                                        alert("업데이트 실패: " + response.error);
                                                        return;
                                                    }
                                                    alert("극장 정보가 업데이트되었습니다.");
                                                    $("#theaterModal").dialog("close");
                                                    location.reload();
                                                },
                                                error: function(xhr, status, error) {
                                                    console.error("AJAX 오류 발생:", error);
                                                    alert("업데이트에 실패했습니다.");
                                                }
                                            });
                                        },
                                        "취소": function() {
                                            $(this).dialog("close");
                                        }
                                    }
                                });
                            });

                                //     // 사용자 데이터 로드 함수
                                // function loadUserData(adminIdx) {
                                //     selectedAdminIdx = adminIdx;
                                //
                                //     $.ajax({
                                //         url: "AdminController",
                                //         method: "GET",
                                //         data: {
                                //             type: "getAdmin",
                                //             adminIdx: adminIdx
                                //         },
                                //         dataType: "json",
                                //         headers: {
                                //             "X-Requested-With": "XMLHttpRequest"
                                //         },
                                //         success: function(response) {
                                //             if (response.error) {
                                //                 alert("오류 발생: " + response.error);
                                //                 return;
                                //             }
                                //
                                //             // 기본 정보 채우기
                                //             $("#adminIdx").val(response.adminIdx);
                                //             $("#adminId").val(response.adminId);
                                //             $("#adminLevel").val(response.adminLevel);
                                //             $("#adminStatus").val(response.adminStatus);
                                //
                                //             // 변경 가능한 정보 채우기
                                //             $("[name='adminId']").val(response.adminId);
                                //             $("[name='adminLevel']").val(response.adminLevel);
                                //             $("[name='adminStatus']").val(response.adminStatus);
                                //
                                //             // 모달 창 열기
                                //             $("#adminModal").dialog("open");
                                //         },
                                //         error: function(xhr, status, error) {
                                //             console.error("AJAX 오류:", xhr.responseText);
                                //             alert("사용자 정보를 불러오는 데 실패했습니다.");
                                //         }
                                //     });
                                // }

                                // // jQuery UI 모달 초기화
                                // $("#adminModal").dialog({
                                //     autoOpen: false,
                                //     modal: true,
                                //     width: 600,
                                //     classes: {
                                //         "ui-dialog": "dialog-common"
                                //     },
                                //     buttons: {
                                //         "저장": function() {
                                //
                                //             // 폼을 배열로 만들어서 String으로 변환
                                //             let formDataArray = $("#updateAdminForm").serializeArray();
                                //             formDataArray.push({ name: "type", value: "updateAdmin" });
                                //             formDataArray.push({ name: "adminIdx", value: selectedTheaterIdx });
                                //
                                //             // .param 사용하여 배열을 String으로
                                //             let formDataString = $.param(formDataArray);
                                //
                                //             $.ajax({
                                //                 url: "AdminController",
                                //                 type: "POST",
                                //                 data: formDataString,
                                //                 dataType: "json",
                                //                 headers: {
                                //                     "X-Requested-With": "XMLHttpRequest"
                                //                 },
                                //                 success: function(response) {
                                //                     if (response.error) {
                                //                         alert("업데이트 실패: " + response.error);
                                //                         return;
                                //                     }
                                //
                                //                     alert("사용자 정보가 업데이트되었습니다.");
                                //                     $("#adminModal").dialog("close");
                                //                     location.reload();  // 페이지 새로고침
                                //                 },
                                //                 error: function(xhr, status, error) {
                                //                     console.error("AJAX 오류 발생:", error);
                                //                     alert("업데이트에 실패했습니다.");
                                //                 }
                                //             });
                                //         },
                                //         "취소": function() {
                                //             $(this).dialog("close");
                                //         }
                                //     }
                                // });
                                //
                                // // jQuery UI 모달 초기화
                                // $("#adminAddModal").dialog({
                                //     autoOpen: false,
                                //     modal: true,
                                //     width: 600,
                                //     classes: {
                                //         "ui-dialog": "dialog-common"
                                //     },
                                //     buttons: {
                                //         "저장": function() {
                                //
                                //             // 폼을 배열로 만들어서 String으로 변환
                                //             let formDataArray = $("#addAdminForm").serializeArray();
                                //             formDataArray.push({ name: "type", value: "addAdmin" });
                                //             formDataArray.push({ name: "adminIdx", value: selectedAdminIdx });
                                //
                                //             // .param 사용하여 배열을 String으로
                                //             let formDataString = $.param(formDataArray);
                                //
                                //             $.ajax({
                                //                 url: "AdminController",
                                //                 type: "POST",
                                //                 data: formDataString,
                                //                 dataType: "json",
                                //                 headers: {
                                //                     "X-Requested-With": "XMLHttpRequest"
                                //                 },
                                //                 success: function(response) {
                                //                     if (response.error) {
                                //                         alert("관리자 추가 실패: " + response.error);
                                //                         return;
                                //                     }
                                //
                                //                     alert("사용자 정보가 추가되었습니다.");
                                //                     $("#adminAddModal").dialog("close");
                                //                     location.reload();  // 페이지 새로고침
                                //                 },
                                //                 error: function(xhr, status, error) {
                                //                     console.error("AJAX 오류 발생:", error);
                                //                     alert("관리자 추가에 실패했습니다.");
                                //                 }
                                //             });
                                //         },
                                //         "취소": function() {
                                //             $(this).dialog("close");
                                //         }
                                //     }
                                // });
                                //
                                // // 사용자 목록 <tr> 클릭 이벤트 설정
                                // $(".clickable-row").on("click", function() {
                                //     const adminIdx = $(this).data("id");
                                //
                                //     // 사용자 데이터 로드 후 모달 열기
                                //     loadUserData(adminIdx);
                                // });
                                //
                                // $(".addAdmin").on("click", function() {
                                //     // 모달 창 열기
                                //     $("#adminAddModal").dialog("open");
                                // })

                        </script>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    // function searchTheater() {
    //     let keyword = document.getElementById("searchKeyword").value.trim();
    //     let searchType = document.getElementById("searchType").value;

    //     let queryParams = new URLSearchParams();
    //     // type을 "theaterManage"로 설정하여 극장 검색 Action이 호출되도록 함
    //     queryParams.append("type", "theaterManage");
    //     if (searchType && keyword) {
    //         queryParams.append("searchType", searchType);
    //         queryParams.append("searchKeyword", keyword);
    //     }
    //     // 필요한 경우 다른 파라미터(예: cPage, startDate, endDate 등)도 추가할 수 있음
    //     let baseUrl = window.location.origin + "/AdminController";
    //     let queryString = queryParams.toString();
    //     window.location.href = baseUrl + "?" + queryString;
    // }

    function resetSearch() {
        let baseUrl = window.location.origin + "/AdminController?type=theaterManage";
        window.location.href = baseUrl;
    }

</script>

</body>
</html>