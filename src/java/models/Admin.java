/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

import java.sql.ResultSet;
import java.sql.SQLException;
/**
 *
 * @author bamba
 */
public class Admin extends Pengguna{
    JDBC db = new JDBC();
    
    public Admin() {}
    
    public Admin(Integer id) {
        super(id);
    }
    
    public Admin(Integer id, String nama) {
        super(id, nama);
    }
    
    public Admin(Integer id, String nama, String email, String password) {
        super(id, nama, email, password);
    }
    
    public Admin(String email, String password) {
        super(email, password);
    }
    
    public Admin toModel(ResultSet rs) {
       try {
           return new Admin(
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
        db.runQuery("INSERT INTO admin (nama, email, password) VALUES ('" + getNama() + "', '" + getEmail() + "', '" + getPassword() + "')");
    }
    
    @Override
    public Admin Login() {
        ResultSet rs = db.getData("SELECT * FROM admin WHERE email = '" + getEmail() + "' AND password = '" + getPassword() + "'");
        try {
            if (rs.next()){
                return toModel(rs);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
    
    public void updateProfile() {
       db.runQuery("UPDATE admin SET email='"+getEmail()+"', nama='"+getNama()+"', password='"+getPassword()+"' WHERE id="+getId());
   }
   
   public void delete() {
        db.runQuery("DELETE FROM admin WHERE id="+getId());
   }
}
