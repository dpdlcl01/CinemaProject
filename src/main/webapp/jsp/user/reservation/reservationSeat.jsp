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
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/seat.css?v=1.0">
<body>
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
              <div class="rows">
                <div class="line" data-row="Front">
                  <button class="row-label">&nbsp;</button>
                  <div class="seat-group">
                    <c:forEach var="i" begin="1" end="1">
                      <button class="unavailable-seat" data-seat="Fornt${i}"></button>
                    </c:forEach>
                    <c:forEach var="i" begin="1" end="1">
                      <button class="door-left" data-seat="door-left}"></button>
                    </c:forEach>
                  </div>
                  <div class="seat-group">
                    <c:forEach var="i" begin="2" end="4">
                      <button class="unavailable-seat" data-seat="Front${i}"></button>
                    </c:forEach>
                  </div>
                  <div class="seat-group-right">
                    <c:forEach var="i" begin="5" end="5">
                      <button class="unavailable-seat" data-seat="Front${i}"></button>
                    </c:forEach>
                  </div>
                </div>
                <div class="line" data-row="A">
                  <button class="row-label">A</button>
                  <div class="seat-group">
                    <c:forEach var="i" begin="1" end="1">
                      <c:set var="seatStatus" value="0" />
                      <c:forEach var="seat" items="${availableSeats}">
                        <c:set var="seatPrefix" value="A" />
                        <c:if test="${seat.seatNumber == (seatPrefix.concat(i))}">
                          <c:set var="seatStatus" value="${seat.seatStatus}" />
                        </c:if>
                      </c:forEach>
                      <button
                              class="seat ${seatStatus == 0 ? 'available-seat' : seatStatus == 1 ? 'disabled-seat' : 'temp-seat'}"
                              data-seat="A${i}"
                        ${seatStatus != 0 ? 'disabled' : ''}>
                          ${i}
                      </button>
                    </c:forEach>
                  </div>
                  <div class="seat-group-center">
                    <c:forEach var="i" begin="2" end="4">
                      <c:set var="seatStatus" value="0" />
                      <c:forEach var="seat" items="${availableSeats}">
                        <c:set var="seatPrefix" value="A" />
                        <c:if test="${seat.seatNumber == (seatPrefix.concat(i))}">
                          <c:set var="seatStatus" value="${seat.seatStatus}" />
                        </c:if>
                      </c:forEach>
                      <button
                              class="seat ${seatStatus == 0 ? 'available-seat' : seatStatus == 1 ? 'disabled-seat' : 'temp-seat'}"
                              data-seat="A${i}"
                        ${seatStatus != 0 ? 'disabled' : ''}>
                          ${i}
                      </button>
                    </c:forEach>
                  </div>
                  <div class="seat-group-right">
                    <c:forEach var="i" begin="5" end="5">
                      <c:set var="seatStatus" value="0" />
                      <c:forEach var="seat" items="${availableSeats}">
                        <c:set var="seatPrefix" value="A" />
                        <c:if test="${seat.seatNumber == (seatPrefix.concat(i))}">
                          <c:set var="seatStatus" value="${seat.seatStatus}" />
                        </c:if>
                      </c:forEach>
                      <button
                              class="seat ${seatStatus == 0 ? 'available-seat' : seatStatus == 1 ? 'disabled-seat' : 'temp-seat'}"
                              data-seat="A${i}"
                        ${seatStatus != 0 ? 'disabled' : ''}>
                          ${i}
                      </button>
                    </c:forEach>
                  </div>
                </div>
                <div class="line" data-row="B">
                  <button class="row-label">B</button>
                  <div class="seat-group">
                    <c:forEach var="i" begin="1" end="1">
                      <c:set var="seatStatus" value="0" />
                      <c:forEach var="seat" items="${availableSeats}">
                        <c:set var="seatPrefix" value="B" />
                        <c:if test="${seat.seatNumber == (seatPrefix.concat(i))}">
                          <c:set var="seatStatus" value="${seat.seatStatus}" />
                        </c:if>
                      </c:forEach>
                      <button
                              class="seat ${seatStatus == 0 ? 'available-seat' : seatStatus == 1 ? 'disabled-seat' : 'temp-seat'}"
                              data-seat="B${i}"
                        ${seatStatus != 0 ? 'disabled' : ''}>
                          ${i}
                      </button>
                    </c:forEach>
                  </div>
                  <div class="seat-group-center">
                    <c:forEach var="i" begin="2" end="4">
                      <c:set var="seatStatus" value="0" />
                      <c:forEach var="seat" items="${availableSeats}">
                        <c:set var="seatPrefix" value="B" />
                        <c:if test="${seat.seatNumber == (seatPrefix.concat(i))}">
                          <c:set var="seatStatus" value="${seat.seatStatus}" />
                        </c:if>
                      </c:forEach>
                      <button
                              class="seat ${seatStatus == 0 ? 'available-seat' : seatStatus == 1 ? 'unavailable-seat' : 'temp-seat'}"
                              data-seat="B${i}"
                        ${seatStatus != 0 ? 'disabled' : ''}>
                          ${i}
                      </button>
                    </c:forEach>
                  </div>
                  <div class="seat-group-right">
                    <c:forEach var="i" begin="5" end="5">
                      <c:set var="seatStatus" value="0" />
                      <c:forEach var="seat" items="${availableSeats}">
                        <c:set var="seatPrefix" value="B" />
                        <c:if test="${seat.seatNumber == (seatPrefix.concat(i))}">
                          <c:set var="seatStatus" value="${seat.seatStatus}" />
                        </c:if>
                      </c:forEach>
                      <button
                              class="seat ${seatStatus == 0 ? 'available-seat' : seatStatus == 1 ? 'unavailable-seat' : 'temp-seat'}"
                              data-seat="B${i}"
                        ${seatStatus != 0 ? 'disabled' : ''}>
                          ${i}
                      </button>
                    </c:forEach>
                  </div>
                </div>
                <div class="line" data-row="C">
                  <button class="row-label">C</button>
                  <div class="seat-group">
                    <c:forEach var="i" begin="1" end="1">
                      <c:set var="seatStatus" value="0" />
                      <c:forEach var="seat" items="${availableSeats}">
                        <c:set var="seatPrefix" value="C" />
                        <c:if test="${seat.seatNumber == (seatPrefix.concat(i))}">
                          <c:set var="seatStatus" value="${seat.seatStatus}" />
                        </c:if>
                      </c:forEach>
                      <button
                              class="seat ${seatStatus == 0 ? 'available-seat' : seatStatus == 1 ? 'disabled-seat' : 'temp-seat'}"
                              data-seat="C${i}"
                        ${seatStatus != 0 ? 'disabled' : ''}>
                          ${i}
                      </button>
                    </c:forEach>
                  </div>
                  <div class="seat-group-center">
                    <c:forEach var="i" begin="2" end="4">
                      <c:set var="seatStatus" value="0" />
                      <c:forEach var="seat" items="${availableSeats}">
                        <c:set var="seatPrefix" value="C" />
                        <c:if test="${seat.seatNumber == (seatPrefix.concat(i))}">
                          <c:set var="seatStatus" value="${seat.seatStatus}" />
                        </c:if>
                      </c:forEach>
                      <button
                              class="seat ${seatStatus == 0 ? 'available-seat' : seatStatus == 1 ? 'disabled-seat' : 'temp-seat'}"
                              data-seat="C${i}"
                        ${seatStatus != 0 ? 'disabled' : ''}>
                          ${i}
                      </button>
                    </c:forEach>
                  </div>
                  <div class="seat-group-right">
                    <c:forEach var="i" begin="5" end="5">
                      <c:set var="seatStatus" value="0" />
                      <c:forEach var="seat" items="${availableSeats}">
                        <c:set var="seatPrefix" value="C" />
                        <c:if test="${seat.seatNumber == (seatPrefix.concat(i))}">
                          <c:set var="seatStatus" value="${seat.seatStatus}" />
                        </c:if>
                      </c:forEach>
                      <button
                              class="seat ${seatStatus == 0 ? 'available-seat' : seatStatus == 1 ? 'unavailable-seat' : 'temp-seat'}"
                              data-seat="C${i}"
                        ${seatStatus != 0 ? 'disabled' : ''}>
                          ${i}
                      </button>
                    </c:forEach>
                  </div>
                </div>
                <div class="line" data-row="D">
                  <button class="row-label">D</button>
                  <div class="seat-group">
                    <c:forEach var="i" begin="1" end="1">
                      <c:set var="seatStatus" value="0" />
                      <c:forEach var="seat" items="${availableSeats}">
                        <c:set var="seatPrefix" value="D" />
                        <c:if test="${seat.seatNumber == (seatPrefix.concat(i))}">
                          <c:set var="seatStatus" value="${seat.seatStatus}" />
                        </c:if>
                      </c:forEach>
                      <button
                              class="seat ${seatStatus == 0 ? 'available-seat' : seatStatus == 1 ? 'disabled-seat' : 'temp-seat'}"
                              data-seat="D${i}"
                        ${seatStatus != 0 ? 'disabled' : ''}>
                          ${i}
                      </button>
                    </c:forEach>
                  </div>
                  <div class="seat-group-center">
                    <c:forEach var="i" begin="2" end="4">
                      <c:set var="seatStatus" value="0" />
                      <c:forEach var="seat" items="${availableSeats}">
                        <c:set var="seatPrefix" value="D" />
                        <c:if test="${seat.seatNumber == (seatPrefix.concat(i))}">
                          <c:set var="seatStatus" value="${seat.seatStatus}" />
                        </c:if>
                      </c:forEach>
                      <button
                              class="seat ${seatStatus == 0 ? 'available-seat' : seatStatus == 1 ? 'disabled-seat' : 'temp-seat'}"
                              data-seat="D${i}"
                        ${seatStatus != 0 ? 'disabled' : ''}>
                          ${i}
                      </button>
                    </c:forEach>
                  </div>
                  <div class="seat-group-right">
                    <c:forEach var="i" begin="5" end="5">
                      <c:set var="seatStatus" value="0" />
                      <c:forEach var="seat" items="${availableSeats}">
                        <c:set var="seatPrefix" value="D" />
                        <c:if test="${seat.seatNumber == (seatPrefix.concat(i))}">
                          <c:set var="seatStatus" value="${seat.seatStatus}" />
                        </c:if>
                      </c:forEach>
                      <button
                              class="seat ${seatStatus == 0 ? 'available-seat' : seatStatus == 1 ? 'disabled-seat' : 'temp-seat'}"
                              data-seat="D${i}"
                        ${seatStatus != 0 ? 'disabled' : ''}>
                          ${i}
                      </button>
                    </c:forEach>
                  </div>
                </div>
                <div class="line" data-row="Back">
                  <button class="row-label">&nbsp;</button>
                  <div class="seat-group">
                    <c:forEach var="i" begin="1" end="1">
                      <button class="unavailable-seat" data-seat="Back${i}"></button>
                    </c:forEach>
                  </div>
                  <div class="seat-group-center">
                    <c:forEach var="i" begin="2" end="4">
                      <button class="unavailable-seat" data-seat="Back${i}"></button>
                    </c:forEach>
                    <c:forEach var="i" begin="4" end="4">
                      <button class="door-top" data-seat="door-top"></button>
                    </c:forEach>
                  </div>
                  <div class="seat-group">
                    <c:forEach var="i" begin="5" end="5">
                      <button class="unavailable-seat" data-seat="Back${i}"></button>
                    </c:forEach>
                  </div>
                </div>
              </div>
            </c:when>
            <c:when test="${screenType == 3}">
              <%-- B set --%>
              <div class="rows">
                <div class="line" data-row="Front">
                  <button class="row-label">&nbsp;</button>
                  <div class="seat-group">
                    <c:forEach var="i" begin="1" end="1">
                      <button class="door-left" data-seat="door-left"></button>
                    </c:forEach>
                    <c:forEach var="i" begin="1" end="8">
                      <button class="unavailable-seat" data-seat="Fornt${i}"></button>
                    </c:forEach>
                  </div>
                </div>
                <div class="line" data-row="A">
                  <button class="row-label">A</button>
                  <div class="seat-group">
                    <c:forEach var="i" begin="1" end="4">
                      <c:set var="seatStatus" value="0" />
                      <c:forEach var="seat" items="${availableSeats}">
                        <c:set var="seatPrefix" value="A" />
                        <c:if test="${seat.seatNumber == (seatPrefix.concat(i))}">
                          <c:set var="seatStatus" value="${seat.seatStatus}" />
                        </c:if>
                      </c:forEach>
                      <button
                              class="seat ${seatStatus == 0 ? 'available-seat' : seatStatus == 1 ? 'disabled-seat' : 'temp-seat'}"
                              data-seat="A${i}"
                        ${seatStatus != 0 ? 'disabled' : ''}>
                          ${i}
                      </button>
                    </c:forEach>
                  </div>
                  <div class="seat-group-right">
                    <c:forEach var="i" begin="5" end="8">
                      <c:set var="seatStatus" value="0" />
                      <c:forEach var="seat" items="${availableSeats}">
                        <c:set var="seatPrefix" value="A" />
                        <c:if test="${seat.seatNumber == (seatPrefix.concat(i))}">
                          <c:set var="seatStatus" value="${seat.seatStatus}" />
                        </c:if>
                      </c:forEach>
                      <button
                              class="seat ${seatStatus == 0 ? 'available-seat' : seatStatus == 1 ? 'disabled-seat' : 'temp-seat'}"
                              data-seat="A${i}"
                        ${seatStatus != 0 ? 'disabled' : ''}>
                          ${i}
                      </button>
                    </c:forEach>
                  </div>
                </div>
                <div class="line" data-row="B">
                  <button class="row-label">B</button>
                  <div class="seat-group">
                    <c:forEach var="i" begin="1" end="4">
                      <c:set var="seatStatus" value="0" />
                      <c:forEach var="seat" items="${availableSeats}">
                        <c:set var="seatPrefix" value="B" />
                        <c:if test="${seat.seatNumber == (seatPrefix.concat(i))}">
                          <c:set var="seatStatus" value="${seat.seatStatus}" />
                        </c:if>
                      </c:forEach>
                      <button
                              class="seat ${seatStatus == 0 ? 'available-seat' : seatStatus == 1 ? 'disabled-seat' : 'temp-seat'}"
                              data-seat="B${i}"
                        ${seatStatus != 0 ? 'disabled' : ''}>
                          ${i}
                      </button>
                    </c:forEach>
                  </div>
                  <div class="seat-group-right">
                    <c:forEach var="i" begin="5" end="8">
                      <c:set var="seatStatus" value="0" />
                      <c:forEach var="seat" items="${availableSeats}">
                        <c:set var="seatPrefix" value="B" />
                        <c:if test="${seat.seatNumber == (seatPrefix.concat(i))}">
                          <c:set var="seatStatus" value="${seat.seatStatus}" />
                        </c:if>
                      </c:forEach>
                      <button
                              class="seat ${seatStatus == 0 ? 'available-seat' : seatStatus == 1 ? 'disabled-seat' : 'temp-seat'}"
                              data-seat="B${i}"
                        ${seatStatus != 0 ? 'disabled' : ''}>
                          ${i}
                      </button>
                    </c:forEach>
                  </div>
                </div>
                  <%--                                <c:forEach var="ar(jsp에서 사용할 배열 변수명)" items="${requestScope.ar(리퀘스트에 저장된 배열의 키값)}">--%>
                  <%--                                    <p>${ar.뽑아내고싶은값}</p>--%>
                  <%--                                </c:forEach>--%>
                <div class="line" data-row="C">
                  <button class="row-label">C</button>
                  <div class="seat-group">
                    <c:forEach var="i" begin="1" end="2">
                      <c:set var="seatStatus" value="0" />
                      <c:forEach var="seat" items="${availableSeats}">
                        <c:set var="seatPrefix" value="C" />
                        <c:if test="${seat.seatNumber == (seatPrefix.concat(i))}">
                          <c:set var="seatStatus" value="${seat.seatStatus}" />
                        </c:if>
                      </c:forEach>
                      <button
                              class="seat ${seatStatus == 0 ? 'available-seat' : seatStatus == 1 ? 'disabled-seat' : 'temp-seat'}"
                              data-seat="C${i}"
                        ${seatStatus != 0 ? 'disabled' : ''}>
                          ${i}
                      </button>
                    </c:forEach>
                    <c:forEach var="i" begin="3" end="4">
                      <button class="unavailable-seat" data-seat="C${i}"></button>
                    </c:forEach>
                  </div>
                  <div class="seat-group-right">
                    <c:forEach var="i" begin="5" end="6">
                      <button class="unavailable-seat" data-seat="C${i}"></button>
                    </c:forEach>
                    <c:forEach var="i" begin="7" end="8">
                      <c:set var="seatStatus" value="0" />
                      <c:forEach var="seat" items="${availableSeats}">
                        <c:set var="seatPrefix" value="C" />
                        <c:if test="${seat.seatNumber == (seatPrefix.concat(i))}">
                          <c:set var="seatStatus" value="${seat.seatStatus}" />
                        </c:if>
                      </c:forEach>
                      <button
                              class="seat ${seatStatus == 0 ? 'available-seat' : seatStatus == 1 ? 'disabled-seat' : 'temp-seat'}"
                              data-seat="C${i}"
                        ${seatStatus != 0 ? 'disabled' : ''}>
                          ${i}
                      </button>
                    </c:forEach>
                  </div>
                </div>
                <div class="line" data-row="Back">
                  <button class="row-label">&nbsp;</button>
                  <div class="seat-group">
                    <c:forEach var="i" begin="1" end="4">
                      <button class="unavailable-seat" data-seat="Back${i}"></button>
                    </c:forEach>
                    <c:forEach var="i" begin="5" end="5">
                      <button class="door-top"></button>
                    </c:forEach>
                    <c:forEach var="i" begin="5" end="8">
                      <button class="unavailable-seat" data-seat="Back${i}"></button>
                    </c:forEach>
                  </div>
                </div>
              </div>
            </c:when>
            <c:when test="${screenType == 4 || screenType == 5}">
              <%-- C set --%>
              <div class="rows">
                <div class="line" data-row="Front">
                  <button class="row-label"> </button>
                  <div class="seat-group">
                    <c:forEach var="i" begin="1" end="1">
                      <button class="unavailable-seat" data-seat="Front${i}"></button>
                    </c:forEach>
                    <c:forEach var="i" begin="2" end="2">
                      <button class="door-left" data-seat="door-left"></button>
                    </c:forEach>
                    <c:forEach var="i" begin="3" end="4">
                      <button class="unavailable-seat" data-seat="Front${i}"></button>
                    </c:forEach>
                  </div>
                  <div class="seat-group-right">
                    <c:forEach var="i" begin="5" end="6">
                      <button class="unavailable-seat" data-seat="Front${i}"></button>
                    </c:forEach>
                  </div>
                </div>
                <div class="line" data-row="A">
                  <button class="row-label">A</button>
                  <div class="seat-group">
                    <c:forEach var="i" begin="1" end="4">
                      <c:set var="seatStatus" value="0" />
                      <c:forEach var="seat" items="${availableSeats}">
                        <c:set var="seatPrefix" value="A" />
                        <c:if test="${seat.seatNumber == (seatPrefix.concat(i))}">
                          <c:set var="seatStatus" value="${seat.seatStatus}" />
                        </c:if>
                      </c:forEach>
                      <button
                              class="seat ${seatStatus == 0 ? 'available-seat' : seatStatus == 1 ? 'disabled-seat' : 'temp-seat'}"
                              data-seat="A${i}"
                        ${seatStatus != 0 ? 'disabled' : ''}>
                          ${i}
                      </button>
                    </c:forEach>
                  </div>
                  <div class="seat-group-right">
                    <c:forEach var="i" begin="5" end="6">
                      <c:set var="seatStatus" value="0" />
                      <c:forEach var="seat" items="${availableSeats}">
                        <c:set var="seatPrefix" value="A" />
                        <c:if test="${seat.seatNumber == (seatPrefix.concat(i))}">
                          <c:set var="seatStatus" value="${seat.seatStatus}" />
                        </c:if>
                      </c:forEach>
                      <button
                              class="seat ${seatStatus == 0 ? 'available-seat' : seatStatus == 1 ? 'disabled-seat' : 'temp-seat'}"
                              data-seat="A${i}"
                        ${seatStatus != 0 ? 'disabled' : ''}>
                          ${i}
                      </button>
                    </c:forEach>
                  </div>
                </div>
                <div class="line" data-row="B">
                  <button class="row-label">B</button>
                  <div class="seat-group">
                    <c:forEach var="i" begin="1" end="4">
                      <c:set var="seatStatus" value="0" />
                      <c:forEach var="seat" items="${availableSeats}">
                        <c:set var="seatPrefix" value="A" />
                        <c:if test="${seat.seatNumber == (seatPrefix.concat(i))}">
                          <c:set var="seatStatus" value="${seat.seatStatus}" />
                        </c:if>
                      </c:forEach>
                      <button
                              class="seat ${seatStatus == 0 ? 'available-seat' : seatStatus == 1 ? 'disabled-seat' : 'temp-seat'}"
                              data-seat="A${i}"
                        ${seatStatus != 0 ? 'disabled' : ''}>
                          ${i}
                      </button>
                    </c:forEach>
                  </div>
                  <div class="seat-group-right">
                    <c:forEach var="i" begin="5" end="6">
                      <c:set var="seatStatus" value="0" />
                      <c:forEach var="seat" items="${availableSeats}">
                        <c:set var="seatPrefix" value="B" />
                        <c:if test="${seat.seatNumber == (seatPrefix.concat(i))}">
                          <c:set var="seatStatus" value="${seat.seatStatus}" />
                        </c:if>
                      </c:forEach>
                      <button
                              class="seat ${seatStatus == 0 ? 'available-seat' : seatStatus == 1 ? 'disabled-seat' : 'temp-seat'}"
                              data-seat="B${i}"
                        ${seatStatus != 0 ? 'disabled' : ''}>
                          ${i}
                      </button>
                    </c:forEach>
                  </div>
                </div>
                <div class="line" data-row="C">
                  <button class="row-label">C</button>
                  <div class="seat-group">
                    <c:forEach var="i" begin="1" end="4">
                      <button class="available-seat" data-seat="C${i}">${i}</button>
                    </c:forEach>
                  </div>
                  <div class="seat-group-right">
                    <c:forEach var="i" begin="5" end="6">
                      <button class="available-seat" data-seat="C${i}">${i}</button>
                    </c:forEach>
                  </div>
                </div>
                <div class="line" data-row="D">
                  <button class="row-label">C</button>
                  <div class="seat-group">
                    <c:forEach var="i" begin="1" end="4">
                      <button class="available-seat" data-seat="D${i}">${i}</button>
                    </c:forEach>
                  </div>
                  <div class="seat-group-right">
                    <c:forEach var="i" begin="5" end="6">
                      <button class="available-seat" data-seat="D${i}">${i}</button>
                    </c:forEach>
                  </div>
                </div>
                <div class="line" data-row="Back">
                  <button class="row-label"> </button>
                  <div class="seat-group">
                    <c:forEach var="i" begin="1" end="4">
                      <button class="unavailable-seat" data-seat="Back${i}"></button>
                    </c:forEach>
                    <c:forEach var="i" begin="5" end="5">
                      <button class="door-top" data-seat="door-top"></button>
                    </c:forEach>
                    <c:forEach var="i" begin="5" end="6">
                      <button class="unavailable-seat" data-seat="Back${i}"></button>
                    </c:forEach>
                  </div>
                </div>
              </div>
            </c:when>
          </c:choose>
        </div>
      </div>
      <!-- 영화 정보 -->
      <div class="movie-container">
        <div class="movie-info">
          <div class="movie-text-group">
            <p class="movie-title">${movieVO.movieTitle}</p>
            <p class="movie-runningTime">${movieVO.movieTime}분</p>
          </div>
        </div>
        <div class="movie-info-area">
          <div class="movie-details">
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
            <div class="my-seat">
              <div class="seat all" title="구매가능 좌석">-</div>
              <div class="seat all" title="구매가능 좌석">-</div>
              <div class="seat all" title="구매가능 좌석">-</div>
              <div class="seat all" title="구매가능 좌석">-</div>
              <div class="seat all" title="구매가능 좌석">-</div>
              <div class="seat all" title="구매가능 좌석">-</div>
              <div class="seat all" title="구매가능 좌석">-</div>
              <div class="seat all" title="구매가능 좌석">-</div>
            </div>
          </div>
        </div>
        <div class="payment-summary">
          <div class="info">
            <p class="details">성인 2</p>
            <p class="final-payment">
              <span class="label">최종결제금액</span>
              <span id="totalAmount" class="amount">0 원</span>
            </p>
          </div>
        </div>
        <div class="btn-group">
          <a href="" class="button pre" id="pagePrevious" title="이전">이전</a>
          <a href="" class="button active" id="pageNext" title="다음">다음</a>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- footer 영역 -->
