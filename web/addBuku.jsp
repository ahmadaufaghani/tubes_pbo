<%-- 
    Document   : addBuku
    Created on : 13 Jun 2025, 17.09.17
    Author     : bamba
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    if (session.getAttribute("adminData") == null) {
        response.sendRedirect("loginAdmin.jsp");
        return;
    }
%>
<html>
<head>
    <title>Tambah Buku</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <div class="form-card" style="margin-top: 40px;">
        <h2 class="form-title">Tambah Buku Baru</h2>
        <form action="BookAdminController" method="post" class="form-grid">
            <input type="hidden" name="menu" value="add"/>

            <input type="text" name="judul" placeholder="Judul" class="input-box" required/>
            <input type="text" name="penulis" placeholder="Penulis" class="input-box" required/>
            <input type="number" name="tahun" placeholder="Tahun Terbit" class="input-box" required/>
            <input type="number" name="halaman" placeholder="Jumlah Halaman" class="input-box" required/>
            <input type="number" name="harga" placeholder="Harga" class="input-box" required/>

            <button type="submit" class="btn-input">Tambah Buku</button>
        </form>
        
    </div>
    <a href="bookAdmin.jsp" class="btn btn-input-cancel" style="margin-top: 20px;">Kembali ke Daftar Buku</a>
</body>
</html>

