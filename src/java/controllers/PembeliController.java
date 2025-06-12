/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers;

import models.JDBC;
import models.Pembeli;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 *
 * @author Ahmad Aufa Ghani
 */
@WebServlet(name = "PembeliController", urlPatterns = {"/PembeliController"})
public class PembeliController extends HttpServlet {
    JDBC db = new JDBC();
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
        if(menu==null) {
            String id = request.getParameter("id");
            Pembeli pb = new Pembeli().find(id);
            if(pb != null) {
                request.setAttribute("list",pb);
                request.getRequestDispatcher("account.jsp").forward(request, response);
            } else {
                response.sendRedirect(request.getContextPath()+"/index.jsp");
            }
            
        } else if (menu.equals("delete")) {
            String id = request.getParameter("id");
            Pembeli pb = new Pembeli().find(id);
            pb.setId(Integer.parseInt(id));
            pb.delete();
            response.sendRedirect(request.getContextPath()+"/index.jsp");
        } else if (menu.equals("logout")) {
            request.getSession(false).invalidate();
            response.sendRedirect(request.getContextPath()+"/index.jsp");
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
        Pembeli p = new Pembeli();
        if (menu.equals("login")) {
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            p.setEmail(email);
            p.setPassword(password);
            Pembeli pb = p.Login();
            
            if(pb != null) {
                request.getSession().setAttribute("userId", pb.getId());
                response.sendRedirect("BukuController");
                
            } else {
                response.sendRedirect("index.jsp");
            }
        }  else if (menu.equals("register")) {
            String email = request.getParameter("email");
            String nama = request.getParameter("name");
            String password = request.getParameter("password");
            p.setEmail(email);
            p.setNama(nama);
            p.setPassword(password);
            p.Register();
            response.sendRedirect(request.getContextPath()+"/index.jsp");
        }  else if (menu.equals("update")) {
            String id = request.getParameter("id");
            String email = request.getParameter("email");
            String nama = request.getParameter("nama");
            String password = request.getParameter("password");
            p.setId(Integer.parseInt(id));
            p.setEmail(email);
            p.setNama(nama);
            p.setPassword(password);
            p.update();
            response.sendRedirect(request.getContextPath()+"/PembeliController?id="+id);
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