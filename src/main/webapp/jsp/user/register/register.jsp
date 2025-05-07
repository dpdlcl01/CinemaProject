<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <jsp:include page="../common/head.jsp"/>
    <style>
        body {
            background-color: #f7f7f7;
            font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;
            margin: 0;
            padding: 0;
            color: #333;
        }

        .contents {
            max-width: 600px;
            min-height: 1100px;
            margin: auto;
            background: #fff;
            padding: 30px;
        }

        /* 로고 영역 */
        h1 {
            background: url("${pageContext.request.contextPath}/css/user/images/logo_cinefeel.png") no-repeat center;
            height: 80px;
            text-indent: -9999px;
            margin-bottom: 30px;
        }

        /* 단계 표시 영역 */
        #step {
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-bottom: 2px solid #e0e0e0;
            padding-bottom: 10px;
            margin-bottom: 25px;
        }
        .step {
            flex: 1;
            text-align: center;
            font-size: 14px;
            color: #999;
            position: relative;
        }

        /* 각 단계 사이 구분선 */
        .step:not(:last-child)::after {
            content: "";
            position: absolute;
            right: 0;
            top: 50%;
            transform: translateY(-50%);
            height: 20px;
            border-right: 1px solid #e0e0e0;
        }

        /* 테이블 기본 스타일 */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        table caption {
            display: none;
        }
        table td {
            padding: 10px;
            border-bottom: 1px solid #f0f0f0;
            vertical-align: middle;
        }

        /* 폼 요소 스타일 */
        input[type="text"],
        input[type="password"],
        textarea,
        select {
            width: 100%;
            padding: 8px;
            font-size: 14px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        input[type="checkbox"],
        input[type="radio"] {
            margin-right: 5px;
        }

        input[type="password"]{
            width: 300px;
        }
        /* 버튼 스타일 */
        button {
            background-color: #339eb2;
            color: #fff;
            border: none;
            border-radius: 4px;
            padding: 10px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            width: 100%;
        }
        button:disabled {
            background-color: #ccc;
            cursor: not-allowed;
        }
        button:hover:not(:disabled) {
            background-color: #1e7f9a;
        }

        .checkbox,
        .radioContainer {
            margin: 20px 0;
            font-size: 14px;
        }
        .checkbox label,
        .radioContainer label {
            vertical-align: middle;
        }

        /* 텍스트 영역(약관) 스타일 */
        textarea {
            color: #333333;
            resize: vertical;
            border: 1px solid #ddd;
            background: #fafafa;
        }


        #box {
            border: 1px solid #ddd;
            border-radius: 4px;
            padding: 15px;
            margin-bottom: 20px;
            background: #f9f9f9;
        }
        #boxTitle {
            font-size: 16px;
            font-weight: bold;
            text-align: center;
            margin-bottom: 10px;
        }
        #box h5 {
            font-size: 14px;
            margin: 10px 0 5px;
        }
        #box p {
            font-size: 13px;
            line-height: 1.5;
            margin: 0 0 10px;
        }


        .inputValue {
            width: calc(100% - 16px);
            height: 34px;
        }
        .inputEmail {
            width: calc(50% - 10px);
            height: 34px;
            display: inline-block;
        }

        #nextDiv, #checkDiv, #registerDiv, #completeDiv {
            text-align: center;
            margin-top: 20px;
        }



        #main0 table tr:nth-child(2) td:nth-child(2) {
            display: flex;
            align-items: center;
            gap: 5px;
        }
        #main0 table tr:nth-child(2) td:nth-child(2) #emailpart1 {
            width: 95px;
        }

        #main0 table tr:nth-child(2) td:nth-child(2) #emailpart2,
        #main0 table tr:nth-child(2) td:nth-child(2) .email_address,
        #main0 table tr:nth-child(2) td:nth-child(2) #emailResult {
            flex: 1;
            min-width: 80px;
        }
        #main0 table tr:nth-child(2) td:nth-child(2) button#Cnum {
            width: 140px;
        }


        #main0 table tr:nth-child(3) td:nth-child(2) {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        #main0 table tr:nth-child(3) td:nth-child(2) .inputValue {
            flex: 1;
        }

        #main0 table tr:nth-child(3) td:nth-child(2) button {
            flex-shrink: 0;
            width: 100px;
        }


        #tableDiv table tr:first-child td:nth-child(2) {
            display: flex;
            align-items: center;
            gap: 5px;
        }
        #tableDiv table tr:first-child td:nth-child(2) input[type="text"] {
            width: 60px;
            text-align: center;
        }


        #tableDiv table tr:nth-child(2) td:nth-child(2), #tableDiv table tr:nth-child(4) td:nth-child(4) {
            display: flex;
            flex-wrap: wrap;
            align-items: center;
            gap: 5px;
        }

        .message, authpwd{
            display: block;
            flex-basis: 100%;
        }
        #tableDiv table tr:nth-child(2) td:nth-child(2) .inputValue, #tableDiv table tr:nth-child(4) td:nth-child(4) .inputValue {
            flex: 1;
            width: 200px;
        }
        #tableDiv table tr:nth-child(2) td:nth-child(2) button#checkIdBtn {
            flex-shrink: 0;
            width: 100px;
        }
        #Cnum {
            max-width: 100px;
        }

        /* 모달 CSS */
        .alert-popup {
            display: none;
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background: #fff;
            z-index: 5006;
            width: 420px;
            padding: 0;
            border-radius: 10px;
            height: 200px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
        }

        .wrap {
            position: relative;
        }

        .layer-header {
            background: #339eb2;
            padding: 15px;
            height: 50px;
            border-radius: 10px 10px 0 0;
        }

        .tit {
            color: #fff;
            font-size: 20px;
            font-weight: 500;
        }

        .layer-con {
            padding: 30px 20px;
            text-align: center;
        }

        .txt-common {
            font-size: 17px;
            color: #333;
        }
        /*모달*/
        .modal-btn-group {
            display: flex;
            justify-content: center;
            gap: 20px;
            margin-top: 30px;
        }

        .modal-btn {
            padding: 10px 20px;
            font-size: 14px;
            border-radius: 5px;
            cursor: pointer;
            border: 2px solid #339eb2;
            background: #fff;
            color: #339eb2;
            font-weight: bold;
            width: 100px;
            text-align: center;
        }

        .button:hover {
            background: #1e7f9a;
            color: #fff;
        }

        .purple {
            background: #339eb2;
            color: #fff;
        }

        .purple:hover {
            background: #1e7f9a;
        }

        .btn-layer-close:hover {
            color: #ccc;
        }


        .modal-overlay {
            display: none; /* 기본 숨김 */
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: rgba(0,0,0,0.5);
            z-index: 999;
            justify-content: center;
            align-items: center;
        }

        .modal-overlay .modal-content {
            background: #fff;
            padding: 20px;
            border-radius: 4px;
            max-width: 300px;
            width: auto;
            text-align: center;
        }
    </style>
