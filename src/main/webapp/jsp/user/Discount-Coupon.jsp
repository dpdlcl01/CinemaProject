<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!Doctype html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>메가박스/제휴쿠폰</title>
    <link rel="stylesheet" href="../../css/user/reset.css">
    <link rel="stylesheet" href="../../css/user/style.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
        }

        .clearfix {
            display: flex;
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
        }

        .sidebar {
            width: 250px;
            background-color: #f8f8f8;
            border-right: 1px solid #ddd;
            padding: 20px;
            box-sizing: border-box;
        }

        .sidebar ul {
            list-style: none;
            padding: 0;
        }

        .sidebar ul li {
            margin-bottom: 10px;
        }

        .sidebar ul li a {
            text-decoration: none;
            color: #333;
            font-size: 14px;
        }

        .main-content {
            flex-grow: 1;
            padding: 20px;
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
    </style>
</head>
<body>
<jsp:include page="header.jsp"/>

<div class="clearfix">
    <!-- Sidebar -->
    <div class="sidebar">
        <ul>
            <li><a href="MyInfo.jsp"><strong>나의 메가박스</strong></a></li>
            <li><a href="Reservation.jsp">예매/구매내역</a></li>
            <li><a href="#">영화/스토어 관람권</a></li>
            <li><a href="Discount-Coupon.jsp">메가박스/제휴쿠폰</a></li>
            <li><a href="#">멤버십 포인트</a></li>
            <li><a href="#">나의 무비스토리</a></li>
            <li><a href="#">회원정보</a></li>
        </ul>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <!-- Section Header -->
        <div class="section">
            <h2>메가박스/제휴쿠폰</h2>

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

<jsp:include page="footer.jsp"/>
</body>
</html>
