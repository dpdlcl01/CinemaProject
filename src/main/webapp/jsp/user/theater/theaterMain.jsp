<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!Doctype html>
<html lang="ko">
<!-- head -->
<head>
  <jsp:include page="../common/head.jsp"/>
</head>

<body>
<!-- header 영역 -->
<jsp:include page="../common/header.jsp"/>

<style>
  /* h1 태그 타이틀 */
  .title {
/*    font-size: 30px;*/
    left: 3px;
    font-weight: normal;
  }
  /* article 공통 스타일 */
  article {
    margin-top: 30px;
    margin-bottom: 30px;
    width: 100%;
    display: flex;
    flex-direction: column;
    gap: 20px; /* 각 섹션 간 간격 */
  }

  /* 극장 목록 영역 */
  .theater-list {
    position: relative;
    width: 100%;
    min-height: 190px;
    border: 3px solid #686571;
    border-radius: 10px;
    overflow: hidden; /* 모서리 경계 밖 배경색 숨김 */
    background-color: #fff;
    box-sizing: border-box;
  }

  /* 탭 영역 */
  ul.tabs {
    margin: 0;
    padding: 0;
    display: flex;
    justify-content: space-between; /* 탭 간 균등 간격 */
    list-style: none;
    border-bottom: 1px solid #ccc;
  }

  ul.tabs li {
    flex: 1;
    text-align: center;
    padding: 10px 15px;
    cursor: pointer;
    box-sizing: border-box;
  }

  ul.tabs li.current {
    background: #ededed;
    color: #222;
    font-weight: bold;
  }

  /* 극장 목록 */
  .tab-content {
    display: none;
    font-size: 16px;
    color: #333;
  }

  .tab-content.current {
    display: flex;
    justify-content: space-between;
    gap: 10px;
  }

  .tab-content ul {
    display: flex;
    flex: 1;
    list-style: none;
    padding: 0;
    margin: 0;
  }

  .tab-content ul li {
    flex: 1;
    text-align: center;
    border-left: 1px solid #ddd;
    padding: 10px 0;
    box-sizing: border-box;
  }

  .tab-content ul li:first-child {
    border-left: none;
  }

  .tab-content ul li a {
    text-decoration: none;
    color: #444;
    font-size: 16px;
  }

  .tab-content ul li a:hover {
    color: #222;
  }

  /* 극장 목록 하단 선호극장 */
  .my-fav-theater {
    padding: 15px;
    background-color: #ecf0f4;
    border-radius: 0 0 10px 10px;
    display: flex;
    align-items: center; /* 텍스트와 버튼 정렬 */
    gap: 10px; /* 텍스트와 버튼 사이 간격 */
    justify-content: flex-start; /* 왼쪽 정렬 */
  }

  .my-fav-theater span {
    font-weight: bold;
  }

  /* 버튼 스타일 */
  button.login {
    height: 32px;
    padding: 0 12px;
    line-height: 30px;
    font-size: .9333em;
    border: 1px solid #503396;
    border-radius: 4px;
    background-color: #fff;
    color: #503396;
    cursor: pointer;
  }

  button.login:hover {
    background-color: #503396;
    color: #fff;
  }


  /* 극장 이벤트 섹션 */
  .theater-event {
    margin-top: 70px;
  }

  .theater-event .event-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
  }

  .theater-event .more {
    display: inline-flex;
    align-items: center;
    font-size: 14px;
    color: darkgrey; /* "더보기" 텍스트 색상 */
    text-decoration: none;
  }

  .theater-event .more i {
    margin-left: 5px;
    font-size: 12px;
    color: #503396;
  }

  .theater-event .more:hover {
    text-decoration: underline;
  }

  /* 이벤트 카드 리스트 */
  .theater-event .event-list ul {
    display: flex;
    gap: 20px; /* 카드 간 간격 */
    list-style: none;
    padding: 0;
    margin: 0;
  }

  .theater-event .event-list ul li {
    flex: 1; /* 카드 너비를 균등 분배 */
    overflow: hidden;
  }

  .theater-event .event-list ul li img {
    width: 100%;
    height: auto;
    display: block;
    border-radius: 5px;
  }

  .theater-event .event-list ul li div {
    margin-top: 10px;
    text-align: center;
    font-size: 16px;
    font-weight: bold;
    color: #333;
  }

  /* 극장 공지사항 섹션 */
  .theater-notice {
    margin-top: 70px;
  }

  .theater-notice .notice-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
  }

  .theater-event .event-title {
    font-size: 24px;
    font-weight: bold;
    color: #503396; /* 타이틀 색상 */
  }

  .theater-notice .notice-title {
    font-size: 24px;
    font-weight: bold;
    color: #503396; /* 타이틀 색상 */
  }

  .theater-notice .more {
    font-size: 14px;
    color: darkgrey;
    text-decoration: none;
  }

  .theater-notice .more:hover {
    text-decoration: underline;
  }


  li{
    list-style: none;
  }

  /* 공지사항 테이블 */
  table {
    width: 100%;
    /*height: 100%;*/
    border-collapse: collapse;
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


</style>

<!-- 상단 탭 영역 -->
<div class="page-util">
  <div class="inner-wrap">
    <div class="location">
      <span>Home</span>
      <a href="/CinemaProject/jsp/user/theater.jsp" title="극장 페이지로 이동">극장</a>
      <a href="/CinemaProject/jsp/user/theater.jsp" title="전체극장 페이지로 이동">전체극장</a>
    </div>
  </div>
</div>

<!-- contents 영역 -->
<div class="contents">

  <!-- title -->
  <div class="title">
    <h1>전체극장</h1>
  </div>

  <!-- 극장 목록 -->
  <article class="theater-list">
    <!-- 탭 목록 -->
    <ul class="tabs">
      <li class="tab-link current" data-tab="tab-1">서울</li>
      <li class="tab-link" data-tab="tab-2">경기</li>
      <li class="tab-link" data-tab="tab-3">인천</li>
      <li class="tab-link" data-tab="tab-4">대전/충청/세종</li>
      <li class="tab-link" data-tab="tab-5">부산/대구/경상</li>
      <li class="tab-link" data-tab="tab-6">광주/전라</li>
      <li class="tab-link" data-tab="tab-7">강원</li>
    </ul>

    <!-- 극장 목록 -->
    <div id="tab-1" class="tab-content current">
      <ul>
        <li><a href="/CinemaProject/jsp/user/theaterView.jsp">강남</a></li>
        <li><a href="#">센트럴</a></li>
        <li><a href="#">코엑스</a></li>
        <li><a href="#">홍대</a></li>
      </ul>
    </div>
    <div id="tab-2" class="tab-content">
      <ul>
        <li><a href="#">고양스타필드</a></li>
        <li><a href="#">수원스타필드</a></li>
        <li><a href="#">안성스타필드</a></li>
      </ul>
    </div>
    <div id="tab-3" class="tab-content">
      <ul>
        <li><a href="#">송도</a></li>
        <li><a href="#">청라지젤</a></li>
      </ul>
    </div>
    <div id="tab-4" class="tab-content">
      <ul>
        <li><a href="#">대전</a></li>
        <li><a href="#">세종나성</a></li>
      </ul>
    </div>
    <div id="tab-5" class="tab-content">
      <ul>
        <li><a href="#">대구신세계</a></li>
        <li><a href="#">부산극장</a></li>
      </ul>
    </div>
    <div id="tab-6" class="tab-content">
      <ul>
        <li><a href="#">광주하남</a></li>
        <li><a href="#">전주객사</a></li>
      </ul>
    </div>
    <div id="tab-7" class="tab-content">
      <ul>
        <li><a href="#">속초</a></li>
      </ul>
    </div>

    <!-- 선호극장 -->
    <div class="my-fav-theater">
      <span>나의 선호극장 정보</span>
      <button class="login">로그인하기</button>
    </div>
  </article>



  <!-- 극장 이벤트 -->
  <article class="theater-event">
    <!-- 섹션 제목 -->
    <div class="event-header">
      <h2 class="event-title">극장 이벤트</h2>
      <a href="#" class="more" title="극장 공지사항 더보기">더보기 <i class="iconset ico-arr-right-gray"></i></a>
    </div>

    <!-- 이벤트 카드 리스트 -->
    <div class="event-list">
      <ul>
        <!-- 첫 번째 이벤트 카드 -->
        <li>
          <a href="#" class="eventBtn" data-no="16362" data-netfunnel="N" title="[사상] 애니메이션 영화랑 매점 콜라보! 상세보기">
            <img src="https://img.megabox.co.kr/SharedImg/event/2025/01/08/ABZW30ApzQFKUAzDUosgKxHftaQTXCGn.jpg" alt="[사상] 애니메이션 영화랑 매점 콜라보!" onerror="noImg(this)" />
          </a>
        </li>
        <!-- 두 번째 이벤트 카드 -->
        <li>
          <a href="#" class="eventBtn" data-no="16948" data-netfunnel="N" title="[수원스타필드] Happy 1st Anniversary 상세보기">
            <img src="https://img.megabox.co.kr/SharedImg/event/2025/01/08/m1htf1m846GY1LSBLyJ4hGEBUaaH1UsN.jpg" alt="[수원스타필드] Happy 1st Anniversary" onerror="noImg(this)" />
          </a>
        </li>
      </ul>
    </div>
  </article>


  <!-- 극장 공지사항 -->
  <article class="theater-notice">
    <!-- 섹션 제목 -->
    <div class="notice-header">
      <h2 class="notice-title">극장 공지사항</h2>
      <a href="#" class="more" title="극장 공지사항 더보기">더보기 <i class="iconset ico-arr-right-gray"></i></a>
    </div>

    <div class="notic-table">
      <!-- 공지사항 테이블 -->
      <table>
        <thead>
        <tr>
          <th>극장</th>
          <th>제목</th>
          <th>지역</th>
          <th>등록일</th>
        </tr>
        </thead>
        <tbody>
        <tr>
          <td>코엑스</td>
          <td><a href="">[코엑스] 시사회 진행에 따른 고객 안내 (1월 14일)</a></td>
          <td>서울</td>
          <td>2025.01.10</td>
        </tr>
        <tr>
          <td>미사강변</td>
          <td><a href="">[미사강변] 내부 인테리어 공사에 따른 임시 휴업 안내 (25년 1월 14일)</a></td>
          <td>경기</td>
          <td>2025.01.09</td>
        </tr>
        <tr>
          <td>안성스타필드</td>
          <td><a href="">[안성스타필드] 대관 행사로 인한 조조영화 상영 안내 (1월 10일)</a></td>
          <td>경기</td>
          <td>2025.01.06</td>
        </tr>
        <tr>
          <td>대구신세계(동대구)</td>
          <td><a href="">[대구신세계] 우대요금 변경안내</a></td>
          <td>부산/대구/경상</td>
          <td>2024.12.31</td>
        </tr>
        <tr>
          <td>안산중앙</td>
          <td><a href="">[안산중앙] 주차공간 안내</a></td>
          <td>경기</td>
          <td>2024.12.26</td>
        </tr>
        </tbody>
      </table>
    </div>

  </article>

</div>

<!-- footer 영역 -->
<jsp:include page="../common/footer.jsp"/>

<!-- script 영역 -->
<script>
  document.addEventListener("DOMContentLoaded", function () {
    // 모든 탭과 콘텐츠 가져오기
    const tabs = document.querySelectorAll(".tabs li");
    const tabContents = document.querySelectorAll(".tab-content");

    // 탭 클릭 시 current 클래스를 변경하고 콘텐츠를 갱신
    tabs.forEach((tab, index) => {
      tab.addEventListener("click", () => {
        // 모든 탭과 콘텐츠에서 current 클래스 제거
        tabs.forEach(t => t.classList.remove("current"));
        tabContents.forEach(content => content.classList.remove("current"));

        // 선택된 탭과 해당 콘텐츠에 current 클래스 추가
        tab.classList.add("current");
        tabContents[index].classList.add("current");

        // 콘텐츠 내부 li 요소의 flex 처리
        const listItems = tabContents[index].querySelectorAll("ul li");
        listItems.forEach(item => {
          item.style.flex = "0 0 25%"; // 4등분
        });
      });
    });
  });
</script>
</body>
</html>