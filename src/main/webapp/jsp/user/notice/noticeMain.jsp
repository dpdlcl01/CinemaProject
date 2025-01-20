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
            margin-top: 20px;
            margin-bottom: 50px;
            text-align: center;
        }

        .pagination a {
            margin: 0 5px;
            text-decoration: none;
            color: #5a4cad;
            font-weight: bold;
        }

        .pagination a.active {
            color: #fff;
            background-color: #5a4cad;
            padding: 5px 10px;
            border-radius: 5px;
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
            <a href="/booking" title="예매 페이지로 이동">공지사항</a>
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
            <c:forEach var="vo" items="${ar }" varStatus="vs">
                <tr>
                    <td>${pvo.totalRecord - ((pvo.nowPage - 1) * pvo.numPerPage + vs.index) }</td>
                    <td></td>
                    <td>공지</td>
                    <td>
                        <a href="">${vo.boardTitle}</a>
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
        <div class="pagination">
            <a href="#">1</a>
            <a href="#">2</a>
            <a href="#">3</a>
            <a href="#" class="active">4</a>
            <a href="#">5</a>
            <a href="#">6</a>
            <a href="#">7</a>
            <a href="#">8</a>
            <a href="#">9</a>
            <a href="#">10</a>
        </div>
    </div>
</div>
</div>
<jsp:include page="../common/footer.jsp"/>
<jsp:include page="../common/modalscript.jsp"/>
</body>
</html>