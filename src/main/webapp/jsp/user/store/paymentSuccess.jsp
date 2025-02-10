<<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!Doctype html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <style>
        *{
            padding: 0px;
            margin: 0px;
        }
        #contents{
            margin: 50px auto;
            width: 1100px;
            min-height: 550px;

        }
        caption{
            text-indent: -9999px;
        }
        .h1{
            width: 1100px;
            border-bottom: 1px solid black;
            padding-bottom: 20px;
        }
        img{
            width: 100px;
            height: 100px;
            margin-right: 20px;
        }
        .productInfo{
            display: flex;
            border-bottom: 1px solid #ababab;
            padding: 30px 0 30px 0;
            width: 1100px;
            margin-bottom: 50px;


        }
        .infoRight{

            padding-top: 20px;
        }
        em{
            color: #339eb2;
            font-size: 17px;
            font-weight: 600;
        }
        .bold{
            font-weight: 600;
        }
        .li{
            margin-top: 5px;
            text-decoration: none;
        }

        .ul{
            margin-bottom: 50px;
        }
        #h3{
            margin: 30px 0 50px 0;

        }
        .notice{
            border: 1px solid #ababab;
            border-radius: 4px;
            width: 1100px;
            padding-left: 30px;
        }
        .btnDiv{
            display: flex;
            width: 1100px;
            justify-content: center;

        }
        .btnDiv>button{
            margin: 20px 3px 30px 3px;
            border-radius: 4px;
            background-color: white ;
        }
        .btnDiv>.paymentList{
            width: 120px;
            height: 50px;
            border: 1px solid #339eb2;

        }
        .btnDiv>.myMega{
            border: 1px solid red;
            width: 120px;
            border: 1px solid #339eb2;
            color: #339eb2;
        }
    </style>
</head>
<!-- head -->
<head>
    <jsp:include page="../common/head.jsp"/>
</head>

<body>
<!-- header 영역 -->
<jsp:include page="../common/header.jsp"/>
<div class="page-util">
    <div class="inner-wrap">
        <div class="location">
            <span>Home</span>
            <img src="https://img.megabox.co.kr/static/pc/images/common/bg/bg-location-arr.png"/>
            <label>스토어</label>
            <img src="https://img.megabox.co.kr/static/pc/images/common/bg/bg-location-arr.png"/>
            <label>결제완료</label>
        </div>
    </div>
</div>
<!-- contents 영역 -->

<div class="contents">
    <h1 class="h1">결제완료</h1>
    <div id="main">
        <div class="productInfo">
            <img src="${pageContext.request.contextPath}/css/user/images/KangImg/${requestScope.img}">
            <div class="infoRight">
                <p class="bold">${requestScope.orderName}</p>
                <p>
                    <span>수량 ${requestScope.quant} 개</span>
                    |
                    <span>결제금액 <em>${requestScope.totalAmount}</em>원</span>
                </p>
            </div>
        </div>

    </div>
    <div class="notice">
        <h3 id="h3">유의사항</h3>
        <ul class="ul">
            <p class="bold">■이용안내</p>
            <li class="li">•본 상품의 사용 기한은 구매일로부터 92일까지입니다.</li>
            <li class="li">•영화관 매장에서 스토어 쿠폰번호를 제시 후 상품으로 교환하실 수 있습니다.</li>
            <li class="li">•본 상품은 온라인 전용 판매 상품으로 현장 구매는 불가능합니다.</li>
            <li class="li">•구매한 상품은 "나의 티켓함"에서 확인할 수 있습니다.</li>
            <li class="li">•구매 및 음료의 크기, 종류 변경 시 추가 금액이 발생할 수 있습니다.</li>
            <li class="li">•상기 이미지는 실제 제품과 다를 수 있습니다.</li>
            <li class="li">•본 상품은 포인트 사용 및 외설 결제액에 한하여 교환권 사용시 적립 가능합니다.</li>
        </ul>

        <ul class="ul">
            <p class="bold">■연장/취소/환불 안내</p>
            <li class="li">•본 상품은 구매일로부터 10일 이내에 취소 가능합니다.</li>
            <li class="li">•유효기간은 본 상품의 유효기간 내에서 연장 신청이 가능하며, 1회 연장 시 3개월(92일) 단위로 연장됩니다.</li>
            <li class="li">•본 상품은 최대 5번까지 유효기간 연장이 가능합니다</li>
            <li class="li">•최초 유효기간 만료 후에는 결제금액의 90%에 대해 환불 요청이 가능하며, 환불 처리에 7일 이상의 시간이 소요될 수 있습니다. (점수차: 1544-0070)</li>
            <li class="li">•유효기간이 경과된 후에는 환불 요청이 1회만 가능하며, 사용한 상품에 대해서는 불가합니다.</li>
            <li class="li">•환불은 현금으로 환불이 포함됩니다.</li>
            <li class="li">•본 상품 환불 요청 시 쇼핑 포인트가 포함되어 있다면 환불 요청한 확일 경우 사용 가능 항 포인트로 돌아갑니다.</li>
            <li class="li">•※ 2020년 2월 4일 이후 구매 상품에 한하여 유효기간 연장 신청 가능합니다.</li>
        </ul>
    </div>

    <div class="btnDiv">
        <button class="paymentList" onclick="myList()">나의 구매내역</button>
        <button class="myMega" onclick="myMega()">마이페이지</button>
    </div>

</div>


<!-- footer 영역 -->
<jsp:include page="../common/footer.jsp"/>





<script>
    function myList(){
        location.href="${pageContext.request.contextPath}/UserController?type=myReservation&reservationType=purchaseTable";
    }
    function myMega(){
        location.href="${pageContext.request.contextPath}/UserController?type=myPage";
    }
</script>
</body>

</html>
