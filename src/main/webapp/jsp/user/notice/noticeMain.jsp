<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!Doctype html>
<html lang="ko">
<head>
    <jsp:include page="../common/head.jsp"/>
    <style>

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

        th, td {
            padding: 15px;
            text-align: center;
        }

        td {
            border-top: 1px solid #ddd;
            border-bottom: 1px solid #ddd;
        }

        td:nth-child(4) {
            text-align: left;
            padding-left: 15px;
        }

        td a:hover {
            color: #666;
        }

        th {
            background-color: #f4f4f4;
            font-weight: bold;
        }


        .pagination {
            clear: both;
            position: relative;
            margin: 0 auto;
            padding: 30px 0 0 0;
            text-align: center !important;
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

        .event-thumbnail img {
            width: 80px;
            height: 80px;
            object-fit: cover;
        }
    </style>
</head>
<body>
<jsp:include page="../common/header.jsp"/>
<!-- 추가된 page-util -->
<div class="page-util">
    <div class="inner-wrap">
        <div class="location">
            <span>Home</span>
            <img src="https://img.megabox.co.kr/static/pc/images/common/bg/bg-location-arr.png"/>
            <label>공지사항</label>
        </div>
    </div>
</div>
<div class="contents">
    <h1>공지사항</h1>
    <div id="announcement" class="noticeboard">
        <div class="search-bar-container">
            <div class="total-count">전체 3,803건</div>
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
                    <input type="text" placeholder="검색어를 입력해주세요." title="공지사항 검색" class="input-text">
                    <button class="btn">
                        <i class="ico-search"></i>
                        검색
                    </button>
                </div>
            </div>
        </div>

        <!-- 공지사항 테이블 -->
        <table>
            <thead>
            <tr>
                <th>번호</th>
                <th>극장</th>
                <th>구분</th>
                <th>제목</th>
                <th>등록일</th>
            </tr>
            </thead>
            <tbody>
            <c:set var="pvo" value="${requestScope.page}"/>
            <c:forEach var="vo" items="${ar }" varStatus="vs">
                <%-- 페이지가 바뀌면 pvo가 바뀌므로 vo도 새롭게 들어와서 vs도 다시 0부터 시작 --%>
                <tr>
                    <td>${((pvo.nowPage - 1) * pvo.numPerPage + vs.index)+1 }</td>
                    <td></td>
                    <td>공지</td>
                    <td>
                        <a href="UserController?type=view&boardIdx=${vo.boardIdx}">${vo.boardTitle}</a>
                    </td>
                    <td>${vo.boardRegDate.substring(0,10)}</td>
                </tr>
            </c:forEach>
            <c:if test="${ar eq null or fn:length(ar) eq 0 }">
                <tr>
                    <td colspan="5">현재 등록된 데이터가 없습니다.</td>
                </tr>
            </c:if>

            </tbody>
        </table>

        <!-- 페이지네이션 -->
        <nav class="pagination">
            <c:if test="${requestScope.page ne null}">
                <c:set var="pvo" value="${requestScope.page}" />

                <!-- << (맨 처음으로) -->
                <c:if test="${pvo.nowPage > 1 && pvo.totalPage > 10}">
                    <a href="UserController?type=board&cPage=1" class="control first" title="처음 페이지">&laquo;</a>
                </c:if>

                <!-- < (이전 페이지 블록) -->
                <c:if test="${pvo.startPage > 1}">
                    <a href="UserController?type=board&cPage=${pvo.startPage - pvo.pagePerBlock}" class="control prev" title="이전 블록">&lt;</a>
                </c:if>

                <!-- 페이지 번호 -->
                <c:forEach begin="${pvo.startPage}" end="${pvo.endPage}" varStatus="st">
                    <c:if test="${st.index eq pvo.nowPage}">
                        <strong class="active">${st.index}</strong>
                    </c:if>
                    <c:if test="${st.index ne pvo.nowPage}">
                        <a href="UserController?type=board&cPage=${st.index}" title="${st.index}페이지 보기">${st.index}</a>
                    </c:if>
                </c:forEach>

                <!-- > (다음 페이지 블록) -->
                <c:if test="${pvo.endPage < pvo.totalPage}">
                    <a href="UserController?type=board&cPage=${pvo.startPage + pvo.pagePerBlock}" class="control next" title="다음 블록">&gt;</a>
                </c:if>

                <!-- >> (맨 마지막으로) -->
                <c:if test="${pvo.nowPage < pvo.totalPage && pvo.totalPage > 10}">
                    <a href="UserController?type=board&cPage=${pvo.totalPage}" class="control last" title="마지막 페이지">&raquo;</a>
                </c:if>
            </c:if>
        </nav>

    </div>
</div>
<script>

</script>
<jsp:include page="../common/footer.jsp"/>
</body>
</html>