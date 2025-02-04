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
            padding: 50px; /* 좌우 여백 추가 */
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
            font-weight: bold; /* 강조 */
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
            border-color: #999; /* 포커스 시 테두리 색상 변경 */
        }

        button {
            width: 100%; /* 버튼 폭 통일 */
            padding: 10px;
            font-size: 16px;
            background-color: #503396;
            border-radius: 4px;
            color: #4a4a4a; /* 버튼 글자색 */
            border: none; /* 테두리 제거 */
            margin-bottom: 10px; /* 버튼 아래 여백 */
        }

        .note {
            width: 100%; /* 글씨 영역 폭 통일 */
            font-size: 12px;
            color: #999; /* 회색 글씨 */
            text-align: left;
        }

        .email-container {
            display: flex;
            align-items: center;
            gap: 5px;
        }

        .inputshort {
            width: 120px;
        }

        select {
            padding: 5px;
            font-size: 14px;
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
    <form action="${pageContext.request.contextPath}/UserController?type=findid" method="POST">
        <input type="hidden" id="type" name="type"/>
        <input type="hidden" id="userEmail" name="userEmail"/>
        <table>
            <tr>
                <td><label for="userName">이름</label></td>
                <td><input type="text" class="inputshort" name="userName" id="userName" placeholder="이름"></td>
            </tr>
            <tr>
                <td><label for="emailpart1">이메일</label></td>
                <td>
                    <div class="email-container">
                        <input type="text" id="emailpart1" name="emailpart1" class="inputshort">
                        <span>@</span>
                        <input type="text" id="emailpart2" name="emailpart2" class="inputshort" disabled>
                        <select name="emailDomain" id="emailDomain" title="이메일 선택" class="email_address">
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
        </table>
        <div class="button-container">
            <!-- 버튼 클릭 시 findid 함수 호출 -->
            <button type="button" id="findid" name="findid" onclick="searchid(event, this.form)">확인</button>
        </div>
    </form>


    <div class="note">
        * 본인인증 시 제공되는 정보는 해당 인증기관에서 직접 수집하며, 인증 이외의 용도로 이용 또는 저장되지 않습니다.
    </div>
</div>
<script>
    document.addEventListener("DOMContentLoaded", function() {
        const domain = document.getElementById("emailDomain");
        const emailpart2input = document.getElementById("emailpart2");

        domain.addEventListener("change", function () {
            const selectedValue = this.value;
            if(this.value === "direct") {
                emailpart2input.disabled = false;
                emailpart2input.value = "";
                emailpart2input.placeholder = "도메인 입력";
            } else {
                emailpart2input.disabled = true;
                emailpart2input.value = selectedValue;
            }
        })
    })

    function searchid(event, frm) {
        event.preventDefault(); // 기본 동작 방지

        let userName = document.getElementById("userName").value.trim();
        let emailPart1 = document.getElementById("emailpart1").value.trim();
        let emailPart2 = document.getElementById("emailpart2").value.trim();
        const userEmail = document.getElementById("userEmail");

        // 이메일 조합
        userEmail.value = emailPart1 + "@" + emailPart2;

        // 입력값 검증
        if (!userName || userName.length < 1) {
            alert("이름을 입력해주세요.");
            return false;
        }

        if (!emailPart1 || emailPart1.length < 3) {
            alert("이메일 첫 번째 칸을 입력해주세요.");
            return false;
        }

        if (!emailPart2 || emailPart2.length < 3) {
            alert("이메일 두 번째 칸을 선택하거나 입력해주세요.");
            return false;
        }

        // type 값 설정
        document.getElementById("type").value = "findid";

        // 폼 제출
        frm.submit();
    }
</script>
</body>
</html>
