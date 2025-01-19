<%@ page import="mybatis.vo.CouponVO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!Doctype html>
<html lang="ko">
<head>
    <jsp:include page="../common/head.jsp"/>
</head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/coupon.css?v=1.0"/>
<body>
<jsp:include page="../common/header.jsp"/>
<div id = "contents">
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
        <div class="myPoint-container">
            <%-- 사이드바 --%>
            <div class="sidebar">
                <ul>
                    <div class="sidebar-title"><a href="myInfoMain.jsp" title="나의 메가박스"><strong>나의 메가박스</strong></a></div>
                    <li><a href="myReservation.jsp" title="예매/구매내역">예매/구매내역</a></li>
                    <li><a href="myAdmissionTicket.jsp" title="영화/스토어 관람권">영화/스토어 관람권</a></li>
                    <li><a href="${pageContext.request.contextPath}/UserController?type=myCoupon" title="메가박스/제휴쿠폰">메가박스/제휴쿠폰</a></li>
                    <li><a href="${pageContext.request.contextPath}/UserController?type=myPoint" title="멤버십 포인트">멤버십 포인트</a></li>
                    <li><a href="#" title="나의 무비스토리">나의 무비스토리</a></li>
                    <li><a href="editMyInfo.jsp" title="회원정보">회원정보</a></li>
                </ul>
            </div>
            <!-- 메인 -->
            <div class="main-content">
                <!-- Section Header -->
                <div class="section">
                    <h1>메가박스/제휴쿠폰</h1>

                    <!-- Information -->
                    <p>• 보유하신 쿠폰 내역입니다.<br>• 각 쿠폰 별 사용 방법이 다르니 사용 전 상세 쿠폰정보를 확인바랍니다.</p>

                    <!-- Filters -->
                    <div class="filters">
                        <label><input type="radio" name="filter" class="use-coupon" value="사용가능"> 사용가능</label>
                        <label><input type="radio" name="filter" class="used-coupon" value="사용완료"> 사용완료</label>
                        <label><input type="radio" name="filter" class="expiration-coupon" value="기간만료"> 기간만료</label>
                        <select>
                            <option>전체</option>
                            <option>매점</option>
                            <option>포인트</option>
                            <option>기타</option>
                        </select>

                        <button>조회</button>
                    </div>

                    <!-- Coupon Table -->
                    <table>
                        <thead>
                        <tr>
                            <th>구분</th>
                            <th>쿠폰명</th>
                            <th>유효기간</th>
                            <th>사용상태</th>
                            <th></th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>매점</td>
                            <td>[생일쿠폰] 오리지널 팝콘 L 무료<br>9218-4969-2233-4408</td>
                            <td>2025.01.05 ~ 2025.01.23</td>
                            <td>사용가능</td>
                            <td><button>쿠폰정보</button></td>
                        </tr>
                        </tbody>
                        <%
                            CouponVO[] couponList = (CouponVO[]) request.getAttribute("couponList");
                            if (couponList != null && couponList.length > 0) {
                                for (CouponVO coupon : couponList) {
                        %>
                        <tr>
                            <td><%= coupon.getCouponType().equals("1") ? "할인" : "추가 제공" %></td>
                            <td><%= coupon.getCouponName() %><br><%= coupon.getCouponInfo() %></td>
                            <td><%= coupon.getCouponRegDate() %> ~ <%= coupon.getCouponExpDate() %></td>
                            <td><%= coupon.getCouponUserStatus().equals("0") ? "사용가능" : "사용완료" %></td>
                            <td><button>쿠폰정보</button></td>
                        </tr>
                        <%
                            }
                        } else {
                        %>
                        <tr>
                            <td colspan="5">보유한 쿠폰이 없습니다.</td>
                        </tr>
                        <%
                            }
                        %>
                    </table>

                    <!-- Pagination -->
                    <div style="text-align:center; margin-top:20px;">
                        [1]
                    </div>

                </div>

            </div>
        </div>
    </div>
</div>
<jsp:include page="../common/footer.jsp"/>
</body>
</html>
