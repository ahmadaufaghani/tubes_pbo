<%-- 
    Document   : transactionAdmin
    Created on : 13 Jun 2025, 14.59.39
    Author     : bamba
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, models.Transaksi" %>
<%
    if (session.getAttribute("adminData") == null) {
        response.sendRedirect("loginAdmin.jsp");
        return;
    }

    Transaksi tr = new Transaksi();
    ArrayList<Transaksi> list = tr.getTransactionUser("0 OR 1=1"); // ambil semua data
%>
<html>
<head>
    <title>Semua Transaksi</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <div class="header-transaction-admin">
        <h2>Semua Transaksi Pembeli</h2>
    </div>
    <div class="table-transaction">
        <table class="content-table">
            <tr>
                <th>ID</th>
                <th>Judul Buku</th>
                <th>Nama Pembeli</th>
                <th>Tanggal</th>
                <th>Harga</th>
            </tr>
                <% for(Transaksi t : list) { %>
            <tr>
                <td><%= t.getNomorTransaksi() %></td>
                <td><%= t.getBuku().getJudul() %></td>
                <td><%= t.getPembeli().getNama() %></td>
                <td><%= t.getTanggal() %></td>
                <td><%= t.getHarga() %></td>
            </tr>
        <% } %>
    </table>
    </div>
    <a href="dashboardAdmin.jsp" class="btn btn-input-cancel" style="margin-top: 20px;">Kembali ke Dashboard</a>
</body>
</html>

