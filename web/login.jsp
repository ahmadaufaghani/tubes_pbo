<%-- 
    Document   : login
    Created on : 11 May 2025, 16.41.40
    Author     : Ahmad Aufa Ghani
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<form method="POST" action="PembeliController?menu=login">
    <input class="input-box" type="email" name="email" placeholder="Email address">
    <input class="input-box" type="password" name="password" placeholder="Password">
    <button type="submit" class="input-btn">Login</button>
</form>