</head>
<body>

<form action="${pageContext.request.contextPath}/UserController" method="post">
    <input type="hidden" name="type" id="type"/>
    <div class="contents">
        <h1>여기에 로고</h1>

        <article id="all">
            <div id="step">
                <p class="step">STEP1.본인인증</p>
                <p class="step">STEP2.약관동의</p>
                <p class="step">STEP3.정보입력</p>
                <p class="step">STEP4.가입완료</p>
            </div>



            <div id="main0" style="display: none;">
                <article id="main0Title">
                    <strong>회원가입을 위한 본인인증 단계입니다.</strong>
                    <p>이메일 인증을 완료해주세요</p>
                </article>
                <table>
                    <caption>이메일인증테이블</caption>
                    <colgroup>
                        <col width="120px">
                        <col width="350px">
                    </colgroup>
                    <tr>
                        <td><span>이름</span> </td>
                        <td><input type="text" id="userName" name="userName" class="inputValue"></td>
                    </tr>
                    <tr>
                        <td><span>이메일</span> </td>
                        <td><input type="text" id="emailpart1" name="emailpart1" class="inputEmail">
                            <span>@</span>
                            <input type="text" id="emailpart2" name="emailpart2" class="inputEmail" disabled>
                            <select name="emailDomain2" id="emailDomain" title="이메일 선택" class="email_address">
                                <option value="" disabled selected>선택하세요</option>
                                <option value="naver.com">naver.com</option>
                                <option value="gmail.com">gmail.com</option>
                                <option value="daum.net">daum.net</option>
                                <option value="nate.com">nate.com</option>
                                <option value="direct">직접입력</option>
                            </select>
                            <%--              <div id="emailResult"></div>--%>
                            <button type="button" id="Cnum" onclick="sendAuthCode('checkDuplicate')">인증 요청</button> </td>
                    </tr>
                    <tr>
                        <td><span>인증번호</span> </td>
                        <td><input type="text" id="authcode" name="authcode" class="inputValue">
                            <button type="button" id="validateEmailButton" name="validateEmailButton" class="tableButton" onclick="verifyAuthCode()">인증 확인</button> </td>
                        <script>
                            function sendAuthCode() {
                                const emailPart1 = document.getElementById("emailpart1").value.trim();
                                const emailPart2 = document.getElementById("emailpart2").value.trim();

                                if (!emailPart1 || !emailPart2) {
                                    showLoginNoticeModal("이메일을 입력해주세요.");
                                    return;
                                }

                                const email = emailPart1 + "@" + emailPart2;

                                if (!email) {
                                    showLoginNoticeModal("이메일을 입력해주세요.");
                                    return;
                                }

                                $.ajax({
                                    type: "POST",
                                    url: "${pageContext.request.contextPath}/EmailServlet",
                                    data: {
                                        actionType: "validateUser",
                                        email: email
                                    },
                                    success: function (response) {
                                        // showLoginNoticeModal("이메일 인증요청 완료");
                                        showLoginNoticeModal(response.message);
                                    },
                                    error: function (response) {
                                        showLoginNoticeModal("서버 통신 중 오류가 발생했습니다.");
                                    }
                                });
                            }
                        </script>
                    </tr>
                </table>
                <div id="nextDiv">
                    <button type="button" id="next" disabled  onclick="gotoMain2()">다음</button>
                </div>
                <input type="hidden" id="user_Email" name="user_Email"/>
                <input type="hidden" id="emailVerified" value=""/>
            </div>


            <div id="main" class="default" style="display: block;">
                <div>
                    <strong>약관동의 및 정보활용 동의</strong>
                </div>
                <div>
                    <span>메가박스 서비스 이용을 위한 약관에 동의해주세요</span>
                </div>
                <article id="firstHr">
                    <input type="checkbox" id="allAgree" onchange="essential()">
                    <label for="allAgree" id="allAgreeLabel" >필수항목 전체 동의</label>
                </article>

                <hr>
                <div class="checkbox">
                    <input type="checkbox" id="serviceAgree" onchange="toggleButton()">
                    <label for="serviceAgree" class="essential">서비스 이용 약관 동의(필수)</label>
                </div>
                <textarea rows="8" cols="66" placeholder="약관은 마지막에 넣으세요" readonly>
