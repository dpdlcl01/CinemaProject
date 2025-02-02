<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
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
    #main ,#before{
        display: flex;
        border: 1px solid gray;
        width: 1100px;
        height: 287px;
        align-items: center;
        padding: 25px 30px 20px 25px;
        border-radius: 8px;
        box-sizing: border-box;

    }
    #main>img ,#before>img{
        width: 135px;
        height: 195px;
        margin-right: 40px;
      margin-left: 150px;
    }
    #mainTable , .mainTable{
        font-size: 14px;
    }
    #mainTable td,.mainTable td{
        height: 32px;
        padding-left: 20px;
    }

    #lastRow, .lastRow{
        background-color: #eeeeee;
        height: 32px;
        margin-bottom: 10px;
        font-size: 14px;
        padding-left: 20px;
        border-radius: 4px;
        width: 600px;
    }
    #lastRow span,.lastRow span{
        font-weight: 600;
    }
    #lastRow button,.lastRow button{
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
        text-align: center;
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
    .paymentInfo{
        display: none;
    }

</style>
<body>
<!-- header 영역 -->
<jsp:include page="../common/header.jsp"/>
<div class="page-util">
    <div class="inner-wrap">
        <div class="location">
            <span>Home</span>
            <img src="https://img.megabox.co.kr/static/pc/images/common/bg/bg-location-arr.png"/>
            <label>예매/취소내역</label>
        </div>
    </div>
</div>
<!-- contents 영역 -->
<div class="contents">
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
                    <label for="radio2">전체내역</label>
                    <button id="searchBtn"><img src="${pageContext.request.contextPath}/css/user/images/KangImg/search.png">조회</button>
                </td>
            </tr>
        </table>
    </div>
    <div id="strong">

    </div>

    <c:if test="${empty requestScope.rvo}">
    <div id="null">
        예약내역이 없습니다.
    </div>
    </c:if>

    <strong>총<b>${fn:length(requestScope.rvo)}</b>건</strong>

    <c:forEach items="${requestScope.rvo}" var="rvo" begin="0" end="2">
        <div id="main" class="main">
            <img src="${rvo.moviePosterUrl}">
            <div id="mainInfo">
                <table id="mainTable">
                    <colgroup>
                        <col width="95px">
                        <col width="230px">
                        <col width="*">
                    </colgroup>
                    <tr>
                        <td><span>예매번호</span></td>
                        <td colspan="2"><em>${rvo.customReservationIdx}</em></td>
                    </tr>
                    <tr>
                        <td><span>영화명</span></td>
                        <td colspan="2">${rvo.movieTitle}</td>
                    </tr>
                    <tr>
                        <td><span>극장 상영관</span></td>
                        <td>${rvo.theaterName} ${rvo.screenName}</td>
                        <td><b>관람인원</b> <a>성인1명</a></td>
                    </tr>
                    <tr>
                        <td><span>관람일시</span></td>
                        <td>${rvo.timetableStartTime}</td>
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
                                    ${rvo.reservationDate}
                                <button type="button" id="payInfo" class="payInfo">결제정보</button>
                                <input type="hidden" value="${rvo.paymentFinal}" class="paymentFinal">
                            </td>
                        </tr>
                    </table>
                </div>
                <div id="btnDiv">
                    <input type="hidden" class="reservationIdx" value="${rvo.reservationIdx}">
                    <button type="button" id="reservCancel" class="reservCancel">
                        예매취소
                    </button>
                </div>
            </div>
            <article id="paymentInfo" class="paymentInfo" title="결제정보">
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
                        <td id="totalPrice">${rvo.paymentFinal}</td>
                    </tr>
                    <tr>
                        <td class="left">
                            결제일시
                        </td>
                        <td>${rvo.reservationDate}</td>
                    </tr>
                </table>

            </article>
        </div>
        <br>
        <br>
    </c:forEach>


    <c:forEach items="${requestScope.rvo}" var="rvo">
        <div id="before" class="before">
            <img src="${rvo.moviePosterUrl}">
            <div class="mainInfo">
                <table class="mainTable">
                    <colgroup>
                        <col width="95px">
                        <col width="230px">
                        <col width="*">
                    </colgroup>
                    <tr>
                        <td><span>예매번호</span></td>
                        <td colspan="2"><em>${rvo.customReservationIdx}</em></td>
                    </tr>
                    <tr>
                        <td><span>영화명</span></td>
                        <td colspan="2">${rvo.movieTitle}</td>
                    </tr>
                    <tr>
                        <td><span>극장 상영관</span></td>
                        <td>${rvo.theaterName} ${rvo.screenName}</td>
                        <td><b>관람인원</b> <a>성인1명</a></td>
                    </tr>
                    <tr>
                        <td><span>관람일시</span></td>
                        <td>${rvo.timetableStartTime}</td>
                        <td><b>관람인원</b> <a>성인1명</a></td>
                    </tr>
                </table>
                <div class="lastRow">
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
                                    ${rvo.reservationDate}
                                <button type="button" id="payInfo" class="payInfo">결제정보</button>
                                <input type="hidden" value="${rvo.paymentFinal}" class="paymentFinal">
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="btnDiv">

                </div>
            </div>
            <article  class="paymentInfo" title="결제정보">
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
                        <td>${rvo.paymentFinal}</td>
                    </tr>
                    <tr>
                        <td class="left">
                            결제일시
                        </td>
                        <td>${rvo.reservationDate}</td>
                    </tr>
                </table>

            </article>
        </div>
        <br>
        <br>
    </c:forEach>





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
            <c:if test="${empty requestScope.cvo}">
                <tr>
                    <td colspan="5">
                        취소 내역이 없습니다.
                    </td>
                </tr>
            </c:if>
            <c:forEach items="${requestScope.cvo}" var="cvo">
            <tr>
                <td>2025.01.15 (15:09)</td>
                <td>${cvo.movieTitle}</td>
                <td>${cvo.theaterName} ${cvo.screenName}</td>
                <td>${cvo.timetableStartTime}</td>
                <td>${cvo.paymentFinal}</td>
            </tr>
            </c:forEach>
        </table>

    </article>


