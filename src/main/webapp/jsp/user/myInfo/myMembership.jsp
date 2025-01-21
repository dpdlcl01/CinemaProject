<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!Doctype html>
<html lang="ko">
<head>
  <jsp:include page="../common/head.jsp"/>
</head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/myInfo.css"/>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<style>
  *{
    padding: 0;
    margin: 0;
  }
  body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
  }

  .total-main {
    width: 1100px;
    margin: 50px auto;
  }

  .myPage-container {
    display: grid;
    grid-template-columns: 2fr 1fr;
  }

  /* 사이드바 */
  .sidebar{
    width: 200px;
    border-radius: 6px;
    height: 360px;
  }
  .sidebar-title {
    font-size: 23px;
    border-bottom: 2px solid #222222;
    padding: 0 0 10px 0;
  }
  .sidebar a{
    display: flex;
    color: #222222;
    padding-top: 10px;
    padding-bottom: 10px;
    text-decoration: none;
    text-indent: 20px;
    line-height: 30px;
    font-weight: bolder;
  }
  .sidebar li>a{
    font-size: 14px;
    width: 180px;
  }
  .sidebar li{
    border-bottom: 1px solid #222222;
  }
  .sidebar-title>a:hover{
    color: gray;
  }
  .sidebar li>a:hover{
    color: gray;
  }

  /* 메인 */
  .main-content {
    width: 840px;
  }
  .section {
    background-color: #fff;
    padding: 20px;
    margin-bottom: 20px;
    border-radius: 5px;
  }
  .section h2{
    font-size: 30px;
    left: 3px;
    font-weight: normal;
  }
  .section h2 {
    font-size: 18px;
    margin-bottom: 10px;
  }
  .selectBtn{
    width: 70px;
    background-color: white;
    height: 30px;
    border: none;
    border-radius: 5px;


  }
  .vertical{
    width: 1px;
    background-color: darkgray;
  }
  #inlineDiv{
    display: flex;
    gap:0;
    border-radius: 5px ;
    border: 1px solid darkgray;
    margin: 0 50px 0 30px;

  }
  .flex{
    display: flex;
    align-items: center;
  }
  .flex input{
    height: 20px;
  }
  .flex>button{
    height: 27px;
    background-color: white;
    border: 1px solid black;
    border-radius: 4px;
    padding-bottom: 3px;
    width: 60px;
  }
  #pointInfo{
    border: 1px solid #d8d9db;
    height: 69px;
    border-radius: 6px;
    background-image: url("${pageContext.request.contextPath}/css/user/images/KangImg/back.png");
    display: flex;
    align-items: center;
    padding-left: 30px;
    font-weight: 600;
    font-size: 17px;

  }
  #imgVip{

    display: flex;
  }
  #myPoint{
    background-color: #333 ;
    width: 330px;
    height: 254px;
    border-bottom-left-radius: 7px;
    text-align: center;
    padding-top: 40px;
    box-sizing: border-box;
  }
  #myPoint p{
    color: white;
    font-size: 25px;


  }
  #myPoint .point{
    font-size: 32px;
    color: #339eb2;
    margin: 10px 0 20px 0;
  }
  #Earn{
    display: flex;
    align-items: center;
    width: 270px;
    border-radius: 30px;
    margin-left: auto ;
    margin-right: auto ;
    background-color: white;

  }
  #Earn p{
    font-size: 15px;
    color: black;
    padding-left: 20px;
  }
  #Earn .pt{
    padding-left: 140px;

  }
  #myVip{
    height: 254px;
    width: 510px;
    text-align: center;
    border-bottom-right-radius:7px ;
    border: 1px solid #d8d9db;
    box-sizing: border-box;
  }
  #myVip p{
    margin-top: 30px;
    font-size: 20px;
    font-weight: 600;
  }
  #myVip>div>.vipPoint{
    width: 450px;
    background-color: #eeeeee;
    font-size: 15px;
    height: 30px;
    display: flex;
    justify-content: center;
    align-items: center;
    border-radius: 6px;
    margin: 30px auto 30px auto;
  }
  #myVip #p{
    font-size: 30px;
    color: #339eb2;
  }
  #myVip #span{
    padding-left: 15px;
    font-size: 12px;
    text-align: left;
  }
  .h2{
    color: #503396;
  }
  #Usearch{
    margin: 30px 0 30px 0;
    background-color: #eeeeee;
    height: 80px;
    display: flex;

  }
  #Usearch table .searchBtn{
    margin-left: 30px;
  }
  .optionDiv{
    display: flex;
    align-items: center;
    margin-bottom: 20px;
    margin-top: 20px;
  }
  .optionDiv>select{
    height: 40px;
    margin-left: 680px;
  }
  .optionDiv>p{
    margin-left: 30px;
    font-size: 17px;
  }
  .optionDiv>p>em{
    color: #339eb2;
    font-weight: 600;
  }
  #uTable{
    border-collapse: collapse;
    text-align: center;
    border-top: 1px solid black;
  }
  #uTable #thead{
    background-color: #eeeeee;
    height: 40px;
  }
  #uTable td{
    height: 40px;
    padding-top: 10px;
  }
