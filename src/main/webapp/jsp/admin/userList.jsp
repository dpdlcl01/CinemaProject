<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% System.out.println("userList: " + request.getAttribute("userList")); %>
<!Doctype html>
<html lang="ko">
<head>
</head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/common.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<style>
    .admin-contents {
        width: 100%;
        min-height: 550px;
    }
    .page-util .inner-wrap {
        max-width: 100%; !important;
        padding: 20px 20px; !important;
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

  .myPage-container{
    display: flex;

  }
  #main{
      width: 100%;
    margin: 27px 40px 40px 40px;
  }
  #main h1{
      font-size: 30px;
  }



    .noticeboard {
        margin-top: 20px;
    }

    .noticeboard.active {
        display: block;
    }

    .search-bar-container {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 20px;
    }

    .search-bar-container .total-count {
        font-size: 16px;
    }

    .search-bar {
        display: flex;
        justify-content: flex-end;
        align-items: center;
        gap: 10px;
    }

    .search-bar select {
        padding: 6px;
        font-size: 14px;
    }

    .search-bar2 {
        border-bottom: 1px solid #423e3e;
        display: inline-block;
        position: relative;
        width: 200px;
        height: 30px;
    }

    .search-bar2 .input-text {
        display: inline-block;
        background-color: transparent;
        border: 0;
        color: #000;
        line-height: 25px;
        font-size: 16px;
        outline: none;
    }

    .search-bar2 .input-text:active {
        border: 0;
        outline: none;
    }

    .search-bar2 .btn {
        display: block;
        width: 30px;
        height: 100%;
        position: absolute;
        right: 0;
        top: 0;
        font-size: 0;
        line-height: 0;
        border: 0;
        background-color: transparent;
    }

    .search-bar2 .btn:hover {
        background-color: #0056b3;
    }

    .search-bar2 .btn .ico-search {
        display: inline-block;
        width: 18px;
        height: 18px;
        background-image: url(https://img.megabox.co.kr/static/pc/images/common/ico/ico-search-white.png);
        vertical-align: middle;
    }

    table {
        width: 100%;
        /*height: 100%;*/
        border-collapse: collapse;
        margin-top: 20px;
    }

    table, th {
        border-top: 2px solid #333;
        border-bottom: 0;
    }

    th {
        text-align: center !important;
    }


    th, td {
        padding: 15px;
        text-align: center;

    }

    td {
        border-top: 1px solid #ddd !important;
        border-bottom: 1px solid #ddd !important;
    }

    /* 제목 왼쪽 정렬 필요할 경우 */
/*    td:nth-child(4) {
        text-align: left;
        padding-left: 15px;
    }*/

    td a {
        color: inherit; /* 부모 요소의 색상을 따르도록 설정 */
        text-decoration: none; /* 밑줄 제거 */
    }


    td a:hover {
        color: #666;
    }

    th {
        background-color: #f4f4f4;
        font-weight: bold;
    }

    /* 페이지네이션 */
    .pagination {
        clear: both;
        position: relative;
        margin: 0 auto;
        padding: 30px 0 0 0;
        display: flex;
        justify-content: center;
    }

    .pagination .active {
        color: #fff;
        background-color: #01738b;
        border-color: #01738b;
    }

    .pagination .control, .pagination a, .pagination strong {
        display: inline-block;
        position: relative;
        min-width: 32px;
        height: 32px;
        margin: 0;
        padding: 0 8px;
        border: 1px solid #ebebeb;
        text-decoration: none;
        line-height: 30px;
        color: #333;
        font-weight: 400;
        vertical-align: middle;
        border-radius: 4px;
    }

    .pagination .control.next {
        margin-left: 5px;
        background-position: -64px 0;
    }

    .pagination .control {
        overflow: hidden;
        width: 32px;
        height: 32px;
        background: url(https://img.megabox.co.kr/static/pc/images/common/btn/btn-paging.png) no-repeat 0 0;
    }
</style>

<body>
<header>
    <div class="page-util">
        <div class="inner-wrap" style="display: flex; justify-content: space-between; align-items: center;">
            <!-- 홍길동 관리자님 위치 -->
            <div class="location" style="flex-grow: 1;">
                <span>홍길동 관리자님</span>
            </div>
            <!-- 로그인/로그아웃 버튼 -->
            <div style="display: flex; gap: 10px; flex-shrink: 0;">
                <a href="/login" title="로그인 페이지로 이동" style="text-decoration: none; color: black; font-weight: 600;">
                    로그인
                </a>
                <a href="/logout" title="로그아웃" style="text-decoration: none; color: black; font-weight: 600;">
                    로그아웃
                </a>
            </div>
        </div>
    </div>
</header>
<div class="admin-contents">
  <div class="total-main">
    <div class="myPage-container">
      <%--  사이드바  --%>
      <jsp:include page="./common/adminSideBar.jsp"></jsp:include>
      <%--  메인  --%>

      <div id="main">
        <h1>회원 목록</h1>
        <div id="title">
            <div id="announcement" class="noticeboard">
                <div class="search-bar-container">
                    <div class="total-count">전체 ${paging.totalRecord}건</div>
                    <form method="get" action="${pageContext.request.contextPath}/AdminController">
                        <input type="hidden" name="type" value="userlist"/>
                        <select id="searchType" name="searchType">
                            <option value="name" ${searchType == 'name' ? 'selected' : ''}>이름</option>
                            <option value="id" ${searchType == 'id' ? 'selected' : ''}>아이디</option>
                            <option value="grade" ${searchType == 'grade' ? 'selected' : ''}>등급</option>
                        </select>
                        <input type="text" name="searchKeyword" value="${searchKeyword}" placeholder="검색어 입력">
                        <button type="submit">검색</button>
                    </form>
                </div>

                <table border="1">
                    <thead>
                    <tr>
                        <th>번호</th>
                        <th>이름</th>
                        <th>아이디</th>
                        <th>이메일</th>
                        <th>전화번호</th>
                        <th>포인트</th>
                        <th>등급</th>
                        <th>상태</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="user" items="${users}" varStatus="status">
                        <tr>
                            <input type="hidden" name="userIdx" class="userIdx" value="${user.userIdx}">
                            <td>${(paging.nowPage - 1) * paging.numPerPage + status.index + 1}</td>
                            <td>${user.userName}</td>
                            <td>${user.userId}</td>
                            <td>${user.userEmail}</td>
                            <td>${user.userPhone}</td>
                            <td>${user.userPoint}</td>
                            <td>${user.userGrade}</td>
                            <td>${user.userStatus}</td>
                            <td><button class="btn btn-primary edit-btn" data-toggle="modal" data-target="#editModal" data-id="${user.userIdx}">수정</button></td>                        </tr>
                    </c:forEach>

                    <!-- 사용자가 없을 경우 -->
                    <c:if test="${fn:length(users) == 0}">
                        <tr><td colspan="9">사용자가 없습니다.</td></tr>
                    </c:if>
                    </tbody>
                </table>

                <nav class="pagination">
                    <c:if test="${paging.nowPage > 1}">
                        <a href="/AdminController?type=userlist&cPage=${paging.nowPage - 1}&searchType=${searchType}&searchKeyword=${searchKeyword}" class="prev">이전</a>
                    </c:if>

                    <c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="pageNum">
                        <c:choose>
                            <c:when test="${pageNum == paging.nowPage}">
                                <a href="/AdminController?type=userlist&cPage=${pageNum}&searchType=${searchType}&searchKeyword=${searchKeyword}" class="current">${pageNum}</a>
                            </c:when>
                            <c:otherwise>
                                <a href="/AdminController?type=userlist&cPage=${pageNum}&searchType=${searchType}&searchKeyword=${searchKeyword}">${pageNum}</a>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>

                    <c:if test="${paging.nowPage < paging.totalPage}">
                        <a href="/AdminController?type=userlist&cPage=${paging.nowPage + 1}&searchType=${searchType}&searchKeyword=${searchKeyword}" class="next">다음</a>
                    </c:if>
                </nav>

                <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
                <script>
                    $(document).ready(function () {
                        $(".edit-btn").click(function () {
                            var userIdx = $(this).data("id");
                            console.log("userIdx = " + userIdx);

                            $.ajax({
                                url: "AdminController?type=getuser",
                                type: "GET",
                                data: { userIdx: userIdx },
                                dataType: "json",
                                headers: { "Accept": "application/json" },
                                success: function (response) {
                                    if (response.error) {
                                        alert("오류 발생: " + response.error);
                                        return;
                                    }
                                    $("#userIdx").val(response.userIdx);
                                    $("#userName").val(response.userName);
                                    $("#userEmail").val(response.userEmail);
                                    $("#userPhone").val(response.userPhone);
                                    $("#userPoint").val(response.userPoint);
                                    $("#userGrade").val(response.userGrade);
                                    $("#editUserModal").modal("show");
                                },
                                error: function (xhr, status, error) {
                                    console.error("AJAX 오류:", xhr.responseText);
                                    alert("서버와의 통신 중 문제가 발생했습니다.");
                                }
                            });
                        });


                        $("#updateUserForm").submit(function (event) {
                            event.preventDefault(); // 폼 기본 제출 방지

                            $.ajax({
                                url: "AdminController?type=updateuser",
                                type: "POST",
                                data: $("#updateUserForm").serialize(), // 폼 데이터 직렬화
                                dataType: "json",
                                headers: {
                                    "Accept": "application/json"
                                },
                                success: function (response) {
                                    if (response.error) {
                                        console.error("업데이트 실패:", response.error);
                                        alert("사용자 정보 업데이트 중 오류 발생: " + response.error);
                                        return;
                                    }

                                    alert("사용자 정보가 성공적으로 업데이트되었습니다.");
                                    $("#editUserModal").modal("hide");
                                    location.reload(); // 페이지 새로고침
                                },
                                error: function (xhr, status, error) {
                                    console.error("AJAX 오류 발생!");
                                    console.error("응답 상태:", xhr.status);
                                    console.error("응답 메시지:", xhr.responseText);
                                    alert("업데이트에 실패했습니다. 콘솔을 확인하세요.");
                                }
                            });
                        });
                    });

                </script>

                <!-- 수정 모달 -->
                <div id="editUserModal" class="modal fade" tabindex="-1" role="dialog">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title">사용자 정보 수정</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <form id="updateUserForm">
                                    <input type="hidden" id="userIdx" name="userIdx">
                                    <div class="form-group">
                                        <label>이름</label>
                                        <input type="text" class="form-control" id="userName" name="userName">
                                    </div>
                                    <div class="form-group">
                                        <label>이메일</label>
                                        <input type="email" class="form-control" id="userEmail" name="userEmail">
                                    </div>
                                    <div class="form-group">
                                        <label>전화번호</label>
                                        <input type="text" class="form-control" id="userPhone" name="userPhone">
                                    </div>
                                    <div class="form-group">
                                        <label>포인트</label>
                                        <input type="number" class="form-control" id="userPoint" name="userPoint">
                                    </div>
                                    <div class="form-group">
                                        <label>등급</label>
                                        <input type="text" class="form-control" id="userGrade" name="userGrade">
                                    </div>
                                    <button type="submit" class="btn btn-primary">저장</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>