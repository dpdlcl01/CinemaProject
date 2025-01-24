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
  .sidebar{
    width: 200px;
    border-radius: 6px;
    height: 360px;
    margin-top: 15px;
    margin-right: 50px;

  }
  .sidebar>ul{
    border-right:1px solid #222222;
    border-left:1px solid #222222;
    border-radius: 6px;
  }
  .sidebar a{
    display: flex;

    padding-top: 15px;
    padding-bottom: 10px;
    text-decoration: none;
    text-indent: 20px;
    line-height: 30px;
    font-weight: bolder;

  }
  .sidebar li>a{

    font-size: 14px;
    width: 180px;
    color: #222222;
  }
  #myMega{
    border-bottom: 2px solid #222222;
    background-color: #222222;
    border-radius: 4px;
    color: #D3D3D3;
  }
  #myMega>a:hover{

    color: gray;
  }
  .sidebar li>a:hover{
    color: gray;
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
<jsp:include page="../common/header.jsp"/>
<div class="page-util">
  <div class="inner-wrap">
    <div class="location">
      <span>Home</span>
      <span>회원정보</span>
      <span class="pageUtila">개인정보수정</span>
    </div>
  </div>
</div>
<!-- contents 영역 -->
<div id="contents">
  <article id="wrap">


    <div class="sidebar">
      <ul>
        <div  id="myMega"><a href="myInfoMain.jsp" title="나의 메가박스">나의 메가박스</a></div>
        <div class="liWrap"><li><a href="myReservation.jsp" title="예매/구매내역">예매/구매내역</a></li></div>
        <div class="liWrap"> <li><a href="myAdmissionTicket.jsp" title="영화/스토어 관람권">영화/스토어 관람권</a></li></div>
        <div class="liWrap">  <li><a href="myCoupon.jsp" title="메가박스/제휴쿠폰">메가박스/제휴쿠폰</a></li></div>
        <div class="liWrap"> <li><a href="myMembership.jsp" title="멤버십 포인트">멤버십 포인트</a></li></div>
        <div class="liWrap"> <li><a href="myMovieStoryV2.jsp" title="나의 무비스토리">나의 무비스토리</a></li></div>
        <div class="liWrap"> <li><a href="editMyInfo.jsp" title="회원정보">회원정보</a></li></div>

      </ul>
    </div>

    <div id="main">
      <h2>개인정보 수정</h2>
      <li>
        회원님의 정보를 정확히 입력해주세요.
      </li>
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
          <td><span>${sessionScope.user.userId}</span></td>
        </tr>
        <tr>
          <td class="title">이름</td>
          <td>
            <span>${sessionScope.user.userName}</span>
          </td>
        </tr>
        <tr>
          <td class="title">생년월일</td>
          <td><span></span></td>
        </tr>
        <tr>
          <td class="title" >휴대폰</td>
          <td>
            <span>${sessionScope.user.userPhone}</span>
            <button type="button" class="normalBtn" onclick="viewP()">휴대폰번호변경</button>
            <p id="editPassword">변경할 휴대폰 번호 <input type="text"><button type="button">변경</button> </p>
          </td>
        </tr>
        <tr>
          <td class="title">이메일</td>
          <td>
            <span>${sessionScope.user.userEmail}</span>
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
        <button type="button" id="go" disabled>변경</button>
      </div>
    </div>


    <div id="passwordMain">
      <h2>비밀번호 변경</h2>
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
          <td><input type="password"></td>
        </tr>
        <tr>
          <td class="title">새 비밀번호</td>
          <td>
            <input type="text">
            <span>※영문,숫자를 조합하여 10자리 이상으로 입력해주세요.</span>
          </td>
        </tr>
        <tr>
          <td class="title">새 비밀번호 확인</td>
          <td>
            <input type="text">
            ※비밀번호 확인을 위해 한 번 더 입력해 주시기 바랍니다.
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
        <button type="button" disabled class="lastBtn">변경</button>

      </div>

    </div>
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
</script>
</body>
</html>

