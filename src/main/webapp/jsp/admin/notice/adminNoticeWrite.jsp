<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!Doctype html>
<html lang="ko">
<head>
    <jsp:include page="../../user/common/head.jsp"/>

</head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Summernote CSS -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/summernote-lite.min.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/common.css">

<style>
    #top1 {
        background-image: url("${pageContext.request.contextPath}/css/user/images/KangImg/my_info_topbg.png");
        color: white;
        background-repeat: no-repeat;
        display: flex;
        width: 840px;
        height: 220px;
        background-size: contain;
    }

    #top1 img {
        width: 90px;
        height: 90px;
    }

    #imgName {
        display: flex;
        padding-right: 30px;
        width: 420px;
        align-items: center;
        justify-content: center;
    }

    #imgName p {
        font-size: 40px;
        line-height: 10px;
        padding-left: 30px;
        margin: 30px 0;

    }

    #point {
        display: flex;
        padding-top: 30px;
        margin-left: 50px;
    }

    #totalPoint {
        font-size: 40px;
    }

    #point span, #point em {
        padding-top: 10px;
        padding-left: 10px;
    }

    #point em {
        color: deepskyblue;
        font-weight: 600;
    }

    #pointDiv {
        position: relative;
        height: 120px;
    }

    #bar {
        width: 100%; /* 가로선을 전체 너비로 설정 */
        height: 2px;
        background-color: #666;
        position: absolute;
        top: 100px;
        left: 50px;
    }

    /* 등급 진행 바 */
    .level-list {
        display: flex;
        align-items: center;
        justify-content: space-between;
        list-style: none;
        padding: 0;
        margin: 20px 0 0 50px;
        width: 100%;
        max-width: 600px;
        position: relative;
    }

    /* 등급 바의 연결선 */
    .level-list::before {
        content: "";
        position: absolute;
        top: 50%;
        left: 0;
        width: 100%;
        height: 2px;
        background-color: #666; /* 기본 선 색상 */
        z-index: -1;
        transform: translateY(-50%);
    }

    /* 각 등급을 나타내는 작은 동그라미 */
    .level-item {
        position: relative;
        width: 12px; /* 작은 크기의 원 */
        height: 12px;
        background-color: #666;
        border-radius: 50%;

    }

    /* 현재 활성화된 등급 */
    .level-item.active {
        background-color: #22C8F6; /* 하늘색 */
        border: 2px solid white;
    }

    /* 등급 텍스트 */
    .level-item span {
        position: absolute;
        top: 20px;
        left: 50%;
        transform: translateX(-50%);
        color: white;
        font-size: 12px;
        text-align: center;
    }

    /* 말풍선 스타일 */
    .tooltip {
        background-color: #22C8F6;
        color: #ffffff;
        padding: 6px 12px;
        /*margin-left: 110px;*/
        border-radius: 6px;
        font-size: 12px;
        font-weight: bold;
        position: absolute;
        top: 50px;
        left: 50%;
        transform: translateX(-50%);
        white-space: nowrap;

    }

    /* 말풍선 꼬리 */
    /*    .tooltip::after {
            content: "";
            position: absolute;
            bottom: -6px;
            left: 50%;
            transform: translateX(-50%);
            border-width: 6px;
            border-style: solid;
            border-color: #22C8F6 transparent transparent transparent;
        }*/

    #top2 {
        display: flex;
        width: 836px;
        height: 140px;
        background-color: #eeeeee;
        border-bottom-left-radius: 20px;
        border-bottom-right-radius: 20px;
        margin-bottom: 50px;
    }

    .top2 {
        width: 200px;
        padding: 10px 20px 0;
    }

    .top2 > a {
        display: block;
        text-align: center;
        color: #503396;
        font-weight: 600;
        padding-bottom: 10px;
        text-decoration: none;
    }

    .top2 > div {
        display: flex;
        margin-left: 10px;
    }

    .top2 span {


        width: 120px;
    }

    .top2 em {
        text-align: right;
        display: block;
        font-weight: 600;
    }

    #myReserv {
        display: flex;
        width: 840px;
        height: 140px;
        margin-bottom: 50px;
        align-items: center;
        border-bottom: 1px solid #eeeeee;
    }

    #myReserv > img {
        width: 70px;
        height: 100px;
    }

    #reservInfo p {
        margin: 0 30px;
        width: 640px;
    }

    #reservInfo em {
        color: #01738b;
    }

    #myReserv button {
        background-color: white;
        width: 74px;
        height: 32px;
    }

    #h2 {
        display: flex;
        align-items: center;
        border-bottom: 1px solid #666666;
        width: 840px;
    }

    #h2 h2 {
        width: 760px;
    }

    #h2 button {
        height: 32px;
        width: 74px;
        border: none;
        background-color: white;
    }

    .top2 span {
        font-size: 14px;
    }

    #total {
        display: none;
    }

    .myPage-container {
        display: flex;

    }

    #contents {
        margin-left: auto;
        margin-right: auto;
        width: 1100px;
    }

    #main {
        margin: 50px 0 50px 50px;
    }

    .notice {
        width: 840px;
    }

    .noticeboard {
        width: 100%;
    }

    .search-bar-container {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 20px;
    }

    .search-bar-container .total-count {
        font-size: 16px;
    }

    .search-bar {
        display: flex;
        justify-content: flex-end;
        align-items: center;
        gap: 10px;
    }

    .search-bar select {
        padding: 6px;
        font-size: 14px;
    }

    .search-bar2 {
        border-bottom: 1px solid #423e3e;
        display: inline-block;
        position: relative;
        width: 200px;
        height: 30px;
    }

    .search-bar2 .input-text {
        display: inline-block;
        background-color: transparent;
        border: 0;
        color: #000;
        line-height: 25px;
        font-size: 16px;
        outline: none;
    }

    .search-bar2 .input-text:active {
        border: 0;
        outline: none;
    }

    .search-bar2 .btn {
        display: block;
        width: 30px;
        height: 100%;
        position: absolute;
        right: 0;
        top: 0;
        font-size: 0;
        line-height: 0;
        border: 0;
        background-color: transparent;
    }

    .search-bar2 .btn:hover {
        background-color: #0056b3;
    }

    .search-bar2 .btn .ico-search {
        display: inline-block;
        width: 18px;
        height: 18px;
        background-image: url(https://img.megabox.co.kr/static/pc/images/common/ico/ico-search-white.png);
        vertical-align: middle;
    }

    .notice h1 {
        font-size: 30px;
    }

    .noticeboard table {
        width: 100%;
    }

    .writeNotice {
        float: right;
        margin-top: 10px;
        text-align: center;
        color: #fff;
        background-color: #6a5acd;
        text-decoration: none;
        border-radius: 5px;
        font-size: 14px;
    }

    /* summernote */
    #main {
        margin: 50px 0 50px 50px;
        width: 840px;
    }
    .note-editor.note-frame {
        border-radius: 10px;
        border: 1px solid #ccc;
    }
    .form-group {
        margin-bottom: 20px;
    }
    .form-control {
        width: 100%;
        padding: 10px;
        font-size: 16px;
        border: 1px solid #ccc;
        border-radius: 5px;
    }
    .btn-submit {
        background-color: #6a5acd;
        color: white;
        padding: 10px 20px;
        border: none;
        border-radius: 5px;
        font-size: 16px;
        cursor: pointer;
    }
    .btn-submit:hover {
        background-color: #5a4db2;
    }

    #summernote, .note-editor {
        all: unset !important;  /* 모든 기존 스타일 초기화 */
    }


