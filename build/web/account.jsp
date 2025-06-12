<%-- 
    Document   : account
    Created on : 12 Jun 2025, 21.46.18
    Author     : bamba
--%>

<%@page import="models.Pembeli"%>
<%@page import="java.sql.ResultSet" contentType="text/html" pageEncoding="UTF-8"%>

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
    <title>Account | e-book</title>
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
                    <a class="" href="TransaksiController?id=<%= userSession.getAttribute("userId") %>">Transaction</a>
                </li>
                 <li>
                    <a class="active" href="PembeliController?id=<%= userSession.getAttribute("userId") %>">Account</a>
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
        <div class="content-header">
            <h1 class="content-header-title">Account</h1>
            <p class="content-header-desc">Here you can see and edit all of your personal information.</p>
        </div>
        <div class="content-data">
            <div class="sub-content-data">
                <form method="POST" action="PembeliController?menu=update">
                <% 

                Pembeli p = (Pembeli)request.getAttribute("list");
                %>
                    <div class="data nameData">
                        <div>
                            <input hidden name="id" value="<%= p.getId() %>">
                            <label for="nama"><h4 class="data-label">Your Name</h4></label>
                            <p class="data-value"><%= p.getNama() %></p>
                        </div>
                        <div>
                            <a class="editName" href="#edit">Edit</a>
                        </div>
                    </div>
                    <div class="data-edit nameInput hidden">
                        <div>
                            <label for="nama"><h4 class="data-label">Your Name</h4></label>
                            <input class="data-input inputNama" type="text" name="nama" value="<%= p.getNama() %>">
                            <input class="btn-input saveName" type="submit" value="Save">
                            <a class="btn-input-cancel cancelName" href="#cancel">Cancel</a>
                        </div>
                    </div>
                    <div class="data emailData">
                        <div>
                            <label for="email"><h4 class="data-label">Your Email</h4></label>
                            <p class="data-value"><%= p.getEmail() %></p>
                        </div>
                        <div>
                            <a class="editEmail" href="#edit">Edit</a>
                        </div>
                    </div>
                    <div class="data-edit emailInput hidden">
                        <div>
                            <label for="email"><h4 class="data-label">Your Email</h4></label>
                            <input class="data-input inputEmail" type="email" name="email" value="<%= p.getEmail() %>">
                            <input class="btn-input saveEmail" type="submit" value="Save">
                            <a class="btn-input-cancel cancelEmail" href="#cancel">Cancel</a>
                        </div>
                    </div>
                    <div class="data passwordData">
                        <div>
                            <label for="password"><h4 class="data-label">Your Password</h4></label>
                            <p >••••••••</p>
                            <p hidden class="data-value"><%= p.getPassword() %></p>
                        </div>
                        <div>
                            <a class="editPassword" href="#edit">Edit</a>
                        </div>
                    </div>
                    <div class="data-edit passwordInput hidden">
                        <div>
                            <label for="password"><h4 class="data-label">Your Password</h4></label>
                            <input class="data-input inputPassword" type="password" name="password" value="<%= p.getPassword() %>">
                            <input class="btn-input savePassword" type="submit" value="Save">
                            <a class="btn-input-cancel cancelPassword" href="#cancel">Cancel</a>
                        </div>
                    </div>
                </form>
            </div>
            <div class="content-action">
                <div class="action">
                    <h4>Delete Your Account Here</h4>
                    <a class="btn btn-delete" href="PembeliController?menu=delete&id=<%= p.getId()  %>">Delete Account</a>
                </div>
            </div>
         <%
               
         %>
        
        </div>
    </div>
<script>
        const nameData = document.getElementsByClassName("nameData");
        const nameDataEdit = document.getElementsByClassName("nameInput");
        const editName = document.getElementsByClassName("editName");
        const saveName = document.getElementsByClassName("saveName");
        editName[0].addEventListener('click', function() {
            nameData[0].classList.add("hidden");
            nameDataEdit[0].classList.remove("hidden");
        });
        saveName[0].addEventListener('click', function() {
            nameData[0].classList.remove("hidden");
            nameDataEdit[0].classList.add("hidden");
        });

        const emailData = document.getElementsByClassName("emailData");
        const emailDataEdit = document.getElementsByClassName("emailInput");
        const editEmail = document.getElementsByClassName("editEmail");
        const saveEmail = document.getElementsByClassName("saveEmail");
        editEmail[0].addEventListener('click', function() {
            emailData[0].classList.add("hidden");
            emailDataEdit[0].classList.remove("hidden");
        });
        saveEmail[0].addEventListener('click', function() {
            emailData[0].classList.remove("hidden");
            emailDataEdit[0].classList.add("hidden");
        });

        const passwordData = document.getElementsByClassName("passwordData");
        const passwordDataEdit = document.getElementsByClassName("passwordInput");
        const editPassword = document.getElementsByClassName("editPassword");
        const savePassword = document.getElementsByClassName("savePassword");
        editPassword[0].addEventListener('click', function() {
            passwordData[0].classList.add("hidden");
            passwordDataEdit[0].classList.remove("hidden");
        });
        savePassword[0].addEventListener('click', function() {
            passwordData[0].classList.remove("hidden");
            passwordDataEdit[0].classList.add("hidden");
        });
        
        
        const nameCancel = document.getElementsByClassName("cancelName");
        const emailCancel = document.getElementsByClassName("cancelEmail");
        const passwordCancel = document.getElementsByClassName("cancelPassword");
        
        nameCancel[0].addEventListener('click', function() {
            nameData[0].classList.remove("hidden");
            nameDataEdit[0].classList.add("hidden");
        });
        
        emailCancel[0].addEventListener('click', function() {
            emailData[0].classList.remove("hidden");
            emailDataEdit[0].classList.add("hidden");
        });
        
        passwordCancel[0].addEventListener('click', function() {
            passwordData[0].classList.remove("hidden");
            passwordDataEdit[0].classList.add("hidden");
        });
</script>
</body>
</html>
