<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: block;
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
        .content {
            flex: 1;
            padding: 20px;
            box-sizing: border-box;
        }
        .content h1 {
            font-size: 18px;
            margin-bottom: 20px;
        }
        .content .filter {
            margin-bottom: 20px;
        }
        .content .filter select, .content .filter button {
            padding: 5px;
            margin-right: 10px;
        }
        .content .table {
            width: 100%;
            border-collapse: collapse;
        }
        .content .table th, .content .table td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: left;
        }
        .content .table th {
            background-color: #f4f4f4;
        }
    </style>
</head>
<body>

<div class="sidebar">
    <ul>
        <li><a href="#">예매/구매내역</a></li>
        <li><a href="#">영화/스토어 관람권</a></li>
        <li><a href="#">메가박스/제휴쿠폰</a></li>
        <li><a href="#">멤버십 포인트</a></li>
        <li><a href="#">나의 무비스토리</a></li>
        <li><a href="#">나의 이벤트 응모내역</a></li>
        <li><a href="#">나의 문의내역</a></li>
        <li><a href="#">회원정보</a></li>
    </ul>
</div>
<div class="content">
    <h1>예매/구매 내역</h1>
    <div class="filter">
        <select>
            <option>예매내역</option>
            <option>지난내역</option>
        </select>
        <select>
            <option>2025년 1월</option>
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
            <td colspan="5" style="text-align: center;">취소내역이 없습니다.</td>
        </tr>
        </tbody>
    </table>
</div>
</body>
</html>
