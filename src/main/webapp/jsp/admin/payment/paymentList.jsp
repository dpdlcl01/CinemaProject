<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!Doctype html>
<html lang="ko">
<head>
</head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/common.css">
<link rel="stylesheet" href="https://code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">

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

    /* 검색 폼 요소를 가로로 나란히 배치 */
    #searchForm {
        display: flex;
        align-items: center;
        flex-wrap: wrap;
        gap: 10px;
    }

    /* 검색 대상 및 필터 요소 스타일 */
    #searchForm select,
    #searchForm input[type="month"] {
        padding: 6px 10px;
        font-size: 14px;
        border: 1px solid #ccc;
        border-radius: 4px;
        flex-shrink: 0;
        width: auto;
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

    /* 검색 바 컨테이너 */
    .search-bar {
        display: flex;
        align-items: center;
        flex-wrap: nowrap;
        gap: 10px;
    }

    .search-bar select {
        padding: 6px;
        font-size: 14px;
    }

    .search-bar2 {
        flex: 1;               /* 부모 컨테이너의 남은 공간을 차지 */
        max-width: 400px;      /* 최대 너비 */
        min-width: 200px;      /* 최소 너비 */
        height: 30px;
        position: relative;
        border-bottom: 1px solid #423e3e;
    }

    .search-bar2 .input-text {
        width: 100%;           /* 부모의 너비에 맞게 확장 */
        background-color: transparent;
        border: 0;
        color: #000;
        line-height: 25px;
        font-size: 16px;
        outline: none;
        padding: 0 35px 0 5px; /* 버튼과 충돌 방지 */
        box-sizing: border-box;
    }

    .search-bar2 .input-text:active {
        border: 0;
        outline: none;
    }

    .search-bar2 .btn {
        width: 30px;
        height: 100%;
        position: absolute;
        right: 0;
        top: 0;
        font-size: 0;
        border: 0;
        background-color: transparent;
        cursor: pointer;
    }

    /*    .search-bar2 .btn:hover {
            background-color: #0056b3;
        }*/

    .search-bar2 .btn .ico-search {
        display: inline-block;
        width: 18px;
        height: 18px;
        background-image: url(https://img.megabox.co.kr/static/pc/images/common/ico/ico-search-white.png);
        vertical-align: middle;
    }

    /* 초기화 아이콘 스타일 */
    .search-bar2 .btn-reset {
        position: absolute;
        right: 30px; /* 검색 버튼 옆에 위치 */
        top: 0;
        width: 30px;
        height: 100%;
        border: 0;
        background-color: transparent;
        cursor: pointer;
    }

    .ico-reset {
        display: inline-block;
        width: 18px;
        height: 18px;
        background-image: url("${pageContext.request.contextPath}/css/user/images/reload.png");
        background-size: contain;
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

    /* 클릭 가능한 행 스타일 */
    .clickable-row {
        cursor: pointer;
        transition: background-color 0.2s ease;
    }

    /* 마우스를 가져갔을 때 배경색 변경 */
    .clickable-row:hover {
        background-color: #f0f0f0;
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
        margin: 0 2px;
        padding: 0 8px;
        border: 1px solid #ebebeb;
        text-decoration: none;
        line-height: 30px;
        color: #333;
        font-weight: 400;
        vertical-align: middle;
        border-radius: 4px;
    }

    .pagination .control.first {
        background-position: 0 0;
    }

    .pagination .control.prev {
        background-position: -32px 0;
    }

    .pagination .control.next {
        background-position: -64px 0;
    }

    .pagination .control.last {
        background-position: -96px 0;
    }

    .pagination .control {
        overflow: hidden;
        width: 32px;
        height: 32px;
        background: url('${pageContext.request.contextPath}/css/user/images/btn-paging.png') no-repeat 0 0;
    }

    .modal-body {
        padding: 20px;
        display: flex;
        flex-direction: column;
        gap: 20px;
    }

    /* 테이블 스타일 */
    .info-table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 0;
        margin-bottom: 5px;
        background-color: #fff;
    }

    .info-table caption {
        font-weight: bold;
        font-size: 18px;
        text-align: left;
        padding: 10px 0;
        color: #333;
        margin-bottom: 10px;
        caption-side: top; /* 제목이 테이블 위에 위치하도록 설정 */
    }

    .info-table th,
    .info-table td {
        border: 1px solid #ddd;
        padding: 12px;
        text-align: left;
        vertical-align: middle;
    }

    .info-table th {
        background-color: #f4f4f4;
        font-weight: bold;
        color: #555;
        width: 30%;
    }

    .info-table td {
        background-color: #fff;
        color: #333;
        font-weight: normal;
    }

    /* 강조 텍스트 스타일 */
    #transactionId {
        color: #01738b;
    }

    /* 최종 결제 및 취소 금액 색상 */
    #paymentFinal {
        color: #01738b;
    }

    #cancelAmount {
        color: #dc3545; /* 빨간색 */
    }

    /* 섹션 간격 */
    .section-title {
        font-size: 16px;
        font-weight: bold;
        margin: 10px 0;
        color: #333;
    }



    /* 테이블 행 클릭 스타일 */
    .clickable-payment-row {
        cursor: pointer;
        transition: background-color 0.2s ease;
    }

    .clickable-payment-row:hover {
        background-color: #f0f0f0;
    }
