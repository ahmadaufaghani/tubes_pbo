<%-- 
    Document   : register
    Created on : 12 Jun 2025, 21.47.13
    Author     : bamba
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<form method="POST" action="PembeliController?menu=register">
    <input class="input-box" type="email" name="email" placeholder="Email address">
    <input class="input-box" type="text" name="name" placeholder="Name">
    <input class="input-box" type="password" name="password" placeholder="Password">
    <button type="submit" class="input-btn">Register</button>
</form>