CENEFEEL 서비스 이용 약관

제 1조 (목적)
본 약관은 영화관 CENEFEEL(이하 "회사")가 제공하는 영화 예매, 상영 정보 제공, 회원 서비스 등 모든 서비스(이하 "서비스")를 이용함에 있어 회사와 이용자 간의 권리와 의무, 책임사항을 규정함을 목적으로 합니다.

제 2조 (약관의 효력 및 변경)

본 약관은 서비스를 이용하려는 모든 회원에게 적용됩니다.
회사는 필요에 따라 본 약관을 변경할 수 있으며, 변경된 약관은 적용일로부터 효력을 발생합니다. 변경된 약관은 회사의 홈페이지 또는 앱을 통해 공지됩니다.
제 3조 (회원 가입)

회원 가입은 회사의 회원 가입 절차를 거쳐야 하며, 가입을 희망하는 이용자는 반드시 본 약관에 동의해야 합니다.
회원 가입 시 제공되는 개인정보는 회사의 개인정보 보호 정책에 따라 안전하게 관리됩니다.
회원 가입 시 제공되는 정보는 사실이어야 하며, 허위로 기재한 경우 회원 자격이 박탈될 수 있습니다.
제 4조 (서비스 이용)

회사는 회원에게 영화 예매, 상영 정보 제공, 이벤트 참여 등의 다양한 서비스를 제공합니다.
회사는 회원의 요청에 따라 서비스를 제공하나, 시스템 장애나 예기치 못한 사유로 서비스 제공이 지연되거나 불가능할 수 있습니다.
회사는 서비스의 내용이나 이용 조건을 사전 공지 후 변경할 수 있습니다.
제 5조 (이용자의 의무)

회원은 서비스 이용 중 타인의 권리를 침해하거나 법령을 위반하지 않도록 하여야 합니다.
회원은 서비스 이용 시 부정한 방법으로 시스템을 방해하거나 해킹 등을 하지 않도록 합니다.
회원은 본 약관 및 회사의 정책을 준수하여야 하며, 이를 위반할 경우 서비스 이용에 제재를 받을 수 있습니다.
제 6조 (서비스 이용 제한 및 종료)

