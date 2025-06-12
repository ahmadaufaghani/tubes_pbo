/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author bamba
 */
public class Transaksi {
    JDBC db = new JDBC();
    
    private Integer nomorTransaksi;
    private Buku buku;
    private Pembeli pembeli;
    private String tanggal;
    private Integer harga;
    
    public Transaksi(){
        
    }
    
    public Transaksi(Integer nomorTransaksi, Buku buku, Pembeli pembeli, String tanggal, Integer harga) {
        this.nomorTransaksi = nomorTransaksi;
        this.buku = buku;
        this.pembeli = pembeli;
        this.tanggal = tanggal;
        this.harga = harga;
    }
    
    public Transaksi toModel(ResultSet rs) {
        try {
           
            return new Transaksi(
                    rs.getInt("id"),
                    new Buku(rs.getInt("bukuId"),rs.getString("judul")),
                    new Pembeli(rs.getInt("pembeliId"), rs.getString("nama")),
                    rs.getString("tanggal"),
                    rs.getInt("harga")
            );
        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
            return null;
        }
    }
    
    public ArrayList<Transaksi> getTransactionUser(String id) {
        ArrayList<Transaksi> tr = new ArrayList<>();
        ResultSet rs = db.getData("SELECT transaksi.id, transaksi.pembeliId, pembeli.nama, transaksi.bukuId, buku.judul, transaksi.tanggal, transaksi.harga FROM transaksi \n" +
                        "INNER JOIN buku ON transaksi.bukuId = buku.id \n" +
                        "INNER JOIN pembeli ON transaksi.pembeliId = pembeli.id \n" +
                        "WHERE transaksi.pembeliId="+id);
        try{
             while(rs.next()) {
                 tr.add(toModel(rs));
             }
        } catch(SQLException ex) {
            System.out.println("Error: "+ex);
        }
        return tr;  
    }
    
    public void insert() {
        db.runQuery("INSERT INTO transaksi (bukuId, pembeliId, tanggal, harga) VALUES("+buku.getId()+","+pembeli.getId()+",'"+getTanggal()+"',"+getHarga()+")");
    }
    
    public boolean alreadyBought(Integer idBuku, Integer idPembeli) {
        ResultSet rs = db.getData("SELECT count(*) AS jumlah FROM `transaksi` WHERE bukuId ="+idBuku+" AND pembeliId ="+idPembeli+"");
        try {
            if(rs.next()) {
                if(rs.getInt("jumlah") > 0) {
                    return true;
                }
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return false;
    }
    
    

    public Integer getNomorTransaksi() {
        return nomorTransaksi;
    }

    public void setNomorTransaksi(Integer nomorTransaksi) {
        this.nomorTransaksi = nomorTransaksi;
    }

    public Buku getBuku() {
        return buku;
    }

    public void setBuku(Buku buku) {
        this.buku = buku;
    }

    public Pembeli getPembeli() {
        return pembeli;
    }

    public void setPembeli(Pembeli pembeli) {
        this.pembeli = pembeli;
    }

    public String getTanggal() {
        return tanggal;
    }

    public void setTanggal(String tanggal) {
        this.tanggal = tanggal;
    }

    public Integer getHarga() {
        return harga;
    }

    public void setHarga(Integer harga) {
        this.harga = harga;
    }
}
