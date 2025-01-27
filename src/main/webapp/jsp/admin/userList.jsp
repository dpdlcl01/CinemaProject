<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
  if (request.getAttribute("users") == null || request.getAttribute("paging") == null) {
    response.sendRedirect(request.getContextPath() + "/AdminController?type=getalluser");
    return;
  }
%>

<!Doctype html>
<html lang="ko">
<head>
  <jsp:include page="/jsp/user/common/head.jsp"/>

</head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/common.css">

<style>
  #top1{
    background-image: url("${pageContext.request.contextPath}/css/user/images/KangImg/my_info_topbg.png");
    color: white;
    background-repeat: no-repeat;
    display: flex;
    width: 840px;
    height: 220px;
    background-size: contain;
  }
  #top1 img{
    width: 90px;
    height: 90px;
  }
  #imgName{
    display: flex;
    padding-right: 30px;
    width: 420px;
    align-items: center;
    justify-content: center;
  }
  #imgName p{
    font-size: 40px;
    line-height: 10px;
    padding-left: 30px;
    margin: 30px 0;

  }
  #point{
    display: flex;
    padding-top: 30px;
    margin-left: 50px;
  }
  #totalPoint{
    font-size: 40px;
  }
  #point span, #point em{
    padding-top: 10px;
    padding-left: 10px;
  }
  #point em{
    color: deepskyblue;
    font-weight: 600;
  }
  #pointDiv {
    position: relative;
    height: 120px;
  }

  #bar {
    width: 100%; /* 가로선을 전체 너비로 설정 */
    height: 2px;
    background-color: #666;
    position: absolute;
    top: 100px;
    left: 50px;
  }

  /* 등급 진행 바 */
  .level-list {
    display: flex;
    align-items: center;
    justify-content: space-between;
    list-style: none;
    padding: 0;
    margin: 20px 0 0 50px;
    width: 100%;
    max-width: 600px;
    position: relative;
  }

  /* 등급 바의 연결선 */
  .level-list::before {
    content: "";
    position: absolute;
    top: 50%;
    left: 0;
    width: 100%;
    height: 2px;
    background-color: #666; /* 기본 선 색상 */
    z-index: -1;
    transform: translateY(-50%);
  }

  /* 각 등급을 나타내는 작은 동그라미 */
  .level-item {
    position: relative;
    width: 12px; /* 작은 크기의 원 */
    height: 12px;
    background-color: #666;
    border-radius: 50%;

  }

  /* 현재 활성화된 등급 */
  .level-item.active {
    background-color: #22C8F6; /* 하늘색 */
    border: 2px solid white;
  }

  /* 등급 텍스트 */
  .level-item span {
    position: absolute;
    top: 20px;
    left: 50%;
    transform: translateX(-50%);
    color: white;
    font-size: 12px;
    text-align: center;
  }

  /* 말풍선 스타일 */
  .tooltip {
    background-color: #22C8F6;
    color: #ffffff;
    padding: 6px 12px;
    /*margin-left: 110px;*/
    border-radius: 6px;
    font-size: 12px;
    font-weight: bold;
    position: absolute;
    top: 50px;
    left: 50%;
    transform: translateX(-50%);
    white-space: nowrap;

  }

  /* 말풍선 꼬리 */
  /*    .tooltip::after {
          content: "";
          position: absolute;
          bottom: -6px;
          left: 50%;
          transform: translateX(-50%);
          border-width: 6px;
          border-style: solid;
          border-color: #22C8F6 transparent transparent transparent;
      }*/

  #top2{
    display: flex;
    width: 836px;
    height: 140px;
    background-color: #eeeeee;
    border-bottom-left-radius: 20px;
    border-bottom-right-radius: 20px;
    margin-bottom: 50px;
  }
  .top2{
    width: 200px;
    padding: 10px 20px 0;
  }
  .top2>a{
    display: block;
    text-align: center;
    color: #503396;
    font-weight: 600;
    padding-bottom: 10px;
    text-decoration: none;
  }
  .top2>div{
    display: flex;
    margin-left: 10px;
  }
  .top2 span{


    width: 120px;
  }
  .top2 em{
    text-align: right;
    display: block;
    font-weight: 600;
  }
  #myReserv{
    display: flex;
    width: 840px;
    height: 140px;
    margin-bottom: 50px;
    align-items: center;
    border-bottom: 1px solid #eeeeee;
  }
  #myReserv>img{
    width: 70px;
    height: 100px;
  }
  #reservInfo p{
    margin: 0 30px;
    width: 640px;
  }
  #reservInfo em{
    color: #01738b;
  }
  #myReserv button{
    background-color: white;
    width: 74px;
    height: 32px;
  }
  #h2{
    display: flex;
    align-items: center;
    border-bottom:1px solid #666666;
    width: 840px;
  }
  #h2 h2{
    width: 760px;
  }
  #h2 button{
    height:32px ;
    width: 74px;
    border: none;
    background-color: white;
  }
  .top2 span{
    font-size: 14px;
  }
  #total{
    display: none;
  }
  .myPage-container{
    display: flex;

  }
  #contents{
    margin-left: auto;
    margin-right: auto;
    width: 1100px;
  }
  #main{
    display: block;
    margin: 50px 0 50px 50px;
  }

  .filter-container {
    position: absolute;
    top: -50px;
    right: 10px;
    display: flex;
    gap: 10px;
  }

  .filter-container select,
  .filter-container input,
  .filter-container button {
    padding: 5px;
    font-size: 14px;
  }

  table {
    display: table;
    width: 900px;
    border-collapse: collapse;
    margin-top: 20px;
    border: 1px solid black;
  }

  th, td {
    border: 1px solid black;
    padding: 10px;
    text-align: center;
  }

  th {
    background-color: #f2f2f2;
  }

  td {
    background-color: #f9f9f9;
  }
