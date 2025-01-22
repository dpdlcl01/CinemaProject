<%@ page import="dao.registerDAO"%><%@ page import="java.io.BufferedReader"%><%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>
<%--<%--%>
<%--    // JSON 데이터를 읽기 위해 BufferedReader 사용--%>
<%--    StringBuilder sb = new StringBuilder();--%>
<%--    String line;--%>
<%--    try (BufferedReader reader = request.getReader()) {--%>
<%--        while ((line = reader.readLine()) != null) {--%>
<%--            sb.append(line);--%>
<%--        }--%>
<%--    }--%>
<%--    String requestData = sb.toString();--%>
<%--    System.out.println("data: " + requestData); // 요청 데이터 로그 확인--%>

<%--    // JSON 파싱--%>
<%--    org.json.JSONObject jsonObject = new org.json.JSONObject(requestData);--%>
<%--    String userId = jsonObject.getString("userId");--%>
<%--    System.out.println("parsing userId: " + userId);--%>

<%--    // DAO 호출--%>
<%--    registerDAO dao = new registerDAO();--%>
<%--    int count = dao.UserIdCheck(userId);--%>

<%--    // JSON 응답 생성--%>
<%--    boolean isDuplicate = count > 0;--%>
<%--    response.setContentType("application/json; charset=UTF-8");--%>
<%--    response.getWriter().write("{\"isDuplicate\": " + isDuplicate + "}");--%>
<%--%>--%>
<%
    Boolean isDuplicate = (Boolean) request.getAttribute("isDuplicate");
%>
{
    "isDuplicate": <%= isDuplicate != null ? isDuplicate : false %>
}