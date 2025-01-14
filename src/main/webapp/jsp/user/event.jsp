<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!Doctype html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <!-- 사용자의 환경에 맞게 화면의 크기를 조정할 수 있도록 함. -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>라이프시어터, 메가박스</title>
    <meta property="name" id="metaTagTitle" content="라이프시어터,메가박스">

    <!-- 해당 페이지의 설명(검색 시 페이지의 제목 아래 페이지 내용의 요약 부분) -->
    <meta property="description" id="metaTagDtls" content="삶의 의미와 즐거움을 소통하는 공간, 함께 더 행복한 가치있는 콘텐츠를 추구하는 만남과 소통의 즐거움이 가득한 공간 메가박스 입니다.">

    <!-- 해당 컨텐츠 내용의 대표적인 키워드를 지정 -->
    <meta property="keywords" id="metaTagKeyword" content="메가박스,megabox,영화,영화관,극장,티켓,박스오피스,상영예정작,예매,오페라,싱어롱,큐레이션,필름소사이어티,이벤트,Movie,theater,Cinema,film,Megabox">

    <!-- OpenGraph -->
    <!-- 웹페이지가 소셜 미디어 또는 오픈그래프를 활용한 사이트로 공유될 때 사용되어지는 정보 -->
    <meta property="fb:app_id" id="fbAppId" content="546913502790694">
    <meta property="og:site_name" id="fbSiteName" content="메가박스">
    <meta property="og:type" id="fbType" content="movie">
    <meta property="og:url" id="fbUrl" content="https://www.megabox.co.kr/">
    <meta property="og:title" id="fbTitle" content="라이프시어터, 메가박스">
    <meta property="og:description" id="fbDtls" content="삶의 의미와 즐거움을 소통하는 공간, 함께 더 행복한 가치있는 콘텐츠를 추구하는 만남과 소통의 즐거움이 가득한 공간 메가박스 입니다.">
    <meta property="og:image" id="fbImg" content="https://img.megabox.co.kr/SharedImg/metaTag/2020/02/04/gFfTzMwwiCxhBwcUV5TRGMFX9Cmoj64W.jpg">
        <link rel="stylesheet" href="../../css/user/reset.css">
        <link rel="stylesheet" href="../../css/user/style.css">
    <script src="https://kit.fontawesome.com/d7f530ec10.js" crossorigin="anonymous"></script>
    <script src="../../js/app.js"></script>
    <style>
        .hightab {
            width: 1000px;
            margin: 50px auto;
        }
        .tabs {
            display: flex;
            justify-content: space-around;
            margin: 20px 0;
            border-bottom: 2px solid #ccc;
        }
        .tab {
            padding: 10px 0;
            width: 150px; /* 탭의 고정 너비 */
            text-align: center;
            cursor: pointer;
            border-bottom: 2px solid transparent;
            font-size: 16px;
        }
        .tab.active {
            border-bottom: 2px solid #6a5acd;
            color: #6a5acd;
        }
        .content {
            display: none;
            margin-top: 20px;
        }
        .content.active {
            display: block;
        }
        h1 {
            margin: 50px 0 20px 0; /* 위, 오른쪽, 아래, 왼쪽 */
            text-align: left;
        }
        .search-bar {
            display: flex;
            justify-content: flex-end;
            align-items: center;
            margin-bottom: 20px;
            gap: 10px;
        }
        .search-bar select, .search-bar input {
            padding: 8px;
            font-size: 14px;
        }
        .search-bar input {
            width: 250px; /* 입력 필드 너비 */
        }
        .search-bar button {
            padding: 8px 15px;
            font-size: 14px;
            color: #fff;
            background-color: #007bff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .search-bar button:hover {
            background-color: #0056b3;
        }
        table {
            width: 100%;
            height: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        table, th, td {
            border: 1px solid #ccc;
        }
        th, td {
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #f4f4f4;
        }
        .pagination {
            margin-top: 20px;
            text-align: center;
        }
        .pagination a {
            margin: 0 5px;
            text-decoration: none;
            color: #007bff;
            font-weight: bold;
        }
        .pagination a.active {
            color: #fff;
            background-color: #007bff;
            padding: 5px 10px;
            border-radius: 5px;
        }
        .event-list {
            list-style: none;
            padding: 0;
            margin: 0;
        }
        .event-item {
            display: flex;
            align-items: flex-start;
            margin-bottom: 20px;
            border-bottom: 1px solid #ccc;
            padding-bottom: 20px;
        }
        .event-thumbnail {
            flex: 0 0 80px;
            margin-right: 20px;
        }
        .event-thumbnail img {
            width: 80px;
            height: 80px;
            object-fit: cover;
        }
        .event-details {
            flex: 1;
        }
        .event-title {
            font-size: 18px;
            margin: 0;
            font-weight: bold;
            color: #000;
        }
        .event-meta {
            font-size: 14px;
            color: #888;
            margin-top: 5px;
        }
        .load-more-btn {
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 20px auto; /* 중앙 정렬 */
            padding: 10px 20px; /* 버튼 내부 여백 */
            font-size: 16px; /* 텍스트 크기 */
            font-weight: bold; /* 텍스트 굵기 */
            color: #333; /* 텍스트 색상 */
            background-color: #f9f9f9; /* 버튼 배경 색상 */
            border: 1px solid #ddd; /* 테두리 */
            border-radius: 30px; /* 둥근 모서리 */
            cursor: pointer; /* 클릭 가능한 상태 표시 */
            transition: background-color 0.3s, color 0.3s; /* 호버 효과 부드럽게 */
        }

        .load-more-btn:hover {
            background-color: #e9e9e9; /* 호버 시 배경 색상 */
            color: #000; /* 호버 시 텍스트 색상 */
        }

        .load-more-btn:focus {
            outline: none; /* 버튼 포커스 시 외곽선 제거 */
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.3); /* 포커스 시 약간의 그림자 */
        }
    </style>
