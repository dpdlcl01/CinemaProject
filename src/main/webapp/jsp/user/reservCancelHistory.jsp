<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 25. 1. 15.
  Time: 오후 9:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <jsp:include page="./common/head.jsp"/>
</head>
<style>
    *{
        padding: 0;
        margin: 0;
    }
    #contents{
        margin: 50px auto;
        width: 1100px;
    }
    #title{
        display: flex;
        padding: 20px 40px;
        margin-top: 20px;
        background-color: #eeeeee;
    }
    td>span{
        font-weight: 600;
    }
    label{
        margin-right: 20px;
    }
    #searchBtn{
        width: 73px;
        height: 32px;
        background-color: white;
        border-radius: 4px;
        border: 1px solid gray;
    }
    #strong{
        margin: 30px 0 15px;
    }
    strong>b , em{
        color: #01738b;
    }
    em{
        font-size: 17px;
    }
    #main{
        display: flex;
        border: 1px solid gray;
        width: 840px;
        height: 287px;
        align-items: center;
        padding: 25px 30px 20px 25px;
        border-radius: 8px;
        box-sizing: border-box;

    }
    #main>img{
        width: 135px;
        height: 195px;
        margin-right: 40px;
    }
    #mainTable{
        font-size: 14px;
    }
    #mainTable td{
        height: 32px;
        padding-left: 20px;
    }

    #lastRow{
        background-color: #eeeeee;
        height: 32px;
        margin-bottom: 10px;
        font-size: 14px;
        padding-left: 20px;
        border-radius: 4px;
        width: 600px;
    }
    #lastRow span{
        font-weight: 600;
    }
    #lastRow button{
        background-color: white;
        border: 1px solid gray;
        border-radius: 3px;

    }
    #btnDiv{
        text-align: right;
        margin-right: 30px;
    }
    #reservCancel{
        width: 83px;
        height: 33px;
        background-color: dimgray;
        color: #eeeeee;
        border: 1px solid dimgray;
        border-radius: 4px;
    }
    h3{
        margin-top: 40px;
        color: #503396;
        font-size: 24px;
        padding-bottom: 16px;
    }
    #bottomTable{
        margin-top: 10px;
        border-top: 1px solid black;
        border-collapse: collapse;
    }
    #bottomTable thead{
        height: 45px;
        background-color: #eeeeee;
    }
    #bottomTable td{
        height: 45px;
        text-align: center;
    }
</style>
<body>
<!-- header 영역 -->
<jsp:include page="./common/header.jsp"/>
<div class="page-util">
    <div class="inner-wrap">
        <div class="location">
            <span>Home</span>
            <span>예매/취소내역</span>
        </div>
    </div>
</div>
<!-- contents 영역 -->
<div id="contents">
    <h1>예매/취소내역</h1>
    <div id="title">
        <table>
            <colgroup>
                <col width="75px">
                <col width="*">
            </colgroup>
            <tr>
                <td><span>구분</span></td>
                <td>
                    <input type="radio" id="radio1" name="radioSelect" value="reservation" checked="checked">
                    <label for="radio1">예매내역</label>
                    <input type="radio" id="radio2" name="radioSelect" value="before">
                    <label for="radio2">지난내역</label>
                    <button id="searchBtn"><img src="../../img/search.png">조회</button>
                </td>
            </tr>
        </table>
    </div>
    <div id="strong">
        <strong>총<b>1</b>건</strong>
    </div>

    <div id="main">
        <img src="../../img/ha.png">
        <div id="mainInfo">
            <table id="mainTable">
                <colgroup>
                    <col width="95px">
                    <col width="230px">
                    <col width="*">
                </colgroup>
                <tr>
                    <td><span>예매번호</span></td>
                    <td colspan="2"><em>0000-000-00000</em></td>
                </tr>
                <tr>
                    <td><span>영화명</span></td>
                    <td colspan="2">하얼빈 2D</td>
                </tr>
                <tr>
                    <td><span>극장 상영관</span></td>
                    <td>강남/3관(리클라이너 LASER)</td>
                    <td><b>관람인원</b> <a>성인1명</a></td>
                </tr>
                <tr>
                    <td><span>관람일시</span></td>
                    <td>2025.01.19(일) 14:35 (3회차)</td>
                    <td><b>관람인원</b> <a>성인1명</a></td>
                </tr>
            </table>
            <div id="lastRow">
                <table>
                    <colgroup>
                        <col width="95px">
                        <col width="230px">
                        <col width="*">
                    </colgroup>
                    <tr >
                        <td>
                            <span>결제일시</span>
                        </td>
                        <td>
                            2025.01.15
                            <button type="button">결제정보</button>
                        </td>
                    </tr>
                </table>
            </div>





            <div id="btnDiv">
                <button type="button" id="reservCancel">
                    예매취소
                </button>
            </div>
        </div>
    </div>
    <article id="cancelHistory">
        <h3>예매취소내역</h3>
        <li>상영일 기준 7일간 취소내역을 확인하실 수 있습니다.</li>
        <table id="bottomTable">
            <colgroup>
                <col width="160px">
                <col width="257px">
                <col width="130px">
                <col width="188px">
                <col width="105px">
            </colgroup>
            <thead>
            <th>취소일시</th>
            <th>영화명</th>
            <th>극장</th>
            <th>상영일시</th>
            <th>취소금액</th>
            </thead>
            <tr>
                <td>2025.01.15 (15:09)</td>
                <td>하얼빈</td>
                <td>광명AK플라자</td>
                <td>2025.01.19 (일) 15:10	</td>
                <td>14,000원</td>
            </tr>
        </table>
    </article>
</div>

<!-- footer 영역 -->
<jsp:include page="./common/footer.jsp"/>

<!-- script 영역 -->

</body>
</html>
