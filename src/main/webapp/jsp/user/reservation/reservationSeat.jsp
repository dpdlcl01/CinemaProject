<%@ page import="mybatis.vo.SeatVO" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <jsp:include page="../common/head.jsp"/>
</head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/seat.css">
<body>
<div id="modalOverlay" class="modal-overlay"></div>
<!-- header 영역 -->
<jsp:include page="../common/header.jsp"/>
<div class="page-util">
  <div class="inner-wrap">
    <div class="location">
      <span>Home</span>
      <img src="https://img.megabox.co.kr/static/pc/images/common/bg/bg-location-arr.png"/>
      <label>예매</label>
      <img src="https://img.megabox.co.kr/static/pc/images/common/bg/bg-location-arr.png"/>
      <label>빠른예매</label>
    </div>
  </div>
</div>
<div class="contents">
  <div class="res-main">
    <h1 class="res-title">빠른예매</h1>
    <div class="seat-selection-container">
      <!-- 좌석 선택 -->
      <div class="seat-selection">
        <div class="header">
          <div class="counter">
            <label for="adult">성인</label>
            <button class="btn decrease" data-target="adult">-</button>
            <span id="adult" class="value">0</span>
            <button class="btn increase" data-target="adult">+</button>
          </div>
          <div class="counter">
            <label for="student">청소년</label>
            <button class="btn decrease" data-target="student">-</button>
            <span id="student" class="value">0</span>
            <button class="btn increase" data-target="student">+</button>
          </div>
          <button class="reset">초기화</button>
        </div>
        <%-- screenType에 따라 다른 레이아웃 출력 --%>
        <%
          Integer screenType = (Integer) request.getAttribute("screenType"); // 전달받은 screenType 값
          System.out.println(screenType);
          if (screenType == null) {
            screenType = 1; // 기본값 설정
          }
        %>
        <div class="seat-container">
          <div class="screen">SCREEN</div>
          <c:choose>
            <c:when test="${screenType == 1 || screenType == 2}">
              <%-- A set --%>
              <div class="line" data-row="Front">
                <button class="row-label">&nbsp;</button>
                <!-- 왼쪽 출구 -->
                <div class="seat-group">
                  <button class="unavailable-seat" data-seat="Front1"></button>
                  <button class="door-left" data-seat="door-left"></button>
                </div>

                <!-- 가운데 좌석 그룹 -->
                <div class="seat-group">
                  <button class="unavailable-seat" data-seat="Front2"></button>
                  <button class="unavailable-seat" data-seat="Front3"></button>
                  <button class="unavailable-seat" data-seat="Front4"></button>
                </div>

                <!-- 오른쪽 출구 -->
                <div class="seat-group-right">
                  <button class="unavailable-seat" data-seat="Front5"></button>
                </div>
              </div>
              <c:forEach var="row" items="A,B,C,D">
                <div class="line" data-row="${row}">
                  <button class="row-label">${row}</button>

                  <!-- 왼쪽 좌석 그룹 -->
                  <div class="seat-group">
                    <c:forEach var="i" begin="1" end="1">
                      <c:set var="computedSeatNumber" value="${row}${i}" />
                      <c:set var="seatData" value="N/A" />

                      <c:forEach var="seat" items="${availableSeats}">
                        <c:if test="${seat.seatNumber == computedSeatNumber}">
                          <c:choose>
                            <c:when test="${seat.seatStatus == 0}">
                              <c:set var="seatData" value="${seat.seatIdx}" />
                            </c:when>
                            <c:otherwise>
                              <c:set var="seatData" value="예약됨" />
                            </c:otherwise>
                          </c:choose>
                        </c:if>
                      </c:forEach>

                      <button class="seat ${seatData == 'N/A' ? 'unavailable-seat' : (seatData == '예약됨' ? 'finish' : 'available-seat')}"
                              data-seatidx="${seatData}"
                              data-seat="${computedSeatNumber}"
                        ${seatData == 'N/A' || seatData == '예약됨' ? 'disabled' : ''}>
                          ${i}
                      </button>
                    </c:forEach>
                  </div>

                  <!-- 가운데 좌석 그룹 -->
                  <div class="seat-group-center">
                    <c:forEach var="i" begin="2" end="4">
                      <c:set var="computedSeatNumber" value="${row}${i}" />
                      <c:set var="seatData" value="N/A" />

                      <c:forEach var="seat" items="${availableSeats}">
                        <c:if test="${seat.seatNumber == computedSeatNumber}">
                          <c:choose>
                            <c:when test="${seat.seatStatus == 0}">
                              <c:set var="seatData" value="${seat.seatIdx}" />
                            </c:when>
                            <c:otherwise>
                              <c:set var="seatData" value="예약됨" />
                            </c:otherwise>
                          </c:choose>
                        </c:if>
                      </c:forEach>

                      <button class="seat ${seatData == 'N/A' ? 'unavailable-seat' : (seatData == '예약됨' ? 'finish' : 'available-seat')}"
                              data-seatidx="${seatData}"
                              data-seat="${computedSeatNumber}"
                        ${seatData == 'N/A' || seatData == '예약됨' ? 'disabled' : ''}>
                          ${i}
                      </button>
                    </c:forEach>
                  </div>

                  <!-- 오른쪽 좌석 그룹 -->
                  <div class="seat-group-right">
                    <c:forEach var="i" begin="5" end="5">
                      <c:set var="computedSeatNumber" value="${row}${i}" />
                      <c:set var="seatData" value="N/A" />

                      <c:forEach var="seat" items="${availableSeats}">
                        <c:if test="${seat.seatNumber == computedSeatNumber}">
                          <c:choose>
                            <c:when test="${seat.seatStatus == 0}">
                              <c:set var="seatData" value="${seat.seatIdx}" />
                            </c:when>
                            <c:otherwise>
                              <c:set var="seatData" value="예약됨" />
                            </c:otherwise>
                          </c:choose>
                        </c:if>
                      </c:forEach>

                      <button class="seat ${seatData == 'N/A' ? 'unavailable-seat' : (seatData == '예약됨' ? 'finish' : 'available-seat')}"
                              data-seatidx="${seatData}"
                              data-seat="${computedSeatNumber}"
                        ${seatData == 'N/A' || seatData == '예약됨' ? 'disabled' : ''}>
                          ${i}
                      </button>
                    </c:forEach>
                  </div>
                </div>
              </c:forEach>

              <div class="line" data-row="Back">
                <button class="row-label">&nbsp;</button>

                <!-- 왼쪽 출구 -->
                <div class="seat-group">
                  <button class="unavailable-seat" data-seat="Back1"></button>
                </div>

                <!-- 가운데 좌석 그룹 + 출구 -->
                <div class="seat-group-center">
                  <button class="unavailable-seat" data-seat="Back2"></button>
                  <button class="unavailable-seat" data-seat="Back3"></button>
                  <button class="unavailable-seat" data-seat="Back4"></button>
                  <button class="door-top" data-seat="door-top"></button>
                </div>

                <!-- 오른쪽 좌석 -->
                <div class="seat-group">
                  <button class="unavailable-seat" data-seat="Back5"></button>
                </div>
              </div>
            </c:when>
            <c:when test="${screenType == 3}">
              <%-- B set --%>
              <div class="line" data-row="Front">
                <button class="row-label">&nbsp;</button>
                <div class="seat-group">
                  <!-- 왼쪽 출구 -->
                  <button class="door-left" data-seat="door-left"></button>
                  <!-- 사용 불가능한 좌석 (Front1 ~ Front8) -->
                  <c:forEach var="i" begin="1" end="8">
                    <button class="unavailable-seat" data-seat="Front${i}"></button>
                  </c:forEach>
                </div>
              </div>
              <c:forEach var="row" items="A,B,C">
                <div class="line" data-row="${row}">
                  <button class="row-label">${row}</button>

                  <!-- 왼쪽 좌석 그룹 -->
                  <div class="seat-group">
                    <c:choose>
                      <c:when test="${row == 'C'}">
                        <!-- C열: 1, 2번 좌석을 왼쪽에 배치 -->
                        <c:forEach var="i" begin="1" end="2">
                          <c:set var="computedSeatNumber" value="${row}${i}" />
                          <c:set var="seatData" value="N/A" />

                          <c:forEach var="seat" items="${availableSeats}">
                            <c:if test="${seat.seatNumber == computedSeatNumber}">
                              <c:choose>
                                <c:when test="${seat.seatStatus == 0}">
                                  <c:set var="seatData" value="${seat.seatIdx}" />
                                </c:when>
                                <c:otherwise>
                                  <c:set var="seatData" value="예약됨" />
                                </c:otherwise>
                              </c:choose>
                            </c:if>
                          </c:forEach>

                          <button class="seat ${seatData == 'N/A' ? 'unavailable-seat' : (seatData == '예약됨' ? 'finish' : 'available-seat')}"
                                  data-seatidx="${seatData}"
                                  data-seat="${computedSeatNumber}"
                            ${seatData == 'N/A' || seatData == '예약됨' ? 'disabled' : ''}>
                              ${i}
                          </button>
                        </c:forEach>

                        <!-- C열에서 가운데 4개의 빈 좌석 추가 -->
                        <c:forEach var="i" begin="1" end="4">
                          <button class="unavailable-seat"></button>
                        </c:forEach>
                      </c:when>
                      <c:otherwise>
                        <!-- 일반 행(A, B, D)에서는 1~4번을 왼쪽에 배치 -->
                        <c:forEach var="i" begin="1" end="4">
                          <c:set var="computedSeatNumber" value="${row}${i}" />
                          <c:set var="seatData" value="N/A" />

                          <c:forEach var="seat" items="${availableSeats}">
                            <c:if test="${seat.seatNumber == computedSeatNumber}">
                              <c:choose>
                                <c:when test="${seat.seatStatus == 0}">
                                  <c:set var="seatData" value="${seat.seatIdx}" />
                                </c:when>
                                <c:otherwise>
                                  <c:set var="seatData" value="예약됨" />
                                </c:otherwise>
                              </c:choose>
                            </c:if>
                          </c:forEach>

                          <button class="seat ${seatData == 'N/A' ? 'unavailable-seat' : (seatData == '예약됨' ? 'finish' : 'available-seat')}"
                                  data-seatidx="${seatData}"
                                  data-seat="${computedSeatNumber}"
                            ${seatData == 'N/A' || seatData == '예약됨' ? 'disabled' : ''}>
                              ${i}
                          </button>
                        </c:forEach>
                      </c:otherwise>
                    </c:choose>
                  </div>

                  <!-- C열일 때만 공백 추가 -->
                  <c:if test="${row == 'C'}">
                    <div class="seat-space"></div> <!-- 이 부분이 공백을 만들 것 -->
                  </c:if>

                  <!-- 오른쪽 좌석 그룹 -->
                  <div class="seat-group-right">
                    <c:choose>
                      <c:when test="${row == 'C'}">
                        <c:forEach var="i" begin="3" end="4">
                          <c:set var="computedSeatNumber" value="${row}${i}" />
                          <c:set var="seatData" value="N/A" />

                          <c:forEach var="seat" items="${availableSeats}">
                            <c:if test="${seat.seatNumber == computedSeatNumber}">
                              <c:choose>
                                <c:when test="${seat.seatStatus == 0}">
                                  <c:set var="seatData" value="${seat.seatIdx}" />
                                </c:when>
                                <c:otherwise>
                                  <c:set var="seatData" value="예약됨" />
                                </c:otherwise>
                              </c:choose>
                            </c:if>
                          </c:forEach>

                          <button class="seat ${seatData == 'N/A' ? 'unavailable-seat' : (seatData == '예약됨' ? 'finish' : 'available-seat')}"
                                  data-seatidx="${seatData}"
                                  data-seat="${computedSeatNumber}"
                            ${seatData == 'N/A' || seatData == '예약됨' ? 'disabled' : ''}>
                              ${i}
                          </button>
                        </c:forEach>
                      </c:when>
                      <c:otherwise>
                        <c:forEach var="i" begin="5" end="8">
                          <c:set var="computedSeatNumber" value="${row}${i}" />
                          <c:set var="seatData" value="N/A" />

                          <c:forEach var="seat" items="${availableSeats}">
                            <c:if test="${seat.seatNumber == computedSeatNumber}">
                              <c:choose>
                                <c:when test="${seat.seatStatus == 0}">
                                  <c:set var="seatData" value="${seat.seatIdx}" />
                                </c:when>
                                <c:otherwise>
                                  <c:set var="seatData" value="예약됨" />
                                </c:otherwise>
                              </c:choose>
                            </c:if>
                          </c:forEach>

                          <button class="seat ${seatData == 'N/A' ? 'unavailable-seat' : (seatData == '예약됨' ? 'finish' : 'available-seat')}"
                                  data-seatidx="${seatData}"
                                  data-seat="${computedSeatNumber}"
                            ${seatData == 'N/A' || seatData == '예약됨' ? 'disabled' : ''}>
                              ${i}
                          </button>
                        </c:forEach>
                      </c:otherwise>
                    </c:choose>
                  </div>
                </div>
              </c:forEach>
              <div class="line" data-row="Back">
                <button class="row-label">&nbsp;</button>
                <div class="seat-group">
                  <!-- 사용 불가능한 좌석 (Back1 ~ Back4) -->
                  <c:forEach var="i" begin="1" end="3">
                    <button class="unavailable-seat" data-seat="Back${i}"></button>
                  </c:forEach>
                  <!-- 상단 출구 -->
                  <button class="door-top" data-seat="door-top"></button>
                  <!-- 사용 불가능한 좌석 (Back5 ~ Back8) -->
                  <c:forEach var="i" begin="6" end="8">
                    <button class="unavailable-seat" data-seat="Back${i}"></button>
                  </c:forEach>
                </div>
              </div>
            </c:when>
            <c:when test="${screenType == 4 || screenType == 5}">
              <%-- C set --%>
              <div class="line" data-row="Front">
                <button class="row-label"> </button>
                <!-- 왼쪽 좌석 그룹 -->
                <div class="seat-group">
                  <c:forEach var="i" begin="1" end="1">
                    <button class="unavailable-seat" data-seat="Front${i}"></button>
                  </c:forEach>

                  <!-- 출입구 버튼 -->
                  <button class="door-left" data-seat="door-left"></button>

                  <c:forEach var="i" begin="3" end="4">
                    <button class="unavailable-seat" data-seat="Front${i}"></button>
                  </c:forEach>
                </div>

                <!-- 가운데 빈 좌석 추가 -->
                <div class="seat-space"></div>

                <!-- 오른쪽 좌석 그룹 -->
                <div class="seat-group-right">
                  <c:forEach var="i" begin="5" end="6">
                    <button class="unavailable-seat" data-seat="Front${i}"></button>
                  </c:forEach>
                </div>
              </div>
              <c:forEach var="row" items="A,B,C,D">
                <div class="line" data-row="${row}">
                  <button class="row-label">${row}</button>
                  <!-- A, B, D 행 (일반적인 좌석 배치) -->
                  <div class="seat-group">
                    <c:forEach var="i" begin="1" end="4">
                      <c:set var="computedSeatNumber" value="${row}${i}" />
                      <c:set var="seatData" value="N/A" />

                      <c:forEach var="seat" items="${availableSeats}">
                        <c:if test="${seat.seatNumber == computedSeatNumber}">
                          <c:choose>
                            <c:when test="${seat.seatStatus == 0}">
                              <c:set var="seatData" value="${seat.seatIdx}" />
                            </c:when>
                            <c:otherwise>
                              <c:set var="seatData" value="예약됨" />
                            </c:otherwise>
                          </c:choose>
                        </c:if>
                      </c:forEach>

                      <button class="seat ${seatData == 'N/A' ? 'unavailable-seat' : (seatData == '예약됨' ? 'finish' : 'available-seat')}"
                              data-seatidx="${seatData}"
                              data-seat="${computedSeatNumber}"
                        ${seatData == 'N/A' || seatData == '예약됨' ? 'disabled' : ''}>
                          ${i}
                      </button>
                    </c:forEach>
                  </div>
                  <div class="seat-group-right">
                    <c:forEach var="i" begin="5" end="6">
                      <c:set var="computedSeatNumber" value="${row}${i}" />
                      <c:set var="seatData" value="N/A" />

                      <c:forEach var="seat" items="${availableSeats}">
                        <c:if test="${seat.seatNumber == computedSeatNumber}">
                          <c:choose>
                            <c:when test="${seat.seatStatus == 0}">
                              <c:set var="seatData" value="${seat.seatIdx}" />
                            </c:when>
                            <c:otherwise>
                              <c:set var="seatData" value="예약됨" />
                            </c:otherwise>
                          </c:choose>
                        </c:if>
                      </c:forEach>

                      <button class="seat ${seatData == 'N/A' ? 'unavailable-seat' : (seatData == '예약됨' ? 'finish' : 'available-seat')}"
                              data-seatidx="${seatData}"
                              data-seat="${computedSeatNumber}"
                        ${seatData == 'N/A' || seatData == '예약됨' ? 'disabled' : ''}>
                          ${i}
                      </button>
                    </c:forEach>
                  </div>
                </div>
              </c:forEach>
              <div class="line" data-row="Back">
                <button class="row-label"> </button>

                <div class="seat-group">
                  <!-- 1~4번 좌석 -->
                  <c:forEach var="i" begin="1" end="4">
                    <button class="unavailable-seat" data-seat="Back${i}"></button>
                  </c:forEach>

                  <!-- 출구 버튼 (door-top) -->
                  <div class="seat-space"></div>
                  <button class="door-top" data-seat="door-top"></button>
                  <div class="seat-space"></div>

                  <!-- 5~6번 좌석 -->
                  <c:forEach var="i" begin="5" end="6">
                    <button class="unavailable-seat" data-seat="Back${i}"></button>
                  </c:forEach>
                </div>
              </div>
            </c:when>
          </c:choose>
        </div>
      </div>
      <!-- 영화 정보 -->
      <div class="movie-container">
        <div class="movie-info">
          <img src="${pageContext.request.contextPath}/css/user/images/ratings/${movieVO.movieGrade}.png" alt="${movieVO.movieGrade}등급" class="movie-grade-image"/>
          <div class="movie-text-group">
            <p class="movie-title">${movieVO.movieTitle}</p>
            <p class="movie-runningTime">${movieVO.movieTime}분</p>
          </div>
        </div>
        <div class="movie-info-area">
          <div class="movie-details">
            <p class="movie-type">${theaterVO.theaterName}</p>
            <p class="movie-type">${movieType} ${screenIdx}관</p>
            <p class="movie-time">
              ${formattedDate} <br>
              ${formattedStartTime} ~ ${formattedEndTime}
            </p>
          </div>
          <img src="${movieVO.moviePosterUrl}" alt="검은 수녀들 포스터" class="poster">
        </div>
        <div class="choose-seat-area">
          <div class="legend">
            <ul class="list">
              <li>
                <div class="seat-condition choice" title="선택한 좌석"></div>
                <em>선택</em></li>
              <li>
                <div class="seat-condition finish" title="예매 완료"></div>
                <em>예매완료</em></li>
              <li>
                <div class="seat-condition impossible" title="선택 불가"></div>
                <em>선택불가</em></li>
            </ul>
          </div>
          <div class="seat-num">
            <p class="tit">선택좌석</p>
            <div class="my-seat"></div>
          </div>
        </div>
        <div class="payment-summary">
          <div class="info">
            <p class="details">성인 <span id="adult-count">0</span>명 / 청소년 <span id="student-count">0</span>명</p>
            <p class="final-payment">
              <span class="label">최종결제금액</span>
              <span id="totalAmount" class="amount">0 원</span>
            </p>
          </div>
        </div>
        <div class="btn-group">
          <a href="${pageContext.request.contextPath}/reservationMain.jsp" class="button pre" id="pagePrevious" title="이전">이전</a>
          <button type="button" class="button" id="pageNext" title="다음" onclick="sendSeatData();" disabled> 다음</button>
        </div>
        <!-- 좌석 예약 정보를 담는 폼 -->
        <div style="display: none;">
          <form id="seatForm" action="${pageContext.request.contextPath}/UserController?type=reservationPayment" method="post">
            <input type="hidden" name="timetableIdx" value="${timetableIdx}" />
            <input type="hidden" name="movieTitle" value="${movieVO.movieTitle}" />
            <input type="hidden" name="movieGrade" value="${movieVO.movieGrade}" />
            <input type="hidden" name="movieTime" value="${movieVO.movieTime}" />
            <input type="hidden" name="moviePosterUrl" value="${movieVO.moviePosterUrl}" />
            <input type="hidden" name="theaterName" value="${theaterVO.theaterName}" />
            <input type="hidden" name="formattedDate" value="${formattedDate}" />
            <input type="hidden" name="formattedStartTime" value="${formattedStartTime}" />
            <input type="hidden" name="formattedEndTime" value="${formattedEndTime}" />
            <input type="hidden" name="screenIdx" value="${screenIdx}" />
            <input type="hidden" name="movieType" value="${movieType}" />
            <input type="hidden" name="theaterIdx" value="${theaterIdx}" />
            <input type="hidden" name="adultPriceIdx" value="${adultPriceIdx}" />
            <input type="hidden" name="studentPriceIdx" value="${studentPriceIdx}" />
            <input type="hidden" name="movieIdx" value="${movieIdx}" />
            <input type="hidden" name="timetableStartTime" value="${timetableStartTime}" />
            <input type="hidden" name="adultCount" id="hiddenAdultCount" value="0"/>
            <input type="hidden" name="studentCount" id="hiddenStudentCount" value="0"/>
            <input type="hidden" name="totalAmount" id="hiddenTotalAmount" value="0"/>

            <div id="seatHiddenContainer"></div>
          </form>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- 좌석 선택 취소 모달 -->
