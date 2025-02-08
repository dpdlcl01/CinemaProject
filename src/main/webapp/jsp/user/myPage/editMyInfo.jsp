<%@ page import="mybatis.vo.UserVO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!Doctype html>
<html lang="en">
<!-- head -->
<head>
  <meta charset="UTF-8">
  <jsp:include page="../common/head.jsp"/>
</head>
<style>

  .contents{
    width: 1100px;
  }

  #wrap{
    display: flex;

  }

  #main h1, #passwordMain h1 {
    font-size: 24px;
    margin-bottom: 20px;
  }

  table{
    border-collapse: collapse;
    width: 720px;
    margin-bottom: 10px;
  }

  table td{
    border-bottom: 1px solid gray;
    border-top: 1px solid gray;
    height: 40px;
    padding: 10px;
    padding-left: 20px;
  }
  .title{
    font-weight: bold;
    font-size: 14px;
    padding: 7px 15px;
    background-color: #F5F5F5;
  }
  caption{
    width: 0;
    height: 0;
    text-indent: -9999px;
  }

  #main,#passwordMain{
    padding-left: 50px;
    /*width: 800px;*/
  }
  #btnDiv>button, #lastBtnDiv>button{
    border-radius: 5px;
    color: #FFFFFF;
    background-color: #503396;
    border: none;
    width: 88px;
    height: 46px;
  }

  #btnDiv>button, #lastBtnDiv>button:hover {
    background-color: #3D2775;;
  }

  #btnDiv, #lastBtnDiv{
    margin-right: auto ;
    margin-left: auto;
    width: 100%;
    padding-bottom: 40px;
    text-align: center;
  }
  /*table .normalBtn{*/
  /*  background-color: white;*/
  /*  border: 1px solid gray;*/
  /*  width: 120px;*/
  /*  height: 30px;*/
  /*  border-radius: 4px;*/
  /*  margin-left: 10px;*/
  /*}*/
  table input{
      display: inline-block;
      width: 200px;
      height: 32px;
      padding: 0 10px;
      line-height: 30px;
      color: #444;
      border: 1px solid #d8d9db;
      font-size: 14px;
  }
  i{
    text-indent: -9999px;
  }
  #passwordMain{
    display: none;
  }
  #editPassword{
    display: none;
  }

  /*버튼 스타일*/
  #main button {
    font-size: 14px;
    color: #fff;
    border: none;
    border-radius: 5px;
    background-color: #503396;
    /*width: 60px;*/
    height: 26px;
    /*margin-left: 10px;*/
  }
  #main button:hover {
    background-color: #3D2775;;
  }

  #passwordBtn{
    margin-left: 0
  }

  button:hover {
    color: #fff;
    background-color: #01738b;
  }

  h1{
    margin: 0;
    padding: 0;
  }
  #passwordMain li{
    width: 730px;
    margin-bottom: 15px;
    list-style-type: disc;
  }

  #authpwd{
    display: inline-block;
    margin-top: 5px;
    font-size: 12px;
    color: red;
  }

  #lastBtnDiv .cancel{
    margin: 0 10px;
    border: 1px solid;
    background-color: #fff;
    color: #503396;
  }

  #lastBtnDiv .cancel:hover{
    background-color: #f2f2f2;
  }


</style>
<body>
<!-- header 영역 -->
<head>
  <jsp:include page="../common/header.jsp"/>
</head>
<div class="page-util">
  <div class="inner-wrap">
    <div class="location">
      <span>Home</span>
      <img src="https://img.megabox.co.kr/static/pc/images/common/bg/bg-location-arr.png"/>
      <label>마이페이지</label>
      <img src="https://img.megabox.co.kr/static/pc/images/common/bg/bg-location-arr.png"/>
      <label>개인정보수정</label>
    </div>
  </div>
</div>
<!-- contents 영역 -->
<div class="contents">
  <article id="wrap">
    <%--  사이드바  --%>
    <jsp:include page="../common/sideBar.jsp"/>
    <div id="main">
      <h1>개인정보 수정</h1>
      <li>
        회원님의 정보를 정확히 입력해주세요.
      </li>
      <%
        UserVO uservo = (UserVO) session.getAttribute("uservo");
      %>
      <h3>기본 정보</h3>
      <table>
        <caption>기본정보 테이블</caption>
        <colgroup>
          <col width="150px" class="title">
          <col width="*">
        </colgroup>
        <tbody>
        <tr>
          <td class="title">아이디</td>
          <td>
            <span>${uservo.userId}</span>
            <button onclick="window.location.href='${pageContext.request.contextPath}/UserController?type=deleteuser'">회원탈퇴</button>
          </td>
        </tr>
        <tr>
          <td class="title">이름</td>
          <td>
            <span>${uservo.userName}</span>
          </td>
        </tr>
        <tr>
          <td class="title" >휴대폰</td>
          <td>
            <span>${uservo.userPhone}</span>
            <button type="button" class="normalBtn" onclick="viewP()">휴대폰번호변경</button>
            <p id="editPassword">변경할 휴대폰 번호 <input type="text"><button type="button">변경</button> </p>
          </td>
        </tr>
        <tr>
          <td class="title">이메일</td>
          <td>
            <span>${uservo.userEmail}</span>
          </td>
        </tr>
        <tr>
          <td class="title" >비밀번호</td>
          <td>
            <button type="button" id="passwordBtn" onclick="passwordMain()">비밀번호 변경</button>
          </td>
        </tr>
        </tbody>
      </table>
      <div id="btnDiv">
