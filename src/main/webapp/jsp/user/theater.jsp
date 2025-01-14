<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!Doctype html>
<html lang="ko">
<!-- head -->
<head>
  <jsp:include page="./common/head.jsp"/>
</head>

<body>
<!-- header 영역 -->
<jsp:include page="./common/header.jsp"/>

<style>
  /* Page Util 스타일 */
  .page-util {
    background-color: #f8f8f8; /* 배경색 */
    border-bottom: 1px solid #ddd; /* 하단 경계선 */
    padding: 10px 0;
  }

  .page-util .inner-wrap {
    max-width: 1200px;
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
  }

  .page-util .location a:hover {
    text-decoration: underline; /* 호버 효과 */
  }

  /* 전체 컨테이너 */
  .res-main {
    width: 1000px;
    margin: 50px auto;
  }

  .res-container {
    padding: 20px;
    background: #fff;
    border-radius: 10px;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
  }

  /* 지역 메뉴 수평 배치 */
  /* 지역 선택 메뉴 */
  .date-navigation ul {
    display: flex;
    list-style: none;
    padding: 0;
    margin: 0;
    justify-content: space-around;
  }

  .date-navigation li {
    position: relative;
  }

  .date-navigation li button {
    background-color: #f8f8f8;
    border: 1px solid #ddd;
    padding: 10px 20px;
    border-radius: 5px;
    cursor: pointer;
    font-size: 16px;
  }

  .date-navigation li button:hover {
    background-color: #e6e6e6;
  }

  .date-navigation li .theater-list {
    display: none;
    position: absolute;
    top: 100%;
    left: 0;
    background-color: white;
    border: 1px solid #ddd;
    border-radius: 5px;
    width: 200px;
    z-index: 1000;
  }

  .date-navigation li:hover .theater-list {
    display: block;
  }

  .date-navigation li .theater-list ul {
    list-style: none;
    padding: 0;
    margin: 0;
  }

  .date-navigation li .theater-list ul li {
    padding: 10px;
    border-bottom: 1px solid #f5f5f5;
  }

  .date-navigation li .theater-list ul li a {
    color: #333;
    text-decoration: none;
  }

  .date-navigation li .theater-list ul li a:hover {
    text-decoration: underline;
  }


  /* 극장 리스트 스타일 */
  .theater-list ul {
    list-style: none;
    padding: 0;
    margin: 0;
  }

  .theater-list ul li {
    padding: 10px;
    border-bottom: 1px solid #eee;
    cursor: pointer;
  }

  .theater-list ul li:hover {
    background: #f5f5f5;
  }

  .theater-list ul li:last-child {
    border-bottom: none;
  }

  button {
    height: 32px;
    padding: 0 12px;
    line-height: 30px;
    font-size: .9333em;
    display: inline-block;
    margin: 0;
    text-align: center;
    font-weight: 400;
    border-radius: 4px;
    font-family: NanumBarunGothic, Dotum, '돋움', sans-serif;
    border: 1px solid #503396;
    vertical-align: middle;
    background-color: #fff;
  }
  a{
    text-decoration: none;
    color: black;
  }

  ul.tabs {
    margin: 0px;
    padding: 0px;
    list-style: none;
  }

  ul.tabs li {
    background: none;
    color: #222;
    display: inline-block;
    padding: 10px 15px;
    cursor: pointer;
  }

  .tabs ul li a {
    color: #444;
  }

  a:link {
    color: #444;
    text-decoration: none;
  }

  ul.tabs li.current {
    background: #ededed;
    color: #222;
  }

  .tab-content {
    display: none;
    background: #ededed;
    padding: 15px;
  }

  .tab-content.current {
    display: inherit;
  }

  li {
    display: inline-block;
  }

  .wrap {
    position: relative;
    display: block;
    width: 100%;
    min-height: 190px;
    border: 3px solid #686571;
    border-radius: 10px;
  }

  .tab-content { .theater-box .theater-list { display:none;
    position: absolute;
    left: 0;
    top: 48px;
    width: 100%;
    min-height: 85px;
    padding: 30px 0;
  }

  }
  .my-fav-theater {
    position: absolute;
    padding: 0 20px;
    width: 100%;
    bottom: 0;
    left: 0;
    line-height: 54px;
    border-radius: 0 0 10px 10px;
    background-color: #ecf0f4;
  }
  button {
    height: 32px;
    padding: 0 12px;
    line-height: 30px;
    font-size: .9333em;
    display: inline-block;
    margin: 0;
    text-align: center;
    font-weight: 400;
    border-radius: 4px;
    font-family: NanumBarunGothic, Dotum, '돋움', sans-serif;
    border: 1px solid #503396;
    vertical-align: middle;
    background-color: #fff;
  }

  ul.tabs {
    margin: 0px;
    padding: 0px;
    list-style: none;
  }

  ul.tabs li {
    background: none;
    color: #222;
    display: inline-block;
    padding: 10px 15px;
    cursor: pointer;
  }

  .tabs ul li a {
    color: #444;
  }

  a:link {
    color: #444;
    text-decoration: none;
  }

  ul.tabs li.current {
    background: #ededed;
    color: #222;
  }

  .tab-content {
    display: none;
    background: #ededed;
    padding: 15px;
  }

  .tab-content.current {
    display: inherit;
  }

  li {
    display: inline-block;
  }

  .theater-box .user-theater {
    position: absolute;
    padding: 0 20px;
    width: 100%;
    bottom: 0;
    left: 0;
    line-height: 54px;
    border-radius: 0 0 10px 10px;
    background-color: #ecf0f4;
  }

  .wrap {
    position: relative;
    display: block;
    width: 100%;
    min-height: 190px;
    border: 3px solid #686571;
    border-radius: 10px;
  }


  .my-fav-theater {
    position: absolute;
    padding: 0 20px;
    width: 100%;
    bottom: 0;
    left: 0;
    line-height: 54px;
    border-radius: 0 0 10px 10px;
    background-color: #ecf0f4;
  }
