<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>비회원 예매 확인</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f0f0f0; /* 좌우 회색 배경 */
            display: flex;
            justify-content: center;
            align-items: flex-start;
            min-height: 100vh;
        }
        .container {
            width: 500px;
            min-height: 100vh; /* 화면 꽉 차게 */
            background: white;
            margin: auto; /* 좌우 중앙 정렬 */
            padding: 100px 40px; /* 좌우 여백 추가 */
            box-sizing: border-box;
        }
        .logo img {
            width: 150px;
            margin: 0 auto 20px;
            display: block;
        }
        h1 {
            font-size: 18px;
            font-weight: 500;
            color: #4a4a4a;
            text-align: center;
            margin-bottom: 20px;
        }
        table {
            width: 100%; /* 테이블 폭 통일 */
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        table tr:first-child {
            border-top: 1px solid #000; /* 맨 윗선 굵게 */
        }
        table tr {
            border-bottom: 1px solid #ddd;
        }
        table td {
            padding: 10px;
            font-size: 14px;
        }
        table td:first-child {
            width: 30%;
            font-weight: 500;
            background-color: #f5f5f5; /* 회색 배경 */
            text-align: center;
        }
        input {
            width: 100%; /* 입력 필드 폭 통일 */
            padding: 8px;
            border: 1px solid #ddd;
            font-size: 14px;
            box-sizing: border-box;
        }
        input:focus {
            outline: none;
            border-color: #999;
        }
        button {
            width: 100%; /* 버튼 폭 통일 */
            padding: 10px;
            font-size: 16px;
            background-color: #e0e0e0;
            color: #4a4a4a;
            border: none;
            cursor: not-allowed; /* 비활성화 효과 */
            margin-bottom: 10px; /* 버튼 아래 여백 */
        }
        .note {
            width: 100%; /* 글씨 영역 폭 통일 */
            font-size: 12px;
            color: #999;
            text-align: left;
            margin-top: 10px;
            box-sizing: border-box;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="logo">
        <img src="https://via.placeholder.com/150x50?text=MEGABOX" alt="MEGABOX 로고">
    </div>
    <h1>비회원 예매 확인</h1>
    <form>
        <table>
            <tr>
                <td>이름</td>
                <td><input type="text" placeholder="이름" required></td>
            </tr>
            <tr>
                <td>생년월일</td>
                <td><input type="text" placeholder="생년월일 앞 6자리" required></td>
            </tr>
            <tr>
                <td>휴대폰 번호</td>
                <td><input type="text" placeholder="'-' 없이 입력" required></td>
            </tr>
            <tr>
                <td>비밀번호</td>
                <td><input type="password" placeholder="숫자 4자리" required></td>
            </tr>
        </table>
        <button type="button" disabled>비회원 예매 확인</button>
    </form>
    <div class="note">
        * 비회원 정보 오 입력 시 예매 내역 확인/취소 및 티켓 발권이 어려울 수 있으니 다시 한번 확인해 주시기 바랍니다.
    </div>
</div>
</body>
</html>
