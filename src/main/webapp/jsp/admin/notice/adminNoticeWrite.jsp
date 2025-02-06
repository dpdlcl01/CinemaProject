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

    .notice-form {
        margin-bottom: 15px;
    }
    .notice-form label {
        display: block;
        font-weight: bold;
        margin-bottom: 5px;
    }
    .notice-form input, .notice-form textarea {
        width: 100%;
        padding: 8px;
        border: 1px solid #ddd;
        border-radius: 4px;
    }
    .notice-form button {
        background-color: #01738b;
        color: #fff;
        padding: 10px 20px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }
    .notice-form button:hover {
        background-color: #005f73;
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
                    <h1>공지사항 작성</h1>
                    <form id="noticeForm" action="AdminController" method="post">
                        <input type="hidden" name="type" value="adWrite">
                        <input type="hidden" name="boardRegDate" id="boardRegDate">
                        <div class="notice-form">
                            <label for="title">제목</label>
                            <input type="text" id="title" name="title" required>
                        </div>

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
                        <select id="board" name="board">
                            <option value="">종류 선택</option>
                            <option value="NOTICE">공지</option>
                            <option value="EVENT">이벤트</option>
                        </select>
                        <select id="type" name="type">
                            <option value="">게시 상태 선택</option>
                            <option value="start">게시</option>
                            <option value="hold">임시</option>
                        </select>

                        <div class="notice-form">
                            <label for="content">내용</label>
                            <textarea id="content" name="content" rows="10" required></textarea>
                        </div>

                        <div class="notice-form">
                            <label for="file">첨부 파일</label>
                            <input type="file" id="file" name="file">
                        </div>

                        <div class="noticeForm">
                            <button type="submit">등록</button>
                        </div>
                    </form>
                </div>
        </div>
    </div>
</div>
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

</script>
</body>
</html>