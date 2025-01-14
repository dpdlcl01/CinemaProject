<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!Doctype html>
<html lang="ko">
<head>
    <jsp:include page="./common/head.jsp"/>
    <style>
        .noticeboard {
            margin-top: 20px;
        }
        .noticeboard.active {
            display: block;
        }
        h1 {
            margin: 50px 0 20px 0; /* 위, 오른쪽, 아래, 왼쪽 */
            text-align: left;
        }
        .search-bar-container {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }
        .search-bar-container .total-count {
            font-size: 16px;
            font-weight: bold;
        }
        .search-bar {
            display: flex;
            justify-content: flex-end;
            align-items: center;
            gap: 10px;
        }
        .search-bar select, .search-bar input {
            padding: 8px;
            font-size: 14px;
        }
        .search-bar input {
            width: 250px; /* 입력 필드 너비 */
        }
        .search-bar button {
            padding: 8px 15px;
            font-size: 14px;
            color: #fff;
            background-color: #007bff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .search-bar button:hover {
            background-color: #0056b3;
        }
        table {
            width: 100%;
            height: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        table, th, td {
            border: 1px solid #ccc;
        }
        th, td {
            padding: 10px;
            text-align: left;
        }
        td a:hover {
            color: #666;
        }
        th {
            background-color: #f4f4f4;
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
<jsp:include page="./common/header.jsp"/>
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
                        <input type="text" placeholder="검색어를 입력해주세요.">
                        <button>검색</button>
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
                        <tr>
                            <td>1</td>
                            <td>코엑스</td>
                            <td>공지</td>
                            <td>
                                <a href="">[코엑스]시사회 진행에 따른 고객 안내 (1월 14일)</a>
                            </td>
                            <td>2025.01.10</td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td>메가박스</td>
                            <td>공지</td>
                            <td>
                                <a href="">[토스페이-롯데카드] 시스템 점검 안내 (1/13)></a>
                            </td>
                            <td>2025.01.10</td>
                        </tr>
                        <tr>
                            <td>3</td>
                            <td>미사강변</td>
                            <td>공지</td>
                            <td>
                                <a href="">[미사강변] 내부 인테리어 공사에 따른 임시 휴업 안내 (25년 1월 14일)</a>
                            </td>
                            <td>2025.01.09</td>
                        </tr>
                        <tr>
                            <td>4</td>
                            <td>메가박스</td>
                            <td>공지</td>
                            <td>
                                <a href="">[토스페이-우리카드] 시스템 점검 안내 (1/11~12)</a>
                            </td>
                            <td>2025.01.08</td>
                        </tr>
                        <tr>
                            <td>5</td>
                            <td>메가박스</td>
                            <td>공지</td>
                            <td>
                                <a href="">[컬처랜드] 시스템 점검 공지 안내 (1/23)</a>
                            </td>
                            <td>2025.01.08</td>
                        </tr>
                        <tr>
                            <td>6</td>
                            <td>안성스타필드</td>
                            <td>공지</td>
                            <td>
                                <a href="">[안성스타필드]대관 행사로 인한 조조영화 상영 안내 (1월 10일)</a>
                            </td>
                            <td>2025.01.06</td>
                        </tr>
                        <tr>
                            <td>7</td>
                            <td>안성스타필드</td>
                            <td>공지</td>
                            <td><a href="">[안성스타필드]대관 행사로 인한 조조영화 상영 안내 (1월 10일)</a></td>
                            <td>2025.01.06</td>
                        </tr>
                        <tr>
                            <td>8</td>
                            <td>안성스타필드</td>
                            <td>공지</td>
                            <td><a href="">[안성스타필드]대관 행사로 인한 조조영화 상영 안내 (1월 10일)</a></td>
                            <td>2025.01.06</td>
                        </tr>
                        <tr>
                            <td>9</td>
                            <td>안성스타필드</td>
                            <td>공지</td>
                            <td><a href="">[안성스타필드]대관 행사로 인한 조조영화 상영 안내 (1월 10일)</a></td>
                            <td>2025.01.06</td>
                        </tr>
                        <tr>
                            <td>10</td>
                            <td>안성스타필드</td>
                            <td>공지</td>
                            <td><a href="">[안성스타필드]대관 행사로 인한 조조영화 상영 안내 (1월 10일)</a></td>
                            <td>2025.01.06</td>
                        </tr>

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
<jsp:include page="./common/footer.jsp"/>
<jsp:include page="./common/modalscript.jsp"/>
</body>
</html>