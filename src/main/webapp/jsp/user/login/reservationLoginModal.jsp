<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <style>
        /* Dialog Container */
        .custom-dialog -container {
            width: 700px;
            max-width: 700px;
            height: 480px;
            max-height: 480px;
            background-color: #fff;
            border-radius: 3px;
            overflow: hidden;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);
            display: flex;
            flex-direction: column;
        }

        .custom-body {
            width: 100% !important;
            height: auto !important;
        }

        .content-body {
            height: auto !important;
        }

        /* Header */
        .custom-dialog -header {
            background-color: #6a5acd;
            color: white;
            padding: 15px;
            font-size: 18px;
            font-weight: bold;
        }

        /* Tabs */
        .custom-tabs {
            display: flex;
            width: 100%;
            background-color: #f4f4f4;
            border-bottom: 1px solid #ddd;
        }

        .custom-tab {
            flex: 1;
            text-align: center;
            padding: 10px;
            cursor: pointer;
            font-size: 16px;
            font-weight: bold;
            color: #6a5acd;
            border-bottom: 2px solid transparent;
        }

        .custom-tab.active {
            color: #000;
            border-bottom: 2px solid #6a5acd;
        }

        /* Content */
        .custom-content #customMemberLogin {
            display: none;
            flex: 1;
            padding: 20px;
        }

        .tab-content .active#customMemberLogin {
            display: grid;
            grid-template-columns: 1fr 1fr; /* 좌우 1:1 비율 */
            gap: 20px;
            align-items: center;
        }

        /* 로그인 영역 */
        .custom-login-container input,
        .custom-login-container button {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            font-size: 14px;
            box-sizing: border-box;
        }

        .custom-login-container button {
            background-color: #6a5acd;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .custom-login-container button:hover {
            background-color: #5a4cad;
        }

        .custom-login-footer {
            text-align: center;
            margin-top: 10px;
        }

        .custom-login-footer a {
            margin: 0 5px;
            color: #6a5acd;
            text-decoration: none;
        }

        .custom-login-footer a:hover {
            text-decoration: underline;
        }

        /* 이미지 영역 */
        .custom-image-container {
            width: 100%;
            height: 100%;
            display: flex;
            justify-content: center;
            overflow: hidden;
        }

        .custom-image-container img {
            max-width: 100%;
            max-height: 100%;
            object-fit: cover;
        }

        /* 비회원 로그인 섹션 */
        .custom-content #customNonMemberLogin {
            display: none;
            height: 100%;
            padding: 20px 20px 0px 20px;
        }

        .tab-content .active#customNonMemberLogin {
            display: grid; /* 그리드 레이아웃 */
            grid-template-columns: 1fr 1fr; /* 좌우 1:1 비율 */
            gap: 20px; /* 좌우 간격 */
            align-items: stretch; /* 높이를 동일하게 설정 */
        }

        /* 공통 폰트 크기 */
        .custom-info-box, .custom-info-box-table td {
            font-size: 12px; /* 전체적으로 폰트 크기 줄임 */
        }

        /* 왼쪽 테이블 컨테이너 */
        .custom-info-box-left {
            display: flex;
            flex-direction: column;
            justify-content: space-between; /* 상하 간격 균일 */
            background-color: #f5f5f5; /* 회색 배경 */
            border-radius: 10px;
            padding: 10px; /* 패딩 조정 */
            box-sizing: border-box;
            height: 100%; /* 부모 높이에 맞춤 */
        }

        /* 테이블 스타일 */
        .custom-info-box-table {
            width: 100%;
            border-collapse: collapse;
        }

        .custom-info-box-table td {
            padding: 6px; /* 패딩 축소 */
            font-size: 12px; /* 폰트 크기 축소 */
            vertical-align: middle; /* 텍스트 가운데 정렬 */
            background-color: #f5f5f5; /* 기본 회색 배경 */
        }

        .custom-info-box-table td:first-child {
            font-weight: bold;
            width: 30%; /* 첫 번째 열 폭 조정 */
            text-align: left;
        }

        .custom-info-box-table input {
            width: 100%;
            padding: 6px; /* 패딩 축소 */
            font-size: 12px; /* 폰트 크기 축소 */
            border: 1px solid #ddd;
            border-radius: 5px;
            box-sizing: border-box;
            background-color: white; /* Input만 흰색 배경 */
        }

        .custom-info-box-table button {
            padding: 6px 10px;
            background-color: #6a5acd;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 12px; /* 버튼 폰트 크기 축소 */
        }

        .custom-info-box-table button:hover {
            background-color: #5a4cad;
        }

        /* 오른쪽 정보 박스 */
        .custom-info-box {
            background-color: #f9f9f9;
            border-radius: 10px;
            padding: 10px; /* 패딩 축소 */
            box-sizing: border-box;
            height: 100%; /* 부모 높이에 맞춤 */
        }

        .custom-info-box h3 {
            font-size: 14px; /* 제목 크기 유지 */
            color: #333;
            margin-bottom: 10px;
        }

        .custom-info-box .radio-group {
            display: flex;
            gap: 10px;
            margin-top: 10px;
        }

        .custom-info-box .radio-group label {
            font-size: 12px; /* 라디오 버튼 폰트 축소 */
            color: #666;
        }

        .custom-info-box p {
            font-size: 12px; /* 설명 폰트 축소 */
            color: #555;
            margin-bottom: 8px;
        }

        .custom-info-box p:last-child {
            font-size: 10px; /* 마지막 문구 크기 더 축소 */
            color: #888;
        }

        /* 확인 버튼 스타일 */
        .custom-submit -button-container {
            grid-column: span 2; /* 버튼이 두 열을 차지 */
            text-align: center; /* 가운데 정렬 */
        }

        .custom-submit-button-container button {
            padding: 8px 16px;
            background-color: #6a5acd;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 14px; /* 버튼 폰트 크기 유지 */
            cursor: pointer;
        }

        .custom-submit-button-container button:hover {
            background-color: #5a4cad;
        }

        .btn-primary {
            margin-top: 70px;
        }

        .input-size {
            width: 130px !important;
        }
    </style>
