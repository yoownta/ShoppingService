<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
    <meta charset="UTF-8">
    <title>Lỗi Hệ Thống</title>
    <style>
        body { font-family: Arial, sans-serif; background-color: #f8d7da; margin: 0; padding: 50px; text-align: center; }
        .error-box { background: white; padding: 40px; border-radius: 8px; box-shadow: 0 4px 10px rgba(0,0,0,0.1); display: inline-block; border-top: 5px solid #dc3545; max-width: 600px; text-align: left; }
        h2 { color: #721c24; margin-top: 0; text-align: center; }
        p { color: #555; font-size: 15px; }
        .error-details { background: #f1f1f1; padding: 15px; border-radius: 4px; font-family: monospace; font-size: 13px; color: #d9534f; overflow-x: auto; }
        .back-link { display: block; text-align: center; margin-top: 20px; color: #007bff; text-decoration: none; font-weight: bold; }
        .back-link:hover { text-decoration: underline; }
    </style>
</head>
<body>
    <div class="error-box">
        <h2>Đã xảy ra lỗi hệ thống!</h2>
        <p>Rất tiếc, hệ thống gặp một số sự cố kỹ thuật trong quá trình xử lý yêu cầu của bạn.</p>
        
        <p><strong>Chi tiết lỗi:</strong></p>
        <div class="error-details">
            <%= exception != null ? exception.getMessage() : "Không xác định được chi tiết lỗi." %>
        </div>
        
        <a href="login" class="back-link">Quay lại trang Đăng nhập</a>
    </div>
</body>
</html>