.main-content h1{
  margin-bottom: 50px;
}
#pointMain{
  margin-bottom: 50px;
}
.h2{
  margin-bottom: 20px;
}
.li{
  font-size: 13px;
}
#datepicker,#datepicker1{
  width: 120px;
  height: 30px;
  text-align: center;
}
  .ui-datepicker-title {
    display: flex;
    flex-direction: row-reverse;
    padding-right: 60px;
  }
  .datepicker {
    width: 150px;
    padding: 8px 30px 8px 10px; /* 아이콘 위치를 위한 패딩 */
    border: 1px solid #ccc;
    border-radius: 5px;
    background: url('${pageContext.request.contextPath}/css/user/images/KangImg/datepicker_16x16.png') no-repeat right 8px center;
    background-size: 20px 20px; /* 아이콘 크기 조절 */
  }
</style>
<body>
<jsp:include page="../common/header.jsp"/>
<div id="contents">
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
      <!--사이드바-->
      <div class="sidebar">
        <ul>
          <div class="sidebar-title"><a href="MyInfo.jsp" title="나의 메가박스">나의 메가박스</a></div>
          <div class="liWrap"><li><a href="MyReservation.jsp" title="예매/구매내역">예매/구매내역</a></li></div>
          <div class="liWrap"><li><a href="Admission-Ticket.jsp" title="영화/스토어 관람권">영화/스토어 관람권</a></li></div>
          <div class="liWrap"><li><a href="${pageContext.request.contextPath}/UserController?type=myCoupon" title="메가박스/제휴쿠폰">메가박스/제휴쿠폰</a></li></div>
          <div class="liWrap"><li><a href="${pageContext.request.contextPath}/UserController?type=myPoint" title="멤버십 포인트">멤버십 포인트</a></li></div>
          <div class="liWrap"><li><a href="#" title="나의 무비스토리">나의 무비스토리</a></li></div>
          <div class="liWrap"><li><a href="myInfoMain.jsp" title="회원정보">회원정보</a></li></div>
        </ul>
      </div>
      <!--메인-->
      <div class="main-content">
        <h1>포인트 이용내역</h1>
        <div id="pointMain">
          <div id="pointInfo">나의 포인트 정보</div>
          <div id="imgVip">
            <div id="myPoint">
              <p>사용가능 포인트</p>
              <p class="point">0P</p>
              <div id="Earn">
                <p>• 적립예정</p>
                <p class="pt">0P</p>
              </div>
            </div>
            <div id="myVip">
              <p>VIP 선정 누적 포인트 현황</p>
              <div>
                <p class="vipPoint">포인트</p>
              </div>

              <p><em id="p">0P</em></p>
              <div id="span">
                <span class="span">사용 가능 포인트는 현재 기준 온,오프라인에서 실제 사용 가능한 포인트입니다.</span><br>
                <span class="span">VIP 선정 누적 포인트 현황은 현재 월승급 기준 VIP 선정 기준에 부합하는 포인트 합계입니다.</span>
              </div>

            </div>
          </div>

        </div>
        <h2 class="h2">이용내역 조회</h2>
        <li class="li">•  하단 내역은 상영일 및 구매일 기준이며, 해당일 익일(+1) 에 사용 가능 포인트로 전환됩니다.</li>
        <li class="li">•  적립 예정 포인트는 사용 가능포인트에 포함되지 않으며, 환불 또는 거래 취소가 될 경우 내역에서 삭제됩니다.</li>

        <div id="Usearch">
          <table>
            <colgroup>
              <col width="100px">
              <col>
            </colgroup>
            <tbody>
            <tr>
              <th id="th">조회기간</th>
              <td>
                <div class="flex">
                  <div id="inlineDiv">
                    <button type="button" class="selectBtn">1주일</button>
                    <div class="vertical"></div>
                    <button type="button" class="selectBtn">1개월</button>
                    <div class="vertical"></div>
                    <button type="button" class="selectBtn">3개월</button>
                    <div class="vertical"></div>
                    <button type="button" class="selectBtn">6개월</button>
                  </div>
                  <input type="text" id="datepicker"  class="datepicker" value="2025-01-01">~
                  <input type="text" id="datepicker1" class="datepicker" value="2025-12-31">

                  <button type="button" class="searchBtn"><img src="${pageContext.request.contextPath}/css/user/images/KangImg/search.png">조회</button>
                </div>

              </td>
            </tr>
            </tbody>
          </table>
        </div>
        <div id="utilization">
          <div class="optionDiv">
            <p>전체<em>0</em>건</p>
            <select>
              <option value="1">전체</option>
              <option value="2">적립</option>
              <option value="3">사용</option>
              <option value="4">소멸</option>
            </select>
          </div>

          <table id="uTable">
            <colgroup>
              <col width="155px">
              <col width="240px">
              <col width="295px">
              <col width="150px">
            </colgroup>
            <thead id="thead">
            <th>일자</th>
            <th>구분</th>
            <th>내용</th>
            <th>포인트</th>
            </thead>
            <tr id="tr">
              <td colspan="4">조회된 내역이 없습니다.</td>
            </tr>
          </table>
        </div>

      </div>
    </div>
  </div>
</div>

<jsp:include page="../common/footer.jsp"/>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-ui-datepicker/1.12.1/i18n/datepicker-ko.js"></script>
<script>
  $(document).ready(function () {
    $.datepicker.setDefaults($.datepicker.regional["ko"]);
    $(".datepicker").datepicker({
      dateFormat:"yy-mm-dd",
      dayNames: ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"],
      dayNamesMin: ["일", "월", "화", "수", "목", "금", "토"],
      monthNames: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
      monthNamesShort: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],

      });
    });  // 데이트피커 활성화

</script>
</body>
</html>