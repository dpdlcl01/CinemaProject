<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
  <jsp:include page="../common/head.jsp"/>
</head>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.14.1/themes/base/jquery-ui.css">

<style>

    *{
        padding: 0;
        margin: 0;
    }
    #contents{
        margin: 50px auto;
        width: 1100px;
    }
    #title{
        display: flex;
        padding: 20px 40px;
        margin-top: 20px;
        background-color: #eeeeee;
    }
    td>span{
        font-weight: 600;
    }
    label{
        margin-right: 20px;
    }
    #searchBtn{
        width: 73px;
        height: 32px;
        background-color: white;
        border-radius: 4px;
        border: 1px solid gray;
    }
    #strong{
        margin: 30px 0 15px;
    }
    strong>b , em{
        color: #01738b;
    }
    em{
        font-size: 17px;
    }
    #main{
        display: flex;
        border: 1px solid gray;
        width: 1100px;
        height: 287px;
        align-items: center;
        padding: 25px 30px 20px 25px;
        border-radius: 8px;
        box-sizing: border-box;

    }
    #main>img{
        width: 135px;
        height: 195px;
        margin-right: 40px;
      margin-left: 150px;
    }
    #mainTable{
        font-size: 14px;
    }
    #mainTable td{
        height: 32px;
        padding-left: 20px;
    }

    #lastRow{
        background-color: #eeeeee;
        height: 32px;
        margin-bottom: 10px;
        font-size: 14px;
        padding-left: 20px;
        border-radius: 4px;
        width: 600px;
    }
    #lastRow span{
        font-weight: 600;
    }
    #lastRow button{
        background-color: white;
        border: 1px solid gray;
        border-radius: 3px;

    }
    #btnDiv{
        text-align: right;
        margin-right: 30px;
    }
    #reservCancel{
        width: 83px;
        height: 33px;
        background-color: dimgray;
        color: #eeeeee;
        border: 1px solid dimgray;
        border-radius: 4px;
    }
    h3{
        margin-top: 40px;
        color: #503396;
        font-size: 24px;
        padding-bottom: 16px;
    }
    #bottomTable{
        margin-top: 10px;
        border-top: 1px solid black;
        border-collapse: collapse;
    }
    #bottomTable thead{
        height: 45px;
        background-color: #eeeeee;
    }
    #bottomTable td{
        height: 45px;
        text-align: center;
    }
    #null{
        width: 1100px;
        height: 160px;
        box-sizing: border-box;
        margin-top: 20px;
        border-top: 1px solid black;
        border-bottom: 1px solid black;
        padding:65px 470px;
        margin-bottom: 20px;
    }
    #notice {
        display: none; /* 초기 상태에서 다이얼로그 숨김 */
    }
    .ui-dialog{
        padding: 0;
        font-weight: 600;
    }
    .ui-dialog #btnDiv2{
        margin: auto;
        text-align: center;
        margin-top: 20px;
    }
    .ui-dialog button{
        width: 80px;
        height: 40px;
        border: 1px solid #503396;
        background-color: #503396;
        color: white;
        border-radius: 3px;
    }

    /* 다이얼로그 타이틀 색상 변경 */
    .ui-dialog-titlebar {
        background-color: #503396; /* 타이틀 배경색 */
        color: white; /* 텍스트 색상 */
        border: 2px solid #503396;
    }
    .ui-dialog-content {
        color: black; /* 텍스트 색상을 명시적으로 설정 */
        font-size: 14px; /* 적절한 폰트 크기를 설정 */
    }
</style>
<body>
<!-- header 영역 -->
<jsp:include page="../common/header.jsp"/>
<div class="page-util">
    <div class="inner-wrap">
        <div class="location">
            <span>Home</span>
            <span>예매/취소내역</span>
        </div>
    </div>
