<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>

        <jsp:include page="../common/head.jsp"/>

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
    .main {
        display: grid;
        grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
        gap: 20px; /* 카드 간격 */
        width: 1100px;
        margin: 0 auto;
        height: 100%;
        padding: 20px;
        /*여기에 디스플레이 논 넣으세요*/
    }



    #title{
        display: flex;
        justify-content: space-around;
        margin: 20px 0;
        border-bottom: 2px solid #ccc;
        width: 100%;

    }
    #h2>h1{
        width: 1100px;
        margin-left: auto;
        margin-right: auto;
        padding-bottom: 20px;
        margin-top: 50px;
    }




    #title a{
        padding: 10px 0;
        width: 150px; /* 탭의 고정 너비 */
        text-align: center;
        cursor: pointer;
        border-bottom: 2px solid transparent;
        font-size: 16px;

    }


    /* 클릭된 상태 (active 클래스 추가 시) */
    #title a.active {
        border-bottom: 2px solid #6a5acd;
        color: #6a5acd;
    }


    /* 카드 개별 스타일 */
    .card {
        display:  block; /* 기본적으로 숨김 */
        text-align: center; /* 텍스트 가운데 정렬 */
        border: 1px solid #ddd;
        padding: 16px;
        border-radius: 8px;
        width: 230px;
    }
    #products1 img,#products2 img,#products3 img {
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
        padding-top: 36px;
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
    #products2 , #products3{
        display: none;
    }



</style>
<header>
    <jsp:include page="../common/header.jsp"/>
</header>

<body class="total">

    <div class="page-util">
        <div class="inner-wrap">
            <div class="location">
                <span>Home</span>
                <span >스토어</span>
            </div>
        </div>
    </div>
<div id="h2">
    <h1>스토어</h1>

<div id="contents">

    <article id="title">
        <a href="" class="active" id="title1">전체상품</a>
        <a href="" id="title2">팝콘,음료</a>
        <a href="" id="title3">굿즈</a>
    </article>


    <article id="products1" class="main" >
        <c:forEach items="${requestScope.ar}" var="ar">
                <div id="main1" class="card"     data-productname="${ar.productName}" data-productimg="${ar.productImg}"  onclick="goProduct(this)" >
                    <img src="${pageContext.request.contextPath}/css/user/images/KangImg/${ar.productImg}">
                    <hr>
                    <div class="info">
                        <p class="name">${ar.productName}</p>
                        <p class="explanation">${ar.productInfo}</p>
                        <hr>
                        <article>
                            <p class="price">${ar.productPrice}</p>
                            <em>원</em>
                        </article>
                    </div>
                </div>
        </c:forEach>
    </article>

    <article id="products2" class="main" >
    <c:forEach items="${requestScope.ar}" var="ar">
        <c:if test="${ar.productCategory eq '1'}">
            <div id="main2" class="card">
                <img src="${pageContext.request.contextPath}/css/user/images/KangImg/${ar.productImg}">
                <hr>
                <div class="info">
                    <p class="name">${ar.productName}</p>
                    <p class="explanation">${ar.productInfo}</p>
                    <hr>
                    <article>
                        <p class="price">${ar.productPrice}</p>
                        <em>원</em>
                    </article>
                </div>
            </div>
        </c:if>
    </c:forEach>
    </article>

    <article id="products3" class="main" >
        <c:forEach items="${requestScope.ar}" var="ar">
            <c:if test="${ar.productCategory eq '2'}">
                <div id="main3" class="card">
                    <img src="${pageContext.request.contextPath}/css/user/images/KangImg/${ar.productImg}">
                    <hr>
                    <div class="info">
                        <p class="name">${ar.productName}</p>
                        <p class="explanation">${ar.productInfo}</p>
                        <hr>
                        <article>
                            <p class="price">${ar.productPrice}</p>
                            <em>원</em>
                        </article>
                    </div>
                </div>
            </c:if>
        </c:forEach>
    </article>
</div>
    <form id="productForm" action="${pageContext.request.contextPath}/UserController?type=product" method="post" accept-charset="UTF-8">
        <input type="hidden" name="pName" id="pName">
        <input type="hidden" name="pImg" id="pImg">
        <input type="hidden" name="pCategory" id="pCategory">
    </form>
</div>

<script>
    function goProduct(vo) {
        let pName = vo.getAttribute("data-productname");
        let pImg = vo.getAttribute("data-productimg");

        document.getElementById("pName").value=pName;
        document.getElementById("pImg").value=pImg;

        document.forms[0].submit();

    }


        /*타이틀을 누를 때 이벤트 발생시키자!*/

    const total = document.getElementById("title1");
    const merch = document.getElementById("title2");
    const snack = document.getElementById("title3");

    const tabs=[total,merch,snack];

    const main1=document.getElementById("products1");
    const main2=document.getElementById("products2");
    const main3=document.getElementById("products3");

        tabs.forEach((tab) => {
            tab.addEventListener("click", (event) => {
                event.preventDefault(); // 기본 동작 방지 (필요에 따라 사용)

                // 모든 a 태그에서 active 클래스 제거
                tabs.forEach((t) => t.classList.remove("active"));

                // 클릭된 a 태그에 active 클래스 추가
                tab.classList.add("active");

                // 각각의 탭 클릭 시 개별 동작 추가
                switch (tab.id) {
                    case "title1":
                        console.log("전체 탭 클릭됨! 데이터를 로드합니다.");
                        // total 클릭 시 실행할 코드
                        loadTotalData();
                        break;
                    case "title2":
                        console.log("굿즈 탭 클릭됨! 상품 정보를 가져옵니다.");
                        // merch 클릭 시 실행할 코드
                        loadMerchData();
                        break;
                    case "title3":
                        console.log("스낵 탭 클릭됨! 간식 목록을 표시합니다.");
                        // snack 클릭 시 실행할 코드
                        loadSnackData();
                        break;
                    default:
                        console.log("알 수 없는 탭 클릭됨!");
                }
            });
        });

        function loadTotalData() {
            main1.style.display="grid";
            main2.style.display="none";
            main3.style.display="none";


            // 여기에 전체 상품 관련 로직 추가
        }

        function loadMerchData() {
            main1.style.display="none";
            main2.style.display="grid";
            main3.style.display="none";
            // 여기에 굿즈 상품 관련 로직 추가
        }

        function loadSnackData() {
            main1.style.display="none";
            main2.style.display="none";
            main3.style.display="grid";
            // 여기에 간식 관련 로직 추가
        }

</script>
</body>
<footer>
    <jsp:include page="../common/footer.jsp"/>
</footer>
</html>