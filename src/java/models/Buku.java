/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class Buku {
    private Integer id;
    private String judul;
    private String penulis;
    private Integer tahunTerbit;
    private Integer jumlahHalaman;
    private Integer harga;
    
    JDBC db = new JDBC();

    public Buku() {
    }
    
    public Buku(Integer id) {
        this.id = id;
    }

    public Buku(Integer id, String judul) {
        this.id = id;
        this.judul = judul;
    }

    public Buku(String judul) {
        this.judul = judul;
    }

    public Buku(Integer id, String judul, String penulis, Integer tahunTerbit, Integer jumlahHalaman, Integer harga) {
        this.id = id;
        this.judul = judul;
        this.penulis = penulis;
        this.tahunTerbit = tahunTerbit;
        this.jumlahHalaman = jumlahHalaman;
        this.harga = harga;
    }
    
    public Buku toModel(ResultSet rs) {
        try{
            return new Buku (
                    rs.getInt("id"),
                    rs.getString("judul"),
                    rs.getString("penulis"),
                    rs.getInt("tahunTerbit"),
                    rs.getInt("jumlahHalaman"),
                    rs.getInt("harga")
            );
        } catch (Exception e) {
            System.out.println("Error: "+e);
            return null;
        }
    }
    
    public ArrayList<Buku> get() {
        ArrayList<Buku> bk = new ArrayList<>();
        ResultSet rs = db.getData("SELECT * FROM buku");
        try{
             while(rs.next()) {
                 bk.add(toModel(rs));
             }
        } catch(SQLException ex) {
            System.out.println("Error: "+ex);
        }
        return bk;    
    }
    
    public ArrayList<Buku> find(String key) {
        ArrayList<Buku> bk = new ArrayList<>();
        ResultSet rs = db.getData("SELECT * FROM buku WHERE judul LIKE'"+key+"%'");
        try{
             while(rs.next()) {
                 bk.add(toModel(rs));
             }
        } catch(SQLException ex) {
            System.out.println("Error: "+ex);
        }
        return bk; 
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getJudul() {
        return judul;
    }

    public void setJudul(String judul) {
        this.judul = judul;
    }

    public String getPenulis() {
        return penulis;
    }

    public void setPenulis(String penulis) {
        this.penulis = penulis;
    }

    public Integer getTahunTerbit() {
        return tahunTerbit;
    }

    public void setTahunTerbit(Integer tahunTerbit) {
        this.tahunTerbit = tahunTerbit;
    }

    public Integer getJumlahHalaman() {
        return jumlahHalaman;
    }

    public void setJumlahHalaman(Integer jumlahHalaman) {
        this.jumlahHalaman = jumlahHalaman;
    }

    public Integer getHarga() {
        return harga;
    }

    public void setHarga(Integer harga) {
        this.harga = harga;
    }
}
