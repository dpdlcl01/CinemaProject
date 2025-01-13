<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<style>


    /* 전역 스타일 */
    body, html {
        margin: 0;
        padding: 0;
        font-family: Arial, sans-serif;
        box-sizing: border-box;
        overflow-x: hidden; /* 좌우 스크롤 방지 */
    }

    .total {
        display: flex;
        flex-direction: column;
        align-items: center;
        width: 100%;
        max-width: 1200px;
        margin: 0 auto;
        padding: 0 20px; /* 좌우 여백 */
    }

    /* 제목 섹션 */
    h2 {
        padding: 20px 0;
        font-size: 24px;
        color: #222;
        text-align: center;
    }

    /* 탭 메뉴 스타일 */
    #title1 {
        display: flex;
        justify-content: center;
        gap: 10px; /* 버튼 간 간격 */
        margin-bottom: 20px;
    }

    #title1 a {
        text-decoration: none;
        width: 150px;
        height: 41px;
        text-align: center;
        border: 1px solid #D3D3D3;
        border-bottom: 1px solid #503396;
        color: black;
        display: flex;
        align-items: center;
        justify-content: center;
        transition: all 0.3s ease;
        font-size: 14px;
        font-weight: bold;
    }

    #title1 a.active {
        color: #503396;
        border-color: #503396;
        border-bottom: white;
    }

    #title1 a:hover {
        color: #503396;
    }

    /* 상품 카드 그리드 */
    #products {
        display: grid;
        grid-template-columns: repeat(auto-fill, minmax(250px, 1fr)); /* 반응형 그리드 */
        gap: 20px;
        width: 100%;
        margin: 0 auto;
        padding: 20px 0;
    }

    /* 상품 카드 스타일 */
    .card {
        border: 1px solid #ddd;
        border-radius: 8px;
        padding: 16px;
        background-color: #fff;
        text-align: center;
        transition: all 0.3s ease;
    }

    .card:hover {
        border-color: #503396;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* 호버 시 그림자 */
    }

    /* 상품 이미지 스타일 */
    #products img {
        width: 100%;
        height: 200px;
        object-fit: cover;
        border-radius: 8px;
    }

    /* 상품 정보 */
    .info {
        margin-top: 10px;
    }

    .name {
        font-size: 16px;
        font-weight: bold;
        color: #222;
        margin: 10px 0;
        height: 39px;
        overflow: hidden;
    }

    .explanation {
        font-size: 14px;
        color: #666;
        height: 36px;
        text-overflow: ellipsis;
        overflow: hidden;
        display: -webkit-box;
        -webkit-line-clamp: 2;
        line-clamp: 2;
        -webkit-box-orient: vertical;
        margin-bottom: 10px;
    }

    .price {
        font-size: 18px;
        color: #503396;
        font-weight: bold;
        margin-bottom: 5px;
    }

    em {
        font-size: 14px;
        color: #503396;
    }

    /* 반응형 디자인 */
    @media (max-width: 768px) {
        #title1 {
            flex-direction: column; /* 버튼을 세로로 나열 */
            gap: 5px;
        }

        #title1 a {
            width: 100%; /* 버튼 너비를 100%로 */
        }

        #products {
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            padding: 10px;
        }

        .card {
            padding: 10px;
        }

        .price {
            font-size: 16px;
        }

        em {
            font-size: 12px;
        }
    }

</style>

<body class="total">
<header>
    <jsp:include page="store.jsp"/>
</header>
<div>



    <h2>스토어</h2>

    <article id="title1">
        <a href="" class="active">전체상품</a>
        <a href="">메가티켓</a>
        <a href="">팝콘,음료</a>
        <a href="">굿즈</a>
    </article>

    <article id="products">
        <div class="card">
            <img src="../../img/m1.png">
            <hr>
            <div class="info">
                <p class="name">스타벅스 콜라보 상품 1</p>
                <p class="explanation">안녕하세요 상품설명 부분입니다. 길어져도 깨지지 않는지 확인해보기 위한 문장</p>
                <hr>
                <article>
                    <p class="price">10000</p>
                    <em>원</em>
                </article>
            </div>
        </div>

        <div class="card">
            <img src="../../img/m2.png">
            <hr>
            <div class="info">
                <p class="name">상품명1</p>
                <p class="explanation">상품설명</p>
                <hr>
                <article>
                    <p class="price">10000</p>
                    <em>원</em>
                </article>
            </div>
        </div>
        <div class="card">
            <img src="../../img/m3.png">
            <hr>
            <div class="info">
                <p class="name">상품명1</p>
                <p class="explanation">상품설명</p>
                <hr>
                <article>
                    <p class="price">10000</p>
                    <em>원</em>
                </article>
            </div>
        </div>
        <div class="card">
            <img src="../../img/m4.png">
            <hr>
            <div class="info">
                <p class="name">상품명1</p>
                <p class="explanation">상품설명</p>
                <hr>
                <article>
                    <p class="price">10000</p>
                    <em>원</em>
                </article>
            </div>
        </div>
    </article>


</div>
<footer>
    <jsp:include page="footer.jsp"/>
</footer>
<script>
    //////////////////////////////////////
    ///* card 클래스 클릭 이벤트 넣으세요 *///
    //////////////////////////////////////

    // 모든 a 태그 선택
    const tabs = document.querySelectorAll("#title a");

    // 각 a 태그에 클릭 이벤트 추가
    tabs.forEach((tab) => {
        tab.addEventListener("click", (event) => {
            event.preventDefault(); // 기본 동작 방지 (필요에 따라 사용)

            // 모든 a 태그에서 active 클래스 제거
            tabs.forEach((t) => t.classList.remove("active"));

            // 클릭된 a 태그에 active 클래스 추가
            tab.classList.add("active");
        });
    });

</script>
</body>
</html>