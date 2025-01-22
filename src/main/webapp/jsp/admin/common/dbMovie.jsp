<%@ page language="java" contentType="text/html; charset=EUC-KR"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>OPEN API 영화 데이터 확인용 임시 페이지</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }
        table th, table td {
            border: 1px solid #000;
            padding: 8px;
            text-align: center;
        }
        table caption {
            text-indent: -9999px;
            height: 0px;
        }
        th {
            background-color: #f4f4f4;
        }
    </style>
</head>
<body>
<div id="wrap">
    <header>
        <h1>OPEN API 영화 데이터 확인용 임시 페이지</h1>
    </header>
    <article>
        <c:if test="${empty requestScope.movieList}">
            <p>해당하는 영화 데이터가 없습니다.</p>
        </c:if>
        <table>
            <caption>영화 상세 정보 테이블</caption>
            <colgroup>
                <col width="100px"/>
                <col width="100px"/>
                <col width="100px"/>
                <col width="100px"/>
                <col width="70px"/>
                <col width="70px"/>
                <col width="70px"/>
                <col width="60px"/>
                <col width="70px"/>
                <col width="70px"/>
                <col width="50px"/>
                <col width="50px"/>
                <col width="120px"/>
                <col width="120px"/> <!-- 포스터 컬럼 -->
                <col width="*"/>
            </colgroup>
            <thead>
            <tr>
                <th>영화코드</th>
                <th>제목</th>
                <th>영문 제목</th>
                <th>개봉일</th>
                <th>상영시간</th>
                <th>장르</th>
                <th>감독</th>
                <th>관람등급</th>
                <th>예매율</th>
                <th>누적 관객수</th>
                <th>영화 상태</th>
                <th>제작 국가</th>
                <th>배우</th>
                <th>포스터</th>
                <th>줄거리</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="mvo" items="${requestScope.movieList}">
                <tr>
                    <td>${mvo.movieCd}</td>
                    <td>${mvo.movieTitle}</td>
                    <td>${mvo.movieTitleEn}</td>
                    <td>${mvo.movieDate}</td>
                    <td>${mvo.movieTime}</td>
                    <td>${mvo.movieGenre}</td>
                    <td>${mvo.movieDirector}</td>
                    <td>${mvo.movieGrade}</td>
                    <td>${mvo.movieReservationRate}</td>
                    <td>${mvo.movieTotalAudience}</td>
                    <td>${mvo.movieStatus}</td>
                    <td>${mvo.movieNation}</td>
                    <td>${mvo.movieActors}</td>
                    <td><img src="${mvo.moviePosterUrl}" alt="포스터" style="width:100px; height:auto;"></td>
                    <td>${mvo.movieInfo}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </article>
</div>
</body>
</html>
