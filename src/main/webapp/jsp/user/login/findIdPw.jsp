<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>아이디/비밀번호 찾기</title>
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
            width: 600px;
            min-height: 100vh; /* 화면 꽉 차게 */
            background: white;
            margin: auto; /* 좌우 중앙 정렬 */
            padding: 100px 100px; /* 좌우 여백 추가 */
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
            /*cursor: not-allowed; !* 비활성화 효과 *!*/
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
        <img src="${pageContext.request.contextPath}/css/user/images/logo-purple.png" alt="MEGABOX 로고">
    </div>
    <h1>아이디/비밀번호 찾기</h1>

    <!-- 에러 메시지 표시 -->
    <c:if test="${not empty error}">
        <div class="error-message" style="color: red; text-align: center; margin-top: 10px;">
            <p>${error}</p>
        </div>
    </c:if>

    <form action="#" method="POST">
        <table>
            <tr>
                <td>아이디</td>
                <td><input type="text" name="userId" placeholder="아이디" required></td>
            </tr>
            <tr>
                <td>이름</td>
                <td><input type="text" name="userName" placeholder="이름" required></td>
            </tr>
            <tr>
                <td><span>이메일</span> </td>
                <td><input type="text" id="emailpart1" name="emailpart1" class="inputEmail">
                    <span>@</span>
                    <input type="text" id="emailpart2" name="emailpart2" class="inputEmail">
                    <button type="button" id="Cnum" onclick="sendAuthCode()">인증번호받기</button> </td>
            </tr>
            <tr>
                <td><span>인증번호</span> </td>
                <td><input type="text" id="authcode" name="authcode" class="inputValue">
                    <button type="button" class="tableButton" onclick="verifyAuthCode()">인증 확인</button> </td>
                <script>
                    // 인증번호 확인 AJAX 요청
                    function sendAuthCode() {
                        const emailPart1 = document.getElementById("emailpart1").value;
                        console.log(emailPart1);
                        const emailPart2 = document.getElementById("emailpart2").value;
                        console.log(emailPart2);


                        if (!emailPart1 || !emailPart2) {
                            alert("이메일을 입력해주세요.");
                            return;
                        }

                        const email = emailPart1 + "@" + emailPart2;

                        const xhr = new XMLHttpRequest();
                        xhr.open("POST", "${pageContext.request.contextPath}/EmailServlet", true);
                        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                        xhr.onreadystatechange = function () {
                            if (xhr.readyState === 4 && xhr.status === 200) {
                                alert(xhr.responseText.trim());
                            }
                        };
                        xhr.send("email=" + encodeURIComponent(email));
                    }
                </script>
            </tr>
            <tr>
                <td>비밀번호</td>
                <td><input type="password" name="userAuthPassword" placeholder="비밀번호" required></td>
            </tr>
        </table>
        <button type="submit">비밀번호 찾기</button>
    </form>

    <div class="note">
        * 본인인증 시 제공되는 정보는 해당 인증기관에서 직접 수집하며, 인증 이외의 용도로 이용 또는 저장되지 않습니다.
    </div>
</div>
</body>
</html>