회원이 본 약관을 위반하거나 불법적인 활동을 하는 경우, 회사는 사전 통지 없이 회원의 서비스 이용을 제한하거나 종료할 수 있습니다.
회원이 서비스 이용을 중단하고자 할 경우, 언제든지 회원 탈퇴를 할 수 있습니다.
제 7조 (개인정보 보호)
회사는 이용자의 개인정보를 "개인정보 보호정책"에 따라 안전하게 관리하며, 회원의 동의 없이 제3자에게 제공하지 않습니다. 개인정보의 수집, 이용, 보호에 관한 사항은 회사의 개인정보 보호정책에 따릅니다.

제 8조 (저작권 및 지적재산권)

회사의 서비스에 포함된 콘텐츠, 디자인, 상표, 로고 등의 지적 재산권은 회사 또는 제3자에게 귀속됩니다.
회원은 회사의 허락 없이 서비스를 통해 제공된 콘텐츠를 복제, 배포, 전시할 수 없습니다.
제 9조 (책임의 한계)

회사는 서비스 제공에 있어 고의 또는 중대한 과실로 인한 손해를 제외하고, 일반적인 상황에서 발생하는 손해에 대해 책임을 지지 않습니다.
회사는 서비스의 중단, 지연 또는 오류로 인한 손해에 대해서도 책임을 지지 않습니다.
제 10조 (준거법 및 분쟁 해결)

본 약관은 대한민국 법률에 따라 해석되며, 본 약관에 따른 분쟁은 서울중앙지방법원을 제1심 법원으로 합니다.
회사와 회원은 분쟁 발생 시 원만한 해결을 위해 협의할 의무가 있습니다.
부칙

본 약관은 2025년 2월 8일부터 시행됩니다.</textarea>
                <div class="checkbox">
                    <input type="checkbox" id="personalAgree" onchange="toggleButton()">
                    <label for="personalAgree" class="essential">개인정보 수집 및 이용 동의(필수)</label>
                </div>
                <textarea rows="8" cols="66" placeholder="약관은 마지막에 넣으세요" readonly>
CENEFEEL 개인정보 수집 및 이용 동의서

CENEFEEL(이하 "회사")는 고객의 개인정보를 소중히 보호하며, 개인정보 보호법에 따라 개인정보를 수집, 이용, 제공하는 데 필요한 사항을 안내드립니다. 회원가입을 위해 아래와 같이 개인정보 수집 및 이용에 동의해 주시기 바랍니다.

1. 수집하는 개인정보 항목
회사는 회원가입 및 서비스 이용을 위해 아래와 같은 개인정보를 수집합니다.

필수 항목: 이름, 이메일 주소, 전화번호, 생년월일, 성별
선택 항목: 주소, 프로필 사진, 관심 영화 장르 등
2. 개인정보 수집 및 이용 목적
회사는 수집한 개인정보를 다음의 목적을 위해 이용합니다.

회원 관리: 회원 가입 및 관리, 서비스 이용에 따른 본인 인증, 고객 문의 응대
서비스 제공: 영화 예매 및 상영 정보 제공, 이벤트 및 프로모션 안내, 고객 맞춤형 서비스 제공
마케팅 및 광고: 신규 서비스, 이벤트, 프로모션 등의 정보 제공 및 광고
법적 의무 준수: 법령에 의한 의무 이행
3. 개인정보 보유 및 이용 기간
회사는 개인정보 수집 및 이용 목적이 달성된 후에는 해당 정보를 지체 없이 파기합니다. 단, 관계 법령에 의하여 일정 기간 동안 보관해야 하는 경우에는 법령에 따른 보유 기간 동안 개인정보를 보관합니다.

보유 기간: 회원 탈퇴 시까지 (단, 법령에 의한 보관 기간이 있는 경우 해당 기간 동안 보관)
4. 개인정보 제공
회사는 원칙적으로 이용자의 개인정보를 제3자에게 제공하지 않습니다. 다만, 다음의 경우에는 예외로 개인정보를 제공할 수 있습니다:

이용자가 사전에 동의한 경우
법령에 의하여 요구된 경우
서비스 제공에 필요한 경우 (예: 결제 서비스 제공 업체)
5. 개인정보 처리의 위탁
회사는 원활한 서비스 제공을 위해 필요한 경우, 개인정보 처리 업무를 외부 업체에 위탁할 수 있습니다. 이 경우 위탁받는 업체와의 계약을 통해 개인정보 보호를 위한 적절한 조치를 취합니다.

6. 개인정보 보호 책임자
회사는 개인정보 보호를 위해 아래와 같은 담당자를 지정하고 있습니다:

