<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!Doctype html>
<html lang="ko">
<head>
    <jsp:include page="../../user/common/head.jsp"/>

</head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/common.css">

<style>
    #top1 {
        background-image: url("${pageContext.request.contextPath}/css/user/images/KangImg/my_info_topbg.png");
        color: white;
        background-repeat: no-repeat;
        display: flex;
        width: 840px;
        height: 220px;
        background-size: contain;
    }

    #top1 img {
        width: 90px;
        height: 90px;
    }

    #imgName {
        display: flex;
        padding-right: 30px;
        width: 420px;
        align-items: center;
        justify-content: center;
    }

    #imgName p {
        font-size: 40px;
        line-height: 10px;
        padding-left: 30px;
        margin: 30px 0;

    }

    #point {
        display: flex;
        padding-top: 30px;
        margin-left: 50px;
    }

    #totalPoint {
        font-size: 40px;
    }

    #point span, #point em {
        padding-top: 10px;
        padding-left: 10px;
    }

    #point em {
        color: deepskyblue;
        font-weight: 600;
    }

    #pointDiv {
        position: relative;
        height: 120px;
    }

    #bar {
        width: 100%; /* 가로선을 전체 너비로 설정 */
        height: 2px;
        background-color: #666;
        position: absolute;
        top: 100px;
        left: 50px;
    }

    /* 등급 진행 바 */
    .level-list {
        display: flex;
        align-items: center;
        justify-content: space-between;
        list-style: none;
        padding: 0;
        margin: 20px 0 0 50px;
        width: 100%;
        max-width: 600px;
        position: relative;
    }

    /* 등급 바의 연결선 */
    .level-list::before {
        content: "";
        position: absolute;
        top: 50%;
        left: 0;
        width: 100%;
        height: 2px;
        background-color: #666; /* 기본 선 색상 */
        z-index: -1;
        transform: translateY(-50%);
    }

    /* 각 등급을 나타내는 작은 동그라미 */
    .level-item {
        position: relative;
        width: 12px; /* 작은 크기의 원 */
        height: 12px;
        background-color: #666;
        border-radius: 50%;

    }

    /* 현재 활성화된 등급 */
    .level-item.active {
        background-color: #22C8F6; /* 하늘색 */
        border: 2px solid white;
    }

    /* 등급 텍스트 */
    .level-item span {
        position: absolute;
        top: 20px;
        left: 50%;
        transform: translateX(-50%);
        color: white;
        font-size: 12px;
        text-align: center;
    }

    /* 말풍선 스타일 */
    .tooltip {
        background-color: #22C8F6;
        color: #ffffff;
        padding: 6px 12px;
        /*margin-left: 110px;*/
        border-radius: 6px;
        font-size: 12px;
        font-weight: bold;
        position: absolute;
        top: 50px;
        left: 50%;
        transform: translateX(-50%);
        white-space: nowrap;

    }

    /* 말풍선 꼬리 */
    /*    .tooltip::after {
            content: "";
            position: absolute;
            bottom: -6px;
            left: 50%;
            transform: translateX(-50%);
            border-width: 6px;
            border-style: solid;
            border-color: #22C8F6 transparent transparent transparent;
        }*/

    #top2 {
        display: flex;
        width: 836px;
        height: 140px;
        background-color: #eeeeee;
        border-bottom-left-radius: 20px;
        border-bottom-right-radius: 20px;
        margin-bottom: 50px;
    }

    .top2 {
        width: 200px;
        padding: 10px 20px 0;
    }

    .top2 > a {
        display: block;
        text-align: center;
        color: #503396;
        font-weight: 600;
        padding-bottom: 10px;
        text-decoration: none;
    }

    .top2 > div {
        display: flex;
        margin-left: 10px;
    }

    .top2 span {


        width: 120px;
    }

    .top2 em {
        text-align: right;
        display: block;
        font-weight: 600;
    }

    #myReserv {
        display: flex;
        width: 840px;
        height: 140px;
        margin-bottom: 50px;
        align-items: center;
        border-bottom: 1px solid #eeeeee;
    }

    #myReserv > img {
        width: 70px;
        height: 100px;
    }

    #reservInfo p {
        margin: 0 30px;
        width: 640px;
    }

    #reservInfo em {
        color: #01738b;
    }

    #myReserv button {
        background-color: white;
        width: 74px;
        height: 32px;
    }

    #h2 {
        display: flex;
        align-items: center;
        border-bottom: 1px solid #666666;
        width: 840px;
    }

    #h2 h2 {
        width: 760px;
    }

    #h2 button {
        height: 32px;
        width: 74px;
        border: none;
        background-color: white;
    }

    .top2 span {
        font-size: 14px;
    }

    #total {
        display: none;
    }

    .myPage-container {
        display: flex;

    }

    #contents {
        margin-left: auto;
        margin-right: auto;
        width: 1100px;
    }

    #main {
        margin: 50px 0 50px 50px;
    }

    .notice {
        width: 840px;
    }

    .noticeboard {
        width: 100%;
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

    .notice h1 {
        font-size: 30px;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        margin: 20px 0;
        font-size: 16px;
        text-align: center;
        border-top: 2px solid #000 !important;
    }

    th, td {
        padding: 12px 15px; /* 셀 안쪽 여백 추가 */
        border-bottom: 1px solid #ddd !important;
    }
    td:nth-child(4) {
        text-align: left;
    }

    th {
        background-color: #f2f2f2; /* 헤더 배경색 */
        font-weight: bold;
    }

    tr {
        border-bottom: 1px solid #ddd; /* 행 간 구분선 */
    }

    tr:last-child {
        border-bottom: none; /* 마지막 행 구분선 제거 */
    }

    tr:hover {
        background-color: #f9f9f9; /* 마우스 오버 시 배경색 */
    }

    a{
        color: inherit !important;
    }


    .writeNotice {
        float: right;
        margin-top: 10px;
        text-align: center;
        color: #fff;
        background-color: #6a5acd;
        text-decoration: none;
        border-radius: 5px;
        font-size: 14px;
    }

    .checkbox-column {
        display: none;
    }

    .delete{
        display: none;
    }

</style>

<body>
<jsp:include page="../../user/common/header.jsp"/>
<div class="contents">
    <div class="page-util">
        <div class="inner-wrap">
            <div class="location">
                <span>Home</span>
                <a href="/booking" title="예매 페이지로 이동">이벤트</a>
                <a href="/booking" title="빠른예매 페이지로 이동" class="pageUtila">진행중 이벤트</a>
            </div>
        </div>
    </div>
    <div class="total-main">
        <div class="myPage-container">
            <%--  사이드바  --%>
            <jsp:include page="../common/adminSideBar.jsp"></jsp:include>
            <%--  메인  --%>


            <div id="main">
                <div class="notice">
                    <h1>공지사항</h1>
                    <div id="announcement" class="noticeboard">
                        <div class="search-bar-container">
                            <div class="total-count">전체 ${requestScope.total}건</div>
                            <button id="delete" class="delete">삭제</button>
                            <button id="toggleSelect">선택</button>
                            <!-- 검색어 입력 섹션 -->
                            <form method="post" action="AdminController" class="search-bar">
                                <input type="hidden" name="type" value="adBoard"/>
                                <select id="region" name="region" onchange="updateTheaters()">
                                    <option value="">지역 선택</option>
                                    <option value="서울" ${param.region == '서울' ? 'selected' : ''}>서울</option>
                                    <option value="경기" ${param.region == '경기' ? 'selected' : ''}>경기</option>
                                    <option value="인천" ${param.region == '인천' ? 'selected' : ''}>인천</option>
                                    <option value="대전/충청/세종" ${param.region == '대전/충청/세종' ? 'selected' : ''}>대전/충청/세종
                                    </option>
                                    <option value="부산/대구/경상" ${param.region == '부산/대구/경상' ? 'selected' : ''}>부산/대구/경상
                                    </option>
                                    <option value="광주/전라" ${param.region == '광주/전라' ? 'selected' : ''}>광주/전라</option>
                                    <option value="강원" ${param.region == '강원' ? 'selected' : ''}>강원</option>
                                </select>
                                <select id="theater" name="theater">
                                    <option value="">극장 선택</option>
                                </select>
                                <div class="search-bar2">
                                    <input type="text" name="keyword" placeholder="검색어를 입력해주세요." title="공지사항 검색"
                                           class="input-text" value="${param.keyword}"/>
                                    <button class="btn">
                                        <i class="ico-search"></i>
                                        검색
                                    </button>
                                </div>
                            </form>
                        </div>


                        <!-- 공지사항 테이블 -->
                        <form id="deleteForm" method="post" action="AdminController">
                            <input type="hidden" name="type" value="adWrite">
                            <table>
                                <thead>
                                <tr>
                                    <th class="checkbox-column">
                                        <input type="checkbox" id="selectAll">
                                    </th>
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
                                        <%-- 체크박스 --%>
                                            <td class="checkbox-column">
                                                <input type="checkbox" class="row-checkbox" name="selectedNotice" value="${vo.boardIdx}">
                                            </td>

                                        <td>${((pvo.nowPage - 1) * pvo.numPerPage + vs.index)+1 }</td>
                                        <c:if test="${vo.theaterName ne null}">
                                            <td>${vo.theaterName}</td>
                                        </c:if>
                                        <c:if test="${vo.theaterName eq null}">
                                            <td>메가박스</td>
                                        </c:if>
                                        <td>공지</td>
                                        <td>
                                            <a href="AdminController?type=adView&boardIdx=${vo.boardIdx}">${vo.boardTitle}</a>
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
                        </form>

                        <a href="AdminController?type=adWrite" class="writeNotice">글쓰기</a>



                        <!-- 페이지네이션 -->
                        <nav class="pagination">
                            <c:if test="${requestScope.page ne null}">
                                <c:set var="pvo" value="${requestScope.page}"/>

                                <!-- << (맨 처음으로) -->
                                <c:if test="${pvo.nowPage > 1 && pvo.totalPage > 10}">
                                    <a href="AdminController?type=adBoard&cPage=1&keyword=${param.keyword}&region=${param.region}&theater=${param.theater}"
                                       class="control first" title="처음 페이지">&laquo;</a>
                                </c:if>

                                <!-- < (이전 페이지 블록) -->
                                <c:if test="${pvo.startPage > 1}">
                                    <a href="AdminController?type=adBoard&cPage=${pvo.startPage - pvo.pagePerBlock}&keyword=${param.keyword}&region=${param.region}&theater=${param.theater}"
                                       class="control prev" title="이전 블록">&lt;</a>
                                </c:if>

                                <!-- 페이지 번호 -->
                                <c:forEach begin="${pvo.startPage}" end="${pvo.endPage}" varStatus="st">
                                    <c:if test="${st.index eq pvo.nowPage}">
                                        <strong class="active">${st.index}</strong>
                                    </c:if>
                                    <c:if test="${st.index ne pvo.nowPage}">
                                        <a href="AdminController?type=adBoard&cPage=${st.index}
                                <c:if test='${not empty param.keyword}'> &keyword=${param.keyword}</c:if>
                                <c:if test='${not empty param.region}'> &region=${param.region}</c:if>
                                <c:if test='${not empty param.theater}'> &theater=${param.theater}</c:if>"
                                           title="${st.index}페이지 보기">
                                                ${st.index}
                                        </a>

                                    </c:if>
                                </c:forEach>

                                <!-- > (다음 페이지 블록) -->
                                <c:if test="${pvo.endPage < pvo.totalPage}">
                                    <a href="AdminController?type=adBoard&cPage=${pvo.startPage + pvo.pagePerBlock}&keyword=${param.keyword}&region=${param.region}&theater=${param.theater}"
                                       class="control next" title="다음 블록">&gt;</a>
                                </c:if>

                                <!-- >> (맨 마지막으로) -->
                                <c:if test="${pvo.nowPage < pvo.totalPage && pvo.totalPage > 10}">
                                    <a href="AdminController?type=adBoard&cPage=${pvo.totalPage}&keyword=${param.keyword}&region=${param.region}&theater=${param.theater}"
                                       class="control last" title="마지막 페이지">&raquo;</a>
                                </c:if>
                            </c:if>
                        </nav>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="../../user/common/footer.jsp"/>

<!-- 삭제 결과 메시지 표시 -->
<c:if test="${param.msg == 'deleteSuccess'}">
    <script>alert('선택한 공지사항이 삭제되었습니다.');</script>
</c:if>
<c:if test="${param.msg == 'deleteFail'}">
    <script>alert('삭제에 실패했습니다. 다시 시도하세요.');</script>
</c:if>
<c:if test="${param.msg == 'noSelection'}">
    <script>alert('삭제할 공지사항을 선택하세요.');</script>
</c:if>


<script>
    // 지역별 극장 목록
    const theatersByRegion = {
        '서울': ['강남', '센트럴', '코엑스', '홍대'],
        '경기': ['고양스타필드', '수원스타필드', '안성스타필드'],
        '인천': ['송도', '인천논현'],
        '대전/충청/세종': ['대전중앙로', '세종나성'],
        '부산/대구/경상': ['대구신세계', '해운대'],
        '광주/전라': ['광주하남', '전주혁신'],
        '강원': ['원주혁신']
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
    window.onload = function () {
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

    // 선택눌렀을때 체크박스
    document.getElementById('toggleSelect').addEventListener('click', function () {
        const checkboxes = document.querySelectorAll('.checkbox-column');
        const deleteButton = document.getElementById('delete');

        let isVisible = checkboxes[0].style.display === 'table-cell';

        checkboxes.forEach(checkbox => {
            checkbox.style.display = isVisible ? 'none' : 'table-cell';
        });

        // 삭제 버튼도 선택 버튼과 함께 보이게/숨기게
        deleteButton.style.display = isVisible ? 'none' : 'inline-block';
    });

    // 전체선택
    document.getElementById('selectAll').addEventListener('change', function () {
        const rowCheckboxes = document.querySelectorAll('.row-checkbox');
        rowCheckboxes.forEach(checkbox => {
            checkbox.checked = this.checked;  // 전체 체크박스 상태에 따라 개별 체크박스 변경
        });
    });

    // 삭제버튼 누를시
    document.getElementById('delete').addEventListener('click', function () {
        const selectedItems = document.querySelectorAll('.row-checkbox:checked');
        if (selectedItems.length === 0) {
            alert('삭제할 항목을 선택하세요.');
            return;
        }

        if (confirm('선택한 항목을 삭제하시겠습니까?')) {
            const form = document.getElementById('deleteForm');
            form.submit();  // 선택된 항목을 서버로 전송하여 삭제 요청
        }
    });



    var total = ${requestScope.total};
    document.addEventListener("DOMContentLoaded", function () {
        if (total >= 13000 && total < 20000) {
            document.getElementById("vip-item").classList.add("active");
        }
        if (total >= 20000) {
            document.getElementById("vip-item").classList.add("active");
            document.getElementById("vvip-item").classList.add("active");
        }
    });

</script>
</body>
</html>