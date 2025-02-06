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
        margin-top: 10px;
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

    /*제목 왼쪽 정렬 필요할 경우 */
    td:nth-child(5) {
        text-align: left;
        padding-left: 15px;
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

    tr:hover {
        background-color: #f9f9f9;
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

    .checkbox, .endNotice, .startNotice{
        display: none;
    }

    .buttonGroup{
        display: flex;
        gap: 10px;
        align-items: center;
    }
    .endNotice, .selectNotice, .writeNotice, .startNotice{
        background-color: #01738b;
        color: #fff;
        border: none;
        border-radius: 5px;
        outline: none;
        box-shadow: none !important;
    }
    .writeNotice{
        margin-top: 10px;
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
                <div class="notice">
                    <h1>공지사항</h1>
                    <div id="announcement" class="noticeboard">
                        <div class="search-bar-container">
                            <div class="total-count">전체 ${requestScope.total}건</div>
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
                        <div class="buttonGroup">
                            <button id="toggleSelect" class="selectNotice">선택</button>
                            <button id="startNotice" class="startNotice">게시</button>
                            <button id="endNotice" class="endNotice">종료</button>
                        </div>


                        <!-- 공지사항 테이블 -->
                        <form id="endForm" method="post" action="AdminController">
                            <input type="hidden" name="type" value="adWrite"/>
                            <input type="hidden" name="actionType" value="end"/>
                            <table>
                                <thead>
                                <tr>
                                    <th class="checkbox">
                                        <input type="checkbox" id="selectAll" class="selectAll"/>
                                    </th>
                                    <th>번호</th>
                                    <th>극장</th>
                                    <th>구분</th>
                                    <th>제목</th>
                                    <th>등록일</th>
                                    <th>게시 상태</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:set var="pvo" value="${requestScope.page}"/>
                                <c:forEach var="vo" items="${ar}" varStatus="vs">
                                    <td class="checkbox">
                                        <input type="checkbox" class="rowCheckbox" name="selectedNotice" value="${vo.boardIdx}"/>
                                    </td>
                                    <%-- 페이지가 바뀌면 pvo가 바뀌므로 vo도 새롭게 들어와서 vs도 다시 0부터 시작 --%>
                                        <td>${((pvo.nowPage - 1) * pvo.numPerPage + vs.index) + 1}</td>
                                        <c:if test="${vo.theaterName ne null}">
                                            <td>${vo.theaterName}</td>
                                        </c:if>
                                        <c:if test="${vo.theaterName eq null}">
                                            <td>메가박스</td>
                                        </c:if>
                                        <c:if test="${vo.boardType eq 'NOTICE'}">
                                            <td>공지</td>
                                        </c:if>
                                        <c:if test="${vo.boardType eq 'EVENT'}">
                                            <td>이벤트</td>
                                        </c:if>
                                        <td>
                                            <a href="AdminController?type=adView&amp;boardIdx=${vo.boardIdx}">
                                                    ${vo.boardTitle}
                                            </a>
                                        </td>
                                        <td>${vo.boardRegDate.substring(0,10)}</td>
                                        <c:if test="${vo.boardStatus eq '0'}">
                                            <td>게시 중</td>
                                        </c:if>
                                        <c:if test="${vo.boardStatus eq '1'}">
                                            <td>게시 예정</td>
                                        </c:if>
                                        <c:if test="${vo.boardStatus eq '2'}">
                                            <td>게시 종료</td>
                                        </c:if>
                                    </tr>
                                </c:forEach>
                                <c:if test="${ar eq null or fn:length(ar) eq 0}">
                                    <tr>
                                        <td colspan="5">현재 등록된 데이터가 없습니다.</td>
                                    </tr>
                                </c:if>
                                </tbody>
                            </table>
                        </form>

                        <a href="jsp/admin/notice/adminNoticeWrite.jsp" class="writeNotice">글쓰기</a>


                        <!--------------------- 페이지네이션 -------------------->
                        <nav class="pagination">
                            <c:if test="${requestScope.page ne null}">
                                <c:set var="pvo" value="${requestScope.page}" />

                                <!-- << (맨 처음으로) -->
                                <c:if test="${pvo.startPage > 1 && pvo.totalPage > 10}">
                                    <a href="AdminController?type=adBoard&amp;cPage=1&amp;keyword=${param.keyword}&amp;region=${param.region}&amp;theater=${param.theater}"
                                       class="control first" title="처음 페이지">&laquo;</a>
                                </c:if>

                                <!-- < (이전 페이지 블록) -->
                                <c:if test="${pvo.startPage > 1}">
                                    <a href="AdminController?type=adBoard&amp;cPage=${pvo.startPage - pvo.pagePerBlock}&amp;keyword=${param.keyword}&amp;region=${param.region}&amp;theater=${param.theater}"
                                       class="control prev" title="이전 블록">&lt;</a>
                                </c:if>

                                <!-- 페이지 번호 -->
                                <c:forEach begin="${pvo.startPage}" end="${pvo.endPage}" varStatus="st">
                                    <c:if test="${st.index eq pvo.nowPage}">
                                        <strong class="active">${st.index}</strong>
                                    </c:if>
                                    <c:if test="${st.index ne pvo.nowPage}">
                                        <a href="AdminController?type=adBoard&amp;cPage=${st.index}
                    <c:if test='${not empty param.keyword}'> &amp;keyword=${param.keyword}</c:if>
                    <c:if test='${not empty param.region}'> &amp;region=${param.region}</c:if>
                    <c:if test='${not empty param.theater}'> &amp;theater=${param.theater}</c:if>"
                                           title="${st.index}페이지 보기">${st.index}</a>
                                    </c:if>
                                </c:forEach>

                                <!-- > (다음 페이지 블록) -->
                                <c:if test="${pvo.endPage < pvo.totalPage}">
                                    <a href="AdminController?type=adBoard&amp;cPage=${pvo.startPage + pvo.pagePerBlock}&amp;keyword=${param.keyword}&amp;region=${param.region}&amp;theater=${param.theater}"
                                       class="control next" title="다음 블록">&gt;</a>
                                </c:if>

                                <!-- >> (맨 마지막으로) -->
                                <c:if test="${pvo.nowPage < pvo.totalPage && pvo.totalPage > 10}">
                                    <a href="AdminController?type=adBoard&amp;cPage=${pvo.totalPage}&amp;keyword=${param.keyword}&amp;region=${param.region}&amp;theater=${param.theater}"
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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
        const checkboxes = document.querySelectorAll('.checkbox');
        const endButton = document.getElementById('endNotice');
        const startButton = document.getElementById('startNotice');

        let isVisible = checkboxes[0].style.display === 'table-cell';

        checkboxes.forEach(checkbox => {
            checkbox.style.display = isVisible ? 'none' : 'table-cell';
        });

        // 삭제 버튼도 선택 버튼과 함께 보이게/숨기게
        endButton.style.display = isVisible ? 'none' : 'inline-block';
        startButton.style.display = isVisible ? 'none' : 'inline-block';
    });

    // 전체선택
    document.getElementById('selectAll').addEventListener('change', function () {
        const rowCheckboxes = document.querySelectorAll('.rowCheckbox');
        rowCheckboxes.forEach(checkbox => {
            checkbox.checked = this.checked;  // 전체 체크박스 상태에 따라 개별 체크박스 변경
        });
    });

    // 종료버튼 누를시
    $(document).ready(function () {
        $("#endNotice").on("click", function () {
            const selectedItems = $(".rowCheckbox:checked");

            if (selectedItems.length === 0) {
                alert("게시를 종료할 항목을 선택하세요.");
                return;
            }

            if (!confirm("선택한 항목을 종료하시겠습니까?")) {
                return;
            }

            let boardIdxList = [];
            selectedItems.each(function () {
                boardIdxList.push($(this).val());
            });

            $.ajax({
                url: "AdminController",
                type: "POST",
                data: {
                    type: "adWrite",
                    actionType: "end",
                    selectedNotice: boardIdxList.join(",")
                },
                dataType: "json",
                success: function (response) {
                    console.log("서버 응답:", response);

                    if (response.success) {
                        alert("선택한 항목이 종료되었습니다.");
                        location.reload();
                    } else {
                        alert("종료에 실패했습니다.");
                    }
                },
                error: function (xhr, status, error) {
                    console.error("AJAX 요청 오류:", error);
                    alert("서버 오류가 발생했습니다. 다시 시도해주세요.");
                }
            });
        });
    });

    // 게시버튼 누를시
    $(document).ready(function () {
        $("#startNotice").on("click", function () {
            const selectedItems = $(".rowCheckbox:checked");

            if (selectedItems.length === 0) {
                alert("게시할 항목을 선택하세요.");
                return;
            }

            if (!confirm("선택한 항목을 게시하시겠습니까?")) {
                return;
            }

            let boardIdxList = [];
            selectedItems.each(function () {
                boardIdxList.push($(this).val());
            });

            $.ajax({
                url: "AdminController",
                type: "POST",
                data: {
                    type: "adWrite",
                    actionType: "start",
                    selectedNotice: boardIdxList.join(",")
                },
                dataType: "json",
                success: function (response) {
                    console.log("서버 응답:", response);

                    if (response.success) {
                        alert("선택한 항목이 게시되었습니다.");
                        location.reload();
                    } else {
                        alert("게시에 실패했습니다.");
                    }
                },
                error: function (xhr, status, error) {
                    console.error("AJAX 요청 오류:", error);
                    alert("서버 오류가 발생했습니다. 다시 시도해주세요.");
                }
            });
        });
    });



    window.addEventListener("DOMContentLoaded", function () {
        const urlParams = new URLSearchParams(window.location.search);
        const currentPage = urlParams.get("cPage");

        // cPage가 없으면 1로 설정하고 페이지 새로고침
        if (!currentPage) {
            urlParams.set("cPage", "1");
            const newUrl = window.location.pathname + "?" + urlParams.toString();
            window.history.replaceState({}, "", newUrl);
        }
    });



</script>
</body>
</html>