담당자: 개인정보 보호 담당자
연락처: 010-8307-7905 / wjddks64@gmail.com
7. 동의 거부 권리 및 불이익
이용자는 개인정보 제공에 동의하지 않으실 수 있으나, 필수 항목에 대한 동의 거부 시 서비스 이용에 제한이 있을 수 있습니다.</textarea>
                <div class="checkbox">
                    <input type="checkbox" id="marketingAgree">
                    <label for="marketingAgree">마케팅 활용을 위한 개인정보 수집 이용 안내(선택)</label>
                </div>
                <textarea rows="8" cols="66" placeholder="약관은 마지막에 넣으세요" readonly>
CENEFEEL 마케팅 활용을 위한 개인정보 수집 및 이용 동의서

회사는 이용자의 개인정보를 마케팅 및 광고 목적으로 수집하고 이용할 수 있습니다. 이 정보는 향후 고객 맞춤형 서비스, 프로모션, 이벤트 안내 등 다양한 마케팅 활동에 활용됩니다. 아래 내용을 확인하시고, 마케팅 활용을 위한 개인정보 수집 및 이용에 동의하실 경우 선택해 주세요.

1. 수집하는 개인정보 항목
회사는 마케팅 목적으로 아래와 같은 개인정보를 수집할 수 있습니다.

필수 항목: 이름, 이메일 주소
선택 항목: 전화번호, 관심 영화 장르, 영화 예매 기록, 이벤트 참여 내역, 프로필 사진 등
2. 개인정보 수집 및 이용 목적
회사는 수집한 개인정보를 다음과 같은 마케팅 및 광고 활동에 이용합니다:

고객 맞춤형 서비스 제공: 개인의 취향과 선호에 맞춘 영화 추천, 예매 추천
이벤트 및 프로모션 안내: 신작 영화 상영, 할인 혜택, 특가 이벤트 등의 정보 제공
설문 조사 및 고객 의견 수렴: 고객 만족도 조사 및 서비스 개선을 위한 피드백 수집
광고 제공: 맞춤형 광고 및 뉴스레터 발송
3. 개인정보 보유 및 이용 기간
회사는 마케팅 및 광고 목적으로 수집한 개인정보를 다음과 같은 기간 동안 보유합니다:

보유 기간: 동의일로부터 마케팅 활용 목적이 달성될 때까지 (단, 고객의 요청에 따라 언제든지 동의를 철회할 수 있으며, 동의 철회 시 즉시 파기됩니다.)
4. 개인정보 제공 및 위탁
회사는 마케팅 활동에 필요한 경우 제3자에게 개인정보를 제공하거나 외부 업체에 개인정보 처리 업무를 위탁할 수 있습니다. 이때 제공되는 개인정보는 오직 마케팅 활동에 한정되며, 위탁 업체와의 계약을 통해 개인정보 보호를 위한 적절한 조치를 취합니다.

5. 동의 거부 및 철회
이용자는 마케팅 목적으로 개인정보 수집 및 이용에 동의하지 않으실 수 있습니다. 마케팅에 대한 동의를 거부하거나 철회하더라도 기본적인 서비스 이용에는 제한이 없습니다. 다만, 마케팅 정보를 수신하지 않게 됩니다.</textarea>
                <div class="checkbox">
                    <input type="checkbox" id="locationAgree">
                    <label for="locationAgree">위치기반서비스 이용 약관 동의(선택)</label>
                </div>
                <textarea rows="8" cols="66" placeholder="약관은 마지막에 넣으세요" readonly>
CENEFEEL 위치기반서비스 이용 약관 동의서

회사는 이용자에게 위치기반 서비스를 제공하기 위해 위치 정보를 수집하고 이용합니다. 위치기반 서비스는 영화관의 상영 정보 제공, 근처 상영관 안내, 할인 혜택 등 다양한 서비스에 활용될 수 있습니다. 이 서비스를 제공하기 위해, 아래와 같은 내용을 확인하시고 위치기반 서비스 이용에 동의해 주시기 바랍니다.

1. 위치 정보 수집 항목
회사는 이용자가 서비스 이용 중 제공하는 위치 정보를 수집할 수 있습니다. 수집되는 위치 정보는 다음과 같습니다:

위치 정보: 실시간 GPS 위치, Wi-Fi 정보, 셀타워 정보 등
2. 위치기반 서비스 이용 목적
회사는 수집된 위치 정보를 다음과 같은 목적으로 이용합니다:

