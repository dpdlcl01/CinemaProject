<%@ page import="mybatis.vo.CouponVO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!Doctype html>
<html lang="ko">
<head>
    <jsp:include page="../common/head.jsp"/>
</head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/coupon.css?v=3.0"/>
<body>
<jsp:include page="../common/header.jsp"/>
<div class="page-util">
    <div class="inner-wrap">
        <div class="location">
            <span>Home</span>
            <img src="https://img.megabox.co.kr/static/pc/images/common/bg/bg-location-arr.png"/>
            <label>마이페이지</label>
            <img src="https://img.megabox.co.kr/static/pc/images/common/bg/bg-location-arr.png"/>
            <label>쿠폰</label>
        </div>
    </div>
</div>
<div class="contents">
    <div class="total-main">
        <div class="myPoint-container">
            <%--  사이드바  --%>
            <div class="mypage-side">
                <jsp:include page="../common/sideBar.jsp"/>
            </div>
            <!-- 메인 -->
            <div class="main-content">
                <!-- Section Header -->
                <h1>제휴쿠폰</h1>
                <div class="section">
                    <!-- Information -->
                    <p>• 보유하신 쿠폰 내역입니다.<br>• 각 쿠폰 별 사용 방법이 다르니 사용 전 상세 쿠폰정보를 확인바랍니다.</p>

                    <!-- Filters -->
                    <div class="filters">
                        <div>
                            <label><input type="radio" name="filter" class="use-coupon" value="사용가능"> 사용가능</label>
                            <label><input type="radio" name="filter" class="used-coupon" value="사용완료"> 사용완료</label>
                            <label><input type="radio" name="filter" class="expiration-coupon" value="기간만료"> 기간만료</label>
                        </div>
                        <div>
                            <select class="select-coupon">
                                <option>전체</option>
                                <option>매점</option>
                                <option>포인트</option>
                                <option>기타</option>
                            </select>
                            <button>조회</button>
                        </div>
                    </div>

                    <!-- Coupon Table -->
                    <table id="couponTable">
                        <thead>
                        <tr>
                            <th class="coupon-type">구분</th>
                            <th class="coupon-name">쿠폰명</th>
                            <th class="coupon-exp">유효기간</th>
                            <th class="coupon-used">사용상태</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:if test="${not empty couponList}">
                            <c:forEach var="coupon" items="${couponList}">
                                <tr>
                                    <td class="type">${couponItem.code}
                                        <c:choose>
                                            <c:when test="${coupon.couponType eq '1'}">할인</c:when>
                                            <c:otherwise>추가 제공</c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td>
                                            ${coupon.couponName}
                                            <div class="info">${coupon.couponInfo}</div>
                                    </td>
                                    <td class="date">${coupon.couponRegDate} <br> ~ ${coupon.couponExpDate}</td>
                                    <td class="used">
                                        <c:choose>
                                            <c:when test="${coupon.couponUserStatus eq '0'}">사용가능</c:when>
                                            <c:otherwise>사용완료</c:otherwise>
                                        </c:choose>
                                    </td>
                                </tr>
                            </c:forEach>
                        </c:if>
                        <c:if test="${empty couponList}">
                            <tr>
                                <td colspan="5">보유한 쿠폰이 없습니다.</td>
                            </tr>
                        </c:if>
                        </tbody>
                    </table>

                    <!-- Pagination -->
                    <nav class="pagination">
                        <c:if test="${requestScope.page ne null}">
                            <c:set var="pvo" value="${requestScope.page}" />

                            <!-- << (맨 처음으로) -->
                            <c:if test="${pvo.nowPage > 1}">
                                <a href="UserController?type=myCoupon&cPage=1" class="control first" title="처음 페이지"></a>
                            </c:if>

                            <!-- < (이전 페이지) -->
                            <c:if test="${pvo.nowPage > 1}">
                                <a href="UserController?type=myCoupon&cPage=${pvo.nowPage - 1}" class="control prev" title="이전 페이지"></a>
                            </c:if>

                            <!-- 페이지 번호 -->
                            <c:forEach begin="${pvo.startPage}" end="${pvo.endPage}" varStatus="st">
                                <c:if test="${st.index eq pvo.nowPage}">
                                    <strong class="active">${st.index}</strong>
                                </c:if>
                                <c:if test="${st.index ne pvo.nowPage}">
                                    <a href="UserController?type=myCoupon&cPage=${st.index}" title="${st.index}페이지 보기">${st.index}</a>
                                </c:if>
                            </c:forEach>

                            <!-- > (다음 페이지) -->
                            <c:if test="${pvo.nowPage < pvo.totalPage}">
                                <a href="UserController?type=myCoupon&cPage=${pvo.nowPage + 1}" class="control next" title="다음 페이지"></a>
                            </c:if>

                            <!-- >> (맨 마지막으로) -->
                            <c:if test="${pvo.nowPage < pvo.totalPage}">
                                <a href="UserController?type=myCoupon&cPage=${pvo.totalPage}" class="control last" title="마지막 페이지"></a>
                            </c:if>
                        </c:if>
                    </nav>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="../common/footer.jsp"/>
