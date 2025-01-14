<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!Doctype html>
<html lang="ko">

<head>
    <jsp:include page="/jsp/user/common/head.jsp"/>
</head>
<style>
    h1 {
        margin-bottom: 20px;
    }

    #contents{
        margin: 50px auto;
        width: 1100px;
        height: auto;
    }

    body {
        font-family: 'Arial', sans-serif;
        margin: 0;
        padding: 0;
        background-color: #f9f9f9;
        display: block;
    }

    .clearfix {
        display: flex;
        max-width: 1200px;
        margin: 0 auto;
        padding: 20px;
        background-color: #fff;
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
        margin: auto;
        float: right;
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

    .tabs{
       border: 1px solid #d8d9db
    }

    /* 전체 컨테이너 */
    .YearTabs-container {
        display: flex;
        align-items: center;
        justify-content: space-between;
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
        width: 20px; /* 화살표 이미지 크기 */
        height: 20px;
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

</style>
<body>
<jsp:include page="/jsp/user/common/header.jsp"/>
<div id="contents">

    <div class="clearfix">
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
           <div>
            <h2>나의 무비 스토리</h2>
               <div class="tabs">
                   <div class="tab active" data-target="movieTimeline">무비타임라인</div>
                   <div class="tab" data-target="review">관람평</div>
                   <div class="tab" data-target="seeMove">본영화</div>
               </div>
               <div id="movieTimeline">
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
                       <div class="YearContent" id="2022">2022 Timeline Content</div>
                       <div class="YearContent" id="2023">2023 Review Content</div>
                       <div class="YearContent" id="2024">2024 Seen Movie Content</div>
                       <div class="YearContent active" id="2025">
                           나의 무비타임라인을 만들어보세요!
                       </div>
                   </div>

               </div>
           </div>
        </main>
    </div>
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