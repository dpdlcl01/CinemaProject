<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!Doctype html>
<html lang="ko">
<!-- head -->
<head>
    <jsp:include page="./common/head.jsp"/>
</head>

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

<!-- 극장 상단 이미지 및 메뉴 -->
<div class="wrap">
    <div class="bg-img" style="background-image:url('../../css/user/images/theater-detail.jpg');"></div>
    <div class="bg-pattern"></div>
    <div class="bg-mask"></div>
    <ul class="tabs">
        <li class="tab-link current" style="width: 11.8%" data-tab="tab-1">서울</li>
        <li class="tab-link" style="width: 11.8%" data-tab="tab-2">경기</li>
        <li class="tab-link" style="width: 11.8%" data-tab="tab-3">인천</li>
        <li class="tab-link" style="width: 11.8%" data-tab="tab-4">대전/세종</li>
        <li class="tab-link" style="width: 11.8%" data-tab="tab-5">부산/대구</li>
        <li class="tab-link" style="width: 11.8%" data-tab="tab-6">광주/전라</li>
        <li class="tab-link" style="width: 11.8%" data-tab="tab-7">강원</li>
    </ul>
    <div id="tab-1" class="tab-content current">
        <ul>
            <li class="theaterName" style="width: 23.6%"><a
                    href="/CinemaProject/jsp/user/theaterView.jsp">강남</a></li>
            <li class="theaterName" style="width: 23.6%"><a
                    href="#">센트럴</a></li>
            <li class="theaterName" style="width: 23.6%"><a
                    href="#">코엑스</a></li>
            <li class="theaterName" style="width: 23.6%"><a
                    href="#">홍대</a></li>
        </ul>
    </div>
    <div id="tab-2" class="tab-content">
        <ul>
            <li class="theaterName" style="width: 23.6%"><a
                    href="#">고양스타필드</a></li>
            <li class="theaterName" style="width: 23.6%"><a
                    href="#">수원스타필드</a></li>
            <li class="theaterName" style="width: 23.6%"><a
                    href="#">안성스타필드</a></li>
        </ul>
    </div>
    <div id="tab-3" class="tab-content">
        <ul>
            <li class="theaterName" style="width: 23.6%"><a
                    href="#">송도</a></li>
            <li class="theaterName" style="width: 23.6%"><a
                    href="#">청라지젤</a></li>
        </ul>
    </div>
    <div id="tab-4" class="tab-content">
        <ul>
            <li class="theaterName" style="width: 23.6%"><a
                    href="#">대전</a></li>
            <li class="theaterName" style="width: 23.6%"><a
                    href="#">세종나성</a></li>
        </ul>
    </div>
    <div id="tab-5" class="tab-content">
        <ul>
            <li class="theaterName" style="width: 23.6%"><a
                    href="#">대구신세계</a></li>
            <li class="theaterName" style="width: 23.6%"><a
                    href="#">부산극장</a></li>
        </ul>
    </div>
    <div id="tab-6" class="tab-content">
        <ul>
            <li class="theaterName" style="width: 23.6%"><a
                    href="#">광주하남</a></li>
            <li class="theaterName" style="width: 23.6%"><a
                    href="#">전주객사</a></li>
        </ul>
    </div>
    <div id="tab-7" class="tab-content">
        <ul>
            <li class="theaterName" style="width: 23.6%"><a
                    href="#">속초</a></li>
        </ul>
    </div>
    <div class="my-fav-theater">
        나의 선호극장 정보 <a href="#" id="moveLogin"><button class="login">로그인하기</button></a>
    </div>
</div>

<!-- contents 영역 -->
<div id="contents">
    <main>
        <section>
            <div class="inner-wrap pt40">
                <!-- 탭 영역 -->
                <div class="hightab">
                    <h1>극장정보</h1>
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

                <div class="tab-cont-wrap">
                    <div id="tab01" class="tab-cont">
                    </div>

                    <div id="tab02" class="tab-cont">
                        <h2 class="tit small" style="display: none;">무대인사</h2>
                        <div class="movie-greeting"></div>
                        <h2 class="tit small mt40">상영시간표</h2>
                    </div>
                    <div id="tab03" class="tab-cont">
                        <h2 class="tit small">영화관람료</h2>
                    </div>
                </div>
            </div>




            <!-- theaterView01 극장정보 영역 -->
            <div id="theaterView01">





            </div>

            <!-- theaterView02 상영시간표 영역 -->
            <div id="theaterView02">





            </div>

            <!-- theaterView03 관람료 영역 -->
            <div id="theaterView03">





            </div>

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