<section class="alert-popup" id="seatCancelModal" >
  <div class="wrap">
    <header class="layer-header">
      <h3 class="tit">알림</h3>
    </header>
    <div class="layer-con">
      <p class="txt-common">선택하신 좌석을 모두 취소하고 다시 선택하시겠습니까?</p>
      <div class="modal-btn-group">
        <button type="button" class="modal-btn lyclose">취소</button>
        <button type="button" class="modal-btn purple confirm">확인</button>
      </div>
    </div>
  </div>
</section>
<!-- 좌석 선택 초과 알림 모달 -->
<section class="alert-popup" id="seatLimitModal">
  <div class="wrap">
    <header class="layer-header">
      <h3 class="tit">알림</h3>
    </header>
    <div class="layer-con">
      <p class="txt-common" id="seatLimitMessage">선택 가능한 좌석 수를 초과했습니다.</p>
      <div class="modal-btn-group">
        <button type="button" class="modal-btn purple confirm" id="closeSeatLimitModal">확인</button>
      </div>
    </div>
  </div>
</section>
<script>
  // 첫 번째 모달 요소와 내부 버튼들 가져오기
  const seatCancelModal = document.getElementById('seatCancelModal');
  const modalCancelButton = seatCancelModal.querySelector('.lyclose');
  const modalConfirmButton = seatCancelModal.querySelector('.confirm');

  // 두 번째 모달, 좌석 초과 모달 요소 가져오기
  const seatLimitModal = document.getElementById('seatLimitModal');
  const closeSeatLimitModal = document.getElementById('closeSeatLimitModal');
  const modalOverlay = document.getElementById("modalOverlay"); // 오버레이 요소 가져오기

  // 모달 보이기 / 숨기기 함수
  function showModal(modal) {
    modal.style.display = "block";
    modalOverlay.style.display = "block";
    document.body.style.overflow = "hidden";
  }

  function hideModal(modal) {
    modal.style.display = "none";
    modalOverlay.style.display = "none";
    document.body.style.overflow = "auto";
  }

  // 좌석 선택 취소 모달 보이기
  function showSeatCancelModal() {
    showModal(seatCancelModal);
  }

  // 좌석 초과 모달 보이기 함수
  function showSeatLimitModal(message) {
    document.getElementById('seatLimitMessage').textContent = message;
    showModal(seatLimitModal);
  }

  // 좌석 선택 초과 모달 닫기 이벤트
  closeSeatLimitModal.addEventListener("click", () => hideModal(seatLimitModal));

  // 좌석 취소 모달에서 확인 버튼 클릭 시 초기화 실행
  modalConfirmButton.addEventListener("click", () => {
    document.querySelector(".reset").click(); // 초기화 버튼 클릭
    hideModal(seatCancelModal);
  });

  // ✅ 배경 클릭 시 모달 닫기 방지
  seatCancelModal.addEventListener("click", (event) => {
    if (event.target === seatCancelModal) {
      event.stopPropagation();
    }
  });

  seatLimitModal.addEventListener("click", (event) => {
    if (event.target === seatLimitModal) {
      event.stopPropagation();
    }
  });

