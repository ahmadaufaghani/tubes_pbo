<%-- 
    Document   : profilAdmin
    Created on : 13 Jun 2025, 14.55.10
    Author     : bamba
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="models.Admin" %>

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
    <title>Edit Profil Admin</title>
    <link rel="stylesheet" href="css/style.css">
    <style>
        .form-card {
            max-width: 500px;
            margin: 40px auto;
            padding: 30px;
            border: 1px solid #f2f2f2;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.05);
            background-color: white;
        }

        .form-title {
            font-size: 22px;
            font-weight: 600;
            text-align: center;
            margin-bottom: 24px;
        }

        .form-grid {
            display: flex;
            flex-direction: column;
            gap: 16px;
        }
    </style>
</head>
<body>

    <div class="form-card">
        <h2 class="form-title">Edit Profil Admin</h2>
        <form action="AdminController" method="post" class="form-grid">
            <input type="hidden" name="menu" value="update"/>
            <input type="hidden" name="id" value="<%= admin.getId() %>"/>

            <input type="text" name="nama" class="input-box" value="<%= admin.getNama() %>" placeholder="Nama" required/>
            <input type="email" name="email" class="input-box" value="<%= admin.getEmail() %>" placeholder="Email" required/>
            <input type="password" name="password" class="input-box" value="<%= admin.getPassword() %>" placeholder="Password" required/>

            <button type="submit" class="btn-input">Update</button>
        </form>
       
    </div>
             <a href="dashboardAdmin.jsp?page=book" class="btn btn-input-cancel" style="margin-top: 20px;">Kembali ke Dashboard</a>
</body>
</html>