</style>

<body>
<jsp:include page="../../user/common/header.jsp"/>
<div class="contents">
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
        <div class="myPage-container">
            <%--  사이드바  --%>
            <jsp:include page="../common/adminSideBar.jsp"></jsp:include>
            <%--  메인  --%>
                
            <div id="main">
                <h1>공지사항 작성</h1>
                <form action="AdminController" method="post">
                    <input type="hidden" name="type" value="adWriteSubmit">

                    <div class="form-group">
                        <label for="title">제목</label>
                        <input type="text" id="title" name="title" class="form-control" placeholder="제목을 입력하세요" required>
                    </div>

                    <div class="form-group">
                        <label for="content">내용</label>
                        <textarea id="summernote" name="content"></textarea>
                    </div>

                    <button type="submit" class="btn-submit">등록</button>
                </form>


            </div>
        </div>
    </div>
</div>

<jsp:include page="../../user/common/footer.jsp"/>

<!-- Summernote JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/summernote-lite.min.js"></script>


<script>
    $(document).ready(function() {
        console.log("jQuery가 작동 중");

        try {
            $('#summernote').summernote({
                placeholder: '내용을 입력하세요...',
                tabsize: 2,
                height: 300
            });
            console.log("Summernote 초기화 성공");
        } catch (error) {
            console.error("Summernote 초기화 오류:", error);
        }
    });


    var total = ${requestScope.total};
    document.addEventListener("DOMContentLoaded", function () {
        if (total >= 13000 && total < 20000) {
            document.getElementById("vip-item").classList.add("active");
        }
        if (total >= 20000) {
            document.getElementById("vip-item").classList.add("active");
            document.getElementById("vvip-item").classList.add("active");
        }
    });

</script>
</body>
</html>