/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers;

import models.Buku;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.sql.ResultSet;
import models.JDBC;

@WebServlet(name = "BookAdminController", urlPatterns = {"/BookAdminController"})
public class BookAdminController extends HttpServlet {
JDBC db = new JDBC();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String menu = request.getParameter("menu");

        if (menu == null) {
            // Tampilkan semua buku
            Buku buku = new Buku();
            ArrayList<Buku> list = buku.get();
            request.setAttribute("list", list);
            request.getRequestDispatcher("bookAdmin.jsp").forward(request, response);

        } else if (menu.equals("edit")) {
            
            String id = request.getParameter("id");
            ResultSet rs = db.getData("SELECT * FROM buku WHERE id=" + id);
            try {
                if (rs.next()) {
                    Buku b = new Buku().toModel(rs);
                    request.setAttribute("buku", b);
                    request.getRequestDispatcher("editBuku.jsp").forward(request, response);
                }
            } catch (Exception e) {
                 System.out.println("Error: " + e.getMessage());
                 response.sendRedirect("dashboardAdmin.jsp?page=book");
    }
    

        } else if (menu.equals("delete")) {
            String id = request.getParameter("id");
            Buku buku = new Buku(Integer.parseInt(id));
            buku.delete();
            response.sendRedirect("BookAdminController");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String menu = request.getParameter("menu");

        if (menu.equals("add")) {
            String judul = request.getParameter("judul");
            String penulis = request.getParameter("penulis");
            Integer tahun = Integer.parseInt(request.getParameter("tahun"));
            Integer halaman = Integer.parseInt(request.getParameter("halaman"));
            Integer harga = Integer.parseInt(request.getParameter("harga"));

            Buku buku = new Buku(null, judul, penulis, tahun, halaman, harga);
            buku.insert();
            response.sendRedirect("BookAdminController");

        } else if (menu.equals("update")) {
            String id = request.getParameter("id");
            String judul = request.getParameter("judul");
            String penulis = request.getParameter("penulis");
            Integer tahun = Integer.parseInt(request.getParameter("tahun"));
            Integer halaman = Integer.parseInt(request.getParameter("halaman"));
            Integer harga = Integer.parseInt(request.getParameter("harga"));

            db.runQuery("UPDATE buku SET judul='" + judul + "', penulis='" + penulis + "', tahunTerbit=" + tahun + ", jumlahHalaman=" + halaman + ", harga=" + harga + " WHERE id=" + id);
            response.sendRedirect("bookAdmin.jsp");
}
    }

    @Override
    public String getServletInfo() {
        return "Controller untuk CRUD Buku oleh Admin";
    }
}