</style>


<jsp:include page="/jsp/user/common/header.jsp"/>

<div id="contents">
  <div class="page-util">
    <div class="inner-wrap">
      <div class="location">
        <span>Home</span>
        <a href="/booking" title="예매 페이지로 이동">이벤트</a>
        <a href="/booking" title="빠른예매 페이지로 이동" class="pageUtila">진행중 이벤트</a>
      </div>
    </div>
  </div>

  <div class="total-main">
    <div class="myPage-container">
      <jsp:include page="./common/adminSideBar.jsp"></jsp:include>


      <div id="main">
        <div id="title">
          <h2>회원 목록</h2>
          <div id="top1">
            <div id="imgName">


            </div>
            <div id="pointDiv">






            </div>
          </div>
          <form action="${pageContext.request.contextPath}/AdminController" method="get">
            <input type="hidden" name="type" value="getalluser"/>
            <div class="filter-container">
              <select name="searchType">
                <option value="id" ${searchType == 'userId' ? 'selected' : ''}>아이디</option>
                <option value="name" ${searchType == 'userName' ? 'selected' : ''}>이름</option>
                <option value="grade" ${searchType == 'userGrade' ? 'selected' : ''}>등급</option>
              </select>
              <input type="text" name="searchKeyword" placeholder="검색어를 입력하세요"
                     value="${fn:escapeXml(searchKeyword)}"/>
              <button type="submit">검색</button>
            </div>
          </form>


          <table>
            <thead>
            <tr>
              <th>순번</th>
              <th>이름</th>
              <th>아이디</th>
              <th>이메일</th>
              <th>전화번호</th>
              <th>포인트</th>
              <th>등급</th>
              <th>가입일</th>
              <th>상태</th>
            </tr>
            </thead>

            <tbody>
            <c:forEach var="user" items="${users}" varStatus="vs">
              <tr>
                <td>${user.userIdx}</td>
                <td>${user.userName}</td>
                <td>${user.userId}</td>
                <td>${user.userEmail}</td>
                <td>${user.userPhone}</td>
                <td>${user.userPoint}</td>
                <td>${user.userGrade}</td>
                <td>${user.userRegDate}</td>
                <td>${user.userStatus}</td>
              </tr>
            </c:forEach>

            <c:if test="${empty users}">
              <tr>
                <td colspan="9" style="text-align:center;">데이터가 없습니다.</td>
              </tr>
            </c:if>
            </tbody>
          </table>

          <!-- 페이징 처리 -->
          <div class="pagination">
            <!-- 이전 버튼 -->
            <c:if test="${paging.startPage > paging.pagePerBlock}">
              <!-- 검색 조건 유지 -->
              <a href="?type=getalluser&searchType=${searchType}&searchKeyword=${fn:escapeXml(searchKeyword)}&cPage=${paging.startPage - paging.pagePerBlock}">&lt; 이전</a>
            </c:if>

            <!-- 페이지 번호 -->
            <c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="page">
              <!-- 현재 페이지 강조 -->
              <a href="?type=getalluser&searchType=${searchType}&searchKeyword=${fn:escapeXml(searchKeyword)}&cPage=${page}"
                 class="${page == paging.nowPage ? 'active' : ''}">${page}</a>
            </c:forEach>

            <!-- 다음 버튼 -->
            <c:if test="${paging.endPage < paging.totalPage}">
              <!-- 검색 조건 유지 -->
              <a href="?type=getalluser&searchType=${searchType}&searchKeyword=${fn:escapeXml(searchKeyword)}&cPage=${paging.endPage + 1}">다음 &gt;</a>
            </c:if>

            <!-- 비활성화된 다음 버튼 -->
            <c:if test="${paging.endPage >= paging.totalPage}">
              <a class="disabled">다음 &gt;</a>
            </c:if>
          </div>

        </div>
      </div>





    </div>
  </div>
</div>


<jsp:include page="/jsp/user/common/footer.jsp"/>

<script>
  var total = ${requestScope.total};
  document.addEventListener("DOMContentLoaded", function() {
    if (total >= 13000 && total < 20000) {
      document.getElementById("vip-item").classList.add("active");
    }
    if (total >=20000){
      document.getElementById("vip-item").classList.add("active");
      document.getElementById("vvip-item").classList.add("active");
    }
  });

</script>
</body>
</html>