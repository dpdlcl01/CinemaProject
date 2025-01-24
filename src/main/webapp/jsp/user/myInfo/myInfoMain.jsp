<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!Doctype html>
<html lang="ko">
<head>
    <jsp:include page="../common/head.jsp"/>
</head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/myInfo.css"/>
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
            <div class="main-content">
                <div class="section">
                    <h2>안녕하세요! [username]님</h2>
                    <p>포인트 : 0P</p>
                </div>
                <div class="card-container">
                    <div class="card">
                        <h3>나의 무비스토리</h3>
                        <p>본 영화 : 0편<br>관람평 : 0개<br>보고싶다 : 0개</p>
                    </div>
                    <div class="card">
                        <h3>선호관람정보</h3>
                        <p>선호극장 : 없음<br>선호시간 : 없음</p>
                    </div>
                </div>
                <div class="section">
                    <h2>나의 예매내역</h2>
                    <p>예매 내역이 없습니다.</p>
                </div>
                <div class="section">
                    <h2>나의 구매내역</h2>
                    <p>구매 내역이 없습니다.</p>
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