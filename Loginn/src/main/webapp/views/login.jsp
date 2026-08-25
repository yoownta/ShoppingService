<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Đăng Nhập Hệ Thống</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <div class="login-box">
        <form action="${pageContext.request.contextPath}/login" method="post">
            <h2>Đăng Nhập</h2>
            
            <c:if test="${alert != null}">
                <div class="alert-danger">${alert}</div>
            </c:if>

            <div class="input-group">
                <input type="text" placeholder="Tài khoản" name="username" class="form-control" required>
            </div>
            
            <div class="input-group">
                <input type="password" placeholder="Mật khẩu" name="password" class="form-control" required>
            </div>
            
            <div class="form-actions">
                <label><input type="checkbox" name="remember"> Nhớ tôi</label>
                <a href="forgot-password" class="forgot-password">Quên mật khẩu?</a>
            </div>
            
            <button type="submit" class="logout-btn">Đăng Nhập</button>
            
            <div class="links">
                Chưa có tài khoản? <a href="register">Đăng ký ngay</a>
            </div>
        </form>
    </div>
</body>
</html>