</script>

<!-- footer 영역 -->
<jsp:include page="../common/footer.jsp"/>
<script>
  document.addEventListener('DOMContentLoaded', () => {
    const nextButton = document.getElementById('pageNext');
    nextButton.disabled = true; // 초기 상태에서 비활성화
    const maxSeats = 8; // 최대 선택 가능 인원
    const selectedSeats = new Set(); // 선택된 좌석 저장
    let adultCount = 0;
    let studentCount = 0;
    const totalAmountElement = document.getElementById('totalAmount');
    const mySeatContainer = document.querySelector('.my-seat'); // 선택한 좌석 표시 영역

    // ✅ 추가된 코드: 성인/청소년 카운트 UI 요소 가져오기
    const adultCountElement = document.getElementById('adult-count');
    const studentCountElement = document.getElementById('student-count');

    // ✅ 추가된 코드: 폼에 hidden input 요소 가져오기
    const hiddenAdultCount = document.getElementById('hiddenAdultCount');
    const hiddenStudentCount = document.getElementById('hiddenStudentCount');

    // JSP에서 가격 정보를 가져올 때 기본값 설정
    const adultPrice = parseInt("${adultPrice}") || 0;
    const studentPrice = parseInt("${studentPrice}") || 0;

    function updateNextButtonState() {
      const requiredSeatCount = adultCount + studentCount;
      const selectedSeatCount = selectedSeats.size;

      console.log("requiredSeatCount=", requiredSeatCount, "selectedSeatCount=", selectedSeatCount);

      if (selectedSeatCount === requiredSeatCount && requiredSeatCount > 0) {
        nextButton.disabled = false;
        nextButton.classList.add('active');  // 활성화된 스타일 적용
      } else {
        nextButton.disabled = true;
        nextButton.classList.remove('active');  // 비활성화된 스타일 적용
      }
    }
    // 선택한 좌석을 업데이트하는 함수 (선택된 좌석 박스 업데이트)
    const updateSelectedSeatsDisplay = () => {
      mySeatContainer.innerHTML = ''; // 기존 선택 좌석 초기화
      selectedSeats.forEach(seat => {
        const seatDiv = document.createElement('div');
        seatDiv.classList.add('seat', 'selected-seat');
        seatDiv.textContent = seat; // 좌석 번호 표시
        mySeatContainer.appendChild(seatDiv);
      });

      // 콘솔에 선택한 좌석 seatIdx 출력
      console.log("선택한 좌석 seatIdx 목록:", Array.from(selectedSeats));
    };

    // 가격 업데이트 함수
    const updateTotalPrice = () => {
      const totalSeatsSelected = selectedSeats.size;
      let totalPrice = 0;

      if (totalSeatsSelected > 0) {
        let adultSeats = Math.min(adultCount, totalSeatsSelected);
        let studentSeats = totalSeatsSelected - adultSeats;

        totalPrice = (adultSeats * adultPrice) + (studentSeats * studentPrice);
      }

      totalAmountElement.textContent = totalPrice.toLocaleString() + " 원";

      // ✅ 추가된 코드: hidden input 업데이트
      document.getElementById('hiddenTotalAmount').value = totalPrice;

      updateSelectedSeatsDisplay(); // 선택 좌석 UI 업데이트
    };

    // ✅ 추가된 코드: 성인 및 청소년 인원 업데이트 함수 (UI 변경)
    const updateSeatCountUI = () => {
      adultCountElement.textContent = adultCount;  // 성인 인원 UI 업데이트
      studentCountElement.textContent = studentCount; // 청소년 인원 UI 업데이트

      // ✅ 추가된 코드: hidden input 값 업데이트
      hiddenAdultCount.value = adultCount;
      hiddenStudentCount.value = studentCount;
    };

    // 좌석 선택 이벤트 리스너 추가
    document.querySelectorAll('.available-seat').forEach(function (seat) {
      var seatIdx = seat.getAttribute('data-seatidx'); // 좌석 ID 가져오기
      var seatNumber = seat.getAttribute('data-seat'); // 좌석 번호 가져오기

      seat.classList.add("seat-" + seatIdx); // seatIdx를 class로 추가

      seat.addEventListener('click', function () {
        if (seat.classList.contains('selected')) {
          seat.classList.remove('selected');
          selectedSeats.delete(seatNumber);
        } else if (selectedSeats.size < (adultCount + studentCount)) {
          seat.classList.add('selected');
          selectedSeats.add(seatNumber);
        } else {
          showSeatLimitModal("선택 가능한 좌석 수를 초과했습니다.");
        }

        console.log("선택한 seatIdx:", Array.from(selectedSeats)); // seatIdx 출력
        updateTotalPrice(); // 가격 및 UI 업데이트
        updateNextButtonState(); // 다음 버튼 상태 업데이트
      });
    });

    // 성인 및 청소년 인원 조정
    const updateTotalCount = () => {
      document.getElementById('adult').textContent = adultCount;
      document.getElementById('student').textContent = studentCount;
      updateTotalPrice();

      // ✅ 추가된 코드: 성인 및 청소년 인원 UI 업데이트
      updateSeatCountUI();
    };

    document.querySelectorAll('.increase').forEach(btn => {
      btn.addEventListener('click', () => {
        if (adultCount + studentCount < maxSeats) {
          if (btn.dataset.target === 'adult') adultCount++;
          else if (btn.dataset.target === 'student') studentCount++;
          updateTotalCount();
          updateNextButtonState();
        } else {
          alert('최대 8명까지만 선택 가능합니다.');
        }
      });
    });

    document.querySelectorAll('.decrease').forEach(btn => {
      btn.addEventListener('click', () => {
        // 현재 상태를 임시 변수에 저장 (변경 후 값을 계산)
        let newAdultCount = adultCount;
        let newStudentCount = studentCount;

        if (btn.dataset.target === 'adult' && adultCount > 0) {
          newAdultCount--;
        } else if (btn.dataset.target === 'student' && studentCount > 0) {
          newStudentCount--;
        }

        const newTotalCount = newAdultCount + newStudentCount;
        if (selectedSeats.size > newTotalCount) {
          showSeatCancelModal();

          // 확인 버튼: 선택 좌석을 모두 취소하고 인원 수 업데이트
          modalConfirmButton.onclick = () => {
            document.querySelector('.reset').click(); // 초기화 버튼 클릭 이벤트를 발생시킴
            hideSeatCancelModal();
          };

          // 취소 버튼: 변경을 취소하고 모달만 닫기
          modalCancelButton.onclick = () => {
            hideModal(seatCancelModal);
          };

        } else {
          // 문제가 없으면 그대로 인원 수 변경
          if (btn.dataset.target === 'adult') {
            adultCount = newAdultCount;
          } else if (btn.dataset.target === 'student') {
            studentCount = newStudentCount;
          }
          updateTotalCount();
          updateNextButtonState();
        }
      });
    });

    // 초기화 버튼
    document.querySelector('.reset').addEventListener('click', () => {
      adultCount = 0;
      studentCount = 0;
      selectedSeats.clear();
      document.querySelectorAll('.available-seat').forEach(seat => seat.classList.remove('selected'));
      updateTotalCount();

      // ✅ 추가된 코드: 페이지 로드 시 초기 UI 업데이트
      updateSeatCountUI();
    });


  });

  function sendSeatData(){
    console.log("sendSeatData 호출됨");
    const selectedSeatIdxList = Array.from(document.querySelectorAll('.available-seat.selected'))
            .map(seat => seat.getAttribute('data-seatidx'));

    // ✅ totalAmountValue 변수를 올바르게 가져오기
    const totalAmountValue = document.getElementById('hiddenTotalAmount').value;

    console.log("선택된 seatIdx 목록:", selectedSeatIdxList);
    console.log("성인 수:", hiddenAdultCount.value, "청소년 수:", hiddenStudentCount.value); // ✅ 추가된 코드
    console.log("최종 결제 금액:", totalAmountValue); // ✅ 추가된 코드
    if (selectedSeatIdxList.length === 0) {
      alert("좌석을 선택해주세요.");
      return;
    }
    const container = document.getElementById('seatHiddenContainer');
    container.innerHTML = "";
    selectedSeatIdxList.forEach(seatIdx => {
      let input = document.createElement("input");
      input.type = "hidden";
      input.name = "seatIdxList";
      input.value = seatIdx;
      container.appendChild(input);
    });

    console.log("폼 데이터:", $("#seatForm").serialize());
    document.getElementById("seatForm").submit();
  }
</script>
</body>
</html>