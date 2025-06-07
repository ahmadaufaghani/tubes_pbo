<%-- 
    Document   : transaction
    Created on : 7 Jun 2025, 00.27.30
    Author     : Ahmad Aufa Ghani
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="models.Transaksi"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    HttpSession userSession = request.getSession(false);
    if (userSession == null || userSession.getAttribute("userId") == null) {
        response.sendRedirect("index.jsp");
        return;
    }
    
    if (request.getParameter("id")!=null) {
        if(!userSession.getAttribute("userId").equals(Integer.parseInt(request.getParameter("id")))) {
            response.sendRedirect("index.jsp");
            return;
        }
    }
    
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Transaction</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <div class="header">
        <div class="img">
            <h2>e-book</h1>
        </div>
        <div class="tab">
            <ul class="tab-list">
                <li>
                    <a class="" href="BukuController">Book</a>
                </li>
                <li>
                    <a class="active" href="TransaksiController?id=<%= userSession.getAttribute("userId") %>">Transaction</a>
                </li>
                <li>
                    <a class="" href="PembeliController?id=<%= userSession.getAttribute("userId") %>">Account</a>
                </li>
            </ul>
        </div>
        <div class="profile">
            <a href="PembeliController?menu=logout">
                <img class="exit-img" src="img/exit.png">
            </a>
            <img class="profile-img" src="img/img-profile.png" alt="">
        </div>
    </div>
    <div class="content">
        <div class="content-header-edited-2">
            <div>
                <h1 class="content-header-title">Transaction</h1>
               <p class="content-header-desc">Here is a complete history of your book transaction!</p>
            </div>
            <div>
                <a href="BukuController" class="btn btn-continue-exploration">Continue Your Book Exploration</a>
            </div>
        </div>
        <table class="content-table">
                <tr class="content-table-header underline">
                    <th class="content-table-header-value">Transaction ID</th>
                    <th class="content-table-header-value">Book</th>
                    <th class="content-table-header-value">Date</th>
                    <th class="content-table-header-value">Price</th>
                </tr>
                <%
                    ArrayList<Transaksi> tr = (ArrayList<Transaksi>) request.getAttribute("list");
                    if(tr != null && !tr.isEmpty()) {
                        for (Transaksi t : tr) {
                    
                %>
                <tr class="content-table-item underline">
                    <td class="content-table-value"><%= t.getNomorTransaksi() %></td>
                    <td class="content-table-value"><%= t.getBuku().getJudul() %></td>
                    <td class="content-table-value"><%= t.getTanggal() %></td>
                    <td class="content-table-value">$ <%= t.getHarga() %></td>
                </tr>
                <%
                        }
                    }
                %>  
        </table>
    </div>
</body>
</html>
