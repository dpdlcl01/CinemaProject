<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="../common/head.jsp"/>
    <style>
        h1 {
            margin: 50px 0 20px 0;
            text-align: left;
        }

        .notice-title {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 20px;
        }

        .notice-info {
            font-size: 14px;
            color: #888;
            margin-bottom: 20px;
        }

        .notice-content {
            border-top: 1px solid #ccc;
            border-bottom: 1px solid #ccc;
            padding: 20px 0;
            margin-bottom: 20px;
        }

        .notice-content p {
            margin: 10px 0;
        }

        .btn-list {
            display: block;
            width: 100px;
            margin: 20px auto;
            padding: 10px;
            text-align: center;
            color: #fff;
            background-color: #6a5acd;
            text-decoration: none;
            border-radius: 5px;
            font-size: 14px;
        }

        .btn-list:hover {
            background-color: #5a4cad;
        }

        .navigation-table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }

        .navigation-table td {
            padding: 10px 15px;
            border: 1px solid #ddd;
            vertical-align: middle;
        }

        .navigation-table td span {
            font-weight: bold;
            color: #666;
        }

        .navigation-table td:first-child {
            background-color: #f8f8f8; /* 옅은 회색 */
            font-weight: bold;
            text-align: center;
        }

        .navigation-table td a:hover {
            text-decoration: underline; /* 마우스를 올릴 때 밑줄 */
        }

        /*.navigation-table tr:first-child td {*/
        /*    border-top: 1px solid #6a5acd;*/
        /*}*/
        /*.navigation-table tr:last-child td {*/
        /*    border-bottom: 1px solid #6a5acd;*/
        /*}*/
    </style>
</head>
<body>
<jsp:include page="../common/header.jsp"/>
<!-- 추가된 page-util -->
<div class="page-util">
    <div class="inner-wrap">
        <div class="location">
            <span>Home</span>
            <a href="/booking" title="예매 페이지로 이동">공지사항</a>
        </div>
    </div>
</div>
<div class="contents">
    <c:set var="board" value="${requestScope.board}"/>
    <c:set var="pboard" value="${requestScope.pboard}"/>
    <c:set var="nboard" value="${requestScope.nboard}"/>
    <h1>공지사항</h1>
    <h1 class="notice-title">${board.boardTitle}</h1>
    <div class="notice-info">
        <span>영화관: 코엑스</span> | <span>구분: 공지</span> | <span>등록일: ${board.boardRegDate}</span>
    </div>
    <div class="notice-content">
        ${board.boardContent}
    </div>
    <table class="navigation-table">
        <colgroup>
            <col width="20%">
            <col width="*">
        </colgroup>
        <tbody>
        <tr>
            <td>
                <span>이전</span>
            </td>
            <td>
                <a href="UserController?type=view&boardIdx=${pboard.boardIdx}">${pboard.boardTitle}</a>
            </td>
        </tr>
        <tr>
            <td>
                <span>다음</span>
            </td>
            <td>
                <a href="UserController?type=view&boardIdx=${nboard.boardIdx}">${nboard.boardTitle}</a>
            </td>
        </tr>
        </tbody>
    </table>
    <a href="UserController?type=board" class="btn-list">목록</a>
</div>
<script>
    var boardIdx = ${board.boardIdx};

</script>
<jsp:include page="../common/footer.jsp"/>
<jsp:include page="../common/modalscript.jsp"/>
</body>
</html>
