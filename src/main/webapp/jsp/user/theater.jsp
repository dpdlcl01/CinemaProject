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

  /* 메인 컨테이너 */
  /*.res-container {*/
  /*    max-width: 1200px;*/
  /*    margin: 20px auto;*/
  /*    !*margin-top: 100px;*!*/
  /*    !*margin-bottom: 100px;*!*/
  /*    height: 100%;*/
  /*    padding: 20px;*/
  /*    background: #fff;*/
  /*    border-radius: 10px;*/
  /*    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);*/
  /*}*/

  .res-main {
    width: 1000px;
    margin: 50px auto;
  }
  .res-title {
    font-size: 30px;
    left: 3px;
    font-weight: normal;
  }

  .res-container {
    padding: 20px;
    background: #fff;
    border-radius: 10px;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
  }

  /* 메인 컨텐츠 */
  .content {
    display: grid;
    grid-template-columns: 2fr 2fr 3fr;
    gap: 20px;
  }

  /* 각 섹션 */
  section {
    border: 1px solid #ddd;
    border-radius: 10px;
    padding: 20px;
    background: #fff;
  }

  section h2 {
    font-size: 1.2em;
    margin-bottom: 15px;
  }

  /* 리스트 스타일 */
  section ul {
    list-style: none;
    padding: 0;
    margin: 0;
  }

  section ul li {
    padding: 10px;
    border-bottom: 1px solid #eee;
    cursor: pointer;
  }

  section ul li:hover {
    background: #f5f5f5;
  }

  section ul li:last-child {
    border-bottom: none;
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
  <div id="contents" class="no-padding">


    <!--// theater-main -->

    <div class="res-main">

      <h1 class="res-title">전체극장</h1>

      <div class="res-container">
        <div class="date-navigation">
          <ul>

            <li class="on">
              <button type="button" class="sel-city">서울
              </button>
              <div class="theater-list">
                <ul>
                  <li data-brch-no="1372">
                    <a href="/theater?brchNo=1372" title="강남 상세보기">강남</a>
                  </li>
                  <li data-brch-no="1371">
                    <a href="/theater?brchNo=1371" title="센트럴 상세보기">센트럴</a>
                  </li>
                  <li data-brch-no="1351">
                    <a href="/theater?brchNo=1351" title="코엑스 상세보기">코엑스</a>
                  </li>
                  <li data-brch-no="1212">
                    <a href="/theater?brchNo=1212" title="홍대 상세보기">홍대</a>
                  </li>
                </ul>
              </div>
            </li>

            <li>
              <button type="button" class="sel-city">경기
              </button>
              <div class="theater-list">
                <ul>
                  <li data-brch-no="4121">
                    <a href="/theater?brchNo=4121" title="고양스타필드 상세보기">고양스타필드</a>
                  </li>
                  <li data-brch-no="0062">
                    <a href="/theater?brchNo=0062" title="수원스타필드 상세보기">수원스타필드</a>
                  </li>
                  <li data-brch-no="0020">
                    <a href="/theater?brchNo=0020" title="안성스타필드 상세보기">안성스타필드</a>
                  </li>
                </ul>
              </div>
            </li>

            <li>
              <button type="button" class="sel-city">인천
              </button>
              <div class="theater-list">
                <ul>
                  <li data-brch-no="4062">
                    <a href="/theater?brchNo=4062" title="송도 상세보기">송도</a>
                  </li>
                  <li data-brch-no="0027">
                    <a href="/theater?brchNo=0027" title="청라지젤&#40;휴관&#41; 상세보기">청라지젤&#40;휴관&#41;</a>
                  </li>
                </ul>
              </div>
            </li>

            <li>
              <button type="button" class="sel-city">대전/충청/세종
              </button>
              <div class="theater-list">
                <ul>
                  <li data-brch-no="0028">
                    <a href="/theater?brchNo=0028" title="대전신세계 아트앤사이언스 상세보기">대전신세계 아트앤사이언스</a>
                  </li>
                  <li data-brch-no="3392">
                    <a href="/theater?brchNo=3392" title="세종나성 상세보기">세종나성</a>
                  </li>
                </ul>
              </div>
            </li>

            <li>
              <button type="button" class="sel-city">부산/대구/경상
              </button>
              <div class="theater-list">
                <ul>
                  <li data-brch-no="7011">
                    <a href="/theater?brchNo=7011" title="대구신세계&#40;동대구&#41; 상세보기">대구신세계&#40;동대구&#41;</a>
                  </li>
                  <li data-brch-no="6001">
                    <a href="/theater?brchNo=6001" title="부산극장 상세보기">부산극장</a>
                  </li>
                </ul>
              </div>
            </li>

            <li>
              <button type="button" class="sel-city">광주/전라
              </button>
              <div class="theater-list">
                <ul>
                  <li data-brch-no="5021">
                    <a href="/theater?brchNo=5021" title="광주상무 상세보기">광주상무</a>
                  </li>
                  <li data-brch-no="0050">
                    <a href="/theater?brchNo=0050" title="전주객사 상세보기">전주객사</a>
                  </li>
                </ul>
              </div>
            </li>

            <li>
              <button type="button" class="sel-city">강원
              </button>
              <div class="theater-list">
                <ul>
                  <li data-brch-no="2171">
                    <a href="/theater?brchNo=2171" title="속초 상세보기">속초</a>
                  </li>
                </ul>
              </div>
            </li>

          </ul>
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