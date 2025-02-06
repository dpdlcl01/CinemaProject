<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    session.setAttribute("userIdx", request.getParameter("userIdx"));
    session.setAttribute("userId", request.getParameter("userId"));
%>
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
        }
        .tab.active {
            border-bottom: 2px solid #6a5acd;
            color: #6a5acd;
        }
        .container {
            width: 600px;
            min-height: 100vh; /* 화면 꽉 차게 */
            background: white;
            margin: auto; /* 좌우 중앙 정렬 */
            padding: 10px 20px; /* 좌우 여백 추가 */
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
            width: 60px;
            font-weight: 500;
            background-color: #f5f5f5; /* 회색 배경 */
            text-align: center;
        }
        input {
            width: 150px; /* 입력 필드 크기 조정 */
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
            box-sizing: border-box;
        }
        input:focus {
            outline: none;
            border-color: #999;
        }
        button {
            padding: 8px 14px;
            font-size: 14px;
            background-color: #503396;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            white-space: nowrap;
        }
        .note {
            width: 100%; /* 글씨 영역 폭 통일 */
            font-size: 12px;
            color: #999;
            text-align: left;
            margin-top: 10px;
            box-sizing: border-box;
        }
        /* 기본 스타일 수정 */
        table td {
            padding: 10px;
            vertical-align: middle; /* 테이블 내 요소 수직 중앙 정렬 */
        }

        .email-container {
            display: flex;
            align-items: center; /* 수직 중앙 정렬 */
            gap: 8px; /* 입력 필드와 버튼 간격 */
        }

        .inputEmail {
            width: 120px; /* 입력 필드 크기 조정 */
            padding: 8px;
            border: 1px solid #ddd;
            font-size: 14px;
            box-sizing: border-box;
        }

        #Cnum {
            padding: 8px 12px;
            font-size: 14px;
            background-color: #503396;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        /* 인증번호 입력 필드 및 인증 확인 버튼 정렬 */
        .auth-container {
            display: flex;
            align-items: center; /* 수직 정렬 */
            gap: 8px; /* 간격 조정 */
        }

        #authcode {
            width: 120px; /* 입력 필드 크기 조정 */
            padding: 8px;
            border: 1px solid #ddd;
            font-size: 14px;
            box-sizing: border-box;
        }

        .tableButton {
            padding: 8px 12px;
            font-size: 14px;
            background-color: #503396;
            border-radius: 4px;
            border: none;
            cursor: pointer;
            white-space: nowrap; /* 줄바꿈 방지 */
        }
        .pwrecovery {
            display: flex;
            justify-content: center;
            margin-top: 20px
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
    <div class="tabs">
        <a href="${pageContext.request.contextPath}/UserController?type=movefindid" class="tab">아이디 찾기</a>
        <a href="${pageContext.request.contextPath}/UserController?type=movefindpw" class="tab active">비밀번호 찾기</a>
    </div>
    <form action="${pageContext.request.contextPath}/UserController?type=findpw" method="POST">
        <input type="hidden" id="type" name="type"/>
        <input type="hidden" id="userEmail" name="userEmail"/>
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
                        <select name="emailDomain2" id="emailDomain" title="이메일 선택" class="email_address">
                            <option value="" disabled selected>선택하세요</option>
                            <option value="naver.com">naver.com</option>
                            <option value="gmail.com">gmail.com</option>
                            <option value="daum.net">daum.net</option>
                            <option value="nate.com">nate.com</option>
                            <option value="direct">직접입력</option>
                        </select>
                        <button type="button" id="Cnum" onclick="sendAuthCode()">인증번호받기</button>
                    </div>
                </td>
            </tr>

            <tr>
                <td><span>인증번호</span> </td>
                <td>
                    <div class="auth-container">
                    <input type="text" id="authcode" name="authcode" class="inputValue"/>
                    <input type="hidden" id="authcodecheck" name="authcodecheck" value=""/>
                    <button type="button" class="tableButton" onclick="verifyAuthCode()">인증 확인</button>
                </div>
                </td>
                <script>
                    function sendAuthCode() {
                        const emailPart1 = document.getElementById("emailpart1").value;
                        console.log(emailPart1);
                        const emailPart2 = document.getElementById("emailpart2").value;
                        console.log(emailPart2);


                        if (!emailPart1 || !emailPart2) {
                            showModal("이메일을 입력해주세요.");
                            return;
                        }

                        const email = emailPart1 + "@" + emailPart2;

                        const xhr = new XMLHttpRequest();
                        xhr.open("POST", "${pageContext.request.contextPath}/EmailServlet", true);
                        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                        xhr.onreadystatechange = function () {
                            if (xhr.readyState === 4 && xhr.status === 200) {
                                showModal(xhr.responseText.trim());
                            }
                        };
                        xhr.send("email=" + encodeURIComponent(email));
                    }
                </script>
            </tr>
        </table>
        <div class="pwrecovery">
        <button type="submit" onclick="gotosumbit(event, this.form)">비밀번호 찾기</button>
        </div>
    </form>

    <div class="note">
        * 본인인증 시 제공되는 정보는 해당 인증기관에서 직접 수집하며, 인증 이외의 용도로 이용 또는 저장되지 않습니다.
    </div>

    <div class="modal fade" id="alertModal" tabindex="-1" aria-labelledby="alertModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" style="max-width: 200px; max-height: 200px;">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="alertModalLabel">알림</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" data-bs-dismiss="modal">확인</button>
                </div>
            </div>
        </div>
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

    function verifyAuthCode() {
        console.log("verifyAuthCode 호출.");
        const authCode = document.getElementById("authcode").value;

        if (!authCode) {
            showModal("인증번호를 입력해주세요.");
            return;
        }

        const xhr = new XMLHttpRequest();
        xhr.open("POST", "${pageContext.request.contextPath}/VerifyCodeServlet", true);
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

        xhr.onreadystatechange = function () {
            if (xhr.readyState === 4 && xhr.status === 200) {
                const response = xhr.responseText.trim();

                if (response === "인증 성공!") {
                    showModal("인증에 성공했습니다!");
                    document.getElementById("authcodecheck").value = "success";
                } else {
                    showModal("인증에 실패했습니다. 올바른 인증번호를 입력해주세요.");
                    document.getElementById("authcodecheck").value = "";
                }
            }
        };
        xhr.send("authCode=" + encodeURIComponent(authCode));
    }

    function gotosumbit(event, frm) {
        event.preventDefault();

        const userId = document.getElementById("userId").value.trim();
        const userName = document.getElementById("userName").value.trim();
        const emailPart1 = document.getElementById("emailpart1").value.trim();
        const emailPart2 = document.getElementById("emailpart2").value.trim();
        userEmail.value = emailPart1 + "@" + emailPart2;
        const authCode = document.getElementById("authcode").value.trim();
        const authcodecheck = document.getElementById("authcodecheck").value.trim();

        if (!userId || userId.length < 3) {
            showModal("아이디를 입력해주세요.");
            document.getElementById("userId").focus();
            return false;
        }

        if (!userName || userName.length < 1) {
            showModal("이름을 입력해주세요.");
            document.getElementById("userName").focus();
            return false;
        }

        if (!emailPart1 || emailPart1.length < 3) {
            showModal("이메일 아이디를 입력해주세요.");
            document.getElementById("emailpart1").focus();
            return false;
        }

        if (!emailPart2 || emailPart2.length < 7) {
            showModal("이메일 도메인을 선택하거나 입력해주세요.");
            document.getElementById("emailpart2").focus();
            return false;
        }

        if (!authCode) {
            showModal("인증번호를 입력해주세요.");
            document.getElementById("authcode").focus();
            return false;
        }

        if(authcodecheck !== "success") {
            showModal("인증완료를 진행해주세요.");
            return false;
        }

        frm.submit();
    }

    function showModal(message) {

        document.querySelector('#alertModal .modal-body').textContent = message;

        // Bootstrap Modal 표시
        const alertModal = new bootstrap.Modal(document.getElementById('alertModal'));
        alertModal.show();
    }
</script>
</body>
</html>
