package models;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/*  * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license  * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template  */ 
  /**  *  * @author Ahmad Aufa Ghani  */
public class Pembeli extends Pengguna { 
   JDBC db = new JDBC();
   
   public Pembeli(Integer id, String nama, String email, String password) {
       super(id, nama, email, password);
   }
   
   public Pembeli(String email, String password) {
       super(email, password);
   }
   
   public Pembeli(Integer id) {
       super(id);
   }
   
   public Pembeli(Integer id, String nama) {
       super(id, nama);
   }
   
   public Pembeli() {
       
   }
   
   public Pembeli toModel(ResultSet rs) {
       try {
           return new Pembeli(
                rs.getInt("id"),
                rs.getString("nama"),
                rs.getString("email"),
                rs.getString("password")
           );
       } catch (Exception e) {
           System.out.println("Error: " + e.getMessage());
           return null;
       }
   }
   
    @Override
    public void Register() {
        db.runQuery("insert into pembeli (nama,email,password) values ('"+getNama()+"','"+getEmail()+"','"+getPassword()+"')");
    }   

   @Override
   public Pembeli Login() {
      ResultSet rs = db.getData("select * from pembeli WHERE email='"+getEmail()+"' AND password='"+getPassword()+"'");
      try {
           if(rs.next()) {
               return toModel(rs);
           }
       } catch (SQLException ex) {
           System.out.println(ex);
       } 
       return null;
   }
   
   public void update() {
       db.runQuery("UPDATE pembeli SET email='"+getEmail()+"', nama='"+getNama()+"', password='"+getPassword()+"' WHERE id="+getId());
   }
   
   public void delete() {
        db.runQuery("DELETE FROM pembeli WHERE id="+getId());
   }
   
   public Pembeli find(String id) {
       ResultSet rs = db.getData("select * from pembeli WHERE id="+id);
       try {
           if(rs.next()) {
               return toModel(rs);
           }
       } catch (SQLException ex) {
           System.out.println(ex);
       } 
       return null;
   }
} 