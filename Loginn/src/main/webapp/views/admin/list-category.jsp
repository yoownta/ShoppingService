<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<div class="panel panel-default" style="border-radius: 0; box-shadow: 0 1px 3px rgba(0,0,0,0.1); margin-top: 15px;">
    <!-- Tiêu đề của Panel -->
    <div class="panel-heading" style="background-color: #f5f5f5; border-bottom: 1px solid #ddd; padding: 10px 15px; font-weight: bold; color: #333; display: flex; justify-content: space-between; align-items: center;">
        <span>Danh sách danh mục</span>
        <a href="<c:url value='/admin/category/add'/>" class="btn btn-success btn-xs" style="padding: 5px 10px; color: #fff; background-color: #5cb85c; border-radius: 3px; text-decoration: none;">+ Thêm danh mục mới</a>
    </div>
    
    <div class="panel-body">
        <!-- Thanh công cụ giả lập phía trên bảng -->
        <div class="row" style="margin-bottom: 15px;">
            <div class="col-sm-6">
                <label>
                    Show 
                    <select class="form-control input-sm" style="display: inline-block; width: auto;">
                        <option value="10">10</option>
                        <option value="25">25</option>
                        <option value="50">50</option>
                    </select> records per page
                </label>
            </div>
            <div class="col-sm-6" style="text-align: right;">
                <label>
                    Search: 
                    <input type="search" class="form-control input-sm" style="display: inline-block; width: auto;" placeholder="" />
                </label>
            </div>
        </div>

        <!-- Bảng danh sách chính -->
        <table class="table table-striped table-bordered table-hover" id="dataTables-example">
            <thead>
                <tr style="background-color: #f9f9f9;">
                    <th style="width: 80px;">STT</th>
                    <th style="width: 150px;">Hình ảnh</th>
                    <th>Tên danh mục</th>
                    <th style="width: 120px; text-align: center;">Hành động</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${cateList}" var="cate" varStatus="STT">
                    <tr class="odd gradeX">
                        <!-- Cột STT -->
                        <td style="vertical-align: middle;">${STT.index + 1}</td>
                        
                        <!-- Cột Hình ảnh (Gọi qua Servlet /image) -->
                        <td style="vertical-align: middle; text-align: center;">
                            <c:url value="/image?fname=${cate.icon}" var="imgUrl"></c:url>
                            <img height="70px" width="70px" style="object-fit: cover; border-radius: 50%; border: 1px solid #ddd;" src="${imgUrl}" alt="Category Image" />
                        </td>
                        
                        <!-- Cột Tên danh mục -->
                        <td style="vertical-align: middle; font-weight: 500;">${cate.name}</td>
                        
                        <!-- Cột Hành động (Sửa / Xóa) -->
                        <td style="vertical-align: middle; text-align: center;">
                            <a href="<c:url value='/admin/category/edit?id=${cate.id}'/>">Sửa</a> | 
                            <a href="<c:url value='/admin/category/delete?id=${cate.id}'/>" onclick="return confirm('Bạn có chắc muốn xóa không?');" style="color: #d9534f;">Xóa</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>