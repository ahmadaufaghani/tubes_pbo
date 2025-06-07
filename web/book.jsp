<%-- 
    Document   : book
    Created on : 7 Jun 2025, 00.26.47
    Author     : Ahmad Aufa Ghani
--%>

<%@page import="models.Transaksi"%>
<%@page import="java.util.ArrayList"%>
<%@page import="models.Buku"%>
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
    <title>Book | e-book</title>
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
                    <a class="active" href="BukuController">Book</a>
                </li>
                <li>
                    <a class="" href="TransaksiController?id=<%= userSession.getAttribute("userId") %>">Transaction</a>
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
        <form method="get" action="BukuController?">
            <div class="search underline">
                <input class="search-box" type="text" name="key" placeholder="Find the book that you like here">
                <input class="btn btn-search" type="submit" value="Search">
            </div>
        </form>
        <div class="content-header-edited-1">
           <h1 class="content-header-title">Our Latest Collection</h1>
           <p class="content-header-desc">Here is our latest and greatest books that you'll never find anywhere!</p>
        </div>
        <div>
            <div class="collection-content-item">
                <%
                    Transaksi tr = new Transaksi();
                    ArrayList<Buku> bk = (ArrayList<Buku>) request.getAttribute("list");
                    
                    if(bk != null && !bk.isEmpty()) {
                        for (Buku b : bk) {
                            
                %>
                <form method="post" action="TransaksiController?menu=buy">
                    <div class="content-item">
                        <input hidden name="idBuku" value="<%= b.getId() %>">
                        <input hidden name="idPembeli" value="<%= userSession.getAttribute("userId") %>">
                        <input hidden name="harga" value="<%= b.getHarga() %>">

                        <h3 class="content-item-header underline"><%= b.getJudul() %></h3>
                        <p class="content-item-description"><%= b.getPenulis() %></p>
                        <p class="content-item-description"><%= b.getTahunTerbit() %></p>
                        <p class="content-item-description additional-mb additional-pb underline"><%= b.getJumlahHalaman() %> Pages</p>
                        <div class="content-item-action">
                                <% if(tr.alreadyBought(b.getId(), (Integer)userSession.getAttribute("userId"))) { %>
                                    <p class="text-purchased">Purchased!</p>
                                <%}else {%>
                                    <p class="buy-price">$ <%= b.getHarga() %></p>
                                    <input type="submit" class="btn btn-buy" value="Buy">
                                <% }%>
                        </div>
                    </div>
                </form>
                <%
                        }
                    }
                %>
            </div>  
        </div>
    </div>
</body>
</html>