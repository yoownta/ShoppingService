<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chỉnh sửa Danh mục</title>
<style>
    body { font-family: Arial, sans-serif; margin: 40px; }
    form { width: 400px; background: #f9f9f9; padding: 20px; border: 1px solid #ddd; border-radius: 5px; }
    .form-group { margin-bottom: 15px; }
    label { display: block; margin-bottom: 5px; font-weight: bold; }
    input[type="text"], input[type="file"] { width: 100%; padding: 8px; box-sizing: border-box; }
    button { background-color: #ffc107; color: black; padding: 10px 15px; border: none; border-radius: 4px; cursor: pointer; font-weight: bold; }
    button:hover { background-color: #e0a800; }
    .back-link { display: inline-block; margin-top: 10px; text-decoration: none; color: #007bff; }
    img { width: 60px; height: 60px; object-fit: cover; border-radius: 50%; margin-top: 5px; }
</style>
</head>
<body>

    <h2>Chỉnh sửa Danh mục</h2>
    
    <form action="${pageContext.request.contextPath}/admin/category/edit" method="post" enctype="multipart/form-data">
        <!-- Input ẩn chứa ID để xác định danh mục cần sửa -->
        <input type="hidden" name="id" value="${category.id}">
        
        <div class="form-group">
            <label>Tên danh mục:</label>
            <input type="text" name="name" value="${category.name}" required="required">
        </div>
        
        <div class="form-group">
            <label>Hình ảnh hiện tại:</label>
            <c:if test="${not empty category.icon}">
                <br><img src="${pageContext.request.contextPath}/image?fname=${category.icon}">
            </c:if>
        </div>

        <div class="form-group">
            <label>Đổi hình ảnh mới (nếu muốn):</label>
            <input type="file" name="icon">
        </div>
        
        <button type="submit">Cập nhật</button>
    </form>
    
    <a href="${pageContext.request.contextPath}/admin/category/list" class="back-link">&larr; Quay lại danh sách</a>

</body>
</html>