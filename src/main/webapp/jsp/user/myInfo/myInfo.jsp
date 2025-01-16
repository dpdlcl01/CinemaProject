<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!Doctype html>
<html lang="ko">

<head>
    <jsp:include page="../common/head.jsp"/>
</head>
<style>
    *{
        padding: 0;
        margin: 0;
    }
    .sidebar{
        width: 200px;
        border-radius: 6px;
        height: 360px;
        margin-top: 15px;
        margin-right: 50px;
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
    #myMega a{
        border-bottom: 2px solid #222222;
    }
    #myMega>a:hover{

        color: gray;
    }
    .sidebar li>a:hover{
        color: gray;
    }

    .main-content {
        width: 75%;
        margin: auto;
        float: right;
    }
    .section {
        background-color: #fff;
        padding: 20px;
        margin-bottom: 20px;
        border-radius: 5px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    }
    .section h2 {
        font-size: 18px;
        margin-bottom: 10px;
    }


    .card-container {
        display: flex;
        justify-content: space-between;
        padding-right: 50px;
        gap: 10px;
    }
    .card {
        flex-grow: 1;
        background-color: #f5f5f5;
        padding: 15px;
        text-align: center;
        border-radius: 5px;
    }

    #contents{
        display: flex;
        margin-left: auto;
        margin-right: auto;
        margin-bottom: 50px;
        margin-top: 50px;
        width: 1100px;
        min-height: 590px;
    }
    /*페이지 관련 css 추후 css파일로 수정됨*/

    /*페이지 관련 끝*/
</style>
<body>
<jsp:include page="../common/header.jsp"/>
<div class="page-util">
    <div class="inner-wrap">
        <div class="location">
            <span>Home</span>
            <a href="/booking" title="예매 페이지로 이동">이벤트</a>
            <a href="/booking" title="빠른예매 페이지로 이동" class="pageUtila">진행중 이벤트</a>
        </div>
    </div>
</div>
<div id="contents">
        <div class="sidebar">
            <ul>
                <div  id="myMega"><a href="MyInfo.jsp" title="나의 메가박스">나의 메가박스</a></div>
                <div class="liWrap"><li><a href="MyReservation.jsp" title="예매/구매내역">예매/구매내역</a></li></div>
                <div class="liWrap"> <li><a href="Admission-Ticket.jsp" title="영화/스토어 관람권">영화/스토어 관람권</a></li></div>
                <div class="liWrap">  <li><a href="Discount-Coupon.jsp" title="메가박스/제휴쿠폰">메가박스/제휴쿠폰</a></li></div>
                <div class="liWrap"> <li><a href="MemberShip.jsp" title="멤버십 포인트">멤버십 포인트</a></li></div>
                <div class="liWrap"> <li><a href="#" title="나의 무비스토리">나의 무비스토리</a></li></div>
                <div class="liWrap"> <li><a href="myInfo.jsp" title="회원정보">회원정보</a></li></div>
            </ul>
        </div>

        <main class="main-content">

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
        </main>
    </div>
</div>

<jsp:include page="../common/footer.jsp"/>

<script>

</script>
</body>
</html>