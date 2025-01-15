<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!Doctype html>
<html lang="ko">

<head>
    <jsp:include page="/jsp/user/common/head.jsp"/>
<link rel="stylesheet" href="../../css/user/common.css">
</head>
<style>

    * {
        box-sizing: border-box;
    }

    /* 상단 메뉴바 Page Util */
    .page-util {
        background-color: #f8f8f8; /* 배경색 */
        border-bottom: 1px solid #ddd; / 하단 경계선 /
        /*padding: 10px 0;*/
    }
    .page-util .inner-wrap {
        max-width: 1100px;
        height: 40px;
        margin: 0 auto;
        display: flex;
        align-items: center;
        justify-content: flex-start; /* 왼쪽 정렬 */
        font-size: 14px;
        color: #333;
    }
    .page-util .location span {
        font-weight: bold;
        margin-right: 10px;
    }
    .page-util .location a {
        color: #0078ff;
        text-decoration: none;
        margin-left: 10px;
        pointer-events: none;
        cursor: default;
    }
    .page-util .location a:hover {
        text-decoration: none; /* 호버 효과 */
    }

    h1 {
        margin-bottom: 20px;
    }

    #contents{
        display: flex;
        margin: 50px auto;
        height: auto;
        width: 1100px;
    }

    .sidebar {
        width: 250px;
        order: 0;
        background-color: #f8f8f8;
        border-right: 1px solid #ddd;
        padding: 20px;
        box-sizing: border-box;
    }
    .sidebar ul {
        list-style: none;
        padding: 0;
    }
    .sidebar ul li {
        margin-bottom: 10px;
    }
    .sidebar ul li a {
        text-decoration: none;
        color: #333;
        font-size: 14px;
    }

    .main-content {
        width: 75%;
        /*margin: auto;*/
        margin-left: 30px;
    }
    .section h2 {
        font-size: 18px;
        margin-bottom: 10px;
    }
