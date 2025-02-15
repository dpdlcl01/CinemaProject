<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>CINEFEEL - NEW OCEAN ESSENTIAL</title>
    <script>
        function showTab(tab) {
            if (tab === 'id') {
                document.getElementById('findId').style.display = 'block';
                document.getElementById('findPw').style.display = 'none';
            } else {
                document.getElementById('findId').style.display = 'none';
                document.getElementById('findPw').style.display = 'block';
            }
        }
    </script>
    <style>
        .tab-container {
            display: flex;
            margin-bottom: 10px;
        }
        .tab-button {
            padding: 10px;
            cursor: pointer;
            border: 1px solid #ddd;
            background-color: #f1f1f1;
            margin-right: 5px;
        }
        .tab-button.active {
            background-color: #ddd;
            font-weight: bold;
        }
    </style>
</head>
<body onload="showTab('id')">

<div class="tab-container">
    <div class="tab-button active" onclick="showTab('id')">아이디 찾기</div>
    <div class="tab-button" onclick="showTab('pw')">비밀번호 찾기</div>
</div>

<div id="findId">
    <%@ include file="findId.jsp" %>
</div>

<div id="findPw" style="display: none;">
    <%@ include file="findPw.jsp" %>
</div>

</body>
</html>
