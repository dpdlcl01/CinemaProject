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
    <h1>공지사항</h1>
    <h1 class="notice-title">[지점] 코엑스시사회 진행에 따른 고객 안내 (1월 14일)</h1>
    <div class="notice-info">
        <span>영화관: 코엑스</span> | <span>구분: 공지</span> | <span>등록일: 2025.01.10</span>
    </div>
    <div class="notice-content">
        <p>안녕하세요.<br>메가박스 코엑스지점입니다.</p>
        <p>1월 14일 화요일 19:05~20:20 시간대에는 일부 상영관 시사회 진행으로 인해 일반 영화 관람에 제한이 있을 수 있습니다.</p>
        <p>영화를 관람하실 고객께서는 지점 방문 전 홈페이지, 모바일 앱/웹 상으로 상영시간표를 미리 확인하셔서 영화 예매 시 참고 부탁드립니다.</p>
        <p>아울러 해당 시사회는 배급사가 코엑스지점을 대관하여 진행하는 행사로 외부 업체에서 별도 당첨자에게 티켓 배부를 진행하는 점 안내 드립니다.</p>
        <p>감사합니다.</p>
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
                <a href="#">이전글이 없습니다.</a>
            </td>
        </tr>
        <tr>
            <td>
                <span>다음</span>
            </td>
            <td>
                <a href="#">[토스페이-롯데카드] 시스템 점검 안내 (1/13)</a>
            </td>
        </tr>
        </tbody>
    </table>
    <a href="#" class="btn-list">목록</a>
</div>
<jsp:include page="../common/footer.jsp"/>
<jsp:include page="../common/modalscript.jsp"/>
</body>
</html>