</style>


<body>
<%--  헤더  --%>
<jsp:include page="../common/header.jsp"></jsp:include>
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
                    <div class="total-count">전체 ${requestScope.totalCount}건</div>
                    <!-- 검색어 입력 섹션 -->
                    <div class="search-bar">
                        <form id="searchForm" action="AdminController" method="get">
                            <input type="hidden" name="type" value="paymentList" />

                            <!-- 결제일 월별 검색 -->
                            <label for="paymentMonth">결제일:</label>
                            <input type="month" id="paymentMonth" name="paymentMonth" style="padding: 5px;"
                                   value="${param.paymentMonth}" />

                            <!-- 결제 상태 선택 -->
                            <select id="paymentStatus" name="paymentStatus">
                                <option value="">결제 상태 (전체)</option>
                                <option value="0" ${param.paymentStatus == '0' ? 'selected' : ''}>결제 완료</option>
                                <option value="1" ${param.paymentStatus == '1' ? 'selected' : ''}>결제 취소</option>
                            </select>

                            <!-- 결제 종류 선택 -->
                            <select id="paymentType" name="paymentType">
                                <option value="">결제 종류 (전체)</option>
                                <option value="1" ${param.paymentType == '1' ? 'selected' : ''}>영화 예매</option>
                                <option value="2" ${param.paymentType == '2' ? 'selected' : ''}>상품 구매</option>
                            </select>

                            <!-- 검색 대상 선택 -->
                            <select id="searchType" name="searchType">
                                <option value="all" ${param.searchType == 'all' ? 'selected' : ''}>검색 대상 (전체)</option>
                                <option value="user" ${param.searchType == 'user' ? 'selected' : ''}>사용자 ID</option>
                                <option value="transactionId" ${param.searchType == 'transactionId' ? 'selected' : ''}>거래 ID</option>
                                <option value="reservation" ${param.searchType == 'reservation' ? 'selected' : ''}>예매 ID</option>
                                <option value="product" ${param.searchType == 'product' ? 'selected' : ''}>상품 ID</option>
                            </select>

                            <!-- 검색어 입력 필드 -->
                            <div class="search-bar2">
                                <input type="text" name="searchValue" placeholder="검색어를 입력해주세요." class="input-text"
                                       value="${fn:escapeXml(param.searchValue)}" />
                                <button type="submit" class="btn" title="검색">
                                    <i class="ico-search"></i> 검색
                                </button>
                            </div>

                            <!-- 초기화 버튼 (아이콘) -->
                            <button type="button" class="btn btn-reset" title="검색 조건 초기화" onclick="resetSearch()">
                                <i class="ico-reset"></i>
                            </button>
                        </form>
                    </div>
                </div>
                <script>
                    document.addEventListener('DOMContentLoaded', function () {
                        // 초기화 버튼 클릭 시 폼 리셋 후 페이지 이동
                        function resetSearch() {
                            document.querySelector('#searchForm').reset();
                            location.href = 'AdminController?type=paymentList';  // 초기화 후 기본 페이지로 이동
                        }

                        document.querySelector('.btn-reset').addEventListener('click', resetSearch);
                    });
                </script>

                <!-- 결제 정보 테이블 -->
                <table>
                    <thead>
                    <tr>
                        <th>결제 ID</th>
                        <th>사용자 ID</th>
                        <th>결제 종류</th>
                        <th>결제 방식</th>
                        <th>최종 결제금액</th>
                        <th>결제 상태</th>
                        <th>결제일시</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${requestScope.paymentArray}" var="payment">
                        <tr class="clickable-row" data-payment-id="${payment.paymentIdx}">
                            <td>${payment.paymentIdx}</td>
                            <td>${payment.userId}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${payment.paymentType == 1}">영화 예매</c:when>
                                    <c:when test="${payment.paymentType == 2}">상품 구매</c:when>
                                </c:choose>
                            </td>
                            <td>${payment.paymentMethod}</td>
                            <td>
                                <fmt:formatNumber value="${payment.paymentFinal}" pattern="###,###" />원
                            </td>
                            <td>
                                <c:choose>
                                    <c:when test="${payment.paymentStatus == 0}">완료</c:when>
                                    <c:when test="${payment.paymentStatus == 1}">대기</c:when>
                                    <c:when test="${payment.paymentStatus == 2}">취소</c:when>
                                </c:choose>
                            </td>
                            <td>${payment.paymentDate}</td>
                        </tr>
                    </c:forEach>
                    <c:if test="${empty requestScope.paymentArray}">
                        <tr>
                            <td colspan="7">현재 등록된 데이터가 없습니다.</td>
                        </tr>
                    </c:if>
                    </tbody>
                </table>


                <!--------------------- 페이지네이션 --------------------->
                <nav class="pagination">
                    <c:if test="${requestScope.page ne null}">
                        <c:set var="pvo" value="${requestScope.page}" />

                        <!-- << (맨 처음으로) -->
                        <c:if test="${pvo.startPage > 1}">
                            <a href="AdminController?type=paymentList&cPage=1&searchType=${param.searchType}&searchValue=${param.searchValue}&paymentMonth=${param.paymentMonth}&paymentStatus=${param.paymentStatus}&paymentType=${param.paymentType}"
                               class="control first" title="처음 페이지"></a>
                        </c:if>

                        <!-- < (이전 페이지 블록) -->
                        <c:if test="${pvo.startPage > 1}">
                            <a href="AdminController?type=paymentList&cPage=${pvo.startPage - pvo.pagePerBlock}&searchType=${param.searchType}&searchValue=${param.searchValue}&paymentMonth=${param.paymentMonth}&paymentStatus=${param.paymentStatus}&paymentType=${param.paymentType}"
                               class="control prev" title="이전 블록"></a>
                        </c:if>

                        <!-- 페이지 번호 -->
                        <c:forEach begin="${pvo.startPage}" end="${pvo.endPage}" varStatus="st">
                            <c:if test="${st.index eq pvo.nowPage}">
                                <strong class="active">${st.index}</strong>
                            </c:if>
                            <c:if test="${st.index ne pvo.nowPage}">
                                <a href="AdminController?type=paymentList&cPage=${st.index}&searchType=${param.searchType}&searchValue=${param.searchValue}&paymentMonth=${param.paymentMonth}&paymentStatus=${param.paymentStatus}&paymentType=${param.paymentType}"
                                   title="${st.index}페이지 보기">${st.index}</a>
                            </c:if>
                        </c:forEach>

                        <!-- > (다음 페이지 블록) -->
                        <c:if test="${pvo.endPage < pvo.totalPage}">
                            <a href="AdminController?type=paymentList&cPage=${pvo.startPage + pvo.pagePerBlock}&searchType=${param.searchType}&searchValue=${param.searchValue}&paymentMonth=${param.paymentMonth}&paymentStatus=${param.paymentStatus}&paymentType=${param.paymentType}"
                               class="control next" title="다음 블록"></a>
                        </c:if>

                        <!-- >> (맨 마지막으로) -->
                        <c:if test="${pvo.endPage < pvo.totalPage}">
                            <a href="AdminController?type=paymentList&cPage=${pvo.totalPage}&searchType=${param.searchType}&searchValue=${param.searchValue}&paymentMonth=${param.paymentMonth}&paymentStatus=${param.paymentStatus}&paymentType=${param.paymentType}"
                               class="control last" title="마지막 페이지"></a>
                        </c:if>
                    </c:if>
                </nav>
                <!--------------------- 페이지네이션 --------------------->

                <div id="paymentModal" class="dialog-common" title="결제 내역 상세 정보" style="display: none;">
                    <div class="modal-body">

                        <!-- 구매 정보 섹션 -->
                        <table class="info-table">
                            <caption class="section-title">구매 정보</caption>
                            <tbody id="movieSection" style="display: none;">
                            <tr>
                                <th>영화 제목</th>
                                <td colspan="3" id="movieTitle"></td>
                            </tr>
                            <tr>
                                <th>극장 / 상영관</th>
                                <td id="theaterName"></td>
                                <td colspan="2" id="screenName"></td>
                            </tr>
                            <tr>
                                <th>상영일시</th>
                                <td colspan="3" id="showDateTime"></td>
                            </tr>
                            <tr>
                                <th>예매 수량 / 좌석 번호</th>
                                <td id="ticketQuantity"></td>
                                <td colspan="2" id="seatNumbers"></td>
                            </tr>
                            </tbody>

                            <tbody id="productSection" style="display: none;">
                            <tr>
                                <th>상품명</th>
                                <td id="productName"></td>
                            </tr>
                            <tr>
                                <th>구매 수량</th>
                                <td id="productQuantity"></td>
                            </tr>
                            </tbody>
                        </table>

                        <!-- 결제 정보 섹션 -->
                        <table class="info-table">
                            <caption class="section-title">결제 정보</caption>
                            <tbody>
                            <tr>
                                <th>결제 고유 ID</th>
                                <td id="transactionId"></td>
                            </tr>
                            <tr>
                                <th>결제 금액</th>
                                <td id="paymentTotal"></td>
                            </tr>
                            <tr>
                                <th>할인 금액</th>
                                <td id="paymentDiscount"></td>
                            </tr>
                            <tr>
                                <th>최종 결제 금액</th>
                                <td id="paymentFinal"></td>
                            </tr>
                            <tr>
                                <th>결제 방식</th>
                                <td id="paymentMethod"></td>
                            </tr>
                            <tr>
                                <th>결제일</th>
                                <td id="paymentDate"></td>
                            </tr>
                            </tbody>
                        </table>

                        <!-- 취소 정보 섹션 -->
                        <table class="info-table" id="cancelSection" style="display: none;">
                            <caption class="section-title">취소 정보</caption>
                            <tbody>
                            <tr>
                                <th>취소 금액</th>
                                <td id="cancelAmount"></td>
                            </tr>
                            <tr>
                                <th>취소일</th>
                                <td id="cancelDate"></td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>

            </div>
        </div>
      </div>
    </div>
  </div>
