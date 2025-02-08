<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!Doctype html>
<html lang="en">
<!-- head -->
<head>
  <meta charset="UTF-8">
  <jsp:include page="../common/head.jsp"/>
</head>
<style>
  * {
    padding: 0;
    margin: 0;
    font-size: 14px;
    color: #423e3e;
  }
  body {
    font-family: Arial, sans-serif;
    background-color: #f9f9f9;
  }
  #main h1 {
    font-size: 28px;
    color: #222;
    margin-bottom: 20px;
  }
  .contents {
    width: 800px;
    margin: auto;
    background: white;
    padding: 30px;
  }
  .warning {
    font-size: 14px;
    color: red;
    font-weight: bold;
    margin-bottom: 20px;
  }
  .title {
    font-size: 17px;
    font-weight: bold;
    margin-bottom: 10px;
  }

  #main li {
    margin-bottom: 5px;
    list-style-type: disc;
  }
  table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
  }

  table td, table th {
    font-size: 15px;
    color: #222222;
    border-top: 1px solid gray;
    border-bottom: 1px solid gray;
    height: 40px;
    font-weight: bold;
    padding: 10px;
  }

  table input {
    width: 150px;
    height: 25px;
    text-align: center;
  }

  caption {
    text-indent: -9999px;
  }

  table button {
    width: 100px;
    height: 30px;
    font-size: 14px;
    background-color: #503396;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
  }
  table button:hover {
    background-color: #01738b;
  }
  #btnDiv {
    text-align: center;
    margin-top: 30px;
  }
  #cancel, #go {
    width: 100px;
    height: 40px;
    font-size: 16px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
  }
  #cancel {
    margin: 0 10px;
    border: 1px solid;
    background-color: #fff;
    color: #503396;
  }

  #cancel:hover{
    background-color: #f2f2f2;
  }

  #go {
    background-color: #503396;
    color: white;
  }
  #go:hover {
    background-color: #01738b;
  }


</style>
<body>
<!-- header 영역 -->
<head>
  <jsp:include page="../common/header.jsp"/>
</head>

<!-- contents 영역 -->
<form action="${pageContext.request.contextPath}/UserController?type=userdrop" method="post">
  <div class="page-util">
    <div class="inner-wrap">
      <div class="location">
        <span>Home</span>
        <img src="https://img.megabox.co.kr/static/pc/images/common/bg/bg-location-arr.png"/>
        <label>마이페이지</label>
        <img src="https://img.megabox.co.kr/static/pc/images/common/bg/bg-location-arr.png"/>
        <label>회원탈퇴</label>
      </div>
    </div>
  </div>
  <div class="contents">
    <article id="wrap">
      <%--  사이드바  --%>
<%--      <jsp:include page="../common/sideBar.jsp"/>--%>
      <div id="main">
        <h1>회원탈퇴</h1>
        <p class="warning">[주의] 메가박스 회원탈퇴를 신청하기 전에 안내 사항을 꼭 확인해주세요.</p>
        <p class="title">1. 30일간 회원 재가입이 불가능합니다.</p>
        <li>회원 탈퇴 후, 30일 경과 후 재가입할 수 있습니다.</li>
        <br>
        <p class="title">2. 다음에 경우에 회원 탈퇴가 제한됩니다.</p>
        <li>영화예매 내역이 있는 경우</li>
        <li>모바일오더 주문건이 있는 경우</li>
        <li>기명식 기프트카드 잔액이 있을 경우</li>
        <li>기명식 기프트카드가 카드정지 상태인 경우</li>
        <li>기명식 기프트카드 환불신청이 진행중인 경우</li>
        <br>
        <p class="title">3. 탈퇴 후 삭제 내역</p>
        <p class="warning">(회원 탈퇴하시면 회원정보와 개인 보유 포인트 등 정보가 삭제되며 데이터는 복구되지 않습니다.)</p>
        <li>메가박스 멤버십 포인트 및 적립/차감 내역</li>
        <li>관람권 및 쿠폰</li>
        <li>영화 관람 내역</li>
        <li>간편 로그인 연동 정보</li>
        <br>
        <p class="title">4. 회원님의 비밀번호를 입력하시고[탈퇴] 버튼을 클릭해주세요.</p>
        <table>
          <caption>탈퇴 테이블</caption>
          <colgroup>
            <col width="150px" class="td1">
            <col width="*">
          </colgroup>
          <tbody>
          <tr>
            <input type="hidden" name="userId" value="${sessionScope.userId}">
            <td>비밀번호</td>
            <td><input type="password" id="userPassword11" name="userPassword11"></td>
          </tr>
          <tr>
            <td>이메일</td>
            <td>
              <input type="text" id="emailpart1" name="emailpart1" class="inputEmail">
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
              <button type="button" onclick="sendAuthCode()">인증번호 받기</button>
              <input type="hidden" id="authcodecheck" value="1">
            </td>
          </tr>
          <tr>
            <td>인증번호</td>
            <td>
              <input type="text" id="authcode" name="authcode" class="inputValue">
              <button type="button" onclick="verifyAuthCode()">인증확인</button>
              <script>
                function sendAuthCode() {
                  const emailPart1 = document.getElementById("emailpart1").value.trim();
                  const emailPart2 = document.getElementById("emailpart2").value.trim();
                  console.log(document.getElementById("userPassword11"));
                  console.log(document.getElementById("userPassword11").value);
                  const userPassword = document.getElementById("userPassword11").value.trim();

                  const email = emailPart1 + "@" + emailPart2;

                  if (!emailPart1 || !emailPart2) {
                    showLoginNoticeModal("이메일을 입력해주세요.");
                    return;
                  }

                  if(!userPassword11) {
                    showLoginNoticeModal("기존 비밀번호를 입력하세요.")
                  }

                  console.log(userPassword11);
                  $.ajax({
                    type: "POST",
                    url: "${pageContext.request.contextPath}/EmailServlet", // EmailServlet URL
                    data: {
                      actionType: "deleteAccount", // 비밀번호 찾기 요청
                      email: email,
                      userPassword: userPassword
                    },
                    success: function (response) {
                      if (response.status === "success") {
                        showLoginNoticeModal(response.message); // 오류 메시지 표시
                        // showLoginNoticeModal("이메일 인증요청 완료"); // 성공 메시지 표시
                      } else {
                        // showLoginNoticeModal("이메일 인증요청 완료"); // 성공 메시지 표시
                        showLoginNoticeModal(response.message); // 오류 메시지 표시
                      }
                    },
                    error: function (xhr, status, error) {
                      console.error("AJAX Error:", status, error);
                      console.error("Response Text:", xhr.responseText);
                      showLoginNoticeModal("서버 통신 중 오류가 발생했습니다.");
                    }
                  });
                }
              </script>
            </td>
          </tr>
          </tbody>
        </table>
        <div id="btnDiv" disabled="">
          <button id="cancel">취소</button>
          <button id="go">탈퇴</button>
          <%--        onclick="userStatus_drop(this.form)"--%>
        </div>
      </div>
      <c:if test="${not empty message}">
        <div class="alert">${message}</div>
      </c:if>
    </article>
  </div>
</form>
<!-- footer 영역 -->
<jsp:include page="../common/footer.jsp"/>

<!-- script 영역 -->
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
          document.getElementById("authcodecheck").value = "0";
          document.getElementById("go").disabled = false;
        } else {
          showLoginNoticeModal("인증에 실패했습니다. 올바른 인증번호를 입력해주세요.");
          document.getElementById("authcodecheck").value = "1";
        }
      }
    };
    xhr.send("authCode=" + encodeURIComponent(authCode));
  }

</script>
</body>
</html>
