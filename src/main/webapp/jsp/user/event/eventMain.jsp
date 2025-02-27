<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            width: 150px;
            text-align: center;
            cursor: pointer;
            border-bottom: 2px solid transparent;
            font-size: 16px;
        }
        .tab.active {
            border-bottom: 2px solid #339eb2;
            color: #339eb2;
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
            margin: 20px auto;
            padding: 10px 20px;
            font-size: 16px;
            font-weight: bold;
            color: #333;
            background-color: #f9f9f9;
            border: 1px solid #ddd;
            border-radius: 30px;
            cursor: pointer;
            transition: background-color 0.3s, color 0.3s;
        }
        .load-more-btn:hover {
            background-color: #e9e9e9;
            color: #000;
        }
    </style>
</head>
<body>
<jsp:include page="../common/header.jsp"/>
<div class="page-util">
    <div class="inner-wrap">
        <div class="location">
            <span>Home</span>
            <img src="https://img.megabox.co.kr/static/pc/images/common/bg/bg-location-arr.png"/>
            <label>이벤트</label>
            <img src="https://img.megabox.co.kr/static/pc/images/common/bg/bg-location-arr.png"/>
            <label>진행중 이벤트</label>
        </div>
    </div>
</div>
<div class="contents">
    <h1>이벤트</h1>
    <div class="tabs">
        <a href="${pageContext.request.contextPath}/UserController?type=event&offset=0&pageSize=5" class="tab active" data-target="ongoingevent">진행중 이벤트</a>
        <a href="${pageContext.request.contextPath}/UserController?type=pastevent&offset=0&pageSize=5" class="tab" data-target="pastevent">지난 이벤트</a>
    </div>

    <div id="ongoingevent" class="content active">
        <div class="event-bar-container">
            <div class="total-count">전체 ${requestScope.totalEventCount}건</div>
        </div>
        <ul class="event-list">
            <c:forEach var="vo" items="${ar}">
                <li class="event-item">
                    <div class="event-thumbnail">
                        <img src="${vo.boardContent}" alt="이벤트 이미지">
                    </div>
                    <div class="event-details">
                        <a href="UserController?type=eventdetail&boardIdx=${vo.boardIdx}" class="event-title">${vo.boardTitle}</a>
                        <p class="event-meta">${vo.boardRegDate} ~ ${vo.boardExpDate}</p>
                    </div>
                </li>
            </c:forEach>
        </ul>
        <button class="load-more-btn" id="load-more-btn">더보기</button>
    </div>
</div>
<script>
  document.addEventListener("DOMContentLoaded", () => {
    let offset = 5; // 초기 데이터 오프셋 값
    const pageSize = 5; // 한 번에 가져올 데이터 개수

    console.log("Offset 초기값: " + offset + ", PageSize 초기값: " + pageSize);

    const loadMoreButton = document.querySelector("#load-more-btn");
    const eventList = document.querySelector(".event-list");

    // 데이터를 가져오는 함수
    const fetchData = async () => {
        const url = "${pageContext.request.contextPath}/UserController?type=event&offset=" + offset + "&pageSize=" + pageSize;

        console.log("Fetching data from URL: " + url);

      try {
        const response = await fetch(url);
        if (!response.ok) {
          throw new Error("HTTP error! status: " + response.status);
        }

        const events = await response.json();
        console.log("받은 데이터: ", events);

        if (events && events.length > 0) {
          events.forEach(event => {
            const li = document.createElement("li");
            li.classList.add("event-item");

              let html =
                  '<div class="event-thumbnail">' +
                  '<img src="' + event.boardContent + '" alt="이벤트 이미지">' +
                  '</div>' +
                  '<div class="event-details">' +
                  '<a href="${pageContext.request.contextPath}/UserController?type=eventdetail&boardIdx=' + event.boardIdx + '" class="event-title">' +
                  event.boardTitle +
                  '</a>' +
                  '<p class="event-meta">' + event.boardRegDate + ' ~ ' + event.boardExpDate + '</p>' +
                  '</div>'
              ;

            li.innerHTML = html;
            eventList.appendChild(li);
          });

          offset += pageSize; // 오프셋 증가
          loadMoreButton.style.display = "block"; // "더보기" 버튼 표시
        } else {
          loadMoreButton.style.display = "none"; // 데이터가 없으면 "더보기" 버튼 숨김
          if (offset === 0) {
            alert("해당 탭에 데이터가 없습니다.");
          }
        }
      } catch (error) {
        console.error("데이터 로드 중 오류 발생: ", error);
      }
    };

    // "더보기" 버튼 클릭 이벤트
    if (loadMoreButton) {
      loadMoreButton.addEventListener("click", fetchData);
    } else {
      console.error("더보기 버튼을 찾을 수 없습니다.");
    }
  });

</script>
<jsp:include page="../common/footer.jsp"/>
</body>
</html>
