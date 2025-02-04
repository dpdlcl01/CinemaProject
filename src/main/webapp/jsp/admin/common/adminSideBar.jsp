<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>관리자 화면</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
          crossorigin="anonymous"></script>
</head>
<style>
    /* 아코디언 헤더 스타일 */
    #adminSideBar .accordion-header {
        border: 0;
        background-color: #f8f8f8;
    }
    /* 사이드바 기본 스타일 */
    #adminSideBar {
        width: 250px;
        flex-shrink: 0;
        flex-grow: 0;
        color: black;
        border: none;
        box-sizing: border-box; /* 테두리와 패딩 포함 */
    }

    /* 사이드바 항목 스타일 */
    #adminSideBar .accordion-item {
        border-radius: 0; /* 둥근 모서리 제거 */
        margin: 0;
        padding: 0;
    }

    /* 첫 번째 항목 상단 테두리 제거 */
    #adminSideBar .accordion-item:first-child {
        border-top: none;
    }

    /* 버튼 스타일 */
    #adminSideBar .accordion-button {
        border-radius: 0 !important; /* 둥근 모서리 제거 */
        margin: 0; /* 여백 제거 */
        background-color: white; /* 배경 흰색 */
        color: black; /* 텍스트 검정색 */
    }

    /* 눌린 상태에서도 직사각형 유지 */
    .accordion-button:not(.collapsed) {
        border: 0;
        border-radius: 0 !important;
        background-color: white; /* 눌린 상태에서도 배경 흰색 */
    }

    /* 버튼 hover 상태 */
    .accordion-button:hover {
        background-color: #f8f9fa; /* hover 시 약간의 배경색 변화 */
    }

    /* 링크 스타일 */
    #adminSideBar a {
        text-decoration: none;
        color: black;
    }

    .dashboard {
        display: flex;
        font-size: 17px;
        align-items: center;
        justify-content: center;
        height: 52px;
        font-weight: 600;
    }

    /* 포커스 시 파란 테두리 제거 */
    .accordion-button:focus {
        box-shadow: none; /* 포커스 테두리 제거 */
    }

</style>
<body>
<div id="adminSideBar">


<div class="accordion" id="accordionExample">
  <div class="accordion-item">
    <h2 class="accordion-header">
      <a class="dashboard" href="${pageContext.request.contextPath}/AdminController?type=main">
        관리자 정보
      </a>
    </h2>
 <%--   <div id="collapseOne" class="accordion-collapse collapse show" data-bs-parent="#accordionExample">
      <div class="accordion-body">
        <strong>This is the first item's accordion body.</strong> It is shown by default, until the collapse plugin adds the appropriate classes that we use to style each element. These classes control the overall appearance, as well as the showing and hiding via CSS transitions. You can modify any of this with custom CSS or overriding our default variables. It's also worth noting that just about any HTML can go within the <code>.accordion-body</code>, though the transition does limit overflow.
      </div>
    </div>--%>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
        사용자관리
      </button>
    </h2>
    <div id="collapseTwo" class="accordion-collapse collapse">
      <div class="accordion-body">
        <p>
          <a href="#">회원 목록 보기</a>
        </p>
        <p style="margin-bottom: 0">
        <a href="#">회원 정보 관리</a>
        </p>
      </div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
        영화관리
      </button>
    </h2>
    <div id="collapseThree" class="accordion-collapse collapse">
      <div class="accordion-body">
        <p> <a href="${pageContext.request.contextPath}/AdminController?type=movieInfoList">영화 정보 관리</a></p>
        <p style="margin-bottom: 0">     <a href="${pageContext.request.contextPath}/AdminController?type=timetableList">영화 타임테이블 관리</a></p>


      </div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
        상영관리
      </button>
    </h2>
    <div id="collapseFour" class="accordion-collapse collapse">
      <div class="accordion-body">
        <p>  <a href="#">극장, 상영관 관리</a></p>
        <p style="margin-bottom: 0"> <a href="#">상영관 좌석 관리</a></p>


      </div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
        상품관리
      </button>
    </h2>
    <div id="collapseFive" class="accordion-collapse collapse">
      <div class="accordion-body">
        <p> <a href="${pageContext.request.contextPath}/AdminController?type=product">상품 목록 조회</a></p>
        <p style="margin-bottom: 0">  <a href="${pageContext.request.contextPath}/AdminController?type=product">상품 추가/수정/삭제</a></p>


      </div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseSix" aria-expanded="false" aria-controls="collapseSix">
        결제 및 정산
      </button>
    </h2>
    <div id="collapseSix" class="accordion-collapse collapse">
      <div class="accordion-body">
        <p>     <a href="#">사용자별 결제내역 확인</a></p>
        <p>  <a href="#">결제 오류내역 확인 및 처리</a></p>
        <p style="margin-bottom: 0">  <a href="#">영화, 상품 매출 통계</a></p>



      </div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseSeven" aria-expanded="false" aria-controls="collapseSeven">
       공지사항, 이벤트 관리
      </button>
    </h2>
    <div id="collapseSeven" class="accordion-collapse collapse">
      <div class="accordion-body">
        <p>   <a href="#">공지사항 작성/수정/삭제</a></p>
        <p style="margin-bottom: 0"><a href="#">이벤트 등록/수정/삭제</a></p>



      </div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseEight" aria-expanded="false" aria-controls="collapseEight">
        쿠폰,리뷰 관리
      </button>
    </h2>
    <div id="collapseEight" class="accordion-collapse collapse">
      <div class="accordion-body">
        <p>       <a href="#">쿠폰 관리</a></p>
        <p style="margin-bottom: 0">   <a href="#">리뷰 관리</a></p>


      </div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseNine" aria-expanded="false" aria-controls="collapseNine">
        시스템 관리
      </button>
    </h2>
    <div id="collapseNine" class="accordion-collapse collapse">
      <div class="accordion-body">
        <p>  <a href="#">권한 관리</a></p>
        <p style="margin-bottom: 0"> <a href="#">사용자 활동 로그 관리</a></p>


      </div>
    </div>
  </div>
</div>
</div>
</body>
</html>