</div>
<!-- contents 영역 -->
<div id="contents">
    <h1>예매/취소내역</h1>
    <div id="title">
        <table>
            <colgroup>
                <col width="75px">
                <col width="*">
            </colgroup>
            <tr>
                <td><span>구분</span></td>
                <td>
                    <input type="radio" id="radio1" name="radioSelect" value="reservation" checked="checked">
                    <label for="radio1">예매내역</label>
                    <input type="radio" id="radio2" name="radioSelect" value="before">
                    <label for="radio2">지난내역</label>
                    <button id="searchBtn"><img src="../../../img/search.png">조회</button>
                </td>
            </tr>
        </table>
    </div>
    <div id="strong">

    </div>
    <div id="null">
        예약내역이 없습니다.
    </div>
    <strong>총<b>1</b>건</strong>
    <div id="main">
        <img src="../../../img/ha.png">
        <div id="mainInfo">
            <table id="mainTable">
                <colgroup>
                    <col width="95px">
                    <col width="230px">
                    <col width="*">
                </colgroup>
                <tr>
                    <td><span>예매번호</span></td>
                    <td colspan="2"><em>0000-000-00000</em></td>
                </tr>
                <tr>
                    <td><span>영화명</span></td>
                    <td colspan="2">하얼빈 2D</td>
                </tr>
                <tr>
                    <td><span>극장 상영관</span></td>
                    <td>강남/3관(리클라이너 LASER)</td>
                    <td><b>관람인원</b> <a>성인1명</a></td>
                </tr>
                <tr>
                    <td><span>관람일시</span></td>
                    <td>2025.01.19(일) 14:35 (3회차)</td>
                    <td><b>관람인원</b> <a>성인1명</a></td>
                </tr>
            </table>
            <div id="lastRow">
                <table>
                    <colgroup>
                        <col width="95px">
                        <col width="230px">
                        <col width="*">
                    </colgroup>
                    <tr >
                        <td>
                            <span>결제일시</span>
                        </td>
                        <td>
                            2025.01.15
                            <button type="button" id="payInfo">결제정보</button>
                        </td>
                    </tr>
                </table>
            </div>





            <div id="btnDiv">
                <button type="button" id="reservCancel">
                    예매취소
                </button>
            </div>
        </div>
    </div>
    <article id="cancelHistory">
        <h3>예매취소내역</h3>
        <li>상영일 기준 7일간 취소내역을 확인하실 수 있습니다.</li>
        <table id="bottomTable">
            <colgroup>
                <col width="210px">
                <col width="307px">
                <col width="180px">
                <col width="238px">
                <col width="165px">
            </colgroup>
            <thead>
            <th>취소일시</th>
            <th>영화명</th>
            <th>극장</th>
            <th>상영일시</th>
            <th>취소금액</th>
            </thead>
            <tr>
                <td>2025.01.15 (15:09)</td>
                <td>하얼빈</td>
                <td>광명AK플라자</td>
                <td>2025.01.19 (일) 15:10	</td>
                <td>14,000원</td>
            </tr>
        </table>
    </article>
</div>

<article id="notice" title="다이얼로그">
    <p>
        취소 시 유효기간 경과된 관람권, 쿠폰, 포인트는 복구되지 않습니다. <br/>
        예매취소 하시겠습니까?
    </p>


    <div id="btnDiv2">
        <button type="button"> 취소 </button>
        <button type="button"> 확인 </button>
    </div>
</article>
<article id="paymentInfo" title="결제정보">
    <br>
    <table>
        <colgroup>
            <col width="100px">
            <col width="*">
        </colgroup>
        <tr>
            <td class="left">
                상품금액
            </td>
            <td>가격</td>
        </tr>
        <tr>
            <td class="left">
                상품금액
            </td>
            <td>가격</td>
        </tr>
        <tr>
            <td class="left">
                할인금액
            </td>
            <td>할인</td>
        </tr>
        <tr>
            <td class="left">
                최종금액
            </td>
            <td>가격</td>
        </tr>
        <tr>
            <td class="left">
                결제일시
            </td>
            <td>2025-01-15 00:00:00</td>
        </tr>
    </table>

</article>
<!-- footer 영역 -->
<jsp:include page="../common/footer.jsp"/>



<!-- script 영역 -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/ui/1.14.1/jquery-ui.js"></script>
<script>
    $(function () {
        $('#reservCancel').on('click', function () {
            $('#notice').dialog({
                modal: true,
            });
        });

        $('#payInfo').on('click', function () {
          $('#paymentInfo').dialog({
              modal: true,
          })
        })
    });

</script>
</body>
</html>
