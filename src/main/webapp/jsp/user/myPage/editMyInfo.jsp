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
      <h2>개인정보 수정</h2>
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

    <form action="${pageContext.request.contextPath}/UserController?type=changepw" method="POST">
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
          <td><input type="password" id="oldpassword" name="oldpassword"></td>
        </tr>
        <tr>
          <td class="title">새 비밀번호</td>
          <td>
            <input type="password" id="newPassword" name="newPassword" oninput="pwCheck()" placeholder="8자리 이상 비밀번호를 설정해주세요.">
            <span>※영문,숫자를 조합하여 8자리 이상으로 입력해주세요.</span>
          </td>
        </tr>
        <tr>
          <td class="title">새 비밀번호 확인</td>
          <td>
            <input type="password" id="newPassword2" name="newPassword2" oninput="pwCheck()" placeholder="위에서 입력한 비밀번호와 동일하게 작성하세요.">
            <div id="authpwd" style="margin-top: 5px; font-size: 12px; color: red;">비밀번호를 입력하여 주세요.</div>
          </td>
        </tr>
        </tbody>
      </table>
      <div id="lastElement">
        <li>※생년월일, 전화번호 등 개인 정보와 관련된 숫자, 연속된 숫자와 같이 쉬운 비밀번호는 다른 사람이 쉽게 알아낼 수 있으니 사용을 자제해주세요.</li>
        <li>※비밀번호는 3-6개월마다 꼭 바꿔주세요.</li>
      </div>
      <div id="lastBtnDiv">
        <button type="button" class="lastBtn" onclick="returnMain()">취소</button>
        <button type="button" class="lastBtn" id="changeuserpassword" onclick="changeuserpassword()">변경</button>
      </div>

    </div>
    </form>

  </article>
</div>

<!-- footer 영역 -->
<jsp:include page="../common/footer.jsp"/>

<!-- script 영역 -->
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
    const oldpassword = document.getElementById('oldpassword').value;
    const authPwd = document.getElementById('authpwd');
    const newPassword = document.getElementById('newPassword').value;
    const newPassword2 = document.getElementById('newPassword2').value;

    if (newPassword === newPassword2 && newPassword.length >= 8) {
      authPwd.innerText = '비밀번호가 일치합니다.';
      authPwd.style.color = 'green';
      // changeuserpassword.disabled = false;
    } else if (newPassword !== newPassword2) {
      authPwd.innerText = '비밀번호가 불일치합니다.';
      authPwd.style.color = 'red';
      // changeuserpassword.disabled = true;
    } else if (newPassword.length < 8) {
      authPwd.innerText = '비밀번호는 최소 8자리 이상이어야 합니다.';
      authPwd.style.color = 'red';
      // changeuserpassword.disabled = true;
    }
  }

  $(document).ready(function () {
    $("#changeuserpassword").click(function (event) {
      event.preventDefault(); // 기본 폼 제출 방지

      let oldPassword = $("#oldpassword").val();
      let newPassword = $("#newPassword").val();
      let newPassword2 = $("#newPassword2").val();

      // 비밀번호 유효성 검사
      if (newPassword.length < 8) {
        alert("새 비밀번호는 최소 8자리 이상이어야 합니다.");
        return;
      }
      if (newPassword !== newPassword2) {
        alert("새 비밀번호가 일치하지 않습니다.");
        return;
      }

      $.ajax({
        url: '${pageContext.request.contextPath}/UserController?type=changepw',
        type: 'POST',
        data: JSON.stringify({
          oldpassword: $('#oldpassword').val(),
          newPassword: $('#newpassword').val()
        }),
        contentType: 'application/json',
        success: function(response) {
          if (response.success) {
            alert(response.message); // 성공 메시지 출력
            window.location.href = '/profile.jsp'; // 프로필 페이지로 리다이렉트
          } else {
            alert(response.message); // 실패 메시지 출력
          }
        },
        error: function(xhr) {
          if (xhr.status === 401) {
            alert('세션이 만료되었습니다. 다시 로그인하세요.');
            window.location.href = '/login.jsp'; // 로그인 페이지로 리다이렉트
          } else {
            alert('오류가 발생했습니다. 관리자에게 문의하세요.');
          }
        }
      });
    });
  });
</script>
</body>
</html>

