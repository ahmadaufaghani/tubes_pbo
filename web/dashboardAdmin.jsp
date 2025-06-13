<%-- 
    Document   : dashboardAdmin
    Created on : 13 Jun 2025, 14.58.07
    Author     : bamba
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="models.Admin" %>

<%
    Admin admin = (Admin) session.getAttribute("adminData");
    if (admin == null) {
        response.sendRedirect("loginAdmin.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Dashboard Admin</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <!-- HEADER -->
    <div class="header">
        <h2 class="content-header-title">Welcome, <%= admin.getNama() %></h2>
        <a href="AdminController?menu=logout" class="btn btn-input-cancel">Logout</a>
    </div>

    <!-- NAVIGATION ADMIN -->
    <div class="admin-nav">
        <a href="bookAdmin.jsp" class="btn btn-input">Kelola Buku</a>
        <a href="transactionAdmin.jsp" class="btn btn-input">Lihat Transaksi</a>
        <a href="profilAdmin.jsp" class="btn btn-input">Edit Profil</a>
    </div>
</body>
</html>

