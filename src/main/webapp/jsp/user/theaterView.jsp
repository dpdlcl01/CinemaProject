<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!Doctype html>
<html lang="ko">
<!-- head -->
<head>
    <jsp:include page="./common/head.jsp"/>
</head>
<meta http-equiv='X-UA-Compatible' content='IE=edge'>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
        rel="stylesheet">
<link rel="stylesheet" href="/resources/css/theaterDetail.css">
<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script
        src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript"
        src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript"
        src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<body>
<!-- header 영역 -->
<jsp:include page="./common/header.jsp"/>
<style>

</style>
<!-- page-util -->
<div class="page-util">
    <div class="inner-wrap">
        <div class="location">
            <span>Home</span>
            <a href="/CinemaProject/jsp/user/theater.jsp" title="극장 페이지로 이동">극장</a>
            <a href="/CinemaProject/jsp/user/theater.jsp" title="전체극장 페이지로 이동">전체극장</a>
        </div>
    </div>
</div>

<!-- contents 영역 -->
<div id="contents">
    <main>
        <section>
            <!-- 탭 영역 -->
            <div class="hightab">
                <h1>공지사항</h1>
                <div class="tabs">
                    <div class="tab active" data-target="all">전체</div>
                    <div class="tab" data-target="megaPick">메가픽</div>
                    <div class="tab" data-target="movies">영화</div>
                </div>

                <div id="all" class="content active">
                    <h2>극장정보</h2>
                    <p>극장정보</p>
                </div>
                <div id="megaPick" class="content">
                    <h2>상영시간표</h2>
                    <p>상영시간표</p>
                </div>
                <div id="movies" class="content">
                    <h2>관람료</h2>
                    <p>관람료</p>
                </div>
            </div>

            <!-- theaterView01 영역 -->
            <section id="theaterView01">

            </section>



        </section>
    </main>

</div>

<!-- footer 영역 -->
<jsp:include page="./common/footer.jsp"/>

<!-- script 영역 -->
<script>
    const tabs = document.querySelectorAll('.tab');
    const contents = document.querySelectorAll('.content');

    tabs.forEach(tab => {
        tab.addEventListener('click', () => {
            tabs.forEach(t => t.classList.remove('active'));
            tab.classList.add('active');

            const target = tab.getAttribute('data-target');
            contents.forEach(content => {
                content.classList.remove('active');
                if (content.id === target) {
                    content.classList.add('active');
                }
            });
        });
    });
</script>
</body>
</html>