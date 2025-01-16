<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <jsp:include page="./common/head.jsp"/>
    <style>
        *{
            padding: 0;
            margin: 0;
        }
        #s_side {
            border: 2px solid #ccc;
            border-radius: 8px;
        }
        #side{
            border: 1px solid #;
            overflow: hidden;
        }

        #bg{
            background-color: black;
            border-radius: 4px;
        }
        .sidebar{
            width: 200px;
            height: 360px;
            margin-top: 50px;
            margin-right: 50px;
        }

        .sidebar li {
            border-bottom: 1px
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

        .sidebar ul {
            margin: 0;
            padding: 0;
            border-top : none;
        }

        .sidebar ul li {
            border: 1px solid #ccc;
            border-top: none;
        }

        #myMega{
            background-color: black;
            color: white;
            border: 1px solid black;
            border-radius: 7px;

        }

        #myMega a{
            border-bottom: 1px solid #222222;
            line-height: 90px;
            color: white;
        }

        #myMega>a:hover{

            color: gray;
        }
        .sidebar li>a:hover{
            color: gray;
        }

        /* 메인 콘텐츠 스타일 */
        .main-content {
            position: relative;
            flex-grow: 1;
            padding: 40px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            border-radius: 5px;
            margin-bottom: 50px;
            margin-top: 50px;
        }

        .main-content header1 {
            margin: 30px;
        }

        .main-content header h1 {
            font-size: 24px;
            margin-bottom: 10px;
        }

        .main-content header p {
            font-size: 14px;
            color: #555;
        }

        .register-btn {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 10px 15px;
            cursor: pointer;
            border-radius: 5px;
        }

        /* 테이블 스타일 */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: center;
        }

        th {
            background-color: #f4f4f4;
        }

        /* 푸터 스타일 */
        footer {
            text-align: center;
            margin-top: 20px;
            font-size: 12px;
            color: #777;
        }

        .contents {
            display : flex;
            min-height: 590px;
        }
    </style>
</head>
<div>
<jsp:include page="./common/header.jsp"/>
<jsp:include page="./common/page_util.jsp"/>
<div class="contents">

    <!-- 사이드바 -->
    <div class="sidebar">
        <div id="s_side">
            <div id="bg">
        <div id="myMega"><a href="MyInfo.jsp" title="나의 메가박스"><strong>나의 메가박스</strong></a></div>
            </div>
        <ul id="side">
            <li><a href="Reservation.jsp" title="예매/구매내역">예매/구매내역</a></li>
            <li><a href="Admission-Ticket.jsp" title="영화/스토어 관람권">영화/스토어 관람권</a></li>
            <li><a href="Discount-Coupon.jsp" title="메가박스/제휴쿠폰">메가박스/제휴쿠폰</a></li>
            <li><a href="MemberShip.jsp" title="멤버십 포인트">멤버십 포인트</a></li>
            <li><a href="#" title="나의 무비스토리">나의 무비스토리</a></li>
            <li><a href="#" title="회원정보">회원정보</a></li>
        </ul>
    </div>
    </div>

    <!-- 메인 콘텐츠 -->
    <main class="main-content">
        <!-- 헤더 -->
        <header>
            <h1>영화관람권</h1>
            <p>보유하신 영화관람권/예매권 내역입니다.<br>소지하신 지정(특정) 관람권은 등록 후 이용하실 수 있습니다.</p>
            <button class="register-btn">관람권 등록</button>
        </header>

        <!-- 테이블 -->
        <section class="ticket-table">
            <table>
                <thead>
                <tr>
                    <th>관람권명</th>
                    <th>유효기간</th>
                    <th>사용상태</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td colspan="3">조회된 관람권 내역이 없습니다.</td>
                </tr>
                </tbody>
                </table>
            </section>
        </main>
    </div>
</div>
<jsp:include page="./common/footer.jsp"/>
</body>
</html>