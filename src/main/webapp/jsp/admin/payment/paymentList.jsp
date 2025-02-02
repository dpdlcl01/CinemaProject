<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!Doctype html>
<html lang="ko">
<head>
</head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/common.css">

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
      <jsp:include page="../common/adminSideBar.jsp"></jsp:include>
      <%--  메인  --%>

      <div id="main">
        <h1>결제 내역 조회</h1>
        <div id="title">
            <div id="announcement" class="noticeboard">
                <div class="search-bar-container">
                    <div class="total-count">전체 ${fn:length(requestScope.ar)}건</div>
                    <!-- 검색어 입력 섹션 -->
                    <div class="search-bar">
                    <%--    <select>
                            <option>지역 선택</option>
                            <option>서울</option>
                            <option>경기</option>
                            <option>인천</option>
                            <option>부산</option>
                        </select>
                        <select>
                            <option>극장 선택</option>
                            <option>코엑스</option>
                            <option>미사강변</option>
                            <option>안성스타필드</option>
                        </select>--%>
                        <div class="search-bar2">
                            <input type="text" placeholder="회원 id를 입력하세요" title="사용자 검색" class="input-text">
                            <button class="btn" id="searchBtn">
                                <i class="ico-search"></i>
                                검색
                            </button>
                        </div>
                    </div>
                </div>

                <!-- 영화 정보 테이블 -->
                <table>
                    <thead>
                    <tr>
                        <th>유저idx</th>
                        <th>예매정보</th>
                        <th>상품정보</th>
                        <th>수량</th>
                        <th>결제방식</th>
                        <th>결제금액</th>
                        <th>할인금액</th>
                        <th>최종금액</th>
                        <th>결제번호</th>
                        <th>결제날짜</th>
                        <th>결제상태</th>
                    </tr>
                    </thead>
                    <tbody>

                    <c:forEach items="${requestScope.ar}" var="ar">


                        <tr>
                            <td>${ar.userIdx}</td>
                            <td>${ar.reservationIdx}</td>
                            <td>${ar.productName}</td>
                            <td>${ar.paymentQuantiy}</td>
                            <td>${ar.paymentMethod}</td>
                            <td>${ar.paymentTotal}</td>
                            <td>${ar.paymentDiscount}</td>
                            <td>${ar.paymentFinal}</td>
                            <td>${ar.paymentTransactionId}</td>
                            <td>${ar.paymentDate}</td>
                            <td>${ar.paymentStatus}</td>

                        </tr>
                    </c:forEach>
                    <c:if test="${empty requestScope.ar}">
                        <tr>
                            <td colspan="11">현재 등록된 데이터가 없습니다.</td>
                        </tr>
                    </c:if>



                    </tbody>
                </table>

                <!--------------------- 페이지네이션 -------------------->
                <nav class="pagination">
                    <c:if test="${cPage > 1}">
                        <a href="AdminController?type=paymentList&cPage=1" class="control first">&laquo; 처음</a>
                        <a href="AdminController?type=paymentList&cPage=${cPage - 1}" class="control prev">&lt; 이전</a>
                    </c:if>

                    <c:forEach begin="1" end="${totalPage}" var="pageNum">
                        <c:choose>
                            <c:when test="${pageNum == cPage}">
                                <strong class="active">${pageNum}</strong>
                            </c:when>
                            <c:otherwise>
                                <a href="AdminController?type=paymentList&cPage=${pageNum}">${pageNum}</a>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>

                    <c:if test="${cPage < totalPage}">
                        <a href="AdminController?type=paymentList&cPage=${cPage + 1}" class="control next">&gt; 다음</a>
                        <a href="AdminController?type=paymentList&cPage=${totalPage}" class="control last">&raquo; 마지막</a>
                    </c:if>
                </nav>

                <!--------------------- 페이지네이션 -------------------->

            </div>
        </div>
      </div>
    </div>
  </div>
</div>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script>
    $(document).ready(function() {
        let currentPage = 1; // 현재 페이지 (초기값 1)

        function undefinedToWhitespace(value) {
            return (value !== undefined && value !== null && value !== "") ? value : '&nbsp;';
        }



        $("#searchBtn").on("click", function() {
            let userId = $(".input-text").val().trim();  // 입력된 회원 ID 가져오기

            if (userId === "") {
                alert("회원 ID를 입력하세요.");
                return;
            }

            $.ajax({
                type: "GET",
                url: "${pageContext.request.contextPath}/AdminController?type=paymentIdSearch",
                data: { userId: userId },  // 요청 데이터
                dataType: "json",  // JSON 형식으로 응답 받기
                success: function(response) {
                    console.log("응답 데이터:", response);

                    let tbody = $("table tbody");
                    tbody.empty();  // 기존 테이블 데이터 삭제

                    if (response.length === 0) {
                        tbody.append('<tr><td colspan="11">해당 회원의 결제 내역이 없습니다.</td></tr>');
                    } else {
                        response.forEach(function(ar) {
                            let row =  '<tr>' +
                                '<td>' + undefinedToWhitespace(ar.userIdx) + '</td>' +
                                '<td>' + undefinedToWhitespace(ar.reservationIdx) + '</td>' +
                                '<td>' + undefinedToWhitespace(ar.productName) + '</td>' +
                                '<td>' + undefinedToWhitespace(ar.paymentQuantiy) + '</td>' +
                                '<td>' + undefinedToWhitespace(ar.paymentMethod) + '</td>' +
                                '<td>' + undefinedToWhitespace(ar.paymentTotal) + '</td>' +
                                '<td>' + undefinedToWhitespace(ar.paymentDiscount) + '</td>' +
                                '<td>' + undefinedToWhitespace(ar.paymentFinal) + '</td>' +
                                '<td>' + undefinedToWhitespace(ar.paymentTransactionId) + '</td>' +
                                '<td>' + undefinedToWhitespace(ar.paymentDate) + '</td>' +
                                '<td>' + undefinedToWhitespace(ar.paymentStatus) + '</td>' +
                                '</tr>';
                            tbody.append(row);
                        });
                    }
                },
                error: function(xhr, status, error) {
                    console.error("오류 발생:", error);
                    alert("검색 중 오류가 발생했습니다. 다시 시도해주세요.");
                }
            });
        });
    });


</script>
</body>
</html>