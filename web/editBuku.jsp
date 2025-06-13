<%-- 
    Document   : editBuku
    Created on : 13 Jun 2025, 17.57.44
    Author     : bamba
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="models.Buku" %>
<%@page import="java.util.*" %>

<%
    if (session.getAttribute("adminData") == null) {
        response.sendRedirect("loginAdmin.jsp");
        return;
    }

    Buku b = (Buku) request.getAttribute("buku");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Edit Buku</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <div class="form-card" style="margin-top: 40px;">
        <h2 class="form-title">Edit Buku</h2>
        <form action="BookAdminController" method="post" class="form-grid">
            <input type="hidden" name="menu" value="update"/>
            <input type="hidden" name="id" value="<%= b.getId() %>"/>

            <input type="text" name="judul" class="input-box" value="<%= b.getJudul() %>" placeholder="Judul" required/>
            <input type="text" name="penulis" class="input-box" value="<%= b.getPenulis() %>" placeholder="Penulis" required/>
            <input type="number" name="tahun" class="input-box" value="<%= b.getTahunTerbit() %>" placeholder="Tahun Terbit" required/>
            <input type="number" name="halaman" class="input-box" value="<%= b.getJumlahHalaman() %>" placeholder="Jumlah Halaman" required/>
            <input type="number" name="harga" class="input-box" value="<%= b.getHarga() %>" placeholder="Harga" required/>

            <button type="submit" class="btn-input">Update Buku</button>
        </form>

        <a href="dashboardAdmin.jsp?page=book" class="btn btn-input-cancel" style="margin-top: 20px;">← Kembali</a>
    </div>
</body>
</html>

