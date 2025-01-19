<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <jsp:include page="../common/head.jsp"/>
    <title>빠른 예매</title>
</head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/reservation.css?v=1.0">
<body>
<jsp:include page="../common/header.jsp"/>
<div id="contents">
    <div id="content">
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
                <main class="content">
                    <section class="movie-selection">
                        <h2>영화</h2>
                        <ul>
                            <li>말할 수 없는 비밀</li>
                            <li>검은 수녀들</li>
                            <li>하얼빈</li>
                            <li>동화지만 참불입니다</li>
                            <li>고별의 상자</li>
                        </ul>
                    </section>
                    <section class="theater-selection">
                        <h2>극장</h2>
                        <ul>
                            <li>서울 (20)</li>
                            <li>경기 (31)</li>
                            <li>인천 (6)</li>
                            <li>대전/충청/세종 (17)</li>
                            <li>부산/대구/경상 (27)</li>
                        </ul>
                    </section>
                    <section class="time-selection">
                        <h2>시간</h2>
                        <p>영화와 극장을 선택하시면 상영 시간표를 비교하여 볼 수 있습니다.</p>
                    </section>
                </main>
            </div>
        </div>
    </div>
</div>
<jsp:include page="../common/footer.jsp"/>
</body>
</html>