<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!Doctype html>
<html lang="ko">
<head>
    <jsp:include page="../common/head.jsp"/>

</head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/common.css">

<style>
    #top1{
        background-image: url("${pageContext.request.contextPath}/css/user/images/KangImg/my_info_topbg.png");
        color: white;
        background-repeat: no-repeat;
        display: flex;
        width: 840px;
        height: 220px;
        background-size: contain;
    }
    #top1 img{
        width: 90px;
        height: 90px;
    }
    #imgName{
        display: flex;
        padding-right: 30px;
        width: 420px;
        align-items: center;
        justify-content: center;
    }
    #imgName p{
        font-size: 40px;
        line-height: 10px;
        padding-left: 30px;
        margin: 30px 0;

    }
    #point{
        display: flex;
        padding-top: 30px;
        margin-left: 50px;
    }
    #totalPoint{
        font-size: 40px;
    }
    #point span, #point em{
        padding-top: 10px;
        padding-left: 10px;
    }
    #point em{
        color: deepskyblue;
        font-weight: 600;
    }
    #pointDiv {
        position: relative;
        height: 120px;
    }

    #bar {
        width: 100%; /* 가로선을 전체 너비로 설정 */
        height: 2px;
        background-color: #666;
        position: absolute;
        top: 100px;
        left: 50px;
    }

    /* 등급 진행 바 */
    .level-list {
        display: flex;
        align-items: center;
        justify-content: space-between;
        list-style: none;
        padding: 0;
        margin: 20px 0 0 50px;
        width: 100%;
        max-width: 600px;
        position: relative;
    }

    /* 등급 바의 연결선 */
    .level-list::before {
        content: "";
        position: absolute;
        top: 50%;
        left: 0;
        width: 100%;
        height: 2px;
        background-color: #666; /* 기본 선 색상 */
        z-index: -1;
        transform: translateY(-50%);
    }

    /* 각 등급을 나타내는 작은 동그라미 */
    .level-item {
        position: relative;
        width: 12px; /* 작은 크기의 원 */
        height: 12px;
        background-color: #666;
        border-radius: 50%;

    }

    /* 현재 활성화된 등급 */
    .level-item.active {
        background-color: #22C8F6; /* 하늘색 */
        border: 2px solid white;
    }

    /* 등급 텍스트 */
    .level-item span {
        position: absolute;
        top: 20px;
        left: 50%;
        transform: translateX(-50%);
        color: white;
        font-size: 12px;
        text-align: center;
    }

    /* 말풍선 스타일 */
    .tooltip {
        background-color: #22C8F6;
        color: #ffffff;
        padding: 6px 12px;
        /*margin-left: 110px;*/
        border-radius: 6px;
        font-size: 12px;
        font-weight: bold;
        position: absolute;
        top: 50px;
        left: 50%;
        transform: translateX(-50%);
        white-space: nowrap;

    }

    /* 말풍선 꼬리 */
    /*    .tooltip::after {
            content: "";
            position: absolute;
            bottom: -6px;
            left: 50%;
            transform: translateX(-50%);
            border-width: 6px;
            border-style: solid;
            border-color: #22C8F6 transparent transparent transparent;
        }*/

    #top2{
        display: flex;
        width: 836px;
        height: 140px;
        background-color: #eeeeee;
        border-bottom-left-radius: 20px;
        border-bottom-right-radius: 20px;
        margin-bottom: 50px;
    }
    .top2{
        width: 200px;
        padding: 10px 20px 0;
    }
    .top2>a{
        display: block;
        text-align: center;
        color: #503396;
        font-weight: 600;
        padding-bottom: 10px;
        text-decoration: none;
    }
    .top2>div{
        display: flex;
        margin-left: 10px;
    }
    .top2 span{


        width: 120px;
    }
    .top2 em{
        text-align: right;
        display: block;
        font-weight: 600;
    }
    #myReserv{
        display: flex;
        width: 840px;
        height: 140px;
        margin-bottom: 50px;
        align-items: center;
        border-bottom: 1px solid #eeeeee;
    }
    #myReserv>img{
        width: 70px;
        height: 100px;
    }
    #reservInfo p{
        margin: 0 30px;
        width: 640px;
    }
    #reservInfo em{
        color: #01738b;
    }
    #myReserv button{
        background-color: white;
        width: 74px;
        height: 32px;
    }
    #h2{
        display: flex;
        align-items: center;
        border-bottom:1px solid #666666;
        width: 840px;
    }
    #h2 h2{
        width: 760px;
    }
    #h2 button{
        height:32px ;
        width: 74px;
        border: none;
        background-color: white;
    }
    .top2 span{
        font-size: 14px;
    }
    #total{
        display: none;
    }
    #notice{
        display: none;
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
<jsp:include page="../common/header.jsp"/>
    <div class="page-util">
        <div class="inner-wrap">
            <div class="location">
                <span>Home</span>
                <img src="https://img.megabox.co.kr/static/pc/images/common/bg/bg-location-arr.png"/>
                <label>마이페이지</label>
            </div>
        </div>
    </div>
    <!-- contents 영역 -->
