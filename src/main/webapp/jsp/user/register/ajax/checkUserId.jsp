<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  Boolean isDuplicate = (Boolean) request.getAttribute("isDuplicate");
%>
<% if (isDuplicate != null && isDuplicate) {%>
    <script>alert("중복된 아이디입니다.");</script>
<% } else { %>
    <script>alert("사용 가능한 아이디입니다.");</script>
<% } %>