<jsp:include page="../common/footer.jsp"/>
<script>
  document.addEventListener('DOMContentLoaded', () => {
    const maxSeats = 8; // 최대 선택 가능 인원
    const selectedSeats = new Set(); // 선택된 좌석 저장
    let adultCount = 0; // 성인 인원
    let studentCount = 0; // 청소년 인원
    const totalAmountElement = document.getElementById('totalAmount');

    // 좌석 선택
    document.querySelectorAll('.available-seat').forEach((seat) => {
      seat.addEventListener('click', () => {
        const totalCount = adultCount + studentCount;
        if (seat.classList.contains('selected')) {
          // 이미 선택된 좌석은 선택 해제
          seat.classList.remove('selected');
          selectedSeats.delete(seat.dataset.seat);
        } else if (selectedSeats.size < totalCount) {
          // 새로운 좌석 선택
          seat.classList.add('selected');
          selectedSeats.add(seat.dataset.seat);
        } else {
          alert('선택 가능한 좌석 수를 초과했습니다.');
        }
        updateSelectedSeats();
      });
    });

    // 성인 및 청소년 인원 조정
    document.querySelectorAll('.increase').forEach((btn) => {
      btn.addEventListener('click', () => {
        const target = btn.dataset.target;
        const totalCount = adultCount + studentCount;

        if (totalCount < maxSeats) {
          if (target === 'adult') {
            adultCount++;
          } else if (target === 'student') {
            studentCount++;
          }
          updateTotalCount();
        } else {
          alert('최대 8명까지만 선택 가능합니다.');
        }
      });
    });

    document.querySelectorAll('.decrease').forEach((btn) => {
      btn.addEventListener('click', () => {
        const target = btn.dataset.target;

        if (target === 'adult' && adultCount > 0) {
          adultCount--;
        } else if (target === 'student' && studentCount > 0) {
          studentCount--;
        }
        updateTotalCount();
      });
    });

    // 초기화 버튼
    document.querySelector('.reset').addEventListener('click', () => {
      adultCount = 0;
      studentCount = 0;
      selectedSeats.clear();
      updateTotalCount();
      document.querySelectorAll('.available-seat').forEach((seat) => seat.classList.remove('selected'));
    });

    // 선택된 좌석 및 금액 업데이트
    const updateSelectedSeats = () => {
      const seatsArray = Array.from(selectedSeats);
      const seatElements = document.querySelectorAll('.my-seat .seat');

      // 최대 8칸 유지하며 선택된 좌석 번호 채우기
      seatElements.forEach((seatElement, index) => {
        if (index < seatsArray.length) {
          // 선택된 좌석 번호 채우기
          seatElement.textContent = seatsArray[index];
          seatElement.classList.add('filled'); // 선택된 좌석 스타일 적용
        } else {
          // 선택되지 않은 칸은 "-"로 표시
          seatElement.textContent = '-';
          seatElement.classList.remove('filled'); // 선택되지 않은 좌석 스타일 제거
        }
      });

      // 총 금액 업데이트
      document.getElementById('totalAmount').textContent = (seatsArray.length * 15000).toLocaleString() + ' 원';
    };

    // 총 인원 업데이트 (화면에 표시하지 않음)
    const updateTotalCount = () => {
      const totalCount = adultCount + studentCount;
      document.getElementById('adult').textContent = adultCount;
      document.getElementById('student').textContent = studentCount;
      updateSelectedSeats();
    };

    // 초기 업데이트
    updateTotalCount();
  });
</script>
</body>
</html>