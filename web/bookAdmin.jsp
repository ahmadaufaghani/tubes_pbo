<%-- 
    Document   : bookAdmin
    Created on : 13 Jun 2025, 14.59.05
    Author     : bamba
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, models.Buku" %>
<%
    if (session.getAttribute("adminData") == null) {
        response.sendRedirect("loginAdmin.jsp");
        return;
    }

    Buku b = new Buku();
    ArrayList<Buku> list = b.get();
%>
<html>
<head>
    <title>Kelola Buku</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 20px;">
    <div class="header-transaction-admin">
        <h2>Daftar Buku</h2>
    </div>
    <a href="addBuku.jsp" class="btn btn-input">Tambah Buku</a>
</div>
 
    <div class="book-admin-table">
    <table class="content-table">
        <tr>
            <th>Judul</th>
            <th>Penulis</th>
            <th>Tahun</th>
            <th>Halaman</th>
            <th>Harga</th>
            <th>Aksi</th>
        </tr>
        <%
            for(Buku book : list) {
        %>
        <tr>
            <td><%= book.getJudul() %></td>
            <td><%= book.getPenulis() %></td>
            <td><%= book.getTahunTerbit() %></td>
            <td><%= book.getJumlahHalaman() %></td>
            <td>$<%= book.getHarga() %></td>
            <td>
                <a href="BookAdminController?menu=edit&id=<%= book.getId() %>">Edit</a> |
                <a href="BookAdminController?menu=delete&id=<%= book.getId() %>">Hapus</a>
            </td>
        </tr>
        <% } %>
    </table>
</div>
    <a href="dashboardAdmin.jsp" class="btn btn-input-cancel" style="margin-top: 20px;">Kembali ke Dashboard</a>
    
</body>
</html>

