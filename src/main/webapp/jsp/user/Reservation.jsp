<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!Doctype html>
<html lang="ko">
<head>
<jsp:include page="./common/head.jsp"/>
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

        #contents {
            width: 1100px;
            display: flex;
            margin-left: auto;
            margin-right: auto;
            min-height: 590px;
            margin-bottom: 20px;
            margin-top: 20px;
        }

        .content1 {
            width: 70%;
            flex-grow: 1;
            padding: 20px;
            box-sizing: border-box;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            margin-bottom: 50px;
            margin-top: 50px;
        }
        .content1 h1 {
            font-size: 24px;
            margin-bottom: 20px;
        }
        .content1 .filter {
            margin-bottom: 20px;
        }
        .content1 .filter select,
        .content1 .filter button {
            padding: 5px 10px;
            margin-right: 10px;
        }
        .content1 table {
            width: 100%;
            border-collapse: collapse;
        }
        .content1 table th,
        .content1 table td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: left;
        }
        .content1 table th {
            background-color: #f4f4f4;
        }
    </style>
</head>
<body>
<jsp:include page="./common/header.jsp"/>
<jsp:include page="./common/page_util.jsp"/>
<main>
    <div id="contents">
            <div class="sidebar">
                <ul>
                    <div id="myMega"><a href="MyInfo.jsp" title="나의 메가박스"><strong>나의 메가박스</strong></a></div>
                    <li><a href="Reservation.jsp" title="예매/구매내역">예매/구매내역</a></li>
                    <li><a href="Admission-Ticket.jsp" title="영화/스토어 관람권">영화/스토어 관람권</a></li>
                    <li><a href="Discount-Coupon.jsp" title="메가박스/제휴쿠폰">메가박스/제휴쿠폰</a></li>
                    <li><a href="MemberShip.jsp" title="멤버십 포인트">멤버십 포인트</a></li>
                    <li><a href="#" title="나의 무비스토리">나의 무비스토리</a></li>
                    <li><a href="#" title="회원정보">회원정보</a></li>
                </ul>
            </div>


    <div class="content1">
        <!-- Page Title -->
        <h1>예매/구매 내역</h1>

        <div class="filter">
            <select>
                <option>예매내역</option>
                <option>지난내역</option>
                <option>취소내역</option>
            </select>
            <select>
                <option>2025년 1월</option>
                <option>2024년 12월</option>
                <option>2024년 11월</option>
            </select>
            <button>조회</button>
        </div>

        <table class="table">
            <thead>
            <tr>
                <th>취소일시</th>
                <th>영화명</th>
                <th>극장</th>
                <th>상영일시</th>
                <th>취소금액</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td colspan="5" style="text-align:center;">취소내역이 없습니다.</td>
            </tr>
            </tbody>
        </table>
    </div>
    </div>
    </div>
</main>

<footer>
    <jsp:include page="./common/footer.jsp"/>
</footer>

</body>
</html>
