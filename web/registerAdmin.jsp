<%-- 
    Document   : registerAdmin
    Created on : 13 Jun 2025, 15.49.24
    Author     : bamba
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
    <title>Register Admin</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <div class="form-card">
        <h2 class="form-title">Login Admin</h2>
        <form method="POST" action="AdminController">
            <input type="hidden" name="menu" value="register" />
            <input class="input-box" type="text" name="nama" placeholder="Nama Lengkap" required>
            <input class="input-box" type="email" name="email" placeholder="Email Admin" required>
            <input class="input-box" type="password" name="password" placeholder="Password" required>
            <button type="submit" class="input-btn">Register</button>
        </form>
        <br>
        <p><a href="loginAdmin.jsp">Kembali ke login admin</a></p>
    <div>
</body>
</html>

