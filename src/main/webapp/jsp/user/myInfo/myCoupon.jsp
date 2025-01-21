<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!Doctype html>
<html lang="ko">
<head>
    <jsp:include page="../common/head.jsp"/>
</head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/myInfo.css"/>
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
    #mCoupon{
        width: 840px;
        border-bottom: 2px solid #ebebeb;
        padding-bottom: 13px;
    }
    #notice{
        margin: 30px 0 35px 0;
    }
    #select{
        display: flex;
        background-color: #eeeeee;
        height: 123px;
        align-items: center;
        justify-content: center;
        margin-bottom: 50px;
    }

    #inlineDiv{
        display: flex;
        gap:0;
        border-radius: 5px ;
        border: 1px solid darkgray;
        margin-bottom: 10px;
    }
    #select .selectBtn{
        width: 100px;
        background-color: white;
        height: 40px;
        border: none;
        border-radius: 5px;
    }
    .vertical{
        width: 1px;
        background-color: darkgray;
    }
    .dropdown{
        padding-left: 80px;
    }
    .dropdown label{
        font-weight: 600;
    }
    .dropdown select{
        height: 35px;
        text-align: center;
        border-radius: 5px;
    }
    .dropdown button{
        height: 34px;
        background-color: white;
        border: 1px solid black;
        border-radius: 4px;
        padding-bottom: 3px;
        width: 60px;
    }
    .dropdown img{
        width: 16px;
        height: 18px;
        padding-top: 3px;
    }
    #possession{
        margin-bottom: 10px;
    }
    #couponDiv table{
        border-collapse: collapse;
    }
    #couponDiv thead{
        background-color: #eeeeee;
        border-top: 1px solid black;
        height: 40px;
    }
    #nullTr{
        text-align: center;
        height: 50px;
        border-bottom: 1px solid gray;
    }
    .guide{
        display: none;
    }
    .view{
        display: block;
    }
    #btnDiv{
        width: 1100px;
    }
    #btnDiv button{
        margin-top:50px ;
        width: 840px;
        height: 40px;
        border: 1px solid darkgray;
        background-color: white;
        border-radius: 4px;
        font-size: 16px;
    }
    .main-content li{
        height: 15px;
        margin-top: 20px;
    }

    .main-content #btnDiv li{
        font-size: 14px;
        height: 30px;

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
            <h1 id="mCoupon">메가박스 쿠폰</h1>
            <ul id="notice">
                <li>• 보유하신 쿠폰 내역입니다</li>
                <li>• 각 쿠폰 별 사용 방법이 다르니 사용 전 상세 쿠폰정보를 확인바랍니다.</li>
            </ul>
            <div id="select">
                <table>
                    <colgroup>
                        <col width="50px">
                        <col width="400px">
                        <col width="330px">
                    </colgroup>
                    <tr>
                        <th>유형</th>
                        <td>
                            <div id="inlineDiv">
                                <button type="button" class="selectBtn">전체</button>
                                <div class="vertical">
                                </div>
                                <button type="button" class="selectBtn">포인트</button>
                                <div class="vertical">
                                </div>
                                <button type="button" class="selectBtn">매표</button>
                                <div class="vertical">
                                </div>
                                <button type="button" class="selectBtn">매점</button>
                            </div>

                        </td>
                        <td class="dropdown">
                            <label for="dropdown">구분</label>
                            <select id="dropdown">
                                <option value="1">전체</option>
                                <option value="2">할인 쿠폰</option>
                                <option value="3">추가 쿠폰</option>
                            </select>
                            <button type="button"><img src="${pageContext.request.contextPath}/css/user/images/KangImg/search.png">조회</button>
                        </td>
                    </tr>
                    <tr>
                        <th></th>
                        <td>
                            <input type="radio">
                            <label>사용가능</label>
                            <input type="radio">
                            <label>사용완료</label>
                            <input type="radio">
                            <label>기간만료</label>
                        </td>
                    </tr>
                </table>
            </div>
            <div id="possession">
                <p>총<b>0</b>매</p>
            </div>
            <div id="couponDiv">
                <table id="coupon">
                    <colgroup>
                        <col width="120px">
                        <col width="270px">
                        <col width="200px">
                        <col width="120px">
                        <col width="90px">
                        <col width="40px">
                    </colgroup>
                    <thead>
                    <th>구분</th>
                    <th>쿠폰명</th>
                    <th>유효기간</th>
                    <th>사용상태</th>
                    <th></th>
                    <th></th>
                    </thead>
                    <!--쿠폰 개수에 따라서 포문으로 만들어 넣으세요-->
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr id="nullTr">
                        <td colspan="6">조회된 쿠폰이 없습니다</td>
                    </tr>
                </table>
            </div>
            <div id="btnDiv">
                <button type="button" onclick="viewGuide()">이용안내</button>
                <ul class="guide" id="guide">
                    <li>• 등록하신 쿠폰은 영화 예매 시 결제수단 > 포인트/할인쿠폰 > 메가박스 할인쿠폰에서 사용 가능합니다.</li>
                    <li>• 특정 영화/상품/극장 전용 쿠폰일 경우, 지정 영화 및 상품, 극장에서 명시된 사용기간 내에만 사용이 가능합니다.</li>
                    <li>• 매점 전용 쿠폰은 모바일앱을 통해 쿠폰을 매점에 제시 후 사용 가능합니다.</li>
                    <li>• 온라인 전용으로 발행된 쿠폰의 경우에는 현장 사용이 불가능합니다.</li>
                    <li>• 취소 시 현금 환불은 되지 않으며, 기존 쿠폰으로 유효기간 중에 재사용 하실 수 있습니다.</li>
                    <li>• 기타 할인쿠폰에 대한 문의사항이 있으실 경우, 1544-0070 또는 홈페이지를 이용해 주시기 바랍니다.</li>
                </ul>
            </div>


        </div>
    </div>
</div>
</div>

<jsp:include page="../common/footer.jsp"/>

<script>
    function viewGuide() {
        let element = document.getElementById("guide");

        if (element.classList.contains("guide")) {
            element.classList.remove("guide");
            element.classList.add("view");
        }else{
            element.classList.remove("view");
            element.classList.add("guide");
        }

    }
</script>
</body>
</html>