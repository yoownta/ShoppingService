<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Trang quản trị Admin - Dashboard</title>
    <!-- Nhúng các thư viện CSS Bootstrap chuẩn -->
    <link href="<c:url value='/assets/admin/css/bootstrap.min.css'/>" rel="stylesheet">
    <link href="<c:url value='/assets/admin/css/font-awesome.min.css'/>" rel="stylesheet">
    <style>
        body { margin: 0; font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; background-color: #f4f6f9; }
        .wrapper { display: flex; width: 100%; min-height: 100vh; }
        
        /* Cột Menu bên trái (Màu xanh dương) */
        .sidebar { width: 260px; background-color: #007bff; color: #fff; flex-shrink: 0; }
        .sidebar .admin-profile { text-align: center; padding: 25px 15px; border-bottom: 1px solid rgba(255,255,255,0.1); }
        .sidebar .admin-profile img { width: 80px; height: 80px; border-radius: 50%; object-fit: cover; border: 3px solid #fff; margin-bottom: 10px; }
        .sidebar ul { list-style: none; padding: 0; margin: 0; }
        .sidebar ul li a { display: block; padding: 15px 20px; color: #fff; text-decoration: none; font-size: 15px; border-bottom: 1px solid rgba(255,255,255,0.05); transition: 0.2s; }
        .sidebar ul li a:hover, .sidebar ul li.active a { background-color: #d9534f; }
        .sidebar ul li.sub-menu a { padding-left: 35px; font-size: 13px; color: #ffcccc; background: rgba(0,0,0,0.15); }

        /* Cột Nội dung bên phải */
        .main-content { flex-grow: 1; display: flex; flex-direction: column; }
        
        /* Header phía trên */
        .header-top { background-color: #007bff; color: #fff; padding: 15px 30px; display: flex; justify-content: space-between; align-items: center; border-bottom: 2px solid rgba(0,0,0,0.05); }
        .header-top h1 { margin: 0; font-size: 28px; font-weight: bold; }
        .user-panel { display: flex; align-items: center; gap: 15px; font-size: 16px; font-weight: 500; }
        .btn-logout { background-color: #d9534f; color: white; padding: 6px 15px; border-radius: 4px; text-decoration: none; font-weight: 500; font-size: 14px; }

        /* Khu vực chứa nội dung thay đổi bên trong */
        .content-body { padding: 30px; }
    </style>
</head>
<body>

    <div class="wrapper">
        <!-- 1. SIDEBAR BÊN TRÁI -->
        <div class="sidebar">
            <div class="admin-profile">
                <img src="<c:url value='/upload/avatar-default.png'/>" alt="Avatar">
                <div style="font-size: 14px; font-weight: 500;">Bạn là Admin</div>
            </div>
            <ul>
                <li><a href="<c:url value='/admin/home'/>"><i class="fa fa-dashboard"></i> Dashboard</a></li>
                <li class="active">
                    <a href="<c:url value='/admin/category/list'/>"><i class="fa fa-folder"></i> Quản lý Danh mục</a>
                </li>
                <li class="sub-menu"><a href="<c:url value='/admin/category/add'/>">- Thêm danh mục mới</a></li>
                <li class="sub-menu"><a href="<c:url value='/admin/category/list'/>">- Danh sách danh mục</a></li>
                <li><a href="<c:url value='/admin/product/list'/>"><i class="fa fa-cube"></i> Quản lý sản phẩm</a></li>
                <li><a href="<c:url value='/admin/user/list'/>"><i class="fa fa-users"></i> Quản lý tài khoản</a></li>
            </ul>
        </div>

        <!-- 2. NỘI DUNG BÊN PHẢI -->
        <div class="main-content">
            <!-- Header trên cùng -->
            <div class="header-top">
                <h1>Dashboard</h1>
                <div class="user-panel">
                    <!-- Lấy tên tài khoản động từ Session do LoginServlet truyền sang -->
                    <span>Xin chào, ${sessionScope.account.fullName != null ? sessionScope.account.fullName : sessionScope.account.username}</span>
                    <a href="<c:url value='/logout'/>" class="btn-logout">Đăng xuất</a>
                </div>
            </div>

            <!-- Vùng chứa nội dung động (Sẽ nhúng file danh sách hoặc thêm mới vào đây) -->
            <div class="content-body">
                <jsp:include page="${subPage}" />
            </div>
        </div>
    </div>

</body>
</html>