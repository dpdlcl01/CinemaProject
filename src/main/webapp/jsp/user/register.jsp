<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Title</title>
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
      background-image: url("../../img/logo.png");
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
    #main3{

      text-align: center;
    }
    #main3Title{
      font-size: 20px;
      font-weight: bold;
      color: #503396;
      padding-bottom: 20px;
    }
    #main3Content{

      font-size: 13px;
      padding-bottom: 50px;

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
  </style>

</head>
<body>
<div id="contents">
  <h1>여기에 로고</h1>

  <article id="all">
    <div id="step">
      <p class="step">STEP1.본인인증</p>
      <p class="step">STEP2.약관동의</p>
      <p class="step">STEP3.정보입력</p>
      <p class="step">STEP4.가입완료</p>
    </div>

    <div id="main0">
      <article id="main0Title">
        <strong>회원가입을 위한 본인인증 단계입니다.</strong>
        <p>이메일 인증을 완료해주세요</p>
      </article>
      <table>
        <caption>이메일인증테이블</caption>
        <colgroup>
          <col width="150px">
          <col width="350px">
        </colgroup>
        <tr>
          <td><span>이름</span> </td>
          <td><input type="text" class="inputValue"></td>
        </tr>
        <tr>
          <td><span>이메일</span> </td>
          <td><input type="text" class="inputValue"><span>@</span><input type="text" class="inputValue"></td>
        </tr>
        <tr>
          <td><span>인증번호</span> </td>
          <td><input type="text" class="inputValue"> <button type="button" class="tableButton">인증 확인</button> </td>
        </tr>
      </table>
      <div id="nextDiv">
        <button type="button" id="next" disabled>다음</button>
      </div>

    </div>


    <div id="main" class="main default">
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
        <button type="button" id="check" disabled>확인</button>
      </div>
    </div>
  </article>

  <div id="main2">
    <div>
      <strong>사용자님 안녕하세요</strong>
      <p>회원 정보를 입력해주세요</p>
    </div>

    <div id="tableDiv">
      <table>
        <caption>회원정보입력테이블</caption>
        <colgroup>
          <col width="150px">
          <col width="*">
        </colgroup>
        <tbody>
        <tr>
          <td class="bold">생년월일</td>
          <td>
            <input type="text" class="birth" value="2025">
            <span>년</span>
            <input type="text" class="birth" value="01">
            <span>월</span>
            <input type="text" class="birth" value="01">
            <span>일</span>
          </td>
        </tr>

        <tr>
          <td class="bold"> 휴대폰번호</td>
          <td><input type="text" class="inputValue"></td>
        </tr>

        <tr>
          <td class="bold">아이디</td>
          <td>
            <input type="text" class="inputValue">
            <button type="button" class="tableButton">중복확인</button>
          </td>
        </tr>

        <tr>
          <td class="bold">비밀번호</td>
          <td><input type="text" class="inputValue"></td>
        </tr>

        <tr>
          <td class="bold">비밀번호확인</td>
          <td><input type="text" class="inputValue"></td>
        </tr>

        <tr>
          <td class="bold">이메일주소</td>
          <td><input type="text" class="inputValue"></td>
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
        <button type="button" id="register" disabled>회원가입</button>
      </div>

    </div>
  </div>
  <div id="main3">
    <div id="mainImg">
      <img src="../../img/complete.png">
    </div>
    <div id="main3Title">
      <p>사용자님 메가박스 가입을 환영합니다.</p>
    </div>
    <div>
      <p id="main3Content">이제부터 메가박스에서 제공하는 다양한 멤버십 혜택을 이용하실 수 있습니다.</p>
    </div>
    <div id="completeDiv">
      <button type="button" id="complete">신규회원 혜택 확인</button>
    </div>

  </div>
</div>


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
</script><!--다음 화면 읽고 만들기-->

</body>
</html>