근처 영화관 안내: 이용자의 위치를 기반으로 가까운 영화관 정보 제공
영화 상영 정보 제공: 이용자의 위치 근처에서 상영 중인 영화의 정보 제공
위치 기반 할인 혜택: 특정 지역에서 제공하는 할인 혜택, 이벤트 및 프로모션 정보 제공
기타 맞춤형 서비스 제공: 이용자의 위치에 맞춘 영화 추천 및 관련 정보 제공
3. 위치 정보 제공 및 공유
회사는 이용자의 위치 정보를 제3자에게 제공하지 않으며, 위치기반 서비스 제공을 위한 외부 업체와의 협력 시에도 개인정보 보호를 위한 적절한 조치를 취합니다. 단, 법령에 의한 요구가 있을 경우, 해당 정보를 제공할 수 있습니다.

4. 위치 정보 보유 및 이용 기간
회사는 위치 정보를 실시간으로 처리하며, 서비스 제공에 필요한 최소한의 기간 동안만 보유합니다. 서비스 제공이 완료된 후에는 해당 위치 정보는 즉시 삭제됩니다.

5. 위치기반 서비스 이용 거부 및 철회
이용자는 언제든지 위치기반 서비스 이용을 거부하거나, 위치 정보를 제공하지 않도록 설정할 수 있습니다. 위치정보 제공을 거부하거나 철회하더라도, 다른 서비스 이용에는 제한이 없으며, 단지 위치기반 서비스를 이용할 수 없게 됩니다.

6. 위치기반서비스 이용에 대한 동의 여부
위치기반 서비스를 이용하시려면 아래의 동의 항목에 대해 선택해 주셔야 합니다. 동의하지 않으셔도 기본적인 서비스는 이용이 가능하지만, 위치기반 서비스를 제공받지 못하게 됩니다.</textarea>
                <div id="checkDiv">
                    <button type="button" id="check" disabled onclick="gotoMain0()">확인</button>
                </div>
            </div>
        </article>

        <div id="main2" style="display: none;">
            <div>
                <strong>회원님 안녕하세요.</strong>
                <p>회원 정보를 입력해주세요</p>
            </div>

            <div id="tableDiv">
                <table>
                    <caption>회원정보입력테이블</caption>
                    <colgroup>
                        <col width="120px">
                        <col width="*">
                    </colgroup>
                    <tbody>
                    <tr>
                        <td class="bold">전화번호</td>
                        <td>
                            <span id="userPhone1">010</span>
                            <span>-</span>
                            <input type="text" id="userPhone2" name="userPhone2" width="40px" size="10" maxlength="4">
                            <span>-</span>
                            <input type="text" id="userPhone3" name="userPhone3" width="40px" size="10" maxlength="4">
                            <input type="hidden" id="userPhone" name="userPhone">
                        </td>
                    </tr>

                    <tr>
                        <td class="bold">아이디</td>
                        <td>
                            <input type="text" id="userId" name="userId" class="inputValue" placeholder="8자리 이상 영문숫자조합." oninput="checkid()">
                            <button type="button" id="checkIdBtn">중복확인</button>
                            <div class="message" id="idCheckMessage"></div>
                        </td>
                    </tr>

                    <tr>
                        <td class="bold">비밀번호</td>
                        <td><input type="password" id="userPassword1" name="userPassword1" placeholder="" oninput="pwCheck()" class="inputValue"></td>
                    </tr>

                    <tr>
                        <td class="bold" >비밀번호확인</td>
                        <td>
                            <input type="password" id="userPassword2" name="userPassword2" oninput="pwCheck()" class="inputValue">
                            <div id="authpwd" style="display: block">비밀번호 8자리 이상 영문을 포함해 입력해주세요.</div>
                        </td>
                    </tr>



                    </tbody>
                </table>
                <div id="box">
                    <p id="boxTitle">마케팅 활용을 위한 개인정보 수집 이용 안내(선택)</p>
                    <hr>
                    <h5>수집목적</h5>
                    <p>고객맞춤형 상품 및 서비스 추천, 당사 신규 상품/서비스 안내 및 권유, 사은/할인 행사 등 각종 이벤트 정보 등의 안내 및 권유 </p>
                    <h5>수집항목</h5>
                    <p>이메일, 휴대폰번호, 주소, 생년월일, 선호영화관, 문자/이메일/앱푸쉬 정보수신동의여부, 서비스 이용기록, 포인트 적립 및 사용 정보, 접속로그 </p>
                    <h5>보유기간</h5>
                    <p>회원 탈퇴 시 혹은 이용 목적 달성 시 까지 </p>
                    <div class="radioContainer">
                        <input type="radio" id="agree" name="consent" value="agree">
                        <label for="agree">동의</label>
                        <input type="radio" id="disagree" name="consent" value="disagree">
                        <label for="disagree">미동의</label>
                    </div>
                </div>
                <div id="registerDiv">
                    <button type="button" id="register" onclick="gotoMain3(this.form)">회원가입</button>
                </div>

            </div>
        </div>

    </div>
    </div>

