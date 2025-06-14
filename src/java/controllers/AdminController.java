/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import models.Admin;
import models.JDBC;

/**
 *
 * @author bamba
 */
@WebServlet(name = "AdminController", urlPatterns = {"/AdminController"})
public class AdminController extends HttpServlet {
    
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String menu = request.getParameter("menu");
        
        if (menu == null) {
            response.sendRedirect("dashboardAdmin.jsp");
        } else if (menu.equals("logout")) {
            request.getSession(false).invalidate();
            response.sendRedirect(request.getContextPath() + "/index.jsp");
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String menu = request.getParameter("menu");
        Admin admin = new Admin();
        
        if (menu.equals("login")) {
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            
            admin.setEmail(email);
            admin.setPassword(password);
            Admin adm = (Admin) admin.Login();
            
            if (adm != null) {
                request.getSession().setAttribute("adminId", adm.getId());
                request.getSession().setAttribute("adminData", adm);
                response.sendRedirect("dashboardAdmin.jsp");
            } else {
                response.sendRedirect("loginAdmin.jsp");
            }
        } else if (menu.equals("register")) {
            String nama = request.getParameter("nama");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            
            admin.setNama(nama);
            admin.setEmail(email);
            admin.setPassword(password);
            admin.Register();
            
            response.sendRedirect("login.jsp");
        } else if (menu.equals("update")) {
            String id = request.getParameter("id");
            String nama = request.getParameter("nama");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            
            admin.setId(Integer.parseInt(id));
            admin.setNama(nama);
            admin.setEmail(email);
            admin.setPassword(password);
            admin.updateProfile();
            
            response.sendRedirect("profilAdmin.jsp");
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
