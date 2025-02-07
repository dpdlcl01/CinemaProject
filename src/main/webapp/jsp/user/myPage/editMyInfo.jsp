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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js"></script>
<style>
  *{
    padding: 0;
    margin: 0;
    font-size: 14px;
  }
  h2{
    font-size: 30px;
    padding-top: 20px;
    padding-bottom: 20px;
  }
  #contents{
    width: 1100px;
    margin-right: auto;
    margin-left: auto;
    padding-left: 30px;

  }

  li{
    padding-bottom: 5px;
  }
  #wrap{
    display: flex;

  }

  table{
    border-collapse: collapse;
    width: 720px;
    margin-bottom: 70px;
  }

  table td{
    border-bottom: 1px solid gray;
    border-top: 1px solid gray;
    height: 40px;
    padding-left: 20px;
  }
  .title{
    font-weight: bold;
    font-size: 15px;
    background-color: #F5F5F5;
  }
  caption{
    text-indent: -9999px;
  }
  h3{
    font-size: 19px;
    padding-top: 20px;
  }
  #main,#passwordMain{
    padding-left: 100px;
    width: 800px;
  }
  #btnDiv>button, #lastBtnDiv>button{
    width: 88px;
    height: 46px;
  }
  #btnDiv, #lastBtnDiv{
    margin-right: auto ;
    margin-left: auto;
    width: 100%;
    padding-bottom: 40px;
    text-align: right;
  }
  table .normalBtn{
    background-color: white;
    border: 1px solid gray;
    width: 120px;
    height: 30px;
    border-radius: 4px;
    margin-left: 10px;
  }
  table input{
    height: 25px;
  }
  i{
    text-indent: -9999px;
  }
  .liWrap{
    display: flex;
    border-bottom: 1px solid #222222;
  }
  #passwordBtn{
    background-color: white;
    border: 1px solid gray;
    width: 120px;
    height: 30px;
    border-radius: 4px;
  }
  #passwordMain{
    display: none;
  }
  #editPassword{
    display: none;
  }
 .modal-content {
   width: 300px;
   height: 200px;
 }
  .modal-dialog {
    max-width: 400px; /* 모달 너비 */
  }

</style>
<body>
<!-- header 영역 -->
<head>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
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
      <h2>개인정보 수정</h2>
      <li>
        회원님의 정보를 정확히 입력해주세요.
      </li>
      <%
        UserVO uservo = (UserVO) session.getAttribute("uservo");
      %>
      <h3>기본 정보</h3>
      <button onclick="window.location.href='${pageContext.request.contextPath}/UserController?type=deleteuser'">회원탈퇴</button>
      <table>
        <caption>기본정보 테이블</caption>
        <colgroup>
          <col width="150px" class="title">
          <col width="*">
        </colgroup>
        <tbody>
        <tr>
          <td class="title">아이디</td>
          <td><span>${uservo.userId}</span></td>
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
        <button type="button" id="cancel">취소</button>
        <button type="button" id="go" >변경</button>
      </div>
    </div>

    <form id="passwordChangeForm" action="${pageContext.request.contextPath}/UserController?type=changepassword" method="POST">
    <div id="passwordMain">
      <h2>비밀번호 변경</h2>
      ${success}
      <li>현재 비밀번호를 입력한 후 새로 사용할 비밀번호를 입력하세요.</li>
      <h3>비밀번호</h3>
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
            <div id="authpwd" style="margin-top: 5px; font-size: 12px; color: red;">비밀번호를 입력하여 주세요.</div>
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
                    if (response.status === "success") {
                      showModal(response.message);
                    } else {
                      showModal(response.message);
                    }
                  },
                  error: function () {
                    showModal("오류가 발생했습니다. 다시 시도해주세요.");
                  },
                });
              });
            });
          </script>
        </tr>
        </tbody>
      </table>
      <div id="lastElement">
        <li>※생년월일, 전화번호 등 개인 정보와 관련된 숫자, 연속된 숫자와 같이 쉬운 비밀번호는 다른 사람이 쉽게 알아낼 수 있으니 사용을 자제해주세요.</li>
        <li>※비밀번호는 3-6개월마다 꼭 바꿔주세요.</li>
      </div>
      <div id="lastBtnDiv">
        <button type="button" class="lastBtn" onclick="returnMain()">취소</button>
        <button type="button" class="lastBtn" id="changePasswordButton" name="changePasswordButton">변경</button>
      </div>

    </div>
    </form>
  </article>

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
  function showModal(message) {

    document.querySelector('#alertModal .modal-body').textContent = message;

    // Bootstrap Modal 표시
    const alertModal = new bootstrap.Modal(document.getElementById('alertModal'));
    alertModal.show();
  }
</script>
</body>
</html>