</form>

<div id="modalOverlay" class="modal-overlay"></div>
<!-- 로그인 필요 알림 모달 -->
<section class="alert-popup" id="registerModal">
    <div class="wrap">
        <header class="layer-header">
            <h3 class="tit">알림</h3>
        </header>
        <div class="layer-con">
            <p class="txt-common" id="loginNoticeMessage"></p>
            <div class="modal-btn-group">
                <button type="button" class="modal-btn purple confirm" id="closeLoginNoticeModal">확인</button>
            </div>
        </div>
    </div>
</section>


<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
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



    const checkbox1 = document.getElementById('serviceAgree');
    const checkbox2 = document.getElementById('personalAgree');
    const checkbox = document.getElementById('allAgree');

    function essential() {

        if(checkbox.checked){
            checkbox2.checked= true;
            checkbox1.checked= true;
        }else{
            checkbox2.checked= false;
            checkbox1.checked= false;
        }

        toggleButton();
    }


    function toggleButton() {

        const button = document.getElementById('check');
        if (checkbox1.checked && checkbox2.checked) {
            button.disabled = false; // 활성화
            checkbox.checked=true;
            button.classList.add("enabled");
        } else {
            button.disabled = true; // 비활성화
            checkbox.checked=false;
            button.classList.remove("enabled");
        }
    }

    function gotoMain0(){
        document.getElementById('main').style.display = 'none';
        document.getElementById('main0').style.display = 'block';
    }

    function gotoMain2() {
        let userName = $(".inputValue[name='userName']").val();
        let emailPart1 = $(".inputEmail[name='emailpart1']").val();
        let emailPart2 = $(".inputEmail[name='emailpart2']").val();
        const user_Email = document.getElementById("user_Email");

        userName = $.trim(userName);
        emailPart1 = $.trim(emailPart1);
        emailPart2 = $.trim(emailPart2);

        if (userName.length < 1) {
            showLoginNoticeModal("이름을 입력하세요.");
            $(".inputValue[name='userName']").val("").focus();
            return;
        }
        if (emailPart1.length < 1 || emailPart2.length < 1) {
            showLoginNoticeModal("이메일을 입력하세요.");
            $(".inputEmail[name='emailpart1']").val("").focus();
            return;
        }

        // 이메일 조합 후 숨겨진 필드에 설정
        user_Email.value = emailPart1 + "@" + emailPart2;

        // 화면 전환
        document.getElementById('main0').style.display = 'none';
        document.getElementById('main2').style.display = 'block';
    }

    function pwCheck() {
        const authPwd = document.getElementById('authpwd');
        const password1 = document.getElementById('userPassword1').value;
        const password2 = document.getElementById('userPassword2').value;

        const numberOnly = /^\d+$/;

        if (numberOnly.test(password1)) {
            authPwd.innerText = "비밀번호에는 최소 영문 1글자가 포함되야합니다.";
            authPwd.style.color = "red";
        } else if (password1.length < 7) {
            authPwd.innerText = "비밀번호는 8자리 이상이여야 합니다.";
            authPwd.style.color = "red";
        } else if (password1 === password2) {
            authPwd.innerText = "비밀번호가 일치합니다.";
            authPwd.style.color = "green";
        } else {
            authPwd.innerText = "비밀번호가 불일치합니다.";
            authPwd.style.color = "red";
        }
    }

    function gotoMain3(frm){
        let userPhone1 = document.getElementById("userPhone1").textContent.trim();
        let userPhone2 = document.getElementById("userPhone2").value.trim();
        let userPhone3 = document.getElementById("userPhone3").value.trim();

        const userIdInput = document.getElementById("userId");
        const userPasswordInput = document.getElementById("userPassword");

        let fullPhone = userPhone1 + "-" + userPhone2 + "-" + userPhone3;

        document.getElementById("userPhone").value = fullPhone;

        let userId = $.trim($(".inputValue[name='userId']").val());
        let userPassword = $.trim($("#userPassword1").val());  // 비밀번호 값 가져오기

        if (!userPhone2 || userPhone2.length !== 4) {
            showLoginNoticeModal("핸드폰 번호의 가운데 네 자리를 정확히 입력해주세요.");
            document.getElementById("userPhone2").focus();
            return false;
        }

        if (!userPhone3 || userPhone3.length !== 4) {
            showLoginNoticeModal("핸드폰 번호의 마지막 네 자리를 정확히 입력해주세요.");
            document.getElementById("userPhone3").focus();
            return false;
        }


        if(userId.length < 7) {
            showLoginNoticeModal("아이디는 8글자 이상만 입력가능합니다.");
            $(".inputValue[name='userId']").val("").focus();
            return false;
        }

        if(userPassword.length < 7) {
            showLoginNoticeModal("비밀번호는 8글자 이상만 입력가능합니다.");
            $("#userPassword1").val("").focus();
            return false;
        }

        document.getElementById("type").value = "register";
        frm.submit();

    }

    // 인증번호 확인 AJAX 요청
    function verifyAuthCode() {
        console.log("verifyAuthCode 호출.");
        const authCode = document.getElementById("authcode").value;
        console.log("사용자 입력 인증 코드 : " + authCode);

        if (!authCode) {
            showLoginNoticeModal("인증번호를 입력해주세요.");
            return;
        }

        const xhr = new XMLHttpRequest();
        xhr.open("POST", "${pageContext.request.contextPath}/VerifyCodeServlet", true);
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

        xhr.onreadystatechange = function () {
            if (xhr.readyState === 4 && xhr.status === 200) {
                const response = xhr.responseText.trim();

                if (response === "인증 성공!") {
                    showLoginNoticeModal("인증에 성공했습니다!");
                    document.getElementById("emailVerified").value = "true";
                    document.getElementById("next").disabled = false;
                } else {
                    showLoginNoticeModal("올바른 인증번호를 입력해주세요.");
                    document.getElementById("emailVerified").value = "";
                }
            }
        };
        xhr.send("authCode=" + encodeURIComponent(authCode));
    }



    $(document).ready(function () {
        $("#checkIdBtn").on("click", function () {
            const userId = $("#userId").val().trim();

            // 입력값 검증
            if (userId === "") {
                $("#idCheckMessage").removeClass("success").addClass("error").text("아이디를 입력해주세요.");
                return;
            }

            // AJAX 요청
            $.ajax({
                url: "${pageContext.request.contextPath}/UserController?type=usercheckid", // 서버 URL
                type: "POST", // HTTP 메서드
                data: { userId: userId }, // 전송 데이터
                dataType: "json", // 응답 데이터 타입
                success: function (response) {

                    console.log("서버 응답:", response);

                    const messageElement = $("#idCheckMessage");
                    messageElement.removeClass("success error");

                    if (response.status === "success") {
                        // 사용 가능한 아이디
                        messageElement
                            .addClass("success")
                            .text(response.message);
                    } else {
                        // 중복된 아이디
                        messageElement
                            .addClass("error")
                            .text(response.message);
                    }
                },
                error: function (xhr, status, error) {
                    console.error("AJAX 오류 발생:", status, error);
                    $("#idCheckMessage")
                        .removeClass("success")
                        .addClass("error")
                        .text("아이디 검증 중 오류가 발생했습니다.");
                }
            });
        });
    });

    // 로그인 필요 알림 모달 요소 가져오기
    const registerModal = document.getElementById('registerModal');
    const closeLoginNoticeModal = document.getElementById('closeLoginNoticeModal');
    const modalOverlay = document.getElementById("modalOverlay"); // 오버레이 요소 가져오기

    // 모달 보이기 / 숨기기 함수
    function showModal(modal) {
        modal.style.display = "block";
        modalOverlay.style.display = "block";
    }

    function hideModal(modal) {
        modal.style.display = "none";
        modalOverlay.style.display = "none";
        document.body.style.overflow = "auto";
    }

    // 로그인 필요 알림 모달 보이기 함수
    function showLoginNoticeModal(message) {
        document.getElementById('loginNoticeMessage').textContent = message;
        showModal(registerModal);
    }

    // 닫기 버튼 클릭 시 모달 숨기기
    closeLoginNoticeModal.addEventListener("click", () => hideModal(registerModal));

    // ✅ 모달 외부 클릭 시 닫기 방지
    registerModal.addEventListener("click", (event) => {
        if (event.target === registerModal) {
            event.stopPropagation();
        }
    });
</script>

</body>
</html>