<script>
    document.addEventListener("DOMContentLoaded", function () {
        const filterRadios = document.querySelectorAll("input[name='filter']");
        const couponTableBody = document.querySelector("#couponTable tbody");

        filterRadios.forEach(function (radio) {
            radio.addEventListener("change", async function () {
                const selectedFilter = this.value;
                console.log("선택한 필터:", selectedFilter);

                try {
                    const url = "UserController?type=couponFilter&filter=" + encodeURIComponent(selectedFilter);
                    const response = await fetch(url, {
                        headers: { "X-Requested-With": "XMLHttpRequest" }
                    });

                    if (!response.ok) {
                        throw new Error("HTTP error! status: " + response.status);
                    }

                    const couponList = await response.json();
                    updateCouponTable(couponList);
                } catch (err) {
                    console.error("AJAX 요청 오류:", err);
                }
            });
        });

        function updateCouponTable(couponList) {
            var tableBody = document.querySelector("#couponTable tbody");

            if (!tableBody) {
                console.error("❌ tableBody 요소를 찾을 수 없습니다. #couponTable tbody가 존재하는지 확인하세요.");
                return;
            }

            tableBody.innerHTML = ""; // 기존 내용 제거 후 새로운 데이터 추가

            if (!couponList || couponList.length === 0) {
                var emptyRow = document.createElement("tr");
                var emptyCell = document.createElement("td");
                emptyCell.colSpan = "4";
                emptyCell.className = "empty-row";
                emptyCell.textContent = "보유한 쿠폰이 없습니다.";
                emptyRow.appendChild(emptyCell);
                tableBody.appendChild(emptyRow);
                return;
            }

            couponList.forEach(function(coupon) {
                var row = document.createElement("tr");
                row.className = "coupon-row";

                var typeCell = document.createElement("td");
                typeCell.className = "coupon-type type";
                typeCell.textContent = coupon.couponType === '1' ? '할인' : '추가 제공';

                var nameCell = document.createElement("td");
                nameCell.className = "coupon-name";
                var nameDiv = document.createElement("div");
                nameDiv.className = "info";
                nameDiv.textContent = coupon.couponInfo;
                nameCell.innerHTML = coupon.couponName;
                nameCell.appendChild(nameDiv);

                var expCell = document.createElement("td");
                expCell.className = "coupon-exp date";
                expCell.innerHTML = coupon.couponRegDate + "<br> ~ " + coupon.couponExpDate;

                var statusCell = document.createElement("td");
                statusCell.className = "coupon-used used";
                statusCell.textContent = coupon.couponUserStatus === '0' ? '사용가능' : '사용완료';

                row.appendChild(typeCell);
                row.appendChild(nameCell);
                row.appendChild(expCell);
                row.appendChild(statusCell);

                tableBody.appendChild(row);
            });
        }
    });
</script>
</body>
</html>