<%--        <button type="button" id="cancel">취소</button>--%>
<%--        <button type="button" id="go" >변경</button>--%>
      </div>
    </div>

    <form id="passwordChangeForm" action="${pageContext.request.contextPath}/UserController?type=changepassword" method="POST">
      <div id="passwordMain">
        <h1>비밀번호 변경</h1>
        ${success}
        <li>현재 비밀번호를 입력한 후 새로 사용할 비밀번호를 입력하세요.</li>
        <table>
          <caption>탈퇴 테이블</caption>
          <colgroup>
            <col width="150px" class="title">
            <col width="*">
          </colgroup>
          <tbody>
          <tr>
            <td class="title">현재 비밀번호</td>
            <td><input type="password" id="currentPassword" name="currentPassword"></td>
          </tr>
          <tr>
            <td class="title">새 비밀번호</td>
            <td>
              <input type="password" id="newPassword" name="newPassword" oninput="pwCheck()" placeholder="8자리 이상 비밀번호">
            </td>
          </tr>
          <tr>
            <td class="title">새 비밀번호 확인</td>
            <td>
              <input type="password" id="newPassword2" name="newPassword2" oninput="pwCheck()" placeholder="비밀번호 확인">
              <div id="authpwd">비밀번호를 입력하여 주세요.</div>
            </td>
            <script>
              document.addEventListener("DOMContentLoaded", function () {
                document.getElementById("changePasswordButton").addEventListener("click", function (event) {
                  event.preventDefault();

                  const currentPassword = document.getElementById("currentPassword").value;
                  const newPassword = document.getElementById("newPassword").value;

                  $.ajax({
                    url: "${pageContext.request.contextPath}/UserController?type=changepassword",
                    type: "POST",
                    data: { currentPassword, newPassword },
                    success: function (response) {
                      console.log(response); // 응답 데이터 확인
                      if (response.status === "success") {
                        showLoginNoticeModal(response.message);
                        document.getElementById("currentPassword").value = "";
                        document.getElementById("newPassword").value = "";
                        document.getElementById("newPassword2").value = "";
                      } else {
                        showLoginNoticeModal(response.message);
                        document.getElementById("currentPassword").value = "";
                        document.getElementById("newPassword").value = "";
                        document.getElementById("newPassword2").value = "";
                      }
                    },
                    error: function () {
                      showLoginNoticeModal("오류가 발생했습니다. 다시 시도해주세요.");
                    },
                  });
                });
              });
            </script>
          </tr>
          </tbody>
        </table>
        <div id="lastElement">
          <li>생년월일, 전화번호 등 개인 정보와 관련된 숫자, 연속된 숫자와 같이 쉬운 비밀번호는 다른 사람이 쉽게 알아낼 수 있으니 사용을 자제해주세요.</li>
          <li>비밀번호는 3-6개월마다 꼭 바꿔주세요.</li>
        </div>
        <div id="lastBtnDiv">
          <button type="button" class="cancel" onclick="returnMain()">취소</button>
          <button type="button" class="lastBtn" id="changePasswordButton" name="changePasswordButton">변경</button>
        </div>

      </div>
    </form>
  </article>
</div>

<div id="modalOverlay" class="modal-overlay"></div>

<!-- footer 영역 -->
<jsp:include page="../common/footer.jsp"/>

<!-- script 영역 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
  function viewP(){
    const editPassword = document.getElementById('editPassword');
    if(editPassword.style.display==='none'|| editPassword.style.display === ''){
      editPassword.style.display = 'block';
    }else{
      editPassword.style.display = 'none';
    }
  }

  const hiddenDiv = document.getElementById('passwordMain');
  const mainDiv = document.getElementById("main");


  function passwordMain() {
    if (hiddenDiv.style.display === 'none' || hiddenDiv.style.display === '') {
      hiddenDiv.style.display = 'block';
      mainDiv.style.display='none';
    }
  }
  function returnMain() {
    hiddenDiv.style.display = 'none'; // div 숨기기
    mainDiv.style.display='block';
  }
  function pwCheck() {
    const currentPassword = document.getElementById('currentPassword').value;
    const authPwd = document.getElementById('authpwd');
    const password1 = document.getElementById('newPassword').value;
    const password2 = document.getElementById('newPassword2').value;

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
</script>
</body>
</html>