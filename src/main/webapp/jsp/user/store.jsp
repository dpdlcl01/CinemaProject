<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>

        <jsp:include page="./common/head.jsp"/>

</head>
<style>



    #contents {
        display: flex;
        flex-direction: column;
        align-items: center;
        width: 1100px;
        margin-left: auto;
        margin-right: auto;

    }


    /* 상품 카드 배치 */
    #products {
        display: grid;
        grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
        gap: 20px; /* 카드 간격 */
        width: 1100px;
        margin: 0 auto;
        height: 100%;
        padding: 20px;
    }
    #title{
        display: flex;
        padding: 20px;

    }
    #h2>h1{
        width: 1100px;
        margin-left: auto;
        margin-right: auto;
        padding-bottom: 20px;
        margin-top: 50px;
    }




    #title a{
        text-decoration: none;
        width: 273px;
        height: 41px;
        text-align: center;
        border: 1px solid #D3D3D3;
        border-bottom: 1px solid #503396;
        color: black;
        margin-bottom: 20px;
        display: flex;
        align-items: center; /* 세로 중앙 정렬 */
        justify-content: center;
        transition: all 0.3s ease;

    }


    /* 클릭된 상태 (active 클래스 추가 시) */
    #title a.active {
        color: #503396;
        border-color: #503396; /* 활성화된 테두리 색상 */
        border-bottom: white;
    }


    /* 카드 개별 스타일 */
    .card {
        text-align: center; /* 텍스트 가운데 정렬 */
        border: 1px solid #ddd;
        padding: 16px;
        border-radius: 8px;
        width: 230px;
    }
    #products img {
        width: 200px; /* 이미지의 너비 */
        height: 243px; /* 이미지의 높이 */
        object-fit: cover; /* 비율 유지하며 크기 맞추기 */
    }
    .info article{
        display: flex;
    }
    .price{
        color: #503396;
        font-family: Roboto;
        font-size: 1.6em;
        font-weight: 400;
        vertical-align: middle;
        padding-top: 30px;
        padding-bottom: 0;
        margin-bottom: 0;
    }
    em{
        color: #503396;
        font-family: Roboto;
        font-size: 1.2em;
        height: 61px;
        padding-top: 35px;
        padding-bottom: 0;
        margin-bottom: 0;
    }
    .name{
        overflow: hidden;
        height: 39px;
        margin: 0 0 10px 0;
        color: #222;
        font-weight: 700;
    }
    .explanation{
        font-size: .8667em;
        color: #666;
        overflow: hidden;
        text-overflow: ellipsis;
        display: -webkit-box;
        -webkit-line-clamp: 2;
        line-clamp: 2;
        -webkit-box-orient: vertical;
        height: 36px;
        padding-bottom: 3px
    }
    .card:hover{
        border: 1px solid #503396 ;
    }
    #contents{
        margin-top: 50px;
        margin-bottom: 50px;
    }



</style>
<header>
    <jsp:include page="common/header.jsp"/>
</header>

<body class="total">

    <div class="page-util">
        <div class="inner-wrap">
            <div class="location">
                <span>Home</span>
                <a href="/booking" title="예매 페이지로 이동">스토어</a>
            </div>
        </div>
    </div>
<div id="h2">
    <h1>스토어</h1>

<div id="contents">

    <article id="title">
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
</div>

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
<footer>
    <jsp:include page="footer.jsp"/>
</footer>
</html>