</head>
<body>
<div class="modal fade" id="customLoginModal" tabindex="-1" aria-labelledby="customLoginModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg">
        <div class="modal-content content-body">
            <!-- 모달 헤더 -->
            <div class="modal-header">
                <h5 class="modal-title" id="customLoginModalLabel">로그인</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>

            <!-- 모달 바디 -->
            <div class="modal-body custom-body">
                <!-- 탭 메뉴 -->

                <div class="custom-tabs nav nav-tabs d-flex justify-content-center">
                    <a class="custom-tab nav-link active" data-bs-toggle="tab" href="#customMemberLogin">회원 로그인</a>
                    <a class="custom-tab nav-link" data-bs-toggle="tab" href="#customNonMemberLogin">비회원 로그인</a>
                </div>


                <!-- 탭 컨텐츠 -->
                <div class="tab-content mt-3">
                    <!-- 회원 로그인 -->
                    <div class="tab-pane fade show active" id="customMemberLogin">
                        <div class="custom-login-container">
                            <input type="text" class="custom-login-input form-control" placeholder="아이디">
                            <input type="password" class="custom-login-input form-control mt-3" placeholder="비밀번호">
                            <button class="custom-login-button btn btn-primary mt-3">로그인</button>
                            <div class="login-footer mt-3">
                                <a href="${pageContext.request.contextPath}/UserController?type=findIdPw">ID/PW 찾기</a>
                                <a href="${pageContext.request.contextPath}/UserController?type=register" class="ms-3">회원가입</a>
                                <a href="${pageContext.request.contextPath}/UserController?type=guestReservationCheck" class="ms-3 guest-booking-btn">비회원 예매확인</a>
                            </div>
                        </div>
                        <div class="custom-image-container text-center mt-3">
                            <img src="https://mlink-cdn.netinsight.co.kr/2025/01/07/19941e9ce689d82066cd257a0711d97e.jpg" alt="이미지" class="img-fluid">
                        </div>
                    </div>

                    <!-- 비회원 로그인 -->
                    <div class="tab-pane fade custom-content" id="customNonMemberLogin">
                        <div class="custom-info-box-left">
                            <table class="custom-info-box-table table">
                                <tr>
                                    <td>이름</td>
                                    <td><input type="text" class="form-control" placeholder="이름"></td>
                                </tr>
                               <tr>
                                    <td>이메일</td>
                                    <td>
                                        <div class="d-flex gap-2">
                                            <input type="text" class="form-control input-size" placeholder="'-' 없이 입력">
                                            <button class="btn btn-outline-primary">인증요청</button>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>인증번호</td>
                                    <td>
                                        <div class="d-flex gap-2">
                                            <input type="text" class="form-control" placeholder="인증번호">
                                            <span class="text-danger" style="font-size: 12px;">3:00</span>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>비밀번호</td>
                                    <td><input type="password" class="form-control" placeholder="비밀번호 (숫자 4자리)"></td>
                                </tr>
                                <tr>
                                    <td>비밀번호 확인</td>
                                    <td><input type="password" class="form-control" placeholder="비밀번호 (숫자 4자리) 확인"></td>
                                </tr>
                            </table>
                        </div>

                        <!-- 개인정보 처리방침 -->
                        <div class="custom-info-box">
                            <h3>비회원 개인정보 처리방침</h3>
                            <p><strong>수집목적:</strong> 비회원 예매 서비스 제공, 이용자 식별, 구매 및 결제</p>
                            <p><strong>수집항목:</strong> 이름, 이메일, 비밀번호</p>
                            <p><strong>보유기간:</strong> 관람 또는 취소 후 7일 이내</p>
                            <div class="radio-group">
                                <label><input type="radio" name="customAgree"> 동의</label>
                                <label><input type="radio" name="customAgree"> 미동의</label>
                            </div>
                            <p style="font-size: 10px; color: #888;">
                                정보 수집에 동의하지 않을 경우, 비회원 예매 서비스를 이용할 수 없습니다.
                            </p>
                            <div class="text-center mt-3">
                                <button class="btn btn-primary">확인</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>