</style>

<!-- container 영역 -->
<div class="container">

  <div class="page-util">
    <div class="inner-wrap">
      <div class="location">
        <span>Home</span>
        <a href="/CinemaProject/jsp/user/theater.jsp" title="극장 페이지로 이동">극장</a>
        <a href="/CinemaProject/jsp/user/theater.jsp" title="전체극장 페이지로 이동">전체극장</a>
      </div>
    </div>
  </div>

  <!-- content -->
  <div class="mt-5">
    <h1>전체극장</h1>
  </div>
  <div class="wrap">
    <ul class="tabs">
      <li class="tab-link current" style="width: 11.8%" data-tab="tab-1">서울</li>
      <li class="tab-link" style="width: 11.8%" data-tab="tab-2">경기</li>
      <li class="tab-link" style="width: 11.8%" data-tab="tab-3">인천</li>
      <li class="tab-link" style="width: 11.8%" data-tab="tab-4">대전</li>
      <li class="tab-link" style="width: 11.8%" data-tab="tab-5">부산</li>
      <li class="tab-link" style="width: 11.8%" data-tab="tab-6">광주</li>
      <li class="tab-link" style="width: 11.8%" data-tab="tab-7">강원</li>
    </ul>
    <div id="tab-1" class="tab-content current">
      <ul>
        <c:forEach var="theater" items="${theaters.seoul}">
          <li class="theaterName" style="width: 23.6%"><a
                  href="detail?no=${theater.no }">${theater.name}</a></li>
        </c:forEach>
      </ul>
    </div>
    <div id="tab-2" class="tab-content">
      <ul>
        <c:forEach var="theater" items="${theaters.kyungki}">
          <li class="theaterName" style="width: 23.6%"><a
                  href="detail?no=${theater.no }">${theater.name}</a></li>
        </c:forEach>
      </ul>
    </div>
    <div id="tab-3" class="tab-content">
      <ul>
        <c:forEach var="theater" items="${theaters.incheon}">
          <li class="theaterName" style="width: 23.6%"><a
                  href="detail?no=${theater.no }">${theater.name}</a></li>
        </c:forEach>
      </ul>
    </div>
    <div id="tab-4" class="tab-content">
      <ul>
        <c:forEach var="theater" items="${theaters.daejeon}">
          <li class="theaterName" style="width: 23.6%"><a
                  href="detail?no=${theater.no }">${theater.name}</a></li>
        </c:forEach>
      </ul>
    </div>
    <div id="tab-5" class="tab-content">
      <ul>
        <c:forEach var="theater" items="${theaters.busan}">
          <li class="theaterName" style="width: 23.6%"><a
                  href="detail?no=${theater.no }">${theater.name}</a></li>
        </c:forEach>
        <::after></::after>
      </ul>
    </div>
    <div id="tab-6" class="tab-content">
      <ul>
        <c:forEach var="theater" items="${theaters.kwangju}">
          <li class="theaterName" style="width: 23.6%"><a
                  href="detail?no=${theater.no }">${theater.name}</a></li>
        </c:forEach>
        <::after></::after>
      </ul>
    </div>
    <div id="tab-7" class="tab-content">
      <ul>
        <c:forEach var="theater" items="${theaters.kangwon}">
          <li class="theaterName" style="width: 23.6%"><a
                  href="detail?no=${theater.no }">${theater.name}</a></li>
        </c:forEach>
        <::after></::after>
      </ul>
    </div>
    <div class="my-fav-theater">
      나의 선호영화관 정보 <a href="/common/loginFormModal.jsp" id="moveLogin"><button class="login">로그인하기</button></a>
    </div>
  </div>

