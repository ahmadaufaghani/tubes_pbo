<%-- 
    Document   : index
    Created on : 12 Jun 2025, 21.42.23
    Author     : bamba
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/style.css">
        <% 
           String title = request.getParameter("page"); 

           if(title == null) {
                title = "Login";
            } else {
                title = request.getParameter("page"); 
            }
           out.print("<title>"+title+" | e-book </title>");
        
        %>
    </head>
    <body>
        <%
                String p = request.getParameter("page");
                
                if(p == null) {
                    p="Login";
                }
            %>
        <div class="header">
            <div class="img">
                <h2>e-book</h1>
            </div>
            <p><a style="margin:0;" class="btn btn-continue-exploration" href="loginAdmin.jsp">Masuk sebagai admin</a></p>
        </div>
        <div class="container">
            <h1>e-book</h1>
            <div class="nav underline">
                <ul class="nav-list">
                    <li>
                        <a href="<%= request.getContextPath()+"?page=Login" %>" 
                   class="nav-item <% if(p.equals("Login")) {%>active<%}%>">
                    Login
                        </a>
                    </li>
                    <li>
                         <a href="<%= request.getContextPath()+"?page=Register" %>" 
                   class="nav-item <% if(p.equals("Register")) {%>active<%}%>">
                    Register
                </a>
                    </li>
                </ul>
                
                
               
            </div>
            
            
            <% 
                if(p.equals("Login")) { %>
                    <jsp:include page="login.jsp" flush="false"></jsp:include>
            <%    } else { %>
                <jsp:include page="register.jsp" flush="false"></jsp:include>
            <% } %>
            
        </div>
    </body>
</html>
