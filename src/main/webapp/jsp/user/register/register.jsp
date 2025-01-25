<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>회원가입</title>
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
      width: 16px;
      height: 16px;
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
    .birth{
      width: 40px;
      text-align: center;
      height: 25px;
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
  </style>
</head>
<body>

<form action="${pageContext.request.contextPath}/UserController" method="post">
  <input type="hidden" name="type" id="type"/>
<div id="contents">
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

      </table>
      <div id="nextDiv">
        <button type="button" id="next" disabled  onclick="gotoMain2()">다음</button>
      </div>
      <input type="hidden" id="user_Email" name="user_Email"/>
      <input type="hidden" id="authcodecheck" value=""/>
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
      <strong>회원님 안녕하세요</strong>
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
          <td class="bold">생년월일</td>
          <td>
            <input type="text" id="birthyear" name="birthyear" class="birth" value="2025">
            <span>년</span>
            <input type="text" id="birthmonth" name="birthmonth" class="birth" value="01">
            <span>월</span>
            <input type="text" id="birthday" name="birthday" class="birth" value="01">
            <span>일</span>
          </td>
        </tr>

        <tr>
          <td class="bold">휴대폰번호</td>
          <td><input type="text" id="userPhone" name="userPhone" class="inputValue"></td>
        </tr>

        <tr>
          <td class="bold">아이디</td>
          <td>
            <input type="text" id="userId" name="userId" class="inputValue" oninput="checkid()">
            <span id="id_ok" class="id_ok" style="color:green; display:none;">사용 가능한 아이디입니다.</span>
            <span id="id_already" class="id_already" style="color:red; display:none;">사용 불가능 가능한 아이디입니다.</span>
          </td>
        </tr>

        <tr>
          <td class="bold">비밀번호</td>
          <td><input type="password" id="userPassword1" name="userPassword1" oninput="pwCheck()" class="inputValue"></td>
        </tr>

        <tr>
          <td class="bold" >비밀번호확인</td>
          <td><input type="password" id="userPassword2" name="userPassword2" oninput="pwCheck()" class="inputValue"></td>
          <span id="authpwd">비밀번호를 입력하여 주세요.</span>
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

<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script>
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
      alert("이름을 입력하세요.");
      $(".inputValue[name='userName']").val("").focus();
      return;
    }
    if (emailPart1.length < 1 || emailPart2.length < 1) {
      alert("이메일을 입력하세요.");
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
    if (document.getElementById('userPassword1').value === document.getElementById('userPassword2').value) {
      authPwd.innerText = '비밀번호가 일치합니다.';
      authPwd.style.color = 'green';
    } else {
      authPwd.innerText = '비밀번호가 불일치합니다.';
      authPwd.style.color = 'red';
    }
  }

  function gotoMain3(frm){
    let userPhone = $.trim($(".inputValue[name='userPhone']").val());
    let userId = $.trim($(".inputValue[name='userId']").val());

    if(userPhone.length < 10) {
      alert("핸드폰번호를 입력해주세요.");
      $(".inputValue[name='userPhone']").val("").focus();
      return false;
    }
    if(userId.length < 3) {
      alert("아이디는 4글자 이상만 입력가능합니다.");
      $(".inputValue[name='userId']").val("").focus();
      return false;
    }
    if(userPassword.length < 6) {
      alert("비밀번호는 6글자 이상만 입력가능합니다.");
      $(".inputValue[name='userPassword']").val("").focus();
      return false;
    }
    document.getElementById("type").value = "register";
    frm.submit();

  }

  // 인증번호 확인 AJAX 요청
  function verifyAuthCode() {
    console.log("verifyAuthCode 호출.");
    const authCode = document.getElementById("authcode").value;

    if (!authCode) {
      alert("인증번호를 입력해주세요.");
      return;
    }

    const xhr = new XMLHttpRequest();
    xhr.open("POST", "${pageContext.request.contextPath}/VerifyCodeServlet", true);
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

    xhr.onreadystatechange = function () {
      if (xhr.readyState === 4 && xhr.status === 200) {
        const response = xhr.responseText.trim();

        if (response === "인증 성공!") {
          alert("인증에 성공했습니다!");
          document.getElementById("authcodecheck").value = "success"; // 인증 성공 상태 저장
          document.getElementById("next").disabled = false;
        } else {
          alert("인증에 실패했습니다. 올바른 인증번호를 입력해주세요.");
          document.getElementById("authcodecheck").value = ""; // 인증 실패 상태 초기화
        }
      }
    };
    xhr.send("authCode=" + encodeURIComponent(authCode));
  }



  function checkid() {
    console.log("checkid 이벤트 호출")
    const userId = $("#userId").val();

    if(!userId){
      $(".id_ok").hide();
      $(".id_already").hide();
      return;
    }

    $.ajax({
      url:'/UserController?type=usercheckid',
      type:"post",
      data:{ userId: userId },
      success:function(response) {
        console.log("서버응답: ", response);
          if(response.trim() === "0") {
            $(".id_ok").show();
            $(".id_already").hide();
          } else {
            $(".id_ok").hide();
            $(".id_already").show();
          }
        },
      error:function(){
      alert("아이디검증 ajax 오류 발생.");
      }
    });
}

</script>

</body>
</html>
