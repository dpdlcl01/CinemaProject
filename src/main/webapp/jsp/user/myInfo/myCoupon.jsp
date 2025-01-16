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
            flex-grow: 1;
            padding: 40px;
        }

        .section {
            background-color: #fff;
            padding: 20px;
            margin-bottom: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);

        }

        .section h1 {
            margin-bottom: 30px; /*다시 보기.*/
            font-size: 24px;
        }

        .filters {
            display: flex;
            align-items: center;
            gap: 10px;
            margin-bottom: 20px;
        }

        .filters input[type="radio"] {
            margin-right: 5px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        table th, table td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: left;
        }

        table th {
            background-color: #f4f4f4;
        }
        .contents{
            display: flex;
            margin-bottom: 50px;
            margin-top: 50px;
            min-height: 590px;
        }
    </style>
<body>
<main>
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
    <div class = "contents">
        <div class="sidebar">
            <ul>
                <div id="myMega"><a href="myInfoMain.jsp" title="나의 메가박스"><strong>나의 메가박스</strong></a></div>
                <li><a href="myReservation.jsp" title="예매/구매내역">예매/구매내역</a></li>
                <li><a href="myAdmissionTicket.jsp" title="영화/스토어 관람권">영화/스토어 관람권</a></li>
                <li><a href="myCoupon.jsp" title="메가박스/제휴쿠폰">메가박스/제휴쿠폰</a></li>
                <li><a href="myMembership.jsp" title="멤버십 포인트">멤버십 포인트</a></li>
                <li><a href="#" title="나의 무비스토리">나의 무비스토리</a></li>
                <li><a href="editMyInfo.jsp" title="회원정보">회원정보</a></li>
            </ul>
        </div>

        <!-- Main Content -->
        <div class="main-content">
            <!-- Section Header -->
            <div class="section">
                <h1>메가박스/제휴쿠폰</h1>

                <!-- Information -->
                <p>• 보유하신 쿠폰 내역입니다.<br>• 각 쿠폰 별 사용 방법이 다르니 사용 전 상세 쿠폰정보를 확인바랍니다.</p>

                <!-- Filters -->
                <div class="filters">
                    <label><input type="radio" name="filter" checked> 사용가능</label>
                    <label><input type="radio" name="filter"> 사용완료</label>
                    <label><input type="radio" name="filter"> 기간만료</label>

                    <select>
                        <option>전체</option>
                        <option>매점</option>
                        <option>포인트</option>
                        <option>기타</option>
                    </select>

                    <button>조회</button>
                </div>

                <!-- Coupon Table -->
                <table>
                    <thead>
                    <tr>
                        <th>구분</th>
                        <th>쿠폰명</th>
                        <th>유효기간</th>
                        <th>사용상태</th>
                        <th></th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>매점</td>
                        <td>[생일쿠폰] 오리지널 팝콘 L 무료<br>9218-4969-2233-4408</td>
                        <td>2025.01.05 ~ 2025.01.23</td>
                        <td>사용가능</td>
                        <td><button>쿠폰정보</button></td>
                    </tr>
                    </tbody>
                </table>

                <!-- Pagination -->
                <div style="text-align:center; margin-top:20px;">
                    [1]
                </div>

            </div>

            </div>
        </div>
    </div>
</main>
<jsp:include page="../common/footer.jsp"/>
</body>
</html>
