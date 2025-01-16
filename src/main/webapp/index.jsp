<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cinema Project</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f9;
        }

        header {
            background-color: #333;
            color: white;
            padding: 20px;
            text-align: center;
        }

        main {
            padding: 30px;
            text-align: center;
        }

        h1 {
            font-size: 2.5em;
            margin-bottom: 20px;
        }

        h2 {
            font-size: 1.8em;
            color: #444;
        }

        p {
            font-size: 1.2em;
            color: #666;
        }

        a {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }

        a:hover {
            background-color: #0056b3;
        }

        footer {
            background-color: #333;
            color: white;
            text-align: center;
            padding: 10px;
            position: fixed;
            bottom: 0;
            width: 100%;
        }
    </style>
</head>
<body>
<header>
    <h1>Cinema Project</h1>
</header>

<main>
    <h2>영화 예매 웹 애플리케이션</h2>

    <a href="UserController">Go to UserController</a><br/><br/>
    <p>메인 메뉴에 화면 연결시</p>
    <p><strong>header.jsp</strong>의 a태그에 다음 예시와 같이 추가<em>"UserController?type=movie"</em></p><br/><br/>
    <section>
        <h3>기능별 화면 확인</h3>
        <p>아래 버튼을 클릭하여 각각의 화면을 확인하세요:</p>
        <div>
            <a href="./jsp/user/event.jsp">이벤트 페이지</a>
            <a href="./jsp/user/announcement.jsp">공지사항 페이지</a>
            <a href="./jsp/user/noticepost.jsp">공지사항 글 확인 페이지</a>
            <a href="./jsp/user/MyInfo.jsp">내 정보 페이지</a>
            <a href="./jsp/user/product.jsp">상품 페이지</a>
        </div>
    </section>
</main>

<footer>
    <p>&copy; 2025 Cinema Project. All rights reserved.</p>
</footer>
</body>
</html>
