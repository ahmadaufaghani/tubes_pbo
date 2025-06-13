<%-- 
    Document   : loginAdmin
    Created on : 13 Jun 2025, 15.48.59
    Author     : bamba
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
    <title>Login Admin</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <div class="form-card">
        <h2 class="form-title">Login Admin</h2>
        <form method="POST" action="AdminController">
            <input type="hidden" name="menu" value="login" />
            <input class="input-box" type="email" name="email" placeholder="Email address" required>
            <input class="input-box" type="password" name="password" placeholder="Password" required>
            <button type="submit" class="input-btn">Login</button>
        </form>
        <br>
        <p>Belum punya akun admin? <a href="registerAdmin.jsp">Daftar di sini</a></p>
        <p><a href="index.jsp">Kembali ke login pembeli</a></p>
     </div>
</body>
</html>

