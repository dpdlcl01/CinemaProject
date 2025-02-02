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
            <div class="total-count">전체 ${requestScope.total}건</div>
            <!-- 검색어 입력 섹션 -->
            <form method="post" action="UserController" class="search-bar">
                <input type="hidden" name="type" value="board"/>
                <select id="region" name="region" onchange="updateTheaters()">
                    <option value="">지역 선택</option>
                    <option value="서울" ${param.region == '서울' ? 'selected' : ''}>서울</option>
                    <option value="경기" ${param.region == '경기' ? 'selected' : ''}>경기</option>
                    <option value="인천" ${param.region == '인천' ? 'selected' : ''}>인천</option>
                    <option value="대전/충청/세종" ${param.region == '대전/충청/세종' ? 'selected' : ''}>대전/충청/세종</option>
                    <option value="부산/대구/경상" ${param.region == '부산/대구/경상' ? 'selected' : ''}>부산/대구/경상</option>
                    <option value="광주/전라" ${param.region == '광주/전라' ? 'selected' : ''}>광주/전라</option>
                    <option value="강원" ${param.region == '강원' ? 'selected' : ''}>강원</option>
                </select>
                <select id="theater" name="theater">
                    <option value="">극장 선택</option>
                </select>
                <div class="search-bar2">
                    <input type="text" name="keyword" placeholder="검색어를 입력해주세요." title="공지사항 검색" class="input-text" value="${param.keyword}"/>
                    <button class="btn">
                        <i class="ico-search"></i>
                        검색
                    </button>
                </div>
            </form>
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
                    <c:if test="${vo.theaterName ne null}">
                        <td>${vo.theaterName}</td>
                    </c:if>
                    <c:if test="${vo.theaterName eq null}">
                        <td>메가박스</td>
                    </c:if>
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
                    <a href="UserController?type=board&cPage=1&keyword=${param.keyword}&region=${param.region}&theater=${param.theater}"
                       class="control first" title="처음 페이지">&laquo;</a>
                </c:if>

                <!-- < (이전 페이지 블록) -->
                <c:if test="${pvo.startPage > 1}">
                    <a href="UserController?type=board&cPage=${pvo.startPage - pvo.pagePerBlock}&keyword=${param.keyword}&region=${param.region}&theater=${param.theater}"
                       class="control prev" title="이전 블록">&lt;</a>
                </c:if>

                <!-- 페이지 번호 -->
                <c:forEach begin="${pvo.startPage}" end="${pvo.endPage}" varStatus="st">
                    <c:if test="${st.index eq pvo.nowPage}">
                        <strong class="active">${st.index}</strong>
                    </c:if>
                    <c:if test="${st.index ne pvo.nowPage}">
                        <a href="UserController?type=board&cPage=${st.index}
                                <c:if test='${not empty param.keyword}'> &keyword=${param.keyword}</c:if>
                                <c:if test='${not empty param.region}'> &region=${param.region}</c:if>
                                <c:if test='${not empty param.theater}'> &theater=${param.theater}</c:if>" title="${st.index}페이지 보기">
                        ${st.index}
                        </a>

                    </c:if>
                </c:forEach>

                <!-- > (다음 페이지 블록) -->
                <c:if test="${pvo.endPage < pvo.totalPage}">
                    <a href="UserController?type=board&cPage=${pvo.startPage + pvo.pagePerBlock}&keyword=${param.keyword}&region=${param.region}&theater=${param.theater}"
                       class="control next" title="다음 블록">&gt;</a>
                </c:if>

                <!-- >> (맨 마지막으로) -->
                <c:if test="${pvo.nowPage < pvo.totalPage && pvo.totalPage > 10}">
                    <a href="UserController?type=board&cPage=${pvo.totalPage}&keyword=${param.keyword}&region=${param.region}&theater=${param.theater}"
                       class="control last" title="마지막 페이지">&raquo;</a>
                </c:if>
            </c:if>
        </nav>

    </div>
</div>
<script>
    // 지역별 극장 목록
    const theatersByRegion = {
        '서울' : ['강남', '센트럴', '코엑스', '홍대'],
        '경기' : ['고양스타필드', '수원스타필드', '안성스타필드'],
        '인천' : ['송도', '인천논현'],
        '대전/충청/세종' : ['대전중앙로', '세종나성'],
        '부산/대구/경상' : ['대구신세계', '해운대'],
        '광주/전라' : ['광주하남', '전주혁신'],
        '강원' : ['원주혁신']
    };

    function updateTheaters() {
        const regionSelect = document.getElementById('region');  // 지역 선택 드롭다운
        const theaterSelect = document.getElementById('theater');  // 극장 선택 드롭다운

        const selectedRegion = regionSelect.value;  // 선택된 지역 값 (예: '서울')

        // 극장 드롭다운 초기화 (이전에 추가된 옵션들을 제거)
        theaterSelect.innerHTML = '<option value="">극장 선택</option>';

        // 선택한 지역에 해당하는 극장 목록 가져오기
        if (selectedRegion && theatersByRegion[selectedRegion]) {
            const theaters = theatersByRegion[selectedRegion];

            // 극장 목록을 드롭다운에 추가
            theaters.forEach(theaterName => {
                const option = document.createElement('option'); // <option> 태그 생성
                option.value = theaterName;                     // <option value="theaterName">
                option.textContent = theaterName;               // <option value="theaterName">theaterName</option>
                theaterSelect.appendChild(option);              // 드롭다운에 추가
            });
        }
    }

    // 페이지 로드 시 기존 선택 유지 (검색 후 값 유지)
    window.onload = function() {
        const selectedRegion = "${param.region}";
        const selectedTheater = "${param.theater}";

        if (selectedRegion) {
            document.getElementById('region').value = selectedRegion;
            updateTheaters();  // 지역에 따른 극장 목록 업데이트

            if (selectedTheater) {
                document.getElementById('theater').value = selectedTheater;  // 선택한 극장 유지
            }
        }
    };
</script>
<jsp:include page="../common/footer.jsp"/>
</body>
</html>