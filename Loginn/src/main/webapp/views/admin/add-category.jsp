<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<div class="panel panel-default" style="margin-top: 15px;">
    <div class="panel-heading" style="font-weight: bold; background-color: #f5f5f5; padding: 10px 15px;">
        Thêm mới danh mục sản phẩm
    </div>
    <div class="panel-body">
        <form action="<c:url value='/admin/category/add'/>" method="post" enctype="multipart/form-data">
            <div class="form-group" style="margin-bottom: 15px;">
                <label style="font-weight: 600;">Tên danh mục:</label>
                <input type="text" name="categoryname" class="form-control" required placeholder="Nhập tên danh mục..." style="width: 100%; padding: 8px; border: 1px solid #ccc; border-radius: 4px;" />
            </div>
            
            <div class="form-group" style="margin-bottom: 15px;">
                <label style="font-weight: 600;">Hình ảnh:</label>
                <input type="file" name="icon" class="form-control" required style="padding: 5px;" />
            </div>
            
            <button type="submit" class="btn btn-primary" style="background-color: #337ab7; color: white; padding: 8px 16px; border: none; border-radius: 4px; cursor: pointer;">Lưu danh mục</button>
            <a href="<c:url value='/admin/category/list'/>" class="btn btn-default" style="padding: 8px 16px; text-decoration: none; color: #333; background: #e6e6e6; border-radius: 4px; margin-left: 5px;">Hủy</a>
        </form>
    </div>
</div>