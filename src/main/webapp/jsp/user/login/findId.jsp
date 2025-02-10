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

        .tabs {
            display: flex;
            justify-content: space-around;
            margin: 20px 0;
            border-bottom: 2px solid #ccc;
        }

        .tab {
            padding: 10px 0;
            width: 150px;
            text-align: center;
            cursor: pointer;
            border-bottom: 2px solid transparent;
            font-size: 16px;
            color: #339eb2;
            text-decoration: none; /* 밑줄 제거 */
        }

        .tab.active {
            border-bottom: 2px solid #339eb2;
            color: #339eb2;
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
            margin-bottom: 10px;
        }

        button:hover {
            background-color: #1e7f9a;
        }

        .note {
            font-size: 12px;
            color: #999;
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
        <img src="${pageContext.request.contextPath}/css/user/images/logo_cinefeel.png" alt="MEGABOX 로고">
    </div>
    <h1><b>아이디/비밀번호 찾기</b></h1>

    <div class="tabs">
        <a href="${pageContext.request.contextPath}/UserController?type=goidfind" class="tab active">아이디 찾기</a>
        <a href="${pageContext.request.contextPath}/UserController?type=movefindpw" class="tab">비밀번호 찾기</a>
    </div>

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
                        <input type="hidden" id="hiddenEmailPart2" name="hiddenEmailPart2"/>
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
            <button type="button" id="findid" name="findid" onclick="searchid(event, this.form)">아이디 찾기</button>
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
        const hiddenEmailPart2 = document.getElementById("hiddenEmailPart2");

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
            hiddenEmailPart2.value = emailpart2input.value;
        });
    });

    function searchid(event) {
        event.preventDefault();

        let userName = document.getElementById("userName").value.trim();
        let emailPart1 = document.getElementById("emailpart1").value.trim();
        let hiddenEmailPart2 = document.getElementById("hiddenEmailPart2").value.trim();

        if (!userName) {
            alert("이름을 입력해주세요.");
            return false;
        }

        if (!emailPart1) {
            alert("이메일 첫 번째 칸을 입력해주세요.");
            return false;
        }

        if (!hiddenEmailPart2) {
            alert("이메일 두 번째 칸을 선택하거나 입력해주세요.");
            return false;
        }

        // AJAX 요청
        $.ajax({
            type: "POST",
            url: `${pageContext.request.contextPath}/UserController`,
            data: {
                type: "findid",
                userName: userName,
                emailpart1: emailPart1,
                hiddenEmailPart2: hiddenEmailPart2
            },
            dataType: "json",
            success: function (response) {
                if (response.status === "success") {
                    alert(response.message);
                    // 성공 시 처리 (예: 아이디 확인 페이지로 이동)
                    window.location.href = `${pageContext.request.contextPath}/jsp/user/login/result/idFind_success.jsp`;
                } else {
                    alert(response.message);
                }
            },
            error: function () {
                alert("서버 통신 중 오류가 발생했습니다.");
            }
        });
    }
</script>
</body>
</html>
