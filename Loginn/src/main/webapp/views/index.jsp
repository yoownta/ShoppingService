<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Trang Chủ Hệ Thống</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <div class="welcome-box">
        <h1>Chào mừng bạn đến với SStore!</h1>
        <c:choose>
            <c:when test="${not empty sessionScope.account}">
                <p>Xin chào, <strong>${sessionScope.account.fullName}</strong></p>
                <p>Tài khoản: ${sessionScope.account.userName}</p>
                <p>Email: ${sessionScope.account.email}</p>
                
                <a href="logout" class="logout-btn">Đăng Xuất</a>
            </c:when>
            
            <c:otherwise>
                <p>Bạn chưa đăng nhập vào hệ thống.</p>
                
                <div style="margin-top: 25px;">
                    <a href="login" class="logout-btn" style="margin-bottom: 12px; display: block; text-decoration: none;">Đăng Nhập</a>
                    <a href="register" class="logout-btn" style="background: linear-gradient(135deg, #48bb78 0%, #38a169 100%); display: block; text-decoration: none;">Đăng Ký</a>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</body>
</html>