/* 여기부터 작업함*/
    .sidebar .tit {
        overflow: hidden;
        margin: 0;
        padding: 0;
        border-radius: 10px 10px 0 0;
        background: url(https://img.megabox.co.kr/static/pc/images/common/bg/bg-lnb-tit.png) 0 0;
    }

    .sidebar .tit a {
        display: block;
        width: 100%;
        font-size: 1.2em;
        line-height: 90px;
        text-align: center;
        color: #fff;
        text-decoration: none;
    }
    /*기본 탭*/
    .tabs {
        display: flex;
        border: 0;
    }
    .tab {
        flex: 1;
        text-align: center;
        padding: 10px 20px;
        background-color: white;
        cursor: pointer;
        border: 1px solid #ddd;
    }

    .tab:not(:last-child) {
        border-right: none;
    }

    .tab.active {
        background-color: gray;
        color: white;
        font-weight: bold;
        border-color: gray;
    }

    /* 전체 컨테이너 */
    .YearTabs-container {
        display: flex;
        align-items: center;
        /*justify-content: space-between;*/
        margin: 20px 0;
    }

    /* 화살표 버튼 스타일 */
    .arrow {
        background: none;
        border: none;
        cursor: pointer;
        padding: 5px;
        display: flex;
        align-items: center;
        justify-content: center;
    }

    .arrow img {
        width: 30px; /* 화살표 이미지 크기 */
        height: 50px;
    }


    /* 탭 컨테이너 */
    .YearTabs {
        display: flex;
        overflow: hidden;
        flex: 1; /* 중간에 탭이 넓게 차지 */
        justify-content: center;
        gap: 15px; /* 탭 사이 간격 */
    }

    /* 개별 탭 스타일 */
    .YearTab {
        text-align: center;
        padding: 10px 15px;
        cursor: pointer;
        font-size: 16px;
        white-space: nowrap; /* 줄바꿈 방지 */
        position: relative;
        color: #333;
        transition: color 0.3s ease; /* 탭 색상 전환 애니메이션 */
    }

    .YearTab:hover {
        color: #6a0dad; /* 보라색으로 강조 */
    }

    .YearTab.active {
        color: #6a0dad; /* 활성화된 탭 색상 */
    }

    /* 활성화된 탭 밑줄 표시 */
    .YearTab.active::after {
        content: '';
        display: block;
        height: 3px;
        background-color: #6a0dad;
        position: absolute;
        bottom: 0;
        left: 0;
        right: 0;
    }

    /* 콘텐츠 영역 */
    .YearContents {
        margin-top: 20px;
    }

    .YearContent {
        display: none; /* 기본적으로 숨김 */
    }

    .YearContent.active {
        display: block; /* 활성화된 콘텐츠만 표시 */
    }



    /*나의 무비스토리 */
    .my-timeline-list ol .movie li .img img {
        width: 100%;
        height: auto;
    }

    .my-timeline-list ol li .date {
        position: relative;
    }
    .my-timeline-list ol li .date p {
        display: block;
        position: relative;
        z-index: 3;
        width: 120px;
        height: 32px;
        margin: 0 auto;
        padding: 0;
        line-height: 32px;
        text-align: center;
        color: #fff;
        border-radius: 16px;
        background-color: #339eb2;
    }

    .my-timeline-list ol li .date:after {
        content: '';
        display: block;
        position: absolute;
        left: 0;
        top: 16px;
        width: 100%;
        height: 1px;
        background-color: #339eb2;
    }

    .my-timeline-list ol .movie li {
        position: relative;
        min-height: 170px;
        margin: 0;
        padding: 10px 0 10px 120px;
    }

    .my-timeline-list ol .movie li .img {
        position: absolute;
        left: 0;
        top: 10px;
        width: 90px;
        height: 130px;
        font-size: 0;
        line-height: 0;
    }
    .my-timeline-list ol .movie li .cont .label {
        overflow: hidden;
        display: inline-block;
        height: 26px;
        margin: 0;
        padding: 0 20px;
        line-height: 24px;
        border-radius: 13px;
        border: 1px solid #666;
        text-align: center;
    }
    .my-timeline-list ol .movie li .cont .tit {
        display: block;
        padding: 5px 0 0 0;
        font-size: 1.2em;
        font-weight: 700;
        line-height: 1.3;
    }
    .my-timeline-list ol .movie li .cont .theater {
        padding-top: 5px;
    }
    .my-timeline-list p {
        margin: 0;
        padding: 0;
    }
    .my-appraisal {
        overflow: hidden;
        border-top: 1px solid #555;
    }

    .my-appraisal ul li {
        position: relative;
        min-height: 170px;
        padding: 20px 0 20px 120px;
        border-bottom: 1px solid #eaeaea;
    }

    .my-appraisal ul li.no-result {
        min-height: auto;
        padding: 50px 0;
        font-size: 1.2em;
        text-align: center;
    }

    /*본영화*/
    .my-saw-movie ul {
        overflow: hidden;
        margin-bottom: -20px;
    }

    .my-saw-movie ul li:nth-child(2n) {
        float: right;
    }
    .my-saw-movie ul li {
        overflow: hidden;
        float: left;
        position: relative;
        width: auto;
        height: 230px;
        margin: 0 0 20px 0;
        padding: 0;
        border-radius: 10px;
        border: 1px solid #eaeaea;
    }

    .my-saw-movie ul li .img {
        position: absolute;
        left: 29px;
        top: 30px;
        width: 90px;
        height: 130px;
        font-size: 0;
        line-height: 0;
    }

    .my-saw-movie ul li .img img {
        width: 100%;
        height: auto;
    }

    .my-saw-movie ul li .cont {
        min-height: 189px;
        padding: 30px 49px 0 149px;
    }

    .ico-pencil {
        width: 18px;
        height: 18px;
        background-image: url(https://img.megabox.co.kr/static/pc/images/common/ico/ico-pencil.png);
    }

    .iconset {
        overflow: hidden;
        display: inline-block;
        margin: -1px 0 0 0;
        padding: 0;
        font-size: 0;
        line-height: 0;
        vertical-align: middle;
        background-position: 0 0;
        background-repeat: no-repeat;
    }

    .my-saw-movie ul li .btn-group .btn {
        display: block;
        float: left;
        width: 100%;
        height: 39px;
        line-height: 38px;
        margin: 0;
        padding: 0;
        border: 0;
        border-top: 1px solid #eaeaea;
        text-decoration: none;
        background-color: transparent;
    }
    a:link {
        color: #444;
        text-decoration: none;
    }

    .my-saw-movie ul li .btn-group {
        overflow: hidden;
        position: relative;
        padding: 0 105px 0 0;
    }
    .button {
        display: inline-block;
        height: 36px;
        margin: 0;
        padding: 0 15px;
        text-align: center;
        line-height: 34px;
        color: #503396;
        font-weight: 400;
        border-radius: 4px;
        font-family: NanumBarunGothic, Dotum, '돋움', sans-serif;
        text-decoration: none;
        border: 1px solid #503396;
        vertical-align: middle;
        background-color: #fff;
        cursor: pointer;
    }

    .btn-group {
        padding: 20px 0 30px 0;
        margin: 0;
        text-align: center;
    }

    .my-saw-movie ul li .btn-group .btn.del {
        position: absolute;
        right: 0;
        top: 0;
        width: 105px;
        border-left: 1px solid #eaeaea;
        font-size: 16px;
    }

    .mb20 {
        margin-bottom: 20px !important;
    }
    .mypage-infomation {
        position: relative;
        min-height: 36px;
        padding-bottom: 10px;
    }

    .my-saw-movie ul li .btn-group .btn:hover i.ico-pencil {
        background-image: url(https://img.megabox.co.kr/static/pc/images/common/ico/ico-pencil-white.png)
    }

    .my-saw-movie ul li .btn-group .btn.review:hover {
        background-color: #01738b;
        border-color: #01738b
    }

    .my-saw-movie ul li .btn-group .btn.del:hover {
        background-color: #01738b;
        border-color: #01738b
    }


    .mypage-infomation .btn-group {
        position: absolute;
        top: 0;
        right: 0;
        padding: 0;
        margin: 0;
    }
    .dot-list>li {
        position: relative;
        padding: 0 0 0 8px;
    }

</style>
<body>
<jsp:include page="/jsp/user/common/header.jsp"/>
<div class="page-util">
    <div class="inner-wrap">
        <div class="location">
            <span>Home</span>
            <a href="/booking" title="나의 메가박스 페이지로 이동">나의 메가박스</a>
            <a href="/booking" title="나의 무비스토리 페이지로 이동" class="pageUtila">나의 무비스토리</a>
        </div>
    </div>
</div>
<div id="contents">
        <div class="sidebar">
            <p class="tit"><a href="#" title="나의 메가박스">나의 메가박스</a></p>
            <ul>
                <li><a href="Reservation.jsp" title="예매/구매내역">예매/구매내역</a></li>
                <li><a href="Admission-Ticket.jsp" title="영화/스토어 관람권">영화/스토어 관람권</a></li>
                <li><a href="Discount-Coupon.jsp" title="메가박스/제휴쿠폰">메가박스/제휴쿠폰</a></li>
                <li><a href="MemberShip.jsp" title="멤버십 포인트">멤버십 포인트</a></li>
                <li><a href="moviestory.jsp" title="나의 무비스토리"><strong>나의 무비스토리</strong></a></li>
                <li><a href="#" title="회원정보">회원정보</a></li>
            </ul>
        </div>

        <main class="main-content">
            <h2>나의 무비 스토리</h2>
           <div>
               <div class="tabs">
                   <div class="tab active" data-target="movieTimeline">무비타임라인</div>
                   <div class="tab" data-target="review">관람평</div>
                   <div class="tab" data-target="seeMove">본영화</div>
               </div>
               <div id="movieTimeline" class="content active">
                   <div class="YearTabs-container">
                       <!-- 이전 화살표 버튼 -->
                       <button class="arrow prev" aria-label="Previous tab">
                           <img src="https://img.megabox.co.kr/static/pc/images/mypage/btn-timeline-prev.png" alt="Previous">
                       </button>
                       <!-- 탭 버튼들 -->
                       <div class="YearTabs">
                           <div class="YearTab" data-target="2022">2022</div>
                           <div class="YearTab" data-target="2023">2023</div>
                           <div class="YearTab" data-target="2024">2024</div>
                           <div class="YearTab active" data-target="2025">2025</div>
                       </div>

                       <!-- 다음 화살표 버튼 -->
                       <button class="arrow next" aria-label="Next tab">
                           <img src="https://img.megabox.co.kr/static/pc/images/mypage/btn-timeline-next.png" alt="Next">
                       </button>
                   </div>

                   <!-- 각 탭에 연결된 콘텐츠 -->
                   <div class="YearContents">
                       <div class="YearContent" id="2022">
                           <div class="my-timeline-list myTimeline" style="display: block;">
                               <ol>
                                   <li>
                                       <div class="date">
                                           <p>2022.08.13</p>
                                       </div>
                                       <ul class="movie">
                                           <li>
                                               <a href="#" title="헌트 상세보기" class="img">
                                                   <img src="https://img.megabox.co.kr/SharedImg/2022/08/05/QDUC0cjm2bnWDCCQPYpQvelnoFe1CCfH_230.jpg" alt="헌트"></a>
                                               <div class="cont">
                                                   <p class="label">본영화</p>
                                                   <p class="tit"><a href="#" title="헌트 상세보기">헌트</a></p>
                                                   <div class="theater">
                                                       <p>수원남문</p>
                                                       <p>컴포트 3관(리클라이너)</p>
                                                       <p>2022.08.13(토) 13:40 (3회차)</p>
                                                   </div>
                                               </div>
                                           </li>
                                       </ul>
                                   </li>
                                   <li>
                                       <div class="date">
                                           <p>2022.05.28</p>
                                       </div>
                                       <ul class="movie">
                                           <li>
                                       <a href="#" title="범죄도시 2 상세보기" class="img">
                                           <img src="https://img.megabox.co.kr/SharedImg/2022/05/23/oZfETtpEvKGpdY2JQo2Z6wFL0S4cpKy5_230.jpg" alt="범죄도시 2">
                                       </a>
                                       <div class="cont">
                                           <p class="label">본영화</p>
                                           <p class="tit"><a href="#" title="범죄도시 2 상세보기">범죄도시 2</a>
                                           </p><div class="theater">
                                           <p>수원남문</p>
                                           <p>컴포트 4관(리클라이너)</p>
                                           <p>2022.05.28(토) 18:30 (5회차)</p>
                                       </div>
                                       </div>
                                   </li>
                                   </ul>
                                   </li>
                               </ol>
                           </div>
                       </div>
                       <div class="YearContent" id="2023">
                           <div class="my-appraisal">
                               <ul>
                                   <li class="no-result">등록된 타임라인이 없습니다.</li>
                               </ul>
                           </div>
                       </div>
                       <div class="YearContent" id="2024">
                           <div class="my-appraisal">
                               <ul>
                                   <li class="no-result">등록된 타임라인이 없습니다.</li>
                               </ul>
                           </div>
                       </div>
                       <div class="YearContent" id="2025">
                           <div class="my-appraisal">
                               <ul>
                                   <li class="no-result">나의 무비타임라인을 만들어보세요!</li>
                               </ul>
                           </div>
                       </div>
                   </div>
               </div>

               <div id="review" class="content">
                   <div class="my-appraisal">
                       <ul>
                           <li class="no-result">등록된 한줄평이 없습니다.</li>
                       </ul>
                   </div>
               </div>

               <div id="seeMove" class="content">
<%--                   <div class="my-appraisal">--%>
<%--                       <ul id="">--%>
<%--                           <li class="no-result">본영화가 표시 됩니다.</li>--%>
<%--                       </ul>--%>
                       <div class="mypage-infomation mt20" style="display: block;">
                           <ul class="dot-list mb20">
                               <li>극장에서 발권하신 티켓 바코드 하단의 거래번호를 통해 본 영화 등록을 하실 수 있습니다.</li>
                               <li>본영화는 관람한 인원수에 한해 등록이 가능합니다.</li>
                           </ul>
                           <div class="btn-group right" style="display: block;">
                               <a href="#" class="button" title="본 영화 등록">본 영화 등록</a>
                           </div>
                       </div>
                       <div class="my-saw-movie" style="display: block;">
                           <ul id="mySawMovie">
                               <li>
                                   <p class="img posterImg">
                                       <img src="https://img.megabox.co.kr/SharedImg/2022/08/05/QDUC0cjm2bnWDCCQPYpQvelnoFe1CCfH_230.jpg" alt="헌트">
                                   </p>    <div class="cont">
                                   <p class="tit"><a href="#" title="헌트 상세보기">헌트</a></p>
                                   <div class="theater">
                                       <p>수원남문</p>
                                       <p>컴포트 3관(리클라이너)</p>
                                       <p>2022.08.13(토) 13:40 (3회차)</p>
                                   </div>
                               </div>
                                   <div class="btn-group">
                                       <a href="#" class="btn review moveOneBtn" title="관람평쓰기">
                                           <i class="iconset ico-pencil"></i> 관람평쓰기</a>
                                       <button type="button" class="btn del deleteBtn">삭제</button>
                                   </div>
                               </li>
                               <li>
                                   <p class="img posterImg">
                                       <img src="https://img.megabox.co.kr/SharedImg/2022/05/23/oZfETtpEvKGpdY2JQo2Z6wFL0S4cpKy5_230.jpg" alt="범죄도시 2"></p>
                                   <div class="cont">
                                       <p class="tit">
                                           <a href="#" title="범죄도시 2 상세보기">범죄도시 2</a>
                                       </p>
                                       <div class="theater">
                                           <p>수원남문</p>
                                           <p>컴포트 4관(리클라이너)</p>
                                           <p>2022.05.28(토) 18:30 (5회차)</p>
                                       </div>
                                   </div>
                                   <div class="btn-group">
                                   <a href="#" class="btn review moveOneBtn" title="관람평쓰기">
                                       <i class="iconset ico-pencil"></i> 관람평쓰기</a>
                                   <button type="button" class="btn del deleteBtn">삭제</button>
                               </div>
                               </li>
                           </ul>
                       </div>
                   </div>
               </div>
<%--           </div>--%>
        </main>
    </div>

<jsp:include page="/jsp/user/common/footer.jsp"/>

<script>
    const tabs = document.querySelectorAll('.tab');
    const contents = document.querySelectorAll('.content');

    tabs.forEach(tab => {
        tab.addEventListener('click', () => {
            tabs.forEach(t => t.classList.remove('active'));
            tab.classList.add('active');

            const target = tab.getAttribute('data-target');
            contents.forEach(content => {
                content.classList.remove('active');
                if (content.id === target) {
                    content.classList.add('active');
                }
            });
        });
    });

    const tabButtons = document.querySelectorAll('.YearTab');
    const tabPanels = document.querySelectorAll('.YearContent');
    const prevButton = document.querySelector('.arrow.prev');
    const nextButton = document.querySelector('.arrow.next');
    let currentIndex = 0;

    // 탭 및 화살표 전환
    function activateTab(index) {
        tabButtons[currentIndex].classList.remove('active');
        tabPanels[currentIndex].classList.remove('active');
        tabButtons[index].classList.add('active');
        tabPanels[index].classList.add('active');
        currentIndex = index;

        // 화살표 상태 업데이트
        prevButton.disabled = index === 0;
        nextButton.disabled = index === tabButtons.length - 1;
        prevButton.style.opacity = prevButton.disabled ? '0.5' : '1';
        nextButton.style.opacity = nextButton.disabled ? '0.5' : '1';
    }

    // 탭 클릭 이벤트
    tabButtons.forEach((button, index) =>
        button.addEventListener('click', () => activateTab(index))
    );

    // 화살표 클릭 이벤트
    prevButton.addEventListener('click', () => activateTab(currentIndex - 1));
    nextButton.addEventListener('click', () => activateTab(currentIndex + 1));

    // // 초기 상태
    activateTab(3);


</script>
</body>
</html>