</div>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js"></script>
<!-- jQuery 모달 초기화 스크립트 -->
<script>
    $(document).ready(function() {
        function loadPaymentData(paymentIdx) {
            $.ajax({
                url: "AdminController?type=paymentDetail&paymentIdx=" + paymentIdx,
                method: "GET",
                dataType: "json",
                success: function(response) {
                    // 공통 정보 설정
                    $("#transactionId").text(response.paymentTransactionId);

                    // 결제 유형에 따라 정보 표시
                    if (response.paymentType == 1) {
                        $("#movieSection").show();
                        $("#productSection").hide();
                        $("#movieTitle").text(response.movieTitle || "정보 없음");
                        $("#theaterName").text(response.theaterName || "정보 없음");
                        $("#screenName").text(response.screenName || "정보 없음");
                        $("#showDateTime").text(response.showDateTime || "정보 없음");
                        $("#seatNumbers").text(response.seatNumbers || "정보 없음");
                        $("#ticketQuantity").text(response.paymentQuantity + "매");
                    } else {
                        $("#productSection").show();
                        $("#movieSection").hide();
                        $("#productName").text(response.productName || "정보 없음");
                        $("#productQuantity").text(response.paymentQuantity + "개");
                    }

                    // 결제 정보 설정
                    $("#paymentTotal").text(formatCurrency(response.paymentTotal, "원"));
                    $("#paymentDiscount").text(formatCurrency(response.paymentDiscount, "원", true));  // 할인은 음수 표시
                    $("#paymentFinal").text(formatCurrency(response.paymentFinal, "원"));
                    $("#paymentMethod").text(response.paymentMethod || "정보 없음");
                    $("#paymentDate").text(response.paymentDate || "정보 없음");

                    // 결제 상태에 따라 취소 정보 표시
                    if (response.paymentStatus == 1) {
                        $("#cancelSection").show();
                        $("#cancelAmount").text("- " + (response.paymentFinal ?? 0).toLocaleString() + " 원");
                        $("#cancelDate").text(response.paymentCancelDate || "정보 없음");
                    } else {
                        $("#cancelSection").hide();
                    }

                    // 모달 열기
                    $("#paymentModal").dialog("open");
                },
                error: function() {
                    alert("결제 정보를 불러오는 데 실패했습니다.");
                }
            });
        }

        // jQuery UI 모달 초기화
        $("#paymentModal").dialog({
            autoOpen: false,
            modal: true,
            width: 600,
            classes: {
                "ui-dialog": "dialog-common"
            },
            buttons: {
                "확인": function() {
                    $(this).dialog("close");
                }
            }
        });

        // 결제 목록 행 클릭 이벤트 설정
        $(".clickable-row").on("click", function() {
            const paymentIdx = $(this).data("payment-id");

            // 결제 데이터 로드 후 모달 열기
            loadPaymentData(paymentIdx);
        });


        // 가격 포맷 함수
        function formatCurrency(amount, unit, isDiscount = false) {
            const num = Number(amount);  // 숫자로 변환
            if (isNaN(num)) return "정보 없음";  // 변환 실패 시 처리

            // 할인 금액이 0보다 크면 '-' 추가, 아니면 그대로 표시
            const formattedAmount = isDiscount && num > 0 ? "- " + num.toLocaleString() : num.toLocaleString();

            return formattedAmount + " " + unit;
        }

    });

</script>
</body>
</html>