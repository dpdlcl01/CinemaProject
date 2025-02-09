<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="java.util.*, com.google.gson.Gson" %>
<!Doctype html>
<html lang="ko">

<head>

</head>
<!-- 외부CSS 연결하기 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/userMain.css">
<link rel="stylesheet" href="https://code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/chart.js@3.7.1"></script>
<script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels@2.0.0"></script>

<meta name="viewport" content="width=device-width, initial-scale=1.0">


<style>
  .admin-contents {
    width: 100%;
    min-height: 550px;
  }
  .page-util .inner-wrap {
    max-width: 100%; !important;
    padding: 20px 20px; !important;
  }
    .admin-contents {
        width: 100%;
        min-height: 550px;
    }
    .page-util .inner-wrap {
        max-width: 100%; !important;
        padding: 20px 20px; !important;
    }


  .myPage-container{
    display: flex;

  }
  #main{
    width: 100%;
    margin: 27px 40px 40px 40px;
  }
  #main h1{
    font-size: 30px;
    margin-bottom: 20px;
  }
</style>

<body>
<%
    // top 10 영화 데이터
    List<Map<String, Object>> topMovies = (List<Map<String, Object>>) request.getAttribute("topMovies");

    List<String> movieTitles = new ArrayList<>();
    List<Double> movieReservationRates = new ArrayList<>();

    if (topMovies != null) {
        for (Map<String, Object> movie : topMovies) {
            movieTitles.add((String) movie.get("movieTitle"));
            movieReservationRates.add((Double) movie.get("movieReservationRate"));
        }
    }

    // 극장별 매출 데이터
    List<Map<String, Object>> totalRevenues = (List<Map<String, Object>>) request.getAttribute("totalRevenues");

    List<String> theaterNames = new ArrayList<>();
    List<Double> theaterSales = new ArrayList<>();

    if (totalRevenues != null) {
        for (Map<String, Object> revenue : totalRevenues) {
            theaterNames.add((String) revenue.get("theaterName"));
            theaterSales.add(((java.math.BigDecimal) revenue.get("totalRevenue")).doubleValue()); // BigDecimal -> Double 변환
        }
    }

    // 월별 사용자 이용내역 데이터
    List<Map<String, Object>> monthlyActiveUsers = (List<Map<String, Object>>) request.getAttribute("monthlyActiveUsers");

    List<String> months = new ArrayList<>();
    List<Integer> activeUserCounts = new ArrayList<>();

    if (monthlyActiveUsers != null) {
        for (Map<String, Object> data : monthlyActiveUsers) {
            months.add((String) data.get("month"));
            Object userCount = data.get("userCount");
            activeUserCounts.add(userCount instanceof java.math.BigDecimal ?
                    ((java.math.BigDecimal) userCount).intValue() : ((Number) userCount).intValue()); // BigDecimal 변환
        }
    }

%>
    <jsp:include page="header.jsp"/>