</div>


      <div class="tit-util mt70 mb15">
        <h3 class="tit">극장 이벤트</h3>
        <a href="/event/theater" class="more" title="극장 이벤트 더보기">더보기 <i class="iconset ico-arr-right-gray"></i></a>
      </div>

      <div class="event-box">
        <ul>

          <li>
            <a href="#" class="eventBtn" data-no="16362" data-netfunnel="N" title="[사상] 애니메이션 영화랑 매점 콜라보! 상세보기">
              <img src="https://img.megabox.co.kr/SharedImg/event/2025/01/08/ABZW30ApzQFKUAzDUosgKxHftaQTXCGn.jpg" alt="[사상] 애니메이션 영화랑 매점 콜라보!" onerror="noImg(this)" />
            </a>
          </li>

          <li>
            <a href="#" class="eventBtn" data-no="16948" data-netfunnel="N" title="[수원스타필드] Happy 1st Anniversary 상세보기">
              <img src="https://img.megabox.co.kr/SharedImg/event/2025/01/08/m1htf1m846GY1LSBLyJ4hGEBUaaH1UsN.jpg" alt="[수원스타필드] Happy 1st Anniversary" onerror="noImg(this)" />
            </a>
          </li>

        </ul>
      </div>


      <div class="tit-util mt70 mb15">
        <h3 class="tit">극장 공지사항</h3>
        <a href="/support/notice?ti=3" class="more" title="극장 공지사항 더보기">더보기 <i class="iconset ico-arr-right-gray"></i></a>
      </div>

      <div class="table-wrap">
        <table class="board-list">
          <caption>극장, 제목, 지역, 등록일이 들어간 극장 공지사항 목록</caption>
          <colgroup>
            <col style="width:150px;">
            <col>
            <col style="width:150px;">
            <col style="width:120px;">
          </colgroup>
          <thead>
          <tr>
            <th scope="col">극장</th>
            <th scope="col">제목</th>
            <th scope="col">지역</th>
            <th scope="col">등록일</th>
          </tr>
          </thead>
          <tbody>



          <tr>
            <td>코엑스</td>
            <th scope="row">
              <a href="/support/notice/detail?artiNo=11237&bbsNo=9" title="[코엑스]시사회 진행에 따른 고객 안내 &#40;1월 14일&#41; 상세보기">
                [코엑스]시사회 진행에 따른 고객 안내 &#40;1월 14일&#41;
              </a>
            </th>
            <td>서울</td>
            <td>2025.01.10</td>
          </tr>

          <tr>
            <td>미사강변</td>
            <th scope="row">
              <a href="/support/notice/detail?artiNo=11235&bbsNo=9" title="[미사강변] 내부 인테리어 공사에 따른 임시 휴업 안내 &#40;25년 1월 14일&#41; 상세보기">
                [미사강변] 내부 인테리어 공사에 따른 임시 휴업 안내 &#40;25년 1월 14일&#41;
              </a>
            </th>
            <td>경기</td>
            <td>2025.01.09</td>
          </tr>

          <tr>
            <td>안성스타필드</td>
            <th scope="row">
              <a href="/support/notice/detail?artiNo=11232&bbsNo=9" title="[안성스타필드]대관 행사로 인한 조조영화 상영 안내 &#40;1월 10일&#41; 상세보기">
                [안성스타필드]대관 행사로 인한 조조영화 상영 안내 &#40;1월 10일&#41;
              </a>
            </th>
            <td>경기</td>
            <td>2025.01.06</td>
          </tr>

          <tr>
            <td>대구신세계&#40;동대구&#41;</td>
            <th scope="row">
              <a href="/support/notice/detail?artiNo=11226&bbsNo=9" title="[대구신세계]우대요금 변경안내 상세보기">
                [대구신세계]우대요금 변경안내
              </a>
            </th>
            <td>부산/대구/경상</td>
            <td>2024.12.31</td>
          </tr>

          <tr>
            <td>안산중앙</td>
            <th scope="row">
              <a href="/support/notice/detail?artiNo=11222&bbsNo=9" title="[안산중앙] 주차공간 안내 상세보기">
                [안산중앙] 주차공간 안내
              </a>
            </th>
            <td>경기</td>
            <td>2024.12.26</td>
          </tr>




          </tbody>
        </table>
      </div>

    </div>
  </div>
</div>

<!-- 		</div> -->

<!-- footer 영역 -->
<jsp:include page="./common/footer.jsp"/>

<!-- script 영역 -->
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
</script>
</body>
</html>