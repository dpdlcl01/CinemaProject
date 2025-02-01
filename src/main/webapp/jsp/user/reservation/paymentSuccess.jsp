<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>결제 성공</title>
</head>
<body onload="document.getElementById('paymentForm').submit();">
<form id="paymentForm" action="/UserController?type=reservationPaymentSuccess" method="POST">
    <input type="hidden" name="paymentKey" value="<%= request.getParameter("paymentKey") %>">
    <input type="hidden" name="orderId" value="<%= request.getParameter("orderId") %>">
    <input type="hidden" name="amount" value="<%= request.getParameter("amount") %>">

    <input type="hidden" name="timetableIdx" value="<%= request.getParameter("timetableIdx") %>">
    <input type="hidden" name="theaterName" value="<%= request.getParameter("theaterName") %>">
    <input type="hidden" name="formattedDate" value="<%= request.getParameter("formattedDate") %>">
    <input type="hidden" name="formattedStartTime" value="<%= request.getParameter("formattedStartTime") %>">
    <input type="hidden" name="formattedEndTime" value="<%= request.getParameter("formattedEndTime") %>">
    <input type="hidden" name="screenIdx" value="<%= request.getParameter("screenIdx") %>">
    <input type="hidden" name="movieType" value="<%= request.getParameter("movieType") %>">
    <input type="hidden" name="moviePosterUrl" value="<%= request.getParameter("moviePosterUrl") %>">
    <input type="hidden" name="theaterIdx" value="<%= request.getParameter("theaterIdx") %>">
    <input type="hidden" name="adultCount" value="<%= request.getParameter("adultCount") %>">
    <input type="hidden" name="studentCount" value