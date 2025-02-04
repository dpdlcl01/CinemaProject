<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <jsp:include page="../common/head.jsp"/>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${vo.boardTitle}</title>
    <style>
        .event-image img {
            width: 100%;
            height: auto;
            margin-bottom: 20px;
        }
        .event-meta {
            color: #666;
            font-size: 14px;
            margin-top: 20px;
            margin-bottom: 20px;
        }
        .divider {
            width: 100%;
            height: 1px;
            background-color: black;
            margin: 20px 0;
        }
    </style>
</head>
<body>
<jsp:include page="../common/header.jsp"/>
<div class="page-util">
    <div class="inner-wrap">
        <div class="location">
            <span>Home</span>
            <img src="https://img.megabox.co.kr/static/pc/images/common/bg/bg-location-arr.png"/>
            <label>이벤트</label>
            <img src="https://img.megabox.co.kr/static/pc/images/common/bg/bg-location-arr.png"/>
            <label>상세보기</label>
        </div>
    </div>
</div>
<div class="contents">
    <div class="event-detail">
        <h1 class="event-title">${vo.boardTitle}</h1>
        <p class="event-meta">${vo.boardRegDate} ~ ${vo.boardExpDate}</p>
        <div class="divider"></div>
        <div class="event-image">
            <img src="${vo.boardContent}" alt="이벤트 이미지">
        </div>
        <div class="divider"></div>
    </div>
</div>
<jsp:include page="../common/footer.jsp"/>
</body>
</html>