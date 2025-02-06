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
    *{
      padding: 0;
      margin: 0;
    }
    h1{
      display: flex;
      align-items: center;
      justify-content: center;
      padding: 40px;
      text-indent: -9999px;
      background-image: url("${pageContext.request.contextPath}/css/user/images/logo-purple.png");
      background-repeat: no-repeat;
      background-position: center; /*이미지 가운데 맞추는 구문*/



    }
    #contents{
      width: 510px;
      height: 1184px;
      margin-right: auto;
      margin-left: auto;
    }
    #step{
      display: flex;
      border-bottom: 1px solid gray;
      font-size: 13px;
      align-items: center;
      justify-content: center;

    }
    .step{
      padding: 17px;
    }
    strong{
      padding-top: 20px;
      display: flex;
      font-size: 22px;
      padding-bottom: 10px;
    }
    div>span{
      display: flex;
      padding-bottom: 20px;
    }
    input{
      width: 40px;
      height: 20px;
    }
    #allAgreeLabel{
      font-size: 18px;
      padding-bottom: 10px;
    }
    #firstHr{
      padding-bottom: 20px;
    }
    .checkbox{
      padding-bottom: 10px;
      padding-top: 20px;
    }
    #all{
      padding-left: 2px;

    }
    .essential{
      color: #503396;
    }
    #check, #register, #complete,#next{
      width: 200px;
      height: 46px;
      font-size: 20px;

    }
    #checkDiv , #registerDiv, #completeDiv, #nextDiv{
      padding-top: 20px
    ;
      margin-right: auto;
      margin-left: auto;
      width: 200px;
      padding-bottom: 10px;
    }
    #check.enabled, #register.enabled,#complete{
      background-color: #503396; /* 활성화 색상 */
      color: #fff;
    }
    caption{
      text-indent: -9999px;
    }
    table{
      border-top: 1px solid black;
      border-bottom:  1px solid gray;
      border-collapse: collapse;
      width: 500px;
      margin-bottom: 20px;

    }
    table td{
      border-top:1px solid #666666 ;
      height: 50px;

    }

    .inputValue{
      width: 150px;
      height: 25px;
    }
    .inputEmail{
      width: 120px;
      height: 25px;
    }
    .bold{
      font-weight: bold;
      font-size: 16px;
    }
    #box{
      border: 1px solid gray;
      border-radius: 8px;
    }
    #boxTitle{
      font-size: 18px;
      padding: 5px;
      text-align: center;
    }
    #box>h5{
      padding-top: 20px;
      padding-bottom: 10px;
      padding-left: 10px;
      font-size: 16px;
    }
    #box>p{
      padding-left: 10px;
    }
    .radioContainer{
      padding-top: 20px;
      padding-bottom: 10px;
      padding-left: 30px;

    }
    .radioContainer>label{
      padding-right: 15px;
    }
    .tableButton{
      height: 28px;
      background-color: white;
      border-radius: 4px;
      border: 2px solid gray;
    }
    #main0 table{
      margin-top: 50px;
      margin-bottom: 50px;
    }
    #Cnum{
      width: 90px;
      margin-left: 10px;
      height: 30px;
      background-color: white;
      border-radius: 4px;
    }

    #authpwd{
      position: absolute;
      left: 690px;
      right: 10px;
      top: 433px;
    }

    .inputshort {
      width: 120px;
    }

    select {
      padding: 5px;
      font-size: 14px;
    }

    /* ajax에서 표기해주는 부분 text 컬러표기 */
    .success {
      color: green;
    }

    .error {
      color: red;
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
              <div id="emailResult"></div>
              <button type="button" id="Cnum" onclick="sendAuthCode()">인증번호받기</button> </td>
          </tr>
          <tr>
            <td><span>인증번호</span> </td>
            <td><input type="text" id="authcode" name="authcode" class="inputValue">
              <button type="button" class="tableButton" onclick="verifyAuthCode()">인증 확인</button> </td>
            <div id="responseMessage" name="responseMessage"></div>
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
        <textarea rows="8" cols="66" placeholder="약관은 마지막에 넣으세요"></textarea>
        <div class="checkbox">
          <input type="checkbox" id="personalAgree" onchange="toggleButton()">
          <label for="personalAgree" class="essential">개인정보 수집 및 이용 동의(필수)</label>
        </div>
        <textarea rows="8" cols="66" placeholder="약관은 마지막에 넣으세요"></textarea>
        <div class="checkbox">
          <input type="checkbox" id="marketingAgree">
          <label for="marketingAgree">마케팅 활용을 위한 개인정보 수집 이용 안내(선택)</label>
        </div>
        <textarea rows="8" cols="66" placeholder="약관은 마지막에 넣으세요"></textarea>
        <div class="checkbox">
          <input type="checkbox" id="locationAgree">
          <label for="locationAgree">위치기반서비스 이용 약관 동의(선택)</label>
        </div>
        <textarea rows="8" cols="66" placeholder="약관은 마지막에 넣으세요"></textarea>
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
            <td><input type="password" id="userPassword2" name="userPassword2" oninput="pwCheck()" class="inputValue"></td>
            <a id="authpwd">비밀번호 8자리 이상 영문을 포함해 입력해주세요.</a>
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
      showModal("이름을 입력하세요.");
      $(".inputValue[name='userName']").val("").focus();
      return;
    }
    if (emailPart1.length < 1 || emailPart2.length < 1) {
      showModal("이메일을 입력하세요.");
      $(".inputEmail[name='emailpart1']").val("").focus();
      return;
    }

    // 이메일 조합 후 숨겨진 필드에 설정
    user_Email.value = emailPart1 + "@" + emailPart2;

    // 화면 전환
    document.getElementById('main0').style.display = 'none';
    document.getElementById('main2').style.display = 'block';
  }

  function pwCheck(){
    const authPwd = document.getElementById('authpwd');
    const password1 = document.getElementById('userPassword1').value;
    const password2 = document.getElementById('userPassword2').value;

    const numberOnly = /^\d+$/;


    if(numberOnly.test(password1)) {
      authPwd.innerText = "비밀번호에는 최소 영문 1글자가 포함되야합니다."
      authPwd.style.color = "red";
    }
    else if (document.getElementById('userPassword1').value.length <= 7){
      authPwd.innerText = "비밀번호 8자리 이상이여야합니다."
      authPwd.style.color = "red";
    }
    else if (document.getElementById('userPassword1').value === document.getElementById('userPassword2').value) {
      authPwd.innerText = '비밀번호가 일치합니다.';
      authPwd.style.color = 'green';
    }
    else {
      authPwd.innerText = '비밀번호가 불일치합니다.';
      authPwd.style.color = 'red';
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
      showModal("핸드폰 번호의 가운데 네 자리를 정확히 입력해주세요.");
      document.getElementById("userPhone2").focus();
      return false;
    }

    if (!userPhone3 || userPhone3.length !== 4) {
      showModal("핸드폰 번호의 마지막 네 자리를 정확히 입력해주세요.");
      document.getElementById("userPhone3").focus();
      return false;
    }


    if(userId.length < 7) {
      showModal("아이디는 8글자 이상만 입력가능합니다.");
      $(".inputValue[name='userId']").val("").focus();
      return false;
    }

    if(userPassword.length < 7) {
      showModal("비밀번호는 8글자 이상만 입력가능합니다.");
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
          document.getElementById("emailVerified").value = "true"; // 인증 성공 상태 저장
          document.getElementById("next").disabled = false;
        } else {
          showModal("인증에 실패했습니다. 올바른 인증번호를 입력해주세요.");
          document.getElementById("emailVerified").value = ""; // 인증 실패 상태 초기화
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
        url: 'UserController?type=usercheckid', // 서버 URL
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

  function showModal(message) {

    document.querySelector('#alertModal .modal-body').textContent = message;

    // Bootstrap Modal 표시
    const alertModal = new bootstrap.Modal(document.getElementById('alertModal'));
    alertModal.show();
  }

</script>

</body>
</html>