<div class="admin-contents">
  <div class="total-main">
    <div class="myPage-container">
      <%--  사이드바  --%>
      <jsp:include page="adminSideBar.jsp"/>
      <%--  메인  --%>

      <div id="main">
          <h1>대시보드</h1>

          <div class="card mb-4">
              <div class="card-header">
                  <i class="fas fa-chart-pie me-1"></i>
                  인기 영화 TOP10 예매 비율
              </div>
              <div class="card-body">
                  <canvas id="movieChart" width="100%" height="230"></canvas>
              </div>
          </div>

          <div class="row">
              <div class="col-xl-6">
                  <div class="card mb-4">
                      <div class="card-header">
                          <i class="fas fa-chart-line me-1"></i>
                          월별 사용자수 추이
                      </div>
                      <div class="card-body">
                          <canvas id="salesChart" width="100%" height=440"></canvas>
                      </div>
                  </div>
              </div>
              <div class="col-xl-6">
                  <div class="card mb-4">
                      <div class="card-header">
                          <i class="fas fa-chart-bar me-1"></i>
                          극장별 총매출
                      </div>
                      <div class="card-body">
                          <canvas id="productChart" width="100%" height="440"></canvas>
                      </div>
                  </div>
              </div>
          </div>

      </div>

    </div>
  </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels"></script>
    <script>
      document.addEventListener("DOMContentLoaded", function () {

        Chart.register(ChartDataLabels);

        var ctx = document.getElementById("movieChart").getContext("2d");
        var movieChart = new Chart(ctx, {
          type: "pie",
          data: {
            labels: <%= new Gson().toJson(movieTitles) %>,  // 영화 제목
            datasets: [{
              data: <%= new Gson().toJson(movieReservationRates) %>,  // 예매율
              backgroundColor: ["#ff6384", "#36a2eb", "#ffce56", "#4bc0c0", "#9966ff"]
            }]
          },
          options: {
            responsive: true,
            maintainAspectRatio: false,
            plugins: {
              legend: {
                display: true,
                position: 'left',

              },
              datalabels: {  // 차트 내부에 숫자 표시
                color: '#fff',
                font: {
                  weight: 'bold',
                  size: 14
                },
                anchor: 'center',
                align: 'center',
                formatter: function(value, context) {
                  return (context.dataIndex < 5) ? value.toFixed(1) + "%" : "";
                  // 상위 5개 데이터만 표시, 나머지는 빈 문자열 ""
                }
              }
            }
          }
        });


        // 극장별 총매출 (막대 그래프)
        var ctx1 = document.getElementById("productChart").getContext("2d");
        var productChart = new Chart(ctx1, {
          type: "bar",
          data: {
            labels: <%= new Gson().toJson(theaterNames) %>,  // 극장 이름 리스트
            datasets: [{
              label: "총매출 (원)",
              backgroundColor: ["#4e73df", "#1cc88a", "#36b9cc", "#f6c23e"],
              borderColor: "#4e73df",
              data: <%= new Gson().toJson(theaterSales)%>,
              fill: false
            }]
          },
          options: {
            responsive: true,
            maintainAspectRatio: false,
            plugins: {
              datalabels: {
                color: '#fff',  //글씨 색상 흰색으로 변경
                font: {
                  weight: 'bold',
                  size: 14
                },
                anchor: 'center',
                align: 'center',
                formatter: function(value, context) {
                  return new Intl.NumberFormat().format(value);  //숫자 포맷
                }
              }
            },
            scales: {
              y: {  // yAxes 대신 최신 Chart.js 문법
                ticks: {
                  beginAtZero: true,
                  callback: function(value, index, values) {
                    return new Intl.NumberFormat().format(value); // Y축
                  }
                }
              }
            }
          }
        });


        // 매출 추이 (꺾은선 그래프)
        var ctx2 = document.getElementById("salesChart").getContext("2d");
        var salesChart = new Chart(ctx2, {
          type: "line",
          data: {
            labels: <%= new Gson().toJson(months) %>,  // 월별 데이터 (ex. ["1월", "2월", "3월", ...])
            datasets: [{
              label: "월별 이용자 수",
              backgroundColor: "rgba(78, 115, 223, 0.2)",
              borderColor: "rgba(78, 115, 223, 1)",
              data: <%= new Gson().toJson(activeUserCounts) %>,  // 월별 이용자 수 데이터
              fill: true
            }]
          },
          options: {
            responsive: true,
            maintainAspectRatio: false,
            plugins: {
              datalabels: {
                color: '#000',  // 글씨 색상 검정
                font: {
                  weight: 'bold',
                  size: 14
                },
                anchor: 'end',
                align: 'top',
                formatter: function(value, context) {
                  return new Intl.NumberFormat().format(value) + "명"; // 숫자 포맷 및 '명' 추가
                }
              }
            },
            scales: {
              yAxes: [{
                ticks: {
                  beginAtZero: true,
                  callback: function(value, index, values) {
                    return new Intl.NumberFormat().format(value) + "명"; // Y축 숫자 포맷 및 '명' 추가
                  }
                }
              }]
            }
          }
        });

      });
    </script>

</body>
</html>