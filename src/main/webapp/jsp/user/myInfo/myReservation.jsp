<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!Doctype html>
<html lang="ko">
<head>
<jsp:include page="../common/head.jsp"/>
    <style>
        *{
            padding: 0;
            margin: 0;
        }
        .sidebar{
            width: 200px;
            border-radius: 6px;
            height: 360px;
            margin-top: 15px;
            margin-right: 50px;
        }
        .sidebar a{
            display: flex;
            color: #222222;
            padding-top: 10px;
            padding-bottom: 10px;
            text-decoration: none;
            text-indent: 20px;
            line-height: 30px;
            font-weight: bolder;

        }
        .sidebar li>a{

            font-size: 14px;
            width: 180px;

        }
        .sidebar li{
            border-bottom: 1px solid #222222;
        }
        #myMega a{
            border-bottom: 2px solid #222222;
        }
        #myMega>a:hover{

            color: gray;
        }
        .sidebar li>a:hover{
            color: gray;
        }

        #contents {
            width: 1100px;
            display: flex;
            margin-left: auto;
            margin-right: auto;
            min-height: 590px;
            margin-bottom: 20px;
            margin-top: 20px;
        }

        .content1 {
            width: 70%;
            flex-grow: 1;
            padding: 20px;
            box-sizing: border-box;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            margin-bottom: 50px;
            margin-top: 50px;
        }
        .content1 h1 {
            font-size: 24px;
            margin-bottom: 20px;
        }
        .content1 .filter {
            margin-bottom: 20px;
        }
        .content1 .filter select,
        .content1 .filter button {
            padding: 5px 10px;
            margin-right: 10px;
        }
        .content1 table {
            width: 100%;
            border-collapse: collapse;
        }
        .content1 table th,
        .content1 table td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: left;
        }
        .content1 table th {
            background-color: #f4f4f4;
        }

        .content1 > .ongoinReservation {
            display: block; /* 초기 상태로 예매 내역 표시 */
        }

        .content1 > div.active {
            display: block; /* active 클래스가 추가되면 표시 */
        }
    </style>
</head>
<body>
<jsp:include page="../common/header.jsp"/>
<div class="page-util">
    <div class="inner-wrap">
        <div class="location">
            <span>Home</span>
            <a href="/booking" title="예매 페이지로 이동">이벤트</a>
            <a href="/booking" title="빠른예매 페이지로 이동" class="pageUtila">진행중 이벤트</a>
        </div>
    </div>
</div>
<main>
    <div id="contents">
        <%--  사이드바  --%>
        <jsp:include page="../common/sideBar.jsp"/>
    <div class="content1">
        <!-- Page Title -->
        <h1>예매/구매 내역</h1>
        <div class="tabs">
            <div class="tab active" data-target="ongoinReservation">예매내역</div>
            <div class="tab" data-target="ongoinPurchase">구매내역</div>
        </div>
        <div class = "ongoinReservation" style="display : block;">
        <div class="filter">
            <select>
                <option>예매내역</option>
                <option>지난내역</option>
                <option>취소내역</option>
            </select>
            <select>
                <option>2025년 1월</option>
                <option>2024년 12월</option>
                <option>2024년 11월</option>
            </select>
            <button>조회</button>
        </div>

        <table class="table">
            <thead>
            <tr>
                <th>취소일시</th>
                <th>영화명</th>
                <th>극장</th>
                <th>상영일시</th>
                <th>취소금액</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td colspan="5" style="text-align:center;">취소내역이 없습니다.</td>
            </tr>
            </tbody>
        </table>
        </div>
            <div class = "ongoinPurchase" style="display : none;">
        <div class="filter">
            <select>
                <option>구매내역</option>
                <option>지난내역</option>
                <option>취소내역</option>
            </select>
            <select>
                <option>2025년 1월</option>
                <option>2024년 12월</option>
                <option>2024년 11월</option>
            </select>
            <button>조회</button>
        </div>

        <table class="table">
            <thead>
            <tr>
                <th>구매일시</th>
                <th>상품명</th>
                <th>취소금액</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td colspan="5" style="text-align:center;">취소내역이 없습니다.</td>
            </tr>
            </tbody>
        </table>
    </div>
    </div>
    </div>
</main>

<footer>
    <jsp:include page="../common/footer.jsp"/>
</footer>

</body>
<script>
    // 탭 요소와 콘텐츠 섹션 선택
    const tabs = document.querySelectorAll('.tab');
    const contents = document.querySelectorAll('.content1 .ongoinReservation, .content1 .ongoinPurchase');

    // 초기 상태 설정
    contents.forEach(content => {
        content.style.display = 'none'; // 모든 콘텐츠 숨기기
    });
    document.querySelector('.ongoinReservation').style.display = 'block'; // 예매내역 기본 표시

    // 탭 클릭 이벤트 처리
    tabs.forEach(tab => {
        tab.addEventListener('click', function() {
            // 모든 탭에서 'active' 클래스 제거
            tabs.forEach(t => t.classList.remove('active'));

            // 클릭된 탭에 'active' 클래스 추가
            this.classList.add('active');

            // 모든 콘텐츠 숨기기
            contents.forEach(content => {
                content.style.display = 'none';
                content.classList.remove('active');
            });

            // 클릭된 탭과 연결된 콘텐츠 표시
            const target = this.getAttribute('data-target');
            const targetContent = document.querySelector('.'+target);

            if (targetContent) { // 대상 콘텐츠가 존재하는 경우만 실행
                targetContent.style.display = 'block';
                targetContent.classList.add('active');
            }
        });
    });
</script>
</html>
