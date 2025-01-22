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
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/myInfo.css">
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
        margin-left: 110px;
        border-radius: 6px;
        font-size: 12px;
        font-weight: bold;
        position: absolute;
        top: 50px;
        left: 50%;
        transform: translateX(-50%);
        white-space: nowrap;
        display: none;
    }

    /* 말풍선 꼬리 */
    .tooltip::after {
        content: "";
        position: absolute;
        bottom: -6px;
        left: 50%;
        transform: translateX(-50%);
        border-width: 6px;
        border-style: solid;
        border-color: #22C8F6 transparent transparent transparent;
    }
    .level-item.active .tooltip {
        display: block;
    }
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
            <%--  사이드바  --%>
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
                                        ${requestScope.uvo.userPoint}
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
                                        <div class="tooltip">다음 VIP 등급까지 N P 남았어요!</div>
                                        <span>BASIC</span>
                                    </li>
                                    <li class="level-item"><span>VIP</span></li>
                                    <li class="level-item"><span>VVIP</span></li>
                                </ul>

                            </div>
                        </div>
                        <div id="top2">
                            <div id="1" class="top2">
                                <a href="#">나의 무비스토리</a><%--페이보릿시어터랑 이너조인--%>
                                <div>
                                    <span>본 영화</span>
                                    <em>0개</em>
                                </div>
                                <div>
                                    <span>관람평</span>
                                    <em>0개</em>
                                </div>
                                <div>
                                    <span>보고싶어</span>
                                    <em>0개</em>
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
                                <a href="#">구매내역 바로가기</a><%--구매내역 테이블과 이너조인--%>
                                <span>구매내역을 확인해보세요</span>
                            </div>
                            <div id="4" class="top2">
                                <a href="#">문의내역 바로가기</a>
                                <span>문의내역을 확인해보세요</span>
                            </div>
                        </div>
                        <div>
                            <div id="h2">
                                <h2>나의 예매내역</h2>
                                <button type="button">더보기&gt;</button>
                            </div>


                            <div id="myReserv"><%--예매내역 테이블과 이너조인--%>
                                <img src="${pageContext.request.contextPath}/css/user/images/KangImg/EYpFsiHJszKXH8dmVKsH1xsQh1TjggZZ_316.jpg">
                                <div id="reservInfo">
                                    <p>결제일시: 디비에서</p>
                                    <p><em>0000-0000-예매번호</em><span>|영화명/2D</span></p>
                                    <p>상영관</p>
                                    <p>날짜 시간</p>
                                </div>
                                <button type="button">예매취소</button>
                            </div>
                            <div id="noResult">
                                예매 내역이 없습니다
                            </div>
                        </div>
                    </div>


                </div>





        </div>
    </div>
</div>

<jsp:include page="../common/footer.jsp"/>

<script>

</script>
</body>
</html>