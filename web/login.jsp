<%-- 
    Document   : login
    Created on : 12 Jun 2025, 21.47.03
    Author     : bamba
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<form method="POST" action="PembeliController?menu=login">
    <input class="input-box" type="email" name="email" placeholder="Email address">
    <input class="input-box" type="password" name="password" placeholder="Password">
    <button type="submit" class="input-btn">Login</button>
</form>
