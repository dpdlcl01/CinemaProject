<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- header -->
<header id="header">
    <div class="page-util">
        <div class="inner-wrap" style="display: flex; justify-content: space-between; align-items: center;">
            <!-- 홍길동 관리자님 위치 -->
            <div class="location" style="flex-grow: 1;">
                <span>${sessionScope.adminvo.adminId } 관리자님</span>
            </div>
            <!-- 로그아웃 버튼 -->
            <div style="display: flex; gap: 10px; flex-shrink: 0;">
                <a href="${pageContext.request.contextPath}/AdminController?type=adminLogout"
                   class="btn-logout" title="로그아웃">
                    로그아웃
                </a>
            </div>
        </div>
    </div>
</header>