</head>
<body>
<jsp:include page="header.jsp"/>
<main>
    <section>
        <div class="hightab">
            <h1>공지사항</h1>
            <div class="tabs">
                <div class="tab active" data-target="ongoingevent">진행중 이벤트</div>
                <div class="tab" data-target="pastevent">지난 이벤트</div>
            </div>

            <div id="ongoingevent" class="content active">
                <p>응모하신 이벤트의 당첨 여부는 <a href="#">나의 응모결과 확인</a>을 통해 확인하실 수 있습니다.</p><br/>
                <p>전체 13,329건</p><br/>
                <div class="search-bar">
                    <input type="text" placeholder="검색어를 입력해 주세요.">
                    <button>검색</button>
                </div>
                <ul class="event-list">
                    <li class="event-item">
                        <div class="event-thumbnail">
                            <img src="images/관람권구매.png" alt="이벤트 이미지">
                        </div>
                        <div class="event-details">
                            <p class="event-title">[덕천] 관람패키지 & 문화누리 관람권 판매</p>
                            <p class="event-meta">2024.07.15 ~ 2025.12.31</p>
                        </div>
                    </li>
                    <li class="event-item">
                        <div class="event-thumbnail">
                            <img src="images/붕어빵할인.png" alt="이벤트 이미지">
                        </div>
                        <div class="event-details">
                            <p class="event-title">[삼척포] 겨울 맛이 붕어빵 할인!</p>
                            <p class="event-meta">2024.12.01 ~ 2025.12.31</p>
                        </div>
                    </li>
                    <li class="event-item">
                        <div class="event-thumbnail">
                            <img src="images/메리크리스마스.png" alt="이벤트 이미지">
                        </div>
                        <div class="event-details">
                            <p class="event-title">[성수] 미리 메리 크리스마스!</p>
                            <p class="event-meta">2024.11.13 ~ 2025.12.31</p>
                        </div>
                    </li>
                    <li class="event-item">
                        <div class="event-thumbnail">
                            <img src="images/메리크리스마스.png" alt="이벤트 이미지">
                        </div>
                        <div class="event-details">
                            <p class="event-title">[이수] 미리 메리 크리스마스!</p>
                            <p class="event-meta">2024.11.13 ~ 2025.12.31</p>
                        </div>
                    </li>
                    <li class="event-item">
                        <div class="event-thumbnail">
                            <img src="images/골드바이벤트.png" alt="이벤트 이미지">
                        </div>
                        <div class="event-details">
                            <p class="event-title">[제주지역] 골드바 매일매일 1g 증정 이벤트</p>
                            <p class="event-meta">2024.11.13 ~ 2025.12.31</p>
                        </div>
                    </li>
                </ul>
                <button class="load-more-btn">더보기</button>
            </div>

            <div id="pastevent" class="content">
                <p>응모하신 이벤트의 당첨 여부는 <a href="#">나의 응모결과 확인</a>을 통해 확인하실 수 있습니다.</p><br/>
                <p>전체 13,329건</p><br/>
                <div class="search-bar">
                    <input type="text" placeholder="검색어를 입력해 주세요.">
                    <button>검색</button>
                </div>
                <ul class="event-list">
                    <li class="event-item">
                        <div class="event-thumbnail">
                            <img src="images/관람권구매.png" alt="이벤트 이미지">
                        </div>
                        <div class="event-details">
                            <p class="event-title">[덕천] 관람패키지 & 문화누리 관람권 판매</p>
                            <p class="event-meta">2024.07.15 ~ 2025.12.31</p>
                        </div>
                    </li>
                    <li class="event-item">
                        <div class="event-thumbnail">
                            <img src="images/붕어빵할인.png" alt="이벤트 이미지">
                        </div>
                        <div class="event-details">
                            <p class="event-title">[삼척포] 겨울 맛이 붕어빵 할인!</p>
                            <p class="event-meta">2024.12.01 ~ 2025.12.31</p>
                        </div>
                    </li>
                    <li class="event-item">
                        <div class="event-thumbnail">
                            <img src="images/메리크리스마스.png" alt="이벤트 이미지">
                        </div>
                        <div class="event-details">
                            <p class="event-title">[성수] 미리 메리 크리스마스!</p>
                            <p class="event-meta">2024.11.13 ~ 2025.12.31</p>
                        </div>
                    </li>
                    <li class="event-item">
                        <div class="event-thumbnail">
                            <img src="images/메리크리스마스.png" alt="이벤트 이미지">
                        </div>
                        <div class="event-details">
                            <p class="event-title">[이수] 미리 메리 크리스마스!</p>
                            <p class="event-meta">2024.11.13 ~ 2025.12.31</p>
                        </div>
                    </li>
                    <li class="event-item">
                        <div class="event-thumbnail">
                            <img src="images/골드바이벤트.png" alt="이벤트 이미지">
                        </div>
                        <div class="event-details">
                            <p class="event-title">[제주지역] 골드바 매일매일 1g 증정 이벤트</p>
                            <p class="event-meta">2024.11.13 ~ 2025.12.31</p>
                        </div>
                    </li>
                </ul>
                <button class="load-more-btn">더보기</button>
            </div>
        </div>

        <script>
          const tabs = document.querySelectorAll('.tab');
          const contents = document.querySelectorAll('.content');
          const h1Element = document.querySelector('.hightab h1');

          tabs.forEach(tab => {
            tab.addEventListener('click', () => {
              tabs.forEach(t => t.classList.remove('active'));
              tab.classList.add('active');

              const target = tab.getAttribute('data-target');
              contents.forEach(content => {
                content.classList.remove('active');
                if (content.id === target) {
                  content.classList.add('active');
                }
              });

              // h1의 텍스트 변경
              if (target === 'ongoingevent') {
                h1Element.textContent = '진행중 이벤트';
              } else if (target === 'pastevent') {
                h1Element.textContent = '지난 이벤트';
              }

              // 부모 컨테이너 높이를 동적으로 업데이트
              adjustHeight();
            });
          });

          // 활성화된 콘텐츠 높이를 부모에 반영
          function adjustHeight() {
            const activeContent = document.querySelector('.content.active');
            const mainElement = document.querySelector('main');

            if (activeContent) {
              const contentHeight = activeContent.offsetHeight;
              mainElement.style.minHeight = contentHeight + 'px';
            }
          }

          // 초기 높이 설정
          document.addEventListener('DOMContentLoaded', () => {
            adjustHeight();
            h1Element.textContent = '진행중 이벤트'; // 초기 h1 텍스트 설정
          });
        </script>
    </section>
</main>
<jsp:include page="footer.jsp"/>
</body>
</html>
