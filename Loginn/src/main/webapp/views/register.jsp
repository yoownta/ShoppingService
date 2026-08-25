<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Tạo Tài Khoản Mới</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
    <div class="form-container">
        <form action="register" method="post">
            <h2>Tạo Tài Khoản</h2>
            
            <c:if test="${alert != null}">
                <div class="alert-danger">${alert}</div>
            </c:if>

            <div class="input-group">
                <input type="text" placeholder="Tài khoản" name="username" class="form-control" required>
            </div>
            
            <div class="input-group">
                <input type="password" placeholder="Mật khẩu" name="password" class="form-control" required>
            </div>
            
            <div class="input-group">
                <input type="email" placeholder="Nhập Email" name="email" class="form-control" required>
            </div>
            
            <div class="input-group">
                <input type="text" placeholder="Họ và tên" name="fullname" class="form-control" required>
            </div>
            
            <div class="input-group">
                <input type="text" placeholder="Số điện thoại" name="phone" class="form-control" required>
            </div>
            
            <button type="submit" class="logout-btn">Tạo Tài Khoản</button>
            
            <div class="links">
                Đã có tài khoản? <a href="login">Đăng nhập ngay</a>
            </div>
        </form>
    </div>
</body>
</html>