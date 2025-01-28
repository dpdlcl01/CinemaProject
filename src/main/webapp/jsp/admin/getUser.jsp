<%@ page contentType="application/json;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    mybatis.vo.UserVO user = (mybatis.vo.UserVO) request.getAttribute("user");
%>

<%-- JSON 형식으로 사용자 데이터 출력 --%>
{
    "userName": "${c:out(value=user.userName)}",
    "userEmail": "${c:out(value=user.userEmail)}",
    "userPhone": "${c:out(value=user.userPhone)}",
    "userPoint": "${c:out(value=user.userPoint)}",
    "userGrade": "${c:out(value=user.userGrade)}"
}