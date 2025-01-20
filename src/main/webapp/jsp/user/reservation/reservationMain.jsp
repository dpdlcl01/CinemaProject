<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <jsp:include page="../common/head.jsp"/>
    <title>빠른 예매</title>
</head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/reservation.css">
<body>
<jsp:include page="../common/header.jsp"/>
<div id="contents">
    <!-- 추가된 page-util -->
    <div class="page-util">
        <div class="inner-wrap">
            <div class="location">
                <span>Home</span>
                <a href="/booking" title="예매 페이지로 이동">예매</a>
                <a href="/booking" title="빠른예매 페이지로 이동">빠른예매</a>
            </div>
        </div>
    </div>
    <div id="content">
        <div class="res-main">
            <h1 class="res-title">빠른 예매</h1>
            <div class="res-container">
                <nav class="date-navigation">
                    <button>◀</button>
                    <ul>
                        <li>2025.01</li>
                        <li>21 · 화</li>
                        <li>22 · 수</li>
                        <li>23 · 목</li>
                        <li>24 · 금</li>
                        <li>25 · 토</li>
                        <li>26 · 일</li>
                    </ul>
                    <button>▶</button>
                </nav>
                <div class="content">
                    <div class="movie-selection">
                        <h2>영화</h2>
                        <ul class="movie-list">
                            <c:if test="${empty movies}">
                                <p>영화 데이터가 없습니다.</p>
                            </c:if>
                            <c:forEach var="movie" items="${movies}">
                                <li>
                                    <img src="${pageContext.request.contextPath}/css/user/images/ratings/${movie.movieRating}.png" class="rating-image" />
                                    ${movie.movieTitle}
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                    <div class="theater-selection">
                        <h2>극장</h2>
                        <ul id="region-list">
                            <c:forEach var="theater" items="${requestScope.theaters}">
                                <li>
                                    <!-- 큰 지역 클릭 시 Ajax 요청 -->
<%--                                    ${theater.key} (${theater.value})--%>
                                    <a href="#" class="region-link" data-region="${theater.key}">
                                            ${theater.key} (${theater.value})
                                    </a>
                                </li>
                            </c:forEach>
                        </ul>
                        <ul id="theater-region-list">
                            <p>지역을 선택해주세요.</p>
                        </ul>
                    </div>
                    <div class="time-selection">
                        <h2>시간</h2>
                        <p id="time-selection">영화와 극장을 선택하시면 상영 시간표를 비교하여 볼 수 있습니다.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="../common/footer.jsp"/>
<script>
<%--    html += '<p class="event-meta">' + event.theaterName'</p>'; --%>
    document.addEventListener("DOMContentLoaded", () => {
        const regionLinks = document.querySelectorAll(".region-link");
        const theaterRegionList = document.querySelector("#theater-region-list");
        console.log("Context Path:", "${pageContext.request.contextPath}");
        regionLinks.forEach(link => {
            link.addEventListener("click", async (event) => {
                event.preventDefault(); // 기본 동작 방지

                const region = link.getAttribute("data-region").trim(); // 클릭된 지역 이름 (한글 가능)
                console.log("클릭한 지역: [" +region+ "]");

                try {
                    // 서버로 POST 요청 보내기
                    const response = await fetch("${pageContext.request.contextPath}/UserController", {
                        method: "POST",
                        headers: {
                            "Content-Type": "application/json", // 요청 본문이 JSON임을 알림
                        },
                        body: JSON.stringify({
                            "type": "subregions",
                            "region": region.trim() // JSON으로 지역 데이터 전달
                        })
                    });

                    console.log("Sending Request Data:", {
                        "type": "subregions",
                        "region": region.trim()
                    });

                    if (!response.ok) {
                        throw new Error(`HTTP error! status: ${response.status}`);
                    }

                    // 서버에서 반환된 HTML 데이터를 가져옴
                    const html = await response.text();
                    console.log("받은 HTML: ", html);

                    // theaterRegionList를 HTML로 업데이트
                    theaterRegionList.innerHTML = html;
                } catch (error) {
                    console.error("AJAX 요청 중 오류 발생: ", error);
                }
            });
        });
    });


</script>
</body>
</html>