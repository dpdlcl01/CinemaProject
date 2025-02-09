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
        <h1>비회원 목록</h1>
        <div id="title">
            <div id="announcement" class="noticeboard">
                <div class="search-bar-container">
                    <div class="total-count">전체 ${requestScope.totalCount}건</div>

                    <div class="search-bar">
                        <form id="searchForm" action="AdminController" method="get">
                            <input type="hidden" name="type" value="guestList" />

                            <!-- 가입 기간 검색 -->
                            <label for="userJoinMonth">등록월:</label>
                            <input type="month" id="userJoinMonth" name="userJoinMonth" style="padding: 5px;" value="${param.userJoinMonth}" />

                            <!-- 검색 대상 선택 -->
                            <select id="searchType" name="searchType">
                                <option value="all" ${param.searchType == 'all' ? 'selected' : ''}>검색 대상 (전체)</option>
                                <option value="name" ${param.searchType == 'name' ? 'selected' : ''}>이름</option>
                                <option value="email" ${param.searchType == 'email' ? 'selected' : ''}>이메일</option>
                            </select>

                            <!-- 검색어 입력 필드 -->
                            <div class="search-bar2">
                                <input type="text" name="searchKeyword" placeholder="검색어를 입력해주세요." class="input-text"
                                       value="${fn:escapeXml(param.searchKeyword)}" />
                                <button type="submit" class="btn" title="검색">
                                    <i class="ico-search"></i> 검색
                                </button>
                            </div>

                            <!-- 초기화 버튼 (아이콘) -->
                            <button type="button" class="btn btn-reset" title="검색 조건 초기화" onclick="resetUserSearch()">
                                <i class="ico-reset"></i>
                            </button>
                        </form>
                        <script>
                            function resetUserSearch() {
                                document.querySelector('#searchForm').reset();  // 폼 초기화
                                location.href = 'AdminController?type=guestList';  // 초기화 후 기본 목록 페이지로 이동
                            }
                        </script>
                    </div>
                </div>
                <table>
                    <thead>
                    <tr>
                        <th>번호</th>
                        <th>이름</th>
                        <th>이메일</th>
                        <th>등록일</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:set var="pvo" value="${requestScope.page}"/>
                    <c:forEach var="uvo" items="${userArray }" varStatus="status">
                        <tr class="clickable-row" data-id="${uvo.userIdx}">
                            <td>${(pvo.nowPage - 1) * pvo.numPerPage + status.index + 1}</td>
                            <td>${uvo.userName}</td>
                            <td>${uvo.userEmail}</td>
                            <td>${uvo.userRegDate}</td>
                        </tr>
                    </c:forEach>

                    <c:if test="${userArray eq null or fn:length(userArray) eq 0 }">
                        <tr><td colspan="4">사용자가 없습니다.</td></tr>
                    </c:if>
                    </tbody>
                </table>

                <!--------------------- 페이지네이션 --------------------->
                <nav class="pagination">
                    <c:if test="${requestScope.page ne null}">
                        <c:set var="pvo" value="${requestScope.page}" />

                        <!-- 첫 페이지로 이동 버튼 -->
                        <c:if test="${pvo.startPage > 1}">
                            <a href="AdminController?type=guestList&cPage=1&searchType=${param.searchType}&searchKeyword=${param.searchKeyword}&userJoinMonth=${param.userJoinMonth}"
                               class="control first" title="처음 페이지"></a>
                        </c:if>

                        <!-- 이전 페이지 블록으로 이동 버튼 -->
                        <c:if test="${pvo.startPage > 1}">
                            <a href="AdminController?type=guestList&cPage=${pvo.startPage - pvo.pagePerBlock}&searchType=${param.searchType}&searchKeyword=${param.searchKeyword}&userJoinMonth=${param.userJoinMonth}"
                               class="control prev" title="이전 블록"></a>
                        </c:if>

                        <!-- 페이지 번호 목록 -->
                        <c:forEach begin="${pvo.startPage}" end="${pvo.endPage}" varStatus="st">
                            <c:if test="${st.index eq pvo.nowPage}">
                                <strong class="active">${st.index}</strong>
                            </c:if>
                            <c:if test="${st.index ne pvo.nowPage}">
                                <a href="AdminController?type=guestList&cPage=${st.index}&searchType=${param.searchType}&searchKeyword=${param.searchKeyword}&userJoinMonth=${param.userJoinMonth}"
                                   title="${st.index}페이지 보기">${st.index}</a>
                            </c:if>
                        </c:forEach>

                        <!-- 다음 페이지 블록으로 이동 버튼 -->
                        <c:if test="${pvo.endPage < pvo.totalPage}">
                            <a href="AdminController?type=guestList&cPage=${pvo.startPage + pvo.pagePerBlock}&searchType=${param.searchType}&searchKeyword=${param.searchKeyword}&userJoinMonth=${param.userJoinMonth}"
                               class="control next" title="다음 블록"></a>
                        </c:if>

                        <!-- 마지막 페이지로 이동 버튼 -->
                        <c:if test="${pvo.endPage < pvo.totalPage}">
                            <a href="AdminController?type=guestList&cPage=${pvo.totalPage}&searchType=${param.searchType}&searchKeyword=${param.searchKeyword}&userJoinMonth=${param.userJoinMonth}"
                               class="control last" title="마지막 페이지"></a>
                        </c:if>
                    </c:if>
                </nav>
                <!--------------------- 페이지네이션 --------------------->

            </div>

            <!-- jQuery 및 jQuery UI 추가 -->
            <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        </div>
    </div>
</body>
</html>