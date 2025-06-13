<%-- 
    Document   : login
    Created on : 12 Jun 2025, 21.47.03
    Author     : bamba
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
    <title>Login Pembeli</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <form method="POST" action="PembeliController">
        <input type="hidden" name="menu" value="login" />
        <input class="input-box" type="email" name="email" placeholder="Email address" required>
        <input class="input-box" type="password" name="password" placeholder="Password" required>
        <button type="submit" class="input-btn">Login</button>
    </form>
    <br>
    
</body>
</html>


