<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!Doctype html>
<html lang="ko">
<head>
</head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/common.css">

<style>
    .admin-contents {
        width: 100%;
        min-height: 550px;
    }
    .page-util .inner-wrap {
        max-width: 100%; !important;
        padding: 20px 20px; !important;
    }
    #top1{
        background-image: url("${pageContext.request.contextPath}/css/user/images/KangImg/my_info_topbg.png");
        color: white;
        background-repeat: no-repeat;
        display: flex;
        width: 840px;
        height: 220px;
        background-size: contain;
    }
    #top1 img{
        width: 90px;
        height: 90px;
    }
    #imgName{
        display: flex;
        padding-right: 30px;
        width: 420px;
        align-items: center;
        justify-content: center;
    }
    #imgName p{
        font-size: 40px;
        line-height: 10px;
        padding-left: 30px;
        margin: 30px 0;

    }
    #point span, #point em{
        padding-top: 10px;
        padding-left: 10px;
    }
    #point em{
        color: deepskyblue;
        font-weight: 600;
    }
    #pointDiv {
        position: relative;
        height: 120px;
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
    #top2{
        display: flex;
        width: 836px;
        height: 140px;
        background-color: #eeeeee;
        border-bottom-left-radius: 20px;
        border-bottom-right-radius: 20px;
        margin-bottom: 50px;
    }
    .top2>a{
        display: block;
        text-align: center;
        color: #503396;
        font-weight: 600;
        padding-bottom: 10px;
        text-decoration: none;
    }
    .top2>div{
        display: flex;
        margin-left: 10px;
    }
    .top2 span{
        width: 120px;
    }
    .top2 em{
        text-align: right;
        display: block;
        font-weight: 600;
    }
    #myReserv>img{
        width: 70px;
        height: 100px;
    }
    #reservInfo p{
        margin: 0 30px;
        width: 640px;
    }
    #reservInfo em{
        color: #01738b;
    }
    #myReserv button{
        background-color: white;
        width: 74px;
        height: 32px;
    }
    #h2 h2{
        width: 760px;
    }
    #h2 button{
        height:32px ;
        width: 74px;
        border: none;
        background-color: white;
    }
    .top2 span{
        font-size: 14px;
    }
    .myPage-container{
        display: flex;

    }
    #main{
        width: 100%;
        margin: 27px 40px 40px 40px;
    }
    #main h1{
        font-size: 30px;
    }
</style>

<body>
<header>
    <div class="page-util">
        <div class="inner-wrap" style="display: flex; justify-content: space-between; align-items: center;">
            <!-- 홍길동 관리자님 위치 -->
            <div class="location" style="flex-grow: 1;">
                <span>홍길동 관리자님</span>
            </div>
            <!-- 로그인/로그아웃 버튼 -->
            <div style="display: flex; gap: 10px; flex-shrink: 0;">
                <a href="/login" title="로그인 페이지로 이동" style="text-decoration: none; color: black; font-weight: 600;">
                    로그인
                </a>
                <a href="/logout" title="로그아웃" style="text-decoration: none; color: black; font-weight: 600;">
                    로그아웃
                </a>
            </div>
        </div>
    </div>
</header>
<div class="admin-contents">
    <div class="total-main">
        <div class="myPage-container">
            <%--  사이드바  --%>
            <jsp:include page="../common/adminSideBar.jsp"></jsp:include>
            <%--  메인  --%>

            <div id="main">
                <h1>사용자 로그 관리</h1>
                <div id="title">
                    <table border="1" width="100%" style="border-collapse: collapse; text-align: center;">
                        <thead>
                        <tr style="background-color: #f2f2f2;">
                            <th>번호</th>
                            <th>사용자 ID</th>
                            <th>로그 내용</th>
                            <th>날짜</th>
                            <th>IP 주소</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%--                        <c:forEach var="log" items="${logList}">--%>
                        <tr>
                            <td>123</td>
                            <td>345</td>
                            <td>567</td>
                            <td>890</td>
                            <td>123</td>
                        </tr>
                        <%--                        </c:forEach>--%>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<script>

</script>
</body>
</html>