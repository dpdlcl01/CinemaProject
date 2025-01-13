<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!Doctype html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <!-- 사용자의 환경에 맞게 화면의 크기를 조정할 수 있도록 함. -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>라이프시어터, 메가박스</title>
    <meta property="name" id="metaTagTitle" content="라이프시어터,메가박스">

    <!-- 해당 페이지의 설명(검색 시 페이지의 제목 아래 페이지 내용의 요약 부분) -->
    <meta property="description" id="metaTagDtls" content="삶의 의미와 즐거움을 소통하는 공간, 함께 더 행복한 가치있는 콘텐츠를 추구하는 만남과 소통의 즐거움이 가득한 공간 메가박스 입니다.">

    <!-- 해당 컨텐츠 내용의 대표적인 키워드를 지정 -->
    <meta property="keywords" id="metaTagKeyword" content="메가박스,megabox,영화,영화관,극장,티켓,박스오피스,상영예정작,예매,오페라,싱어롱,큐레이션,필름소사이어티,이벤트,Movie,theater,Cinema,film,Megabox">

    <!-- OpenGraph -->
    <!-- 웹페이지가 소셜 미디어 또는 오픈그래프를 활용한 사이트로 공유될 때 사용되어지는 정보 -->
    <meta property="fb:app_id" id="fbAppId" content="546913502790694">
    <meta property="og:site_name" id="fbSiteName" content="메가박스">
    <meta property="og:type" id="fbType" content="movie">
    <meta property="og:url" id="fbUrl" content="https://www.megabox.co.kr/">
    <meta property="og:title" id="fbTitle" content="라이프시어터, 메가박스">
    <meta property="og:description" id="fbDtls" content="삶의 의미와 즐거움을 소통하는 공간, 함께 더 행복한 가치있는 콘텐츠를 추구하는 만남과 소통의 즐거움이 가득한 공간 메가박스 입니다.">
    <meta property="og:image" id="fbImg" content="https://img.megabox.co.kr/SharedImg/metaTag/2020/02/04/gFfTzMwwiCxhBwcUV5TRGMFX9Cmoj64W.jpg">
    <%--    <link rel="stylesheet" href="../../css/user/reset.css">--%>
    <%--    <link rel="stylesheet" href="../../css/user/style.css">--%>
    <script src="https://kit.fontawesome.com/d7f530ec10.js" crossorigin="anonymous"></script>
    <script src="../../js/app.js"></script>
    <style>
        .hightab {
            width: 1000px;
            margin: 50px auto;
        }
        .content {
            margin-top: 20px;
        }
        .content.active {
            display: block;
        }
        h1 {
            margin: 50px 0 20px 0; /* 위, 오른쪽, 아래, 왼쪽 */
            text-align: left;
        }
        .search-bar {
            display: flex;
            justify-content: flex-end;
            align-items: center;
            margin-bottom: 20px;
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
        th {
            background-color: #f4f4f4;
        }
        .pagination {
            margin-top: 20px;
            text-align: center;
        }
        .pagination a {
            margin: 0 5px;
            text-decoration: none;
            color: #007bff;
            font-weight: bold;
        }
        .pagination a.active {
            color: #fff;
            background-color: #007bff;
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
<jsp:include page="header.jsp"/>
<main>
    <section>
        <div class="hightab">
            <h1>공지사항</h1>

            <div id="announcement" class="content">
                <div>
                    <p>전체 3,803건</p>
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
                            <td>[코엑스]시사회 진행에 따른 고객 안내 (1월 14일)</td>
                            <td>2025.01.10</td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td>메가박스</td>
                            <td>공지</td>
                            <td>[토스페이-롯데카드] 시스템 점검 안내 (1/13)</td>
                            <td>2025.01.10</td>
                        </tr>
                        <tr>
                            <td>3</td>
                            <td>미사강변</td>
                            <td>공지</td>
                            <td>[미사강변] 내부 인테리어 공사에 따른 임시 휴업 안내 (25년 1월 14일)</td>
                            <td>2025.01.09</td>
                        </tr>
                        <tr>
                            <td>4</td>
                            <td>메가박스</td>
                            <td>공지</td>
                            <td>[토스페이-우리카드] 시스템 점검 안내 (1/11~12)</td>
                            <td>2025.01.08</td>
                        </tr>
                        <tr>
                            <td>5</td>
                            <td>메가박스</td>
                            <td>공지</td>
                            <td>[컬처랜드] 시스템 점검 공지 안내 (1/23)</td>
                            <td>2025.01.08</td>
                        </tr>
                        <tr>
                            <td>6</td>
                            <td>안성스타필드</td>
                            <td>공지</td>
                            <td>[안성스타필드]대관 행사로 인한 조조영화 상영 안내 (1월 10일)</td>
                            <td>2025.01.06</td>
                        </tr>
                        <tr>
                            <td>7</td>
                            <td>안성스타필드</td>
                            <td>공지</td>
                            <td>[안성스타필드]대관 행사로 인한 조조영화 상영 안내 (1월 10일)</td>
                            <td>2025.01.06</td>
                        </tr>
                        <tr>
                            <td>8</td>
                            <td>안성스타필드</td>
                            <td>공지</td>
                            <td>[안성스타필드]대관 행사로 인한 조조영화 상영 안내 (1월 10일)</td>
                            <td>2025.01.06</td>
                        </tr>
                        <tr>
                            <td>9</td>
                            <td>안성스타필드</td>
                            <td>공지</td>
                            <td>[안성스타필드]대관 행사로 인한 조조영화 상영 안내 (1월 10일)</td>
                            <td>2025.01.06</td>
                        </tr>
                        <tr>
                            <td>10</td>
                            <td>안성스타필드</td>
                            <td>공지</td>
                            <td>[안성스타필드]대관 행사로 인한 조조영화 상영 안내 (1월 10일)</td>
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
    </section>
</main>
<jsp:include page="footer.jsp"/>
</body>
</html>