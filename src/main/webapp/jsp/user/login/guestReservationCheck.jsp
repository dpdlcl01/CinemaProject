<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            background-color: #f0f0f0;
            display: flex;
            justify-content: center;
            align-items: flex-start;
            min-height: 100vh;
        }

        .container {
            width: 600px;
            min-height: 100vh;
            background: white;
            margin: auto;
            padding: 20px;
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
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        table tr:first-child {
            border-top: 1px solid #000;
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
            font-weight: bold;
            background-color: #f5f5f5;
            text-align: center;
        }

        input {
            width: 100%;
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
            width: 100%;
            padding: 10px;
            font-size: 16px;
            background-color: #339eb2;
            border-radius: 4px;
            color: #fff;
            border: none;
            cursor: pointer;
            margin-bottom: 10px;
        }

        button:hover {
            background-color: #1e7f9a;
        }

        .email-container {
            display: flex;
            align-items: center;
            gap: 5px;
        }

        .input {
            width: calc(50% - 10px);
        }

        select {
            padding: 5px;
            font-size: 14px;
        }

        .note {
            font-size: 12px;
            color: #999;
            text-align: left;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="logo">
        <img src="${pageContext.request.contextPath}/css/user/images/logo_cinefeel.png" alt="MEGABOX 로고">
    </div>
    <h1>비회원 예매 확인</h1>

    <form action="${pageContext.request.contextPath}/UserController?type=nonmemberReservationCheck" method="POST">
        <table>
            <tr>
                <td>이름</td>
                <td><input type="text" name="userName" placeholder="이름" class="input" required></td>
            </tr>
            <tr>
                <td>이메일</td>
                <td>
                    <div class="email-container">
                        <input type="text" id="emailpart1" name="emailpart1" class="input" placeholder="이메일 앞자리">
                        <span>@</span>
                        <input type="text" id="emailpart2" name="emailpart2" class="input" disabled placeholder="도메인">
                        <input type="hidden" id="hiddenEmailPart2" name="hiddenEmailPart2"/>
                        <select name="emailDomain" id="emailDomain" class="email_address">
                            <option value="" disabled selected>선택하세요</option>
                            <option value="naver.com">naver.com</option>
                            <option value="gmail.com">gmail.com</option>
                            <option value="daum.net">daum.net</option>
                            <option value="nate.com">nate.com</option>
                            <option value="direct">직접입력</option>
                        </select>
                    </div>
                </td>
            </tr>
            <tr>
                <td>비밀번호</td>
                <td><input type="password" name="userAuthPassword" placeholder="숫자 4자리" class="input" required></td>
            </tr>
        </table>
        <button type="button" id="checkReservation">비회원 예매 확인</button>
    </form>

    <div class="note">
        * 비회원 정보 오 입력 시 예매 내역 확인/취소 및 티켓 발권이 어려울 수 있으니 다시 한번 확인해 주시기 바랍니다.
    </div>
</div>
<script>
    document.addEventListener("DOMContentLoaded", function () {
        const domain = document.getElementById("emailDomain");
        const emailpart2input = document.getElementById("emailpart2");

        domain.addEventListener("change", function () {
            if (this.value === "direct") {
                emailpart2input.disabled = false;
                emailpart2input.value = "";
                emailpart2input.placeholder = "도메인 입력";
            } else {
                emailpart2input.disabled = true;
                emailpart2input.value = this.value;
            }
        });

        $('#checkReservation').on('click', function () {
            const formData = $('form').serialize();

            $.ajax({
                type: 'POST',
                url: '${pageContext.request.contextPath}/UserController',
                data: formData,
                success: function (response) {
                    if (response.status === 'success') {
                        alert('예약 내역이 확인되었습니다.');
                        window.location.href = '${pageContext.request.contextPath}/jsp/user/reservation/reservationSuccess.jsp';
                    } else {
                        alert(response.message || '예약 정보를 확인할 수 없습니다.');
                    }
                },
                error: function () {
                    alert('서버 통신 중 오류가 발생했습니다.');
                }
            });
        });

    });
</script>
</body>
</html>