</div>

<article id="notice" title="다이얼로그">
    <p>
        취소 시 유효기간 경과된 관람권, 쿠폰, 포인트는 복구되지 않습니다. <br/>
        예매취소 하시겠습니까?
    </p>
</article>

<!-- footer 영역 -->
<jsp:include page="../common/footer.jsp"/>



<!-- script 영역 -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/ui/1.14.1/jquery-ui.js"></script>
<script>
    $(document).ready(function () {

        $(".before").hide();

        $('#searchBtn').on('click', function () {
            var selectedValue = $('input[name="radioSelect"]:checked').val(); // 현재 선택된 라디오 버튼 값 가져오기

            console.log("선택된 라디오 버튼 값:", selectedValue);


            if (selectedValue === "reservation") {
                $(".before").hide();
                $(".main").show();
            } else if (selectedValue === "before") {
                $(".main").hide();
                $(".before").show();
            }
        });


        $(document).on('click', '.payInfo', function () {
            var paymentInfo = $(this).closest(".before").find(".paymentInfo");

            console.log("다이얼로그 선택된 요소:", paymentInfo);

            // 다이얼로그가 이미 존재하면 바로 열기
            if (paymentInfo.hasClass("ui-dialog-content")) {
                console.log("기존 다이얼로그 열기");
                paymentInfo.dialog("open");
            } else {
                console.log("새로운 다이얼로그 생성");

                // 다이얼로그를 body 안으로 이동하여 유지
                paymentInfo.dialog({
                    modal: true,
                    title: "결제 정보",
                    closeText: "닫기",
                    buttons: {
                        "확인": function () {
                            $(this).dialog("close");
                        },
                        "취소": function () {
                            $(this).dialog("close");
                        }
                    },
                    close: function () {
                        console.log("다이얼로그 닫힘");
                        $(this).dialog("destroy");  // 다이얼로그가 닫힐 때 초기화 (재사용 가능하게)
                    }
                }).dialog("open");
            }
        });

        $(document).on('click', '.payInfo', function () {
            var paymentInfo = $(this).closest(".main").find(".paymentInfo");

            console.log("다이얼로그 선택된 요소:", paymentInfo);

            // 다이얼로그가 이미 존재하면 바로 열기
            if (paymentInfo.hasClass("ui-dialog-content")) {
                console.log("기존 다이얼로그 열기");
                paymentInfo.dialog("open");
            } else {
                console.log("새로운 다이얼로그 생성");

                // 다이얼로그를 body 안으로 이동하여 유지
                paymentInfo.dialog({
                    modal: true,
                    title: "결제 정보",
                    closeText: "닫기",
                    buttons: {
                        "확인": function () {
                            $(this).dialog("close");
                        },
                        "취소": function () {
                            $(this).dialog("close");
                        }
                    },
                    close: function () {
                        console.log("다이얼로그 닫힘");
                        $(this).dialog("destroy");  // 다이얼로그가 닫힐 때 초기화 (재사용 가능하게)
                    }
                }).dialog("open");
            }
        });



        $('.reservCancel').on('click', function () {
            let reservationIdx = $(this).siblings('.reservationIdx').val();
            $('#notice').dialog({
                modal: true,
                title: "예매 취소 확인",  // 다이얼로그 제목 추가
                closeText: "닫기",  // 닫기 버튼 텍스트 설정
                buttons: {
                    "확인": function () {
                        $.ajax({
                            type: "POST",
                            url: "${pageContext.request.contextPath}/UserController?type=reservationCancel", // action에 맞게 수정
                            data: { reservationIdx: reservationIdx },
                            dataType: "json",
                            success: function (response) {
                                if (response.success) {
                                    alert("예매가 취소되었습니다.");
                                    location.reload(); // UI 업데이트를 위해 새로고침
                                } else {
                                    alert("예매 취소 실패: " + response.message);
                                }
                            },
                            error: function (xhr, status, error) {
                                alert("서버 오류 발생: " + error);
                            }
                        });
                        $(this).dialog("close");
                    },
                    "취소": function () {
                        $(this).dialog("close");
                    }
                }
            });
        });




    });

</script>
</body>
</html>
