<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!Doctype html>
<html lang="ko">
<head>
    <%--  <jsp:include page="../../user/common/head.jsp"/>--%>

</head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/common.css">
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<style>
    .admin-contents {
        width: 100%;
        min-height: 550px;
    }

    .page-util .inner-wrap {
        max-width: 100%;
    !important;
        padding: 20px 20px;
    !important;
    }

    #top1 img {
        width: 90px;
        height: 90px;
    }

    #imgName p {
        font-size: 40px;
        line-height: 10px;
        padding-left: 30px;
        margin: 30px 0;

    }

    #point span, #point em {
        padding-top: 10px;
        padding-left: 10px;
    }

    #point em {
        color: deepskyblue;
        font-weight: 600;
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

    .top2 > a {
        display: block;
        text-align: center;
        color: #503396;
        font-weight: 600;
        padding-bottom: 10px;
        text-decoration: none;
    }

    .top2 > div {
        display: flex;
        margin-left: 10px;
    }

    .top2 span {
        width: 120px;
    }

    .top2 em {
        text-align: right;
        display: block;
        font-weight: 600;
    }

    #myReserv > img {
        width: 70px;
        height: 100px;
    }

    #reservInfo p {
        margin: 0 30px;
        width: 640px;
    }

    #reservInfo em {
        color: #01738b;
    }

    #myReserv button {
        background-color: white;
        width: 74px;
        height: 32px;
    }

    #h2 h2 {
        width: 760px;
    }

    #h2 button {
        height: 32px;
        width: 74px;
        border: none;
        background-color: white;
    }

    .top2 span {
        font-size: 14px;
    }

    .myPage-container {
        display: flex;

    }

    #main {
        width: 100%;
        margin: 27px 40px 40px 40px;
    }

    #main h1 {
        font-size: 30px;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        table-layout: fixed; /* 테이블이 지정된 너비 내에서 고정됨 */
        margin-top: 20px;
    }

    table th {
        border: 1px solid #ccc;
        background-color: #dddddd;
        color: #1e1e1e;
        font-weight: bold;
        padding: 12px;
    }

    table tbody tr:nth-child(even) {
        background-color: #f9f9f9;
    }

    /* 테이블 호버 효과 */
    table tbody tr:hover {
        background-color: #f1f1f1;
        transition: background-color 0.3s ease; /* 부드러운 전환 효과 */
    }

    /* 테이블 셀 스타일 */
    table td {
        padding: 12px;
        border: 1px solid #ddd; /* 테두리 색상 */
    }

    /* 입력 필드와 셀렉트 박스 스타일 */
    #title td input, #title td select {
        border: 1px solid #ddd;
        border-radius: 5px;
        padding: 8px;
        width: 100%;
        text-align: center;
        transition: border-color 0.3s ease;
    }

    th, td {
        font-size: 13px;
        padding: 8px;
        text-align: center;
    }

    td {
        border-top: 1px solid #ddd;
        border-bottom: 1px solid #ddd;
    }

    td a:hover {
        color: #666;
    }

    th {
        background-color: #f4f4f4;
        font-weight: bold;
    }

    #addDialog label {
        width: 90px;
    }

    .addBtnDiv {
        text-align: right;
        margin-right: 50px;
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
                <h1>쿠폰 관리</h1>


                <div class="addBtnDiv">
                    <button type="button" id="issueBtn">
                        쿠폰 발급
                    </button>
                    <button type="button" id="addBtn">
                        쿠폰 추가
                    </button>
                </div>


                <div id="title">
                    <table border="1" width="100%" style="border-collapse: collapse; text-align: center;">
                        <colgroup>
                            <col width="150px">
                            <col width="180px">
                            <col width="50px">
                            <col width="60px">
                            <col width="150px">
                            <col width="150px">
                            <col width="50px">
                            <col width="50px">
                        </colgroup>
                        <thead>
                        <tr style="background-color: #f2f2f2;">
                            <th>쿠폰명</th>
                            <th>쿠폰정보</th>
                            <th>쿠폰타입</th>
                            <th>할인가격</th>
                            <th>쿠폰 시작일</th>
                            <th>쿠폰 만료일</th>
                            <th>쿠폰 상태</th>
                            <th>쿠폰 상태</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="cvo" items="${requestScope.cvo}">
                            <tr>
                                <td>${cvo.couponName}</td>
                                <td>${cvo.couponInfo}</td>
                                <td><c:if test="${cvo.couponType eq '1'}">
                                    스토어
                                </c:if>
                                    <c:if test="${cvo.couponType eq '2'}">
                                        예매
                                    </c:if></td>
                                <td>${empty cvo.couponValue or cvo.couponValue eq '0' ? '교환권' : cvo.couponValue}</td>
                                <td>${cvo.couponRegDate}</td>
                                <td>${cvo.couponExpDate}</td>
                                <td><c:if test="${cvo.couponStatus eq '0'}">
                                    활성
                                </c:if> <c:if test="${cvo.couponStatus eq '1'}">
                                    비활성
                                </c:if></td>
                                <td>
                                    <button class="deletBtn" data-id="${cvo.couponIdx}">
                                        삭제
                                    </button>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<div id="addDialog">
    <h4>쿠폰 추가</h4>
    <form id="addCoupon">
        <label for="couponName">쿠폰명</label>
        <input type="text" id="couponName" name="couponName">
        <br>
        <label for="couponName">쿠폰정보</label>
        <input type="text" id="couponInfo" name="couponInfo">
        <br>
        <label for="couponName">쿠폰타입</label>
        <input type="text" id="couponType" name="couponType">
        <br>
        <label for="couponName">할인가격</label>
        <input type="text" id="couponValue" name="couponValue">
        <br>
        <label for="couponRegDate">쿠폰 시작일</label>
        <input type="text" id="couponRegDate" name="couponRegDate" readonly placeholder="날짜 선택">
        <label for="couponExpDate">쿠폰 만료일</label>
        <input type="text" id="couponExpDate" name="couponExpDate" readonly placeholder="날짜 선택">
    </form>
</div>
<div id="issueCoupon">
  <label>유저등급</label>
  <select id="selectGrade">
    <option value="BASIC">BASIC</option>
    <option value="VIP">VIP</option>
    <option value="VVIP">VVIP</option>
  </select>
  <select id="selectCoupon">
    <c:forEach items="${requestScope.cvo}" var="cvo">
      <option value="${cvo.couponIdx}">${cvo.couponName}</option>
    </c:forEach>
  </select>
</div>


<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
    $(document).ready(function () {

      $("#issueCoupon").dialog({
        title: "쿠폰 발급",
        autoOpen: false, // 처음에는 열리지 않음
        modal: true, // 배경 클릭 방지
        width: 350,
        height: 250,
        buttons: {
          "확인": function () {
            issueCoupon(); // 쿠폰 발급 AJAX 요청 실행
          },
          "취소": function () {
            $(this).dialog("close"); // 다이얼로그 닫기
          }
        }
      });

      //"쿠폰 발급" 버튼 클릭 시 다이얼로그 열기
      $("#issueBtn").on("click", function () {
        $("#issueCoupon").dialog("open");
      });

      //  쿠폰 발급 AJAX 요청
      function issueCoupon() {
        let selectedGrade = $("#selectGrade").val(); // 선택한 유저 등급 가져오기
        let couponIdx = $("#selectCoupon").val(); // 선택한 유저 등급 가져오기

        $.ajax({
          url: "${pageContext.request.contextPath}/AdminController?type=issueCoupon",
          type: "POST",
          data: { userGrade: selectedGrade,couponIdx:couponIdx }, // 선택한 유저 등급을 서버로 전송
          dataType: "json",
          success: function (data) {
            if (data.success) {
              alert("쿠폰이 성공적으로 발급되었습니다.");
              $("#issueCoupon").dialog("close"); // 다이얼로그 닫기
            } else {
              alert("발급 실패: " + data.message);
            }
          },
          error: function (xhr, status, error) {
            console.error("Error:", error);
            alert("서버 오류가 발생했습니다.");
          }
        });
      }



        $("#addDialog").dialog({
            title: "쿠폰 추가",
            autoOpen: false, // 처음에는 열리지 않음
            modal: true, // 배경 클릭 방지
            width: 400,
            height: 400,
            buttons: {
                "추가": function () {
                    addCoupon(); // 추가 버튼 클릭 시 함수 실행
                },
                "취소": function () {
                    $(this).dialog("close"); // 다이얼로그 닫기
                }
            }
        });
        $.datepicker.setDefaults({
            closeText: "닫기",
            prevText: "이전",
            nextText: "다음",
            currentText: "오늘",
            monthNames: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
            monthNamesShort: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
            dayNames: ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"],
            dayNamesShort: ["일", "월", "화", "수", "목", "금", "토"],
            dayNamesMin: ["일", "월", "화", "수", "목", "금", "토"],
            weekHeader: "주",
            dateFormat: "yy-mm-dd",
            changeMonth: true, // 월 선택 활성화
            changeYear: true, // 연도 선택 활성화
            showMonthAfterYear: true,
        });

        $("#couponRegDate, #couponExpDate").datepicker();


        // "쿠폰 추가" 버튼 클릭 시 다이얼로그 열기
        $("#addBtn").on("click", function () {
            $("#addDialog").dialog("open");
        });

        // 쿠폰 추가 AJAX 요청
        function addCoupon() {

            let regDate = $("#couponRegDate").val() + " 00:00:00"; // 시작일: 00:00:00
            let expDate = $("#couponExpDate").val() + " 23:59:59"; // 만료일: 23:59:59

            let couponData = {
                couponName: $("#couponName").val(),
                couponInfo: $("#couponInfo").val(),
                couponType: $("#couponType").val(),
                couponValue: $("#couponValue").val(),
                couponRegDate: regDate,
                couponExpDate: expDate
            };

            $.ajax({
                url: "${pageContext.request.contextPath}/AdminController?type=couponAdd",
                type: "POST",
                data: couponData,
                dataType: "json",
                success: function (data) {
                    if (data.success) {
                        alert("쿠폰이 추가되었습니다.");
                        $("#addDialog").dialog("close"); // 다이얼로그 닫기
                        location.reload(); // 새로고침하여 변경사항 반영
                    } else {
                        alert("추가 실패: " + data.message);
                    }
                },
                error: function (xhr, status, error) {
                    console.error("Error:", error);
                    alert("서버 오류가 발생했습니다.");
                }
            });
        }


        $(".deletBtn").on("click", function () {
            let couponIdx = $(this).data("id"); // 삭제할 쿠폰 ID 가져오기

            if (!confirm("정말 삭제하시겠습니까?")) {
                return; // 사용자가 취소하면 요청을 보내지 않음
            }
            // AJAX 요청 (POST 방식)
            $.ajax({
                url: "${pageContext.request.contextPath}/AdminController?type=couponDel",
                type: "POST",
                data: {couponIdx: couponIdx}, // JSON이 아닌 일반 form 형식으로 전송
                dataType: "json", // JSON 응답을 기대
                success: function (data) {
                    if (data.success) {
                        alert("쿠폰이 삭제되었습니다.");
                        $("button[data-id='" + couponIdx + "']").closest("tr").remove(); // 해당 행을 즉시 삭제
                    } else {
                        alert("삭제 실패: " + data.message);
                    }
                },
                error: function (xhr, status, error) {
                    console.error("Error:", error);
                    alert("서버 오류가 발생했습니다.");
                }
            });
        });
    });


</script>
</body>
</html>