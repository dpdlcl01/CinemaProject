<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CINEFEEL - NEW OCEAN ESSENTIAL</title>
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
            text-decoration: none;
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

        .auth-container {
            display: flex;
            align-items: center;
            gap: 8px;
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
        <a href="${pageContext.request.contextPath}/UserController?type=goidfind" class="tab">아이디 찾기</a>
        <a href="${pageContext.request.contextPath}/UserController?type=movefindpw" class="tab active">비밀번호 찾기</a>
    </div>

    <!-- 에러 메시지 표시 -->
    <c:if test="${not empty error}">
        <div class="error-message" style="color: red; text-align: center; margin-top: 10px;">
            <p>${error}</p>
        </div>
    </c:if>
    <form id="findPasswordForm">
        <input type="hidden" id="type" name="type"/>
        <input type="hidden" id="userEmail" name="userEmail"/>
        <input type="hidden" id="hiddenEmailPart2" name="emailpart2"/>
        <table>
            <tr>
                <td>아이디</td>
                <td><input type="text" id="userId" name="userId" placeholder="아이디" required></td>
            </tr>
            <tr>
                <td>이름</td>
                <td><input type="text" id="userName" name="userName" placeholder="이름" required></td>
            </tr>
            <tr>
                <td>이메일</td>
                <td>
                    <div class="email-container">
                        <input type="text" id="emailpart1" name="emailpart1" class="inputshort">
                        <span>@</span>
                        <input type="text" id="emailpart2" name="emailpart2" class="inputshort" disabled>
                        <select name="emailDomain2" id="emailDomain" class="email_address">
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
            <button type="button" id="findPasswordButton">비밀번호 찾기</button>
        </div>
    </form>

    <div class="note">
        * 본인인증 시 제공되는 정보는 해당 인증기관에서 직접 수집하며, 인증 이외의 용도로 이용 또는 저장되지 않습니다.
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    document.addEventListener("DOMContentLoaded", function() {
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
            document.getElementById("hiddenEmailPart2").value = emailpart2input.value;  // 숨겨진 필드에 값 복사
        });

        $("#findPasswordButton").on("click", function() {
            let userId = $("#userId").val().trim();
            let userName = $("#userName").val().trim();
            let emailPart1 = $("#emailpart1").val().trim();
            let hiddenEmailPart2 = $("#hiddenEmailPart2").val().trim();

            if (!userId || !userName || !emailPart1 || !hiddenEmailPart2) {
                alert("모든 필드를 정확히 입력해 주세요.");
                return;
            }

            var contextPath = "${pageContext.request.contextPath}";

            // AJAX 요청
            $.ajax({
                type: "POST",
                url: contextPath + "/UserController?type=findpw",
                data: {
                    userId: userId,
                    userName: userName,
                    emailpart1: emailPart1,
                    hiddenEmailPart2: hiddenEmailPart2
                },
                dataType: "json",
                success: function (response) {
                    if (response.status === "success") {
                        alert(response.message);
                        // 성공 시 처리 (예: 비밀번호 재설정 페이지로 이동)
                        window.location.href = contextPath + "/jsp/user/login/result/pwFind_success.jsp?userId=" + response.userId;
                    } else {
                        alert(response.message);
                    }
                },
                error: function () {
                    alert("서버 통신 중 오류가 발생했습니다.");
                }
            });
        });
    });
</script>
</body>
</html>
