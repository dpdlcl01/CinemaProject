<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <jsp:include page="../common/head.jsp"/>
    <style>
        *{
            padding: 0;
            margin: 0;
        }


        /* 메인 콘텐츠 스타일 */
        .main-content {
            position: relative;
            flex-grow: 1;
            padding: 40px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            border-radius: 5px;
            margin-bottom: 50px;
            margin-top: 50px;
        }

        .main-content header1 {
            margin: 30px;
        }

        .main-content header h1 {
            font-size: 24px;
            margin-bottom: 10px;
        }

        .main-content header p {
            font-size: 14px;
            color: #555;
        }

        .register-btn {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 10px 15px;
            cursor: pointer;
            border-radius: 5px;
        }

        /* 테이블 스타일 */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: center;
        }

        th {
            background-color: #f4f4f4;
        }

        /* 푸터 스타일 */
        footer {
            text-align: center;
            margin-top: 20px;
            font-size: 12px;
            color: #777;
        }

        .contents {
            display : flex;
            min-height: 590px;
        }
    </style>
</head>
<div>
<jsp:include page="../common/header.jsp"/>
    <div class="page-util">
        <div class="inner-wrap">
            <div class="location">
                <span>Home</span>
                <img src="https://img.megabox.co.kr/static/pc/images/common/bg/bg-location-arr.png"/>
                <label>마이페이지</label>
                <img src="https://img.megabox.co.kr/static/pc/images/common/bg/bg-location-arr.png"/>
                <label>관람권</label>
            </div>
        </div>
    </div>
<div class="contents">

    <%--  사이드바  --%>
    <jsp:include page="../common/sideBar.jsp"/>

    <!-- 메인 콘텐츠 -->
    <main class="main-content">
        <!-- 헤더 -->
        <header>
            <h1>영화관람권</h1>
            <p>보유하신 영화관람권/예매권 내역입니다.<br>소지하신 지정(특정) 관람권은 등록 후 이용하실 수 있습니다.</p>
            <button class="register-btn">관람권 등록</button>
        </header>

        <!-- 테이블 -->
        <section class="ticket-table">
            <table>
                <thead>
                <tr>
                    <th>관람권명</th>
                    <th>유효기간</th>
                    <th>사용상태</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td colspan="3">조회된 관람권 내역이 없습니다.</td>
                </tr>
                </tbody>
                </table>
            </section>
        </main>
    </div>
</div>
<jsp:include page="../common/footer.jsp"/>
</body>
</html>