<div class="contents">
    <div class="total-main">
        <div class="myPage-container">
            <%--  사이드바  --%>
            <jsp:include page="../common/sideBar.jsp"/>
            <%--  메인  --%>
            <div id="main">
                <div id="title">
                    <div id="top1">
                        <div id="imgName">
                            <img src="${pageContext.request.contextPath}/css/user/images/KangImg/member_WELCOME_2.png">
                            <div>
                                <p>안녕하세요!</p>
                                <p>${requestScope.uvo.userName}님</p>
                            </div>
                        </div>
                        <div id="pointDiv">
                            <div id="point">
                                <div id="totalPoint">
                                    ${requestScope.uvo.userPoint}P
                                </div>
                                <span>
                                          현재등급
                                        </span>
                                <em>
                                    ${requestScope.uvo.userGrade}
                                </em>
                            </div>
                            <div id="grade">
                            </div>
                            <div id="bar">
                            </div>
                            <ul class="level-list">
                                <li class="level-item active">

                                    <span>BASIC</span>
                                </li>
                                <p id="total">${requestScope.total}</p>
                                <li class="level-item" id="vip-item">
                                    <c:if test="${requestScope.total < 13000}">
                                        <div class="tooltip">다음 VIP 등급까지 ${requestScope.reach} P 남았어요!</div>
                                    </c:if>
                                    <c:if test="${requestScope.total > 13000 and requestScope.total<20000}">
                                        <div class="tooltip">다음 VVIP 등급까지 ${requestScope.reach} P 남았어요!</div>
                                    </c:if>
                                    <c:if test="${requestScope.total>20000}">
                                        <div class="tooltip">최고 등급입니다!</div>
                                    </c:if>
                                    <span>VIP</span>
                                </li>
                                <li class="level-item" id="vvip-item"><span>VVIP</span></li>
                            </ul>
                        </div>
                    </div>
                    <div id="top2">
                        <div id="1" class="top2">
                            <a href="${pageContext.request.contextPath}/UserController?type=myMovieStory">나의 무비스토리</a><%--페이보릿시어터랑 이너조인--%>
                            <div>
                                <span>본 영화</span>
                                <em>${requestScope.wNum}</em>
                            </div>
                            <div>
                                <span>관람평</span>
                                <em>${requestScope.rNum}</em>
                            </div>
                            <div>
                                <span>보고싶어</span>
                                <em>${requestScope.fNum}</em>
                            </div>
                        </div>
                        <div id="2" class="top2">
                            <a href="#">선호하는 극장</a>
                            <div>
                                <c:forEach var="fvo" items="${requestScope.far}">
                                    <span>${fvo}</span>
                                </c:forEach>
                            </div>

                        </div>
                        <div id="3" class="top2">
                            <a href="${pageContext.request.contextPath}/UserController?type=myReservation">구매내역 바로가기</a><%--구매내역 테이블과 이너조인--%>
                            <span>구매내역을 확인해보세요</span>
                        </div>

                    </div>
                    <div>
                        <div id="h2">
                            <h2>나의 예매내역</h2>
                            <a href="${pageContext.request.contextPath}/UserController?type=myReservation">더보기&gt;</a>
                        </div>

                        <c:if test="${requestScope.rvo ne null}">
                            <c:forEach items="${requestScope.rvo}" var="rvo" begin="0" end="1">
                                <div id="myReserv">
                                    <img src="${rvo.moviePosterUrl}">
                                    <div id="reservInfo">
                                        <p>결제일시: ${rvo.reservationDate}</p>
                                        <p><em>${rvo.customReservationIdx}-예매번호</em><span>|${rvo.movieTitle}</span></p>
                                        <p>${rvo.theaterName} ${rvo.screenName}</p>
                                        <p>${rvo.timetableStartTime}</p>
                                    </div>
                                    <button type="button" class="reservCancel">취소</button>
                                    <input type="hidden" class="reservationIdx" value="${rvo.reservationIdx}"></input>
                                </div>

                            </c:forEach>
                        </c:if>
                        <c:if test="${requestScope.rvo eq null}">
                            <div id="noResult">
                                예매 내역이 없습니다
                            </div>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<article id="notice" title="다이얼로그">
    <p>
        취소 시 유효기간 경과된 관람권, 쿠폰, 포인트는 복구되지 않습니다. <br/>
        예매취소 하시겠습니까?
    </p>
   </article>
<jsp:include page="../common/footer.jsp"/>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/ui/1.14.1/jquery-ui.js"></script>
<script>   $(function () {

    var total = ${requestScope.total};
    document.addEventListener("DOMContentLoaded", function() {
        if (total >= 13000 && total < 20000) {
            document.getElementById("vip-item").classList.add("active");
        }
        if (total >=20000){
            document.getElementById("vip-item").classList.add("active");
            document.getElementById("vvip-item").classList.add("active");
        }
    });
    // 취소 버튼 클릭 이벤트
    $('.reservCancel').on('click', function () {
        let reservationIdx = $(this).siblings('.reservationIdx').val();
        // 해당 버튼과 같은 div 내의 숨겨진 input 값 가져오기 siblings 같은 부모요소를 가진 형제요소 중 클래스가 idx인 것을 선택

        $('#notice').dialog({
            modal: true,
            title: "예매 취소 확인",
            closeText: "닫기",
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