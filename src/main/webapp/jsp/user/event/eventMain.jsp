<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!Doctype html>
<html lang="ko">
<head>
    <jsp:include page="../common/head.jsp"/>
    <style>
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
        .event-bar-container {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }
        .event-bar-container .total-count {
            font-size: 16px;
        }
        .search-bar {
            border-bottom: 1px solid #423e3e;
            display: inline-block;
            position: relative;
            width: 200px;
            height: 30px;
        }
        .search-bar .input-text {
            display: inline-block;
            background-color: transparent;
            border: 0;
            color: #000;
            line-height: 25px;
            font-size: 16px;
            outline: none;
        }
        .search-bar .input-text:active {
            border: 0;
            outline: none;
        }
        .search-bar .btn {
            display: block;
            width: 30px;
            height: 100%;
            position: absolute;
            right: 0;
            top: 0;
            font-size: 0;
            line-height: 0;
            border: 0;
            background-color: transparent;
        }
        .search-bar .btn:hover {
            background-color: #0056b3;
        }
        .search-bar .btn .ico-search {
            display: inline-block;
            width: 18px;
            height: 18px;
            background-image: url(https://img.megabox.co.kr/static/pc/images/common/ico/ico-search-white.png);
            vertical-align: middle;
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
<jsp:include page="../common/header.jsp"/>
<!-- 추가된 page-util -->
<div class="page-util">
    <div class="inner-wrap">
        <div class="location">
            <span>Home</span>
            <a href="/booking" title="예매 페이지로 이동">이벤트</a>
            <a href="/booking" title="빠른예매 페이지로 이동" class="pageUtila">진행중 이벤트</a>
        </div>
    </div>
</div>
<a href="#" id="login-btn" title="로그인">비회원로그인</a>
        <div class="contents">
            <h1>이벤트</h1>
            <div class="tabs">
                <div class="tab active" data-target="ongoingevent">진행중 이벤트</div>
                <div class="tab" data-target="pastevent">지난 이벤트</div>
            </div>

            <div id="ongoingevent" class="content active">
                <p>응모하신 이벤트의 당첨 여부는 <a href="#">나의 응모결과 확인</a>을 통해 확인하실 수 있습니다.</p><br/>
                <div class="event-bar-container">
                    <div class="total-count">전체 13,329건</div>
                    <div class="search-bar">
                        <input type="text" placeholder="검색어를 입력해주세요." title="이벤트 검색" class="input-text">
                        <button class="btn">
                            <i class="ico-search"></i>
                            검색
                        </button>
                    </div>
                </div>
                <ul class="event-list">
                    <li class="event-item">
                        <div class="event-thumbnail">
                            <img src="${pageContext.request.contextPath}/css/user/images/event/관람권구매.png" alt="이벤트 이미지">
                        </div>
                        <div class="event-details">
                            <p class="event-title">[덕천] 관람패키지 & 문화누리 관람권 판매</p>
                            <p class="event-meta">2024.07.15 ~ 2025.12.31</p>
                        </div>
                    </li>
                    <li class="event-item">
                        <div class="event-thumbnail">
                            <img src="${pageContext.request.contextPath}/css/user/images/event/붕어빵할인.png" alt="이벤트 이미지">
                        </div>
                        <div class="event-details">
                            <p class="event-title">[삼척포] 겨울 맛이 붕어빵 할인!</p>
                            <p class="event-meta">2024.12.01 ~ 2025.12.31</p>
                        </div>
                    </li>
                    <li class="event-item">
                        <div class="event-thumbnail">
                            <img src="${pageContext.request.contextPath}/css/user/images/event/메리크리스마스.png" alt="이벤트 이미지">
                        </div>
                        <div class="event-details">
                            <p class="event-title">[성수] 미리 메리 크리스마스!</p>
                            <p class="event-meta">2024.11.13 ~ 2025.12.31</p>
                        </div>
                    </li>
                    <li class="event-item">
                        <div class="event-thumbnail">
                            <img src="${pageContext.request.contextPath}/css/user/images/event/메리크리스마스.png" alt="이벤트 이미지">
                        </div>
                        <div class="event-details">
                            <p class="event-title">[이수] 미리 메리 크리스마스!</p>
                            <p class="event-meta">2024.11.13 ~ 2025.12.31</p>
                        </div>
                    </li>
                    <li class="event-item">
                        <div class="event-thumbnail">
                            <img src="${pageContext.request.contextPath}/css/user/images/event/골드바이벤트.png" alt="이벤트 이미지">
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
                <div class="event-bar-container">
                    <div class="total-count">전체 13,329건</div>
                    <div class="search-bar">
                        <input type="text" placeholder="검색어를 입력해주세요." title="이벤트 검색" class="input-text">
                        <button class="btn">
                            <i class="ico-search"></i>
                            검색
                        </button>
                    </div>
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
          const h1Element = document.querySelector('.contents h1');
          const pageUtilA = document.querySelector('.location .pageUtila');

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
                pageUtilA.textContent = '진행중 이벤트';
              } else if (target === 'pastevent') {
                h1Element.textContent = '지난 이벤트';
                pageUtilA.textContent = '지난 이벤트'
              }

              // 부모 컨테이너 높이를 동적으로 업데이트
              adjustHeight();
            });
          });

          // 활성화된 콘텐츠 높이를 부모에 반영
          function adjustHeight() {
            const activeContent = document.querySelector('.content.active');

            if (activeContent) {
              const contentHeight = activeContent.offsetHeight;
              mainElement.style.minHeight = contentHeight + 'px';
            }
          }

          // 초기 높이 설정
          document.addEventListener('DOMContentLoaded', () => {
            adjustHeight();
            h1Element.textContent = '이벤트'; // 초기 h1 텍스트 설정
            pageUtilA.textContent = '진행중 이벤트'
          });
        </script>
<jsp:include page="../common/footer.jsp"/>
<jsp:include page="../common/modalscript.jsp"/>
</body>
</html>
