/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Buku;
import models.Pembeli;
import models.Transaksi;

/**
 *
 * @author Ahmad Aufa Ghani
 */
@WebServlet(name = "TransaksiController", urlPatterns = {"/TransaksiController"})
public class TransaksiController extends HttpServlet {

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
        Transaksi tr = new Transaksi();
        if(menu == null) {
            String id = request.getParameter("id");
            ArrayList<Transaksi> tr1 = tr.getTransactionUser(id);
            request.setAttribute("list",tr1);
            request.getRequestDispatcher("transaction.jsp").forward(request, response);
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
       if(menu.equals("buy")) {
           Integer idBuku = Integer.parseInt(request.getParameter("idBuku"));
           Integer idPembeli = Integer.parseInt(request.getParameter("idPembeli"));
           Integer harga = Integer.parseInt(request.getParameter("harga"));
           LocalDate date = LocalDate.now();
           DateTimeFormatter df = DateTimeFormatter.ofPattern("yyyy-MM-dd");
           String dateFinal = df.format(date);
                   
                   
           Buku bk = new Buku(idBuku);
           Pembeli pb = new Pembeli(idPembeli);
           Transaksi tr = new Transaksi();
           
           tr.setBuku(bk);
           tr.setPembeli(pb);
           tr.setTanggal(dateFinal);
           tr.setHarga(harga);
           tr.insert();
           response.sendRedirect("BukuController");
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
