/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

/**
 *
 * @author bamba
 */
public abstract class Pengguna {
    private Integer id;     
    private String nama;     
    private String email;    
    private String password;  
    
    public Pengguna() {
        
    }
    
    public Pengguna(Integer id) {
        this.id = id;
    }
    
    public Pengguna(Integer id, String nama) {
        this.id = id;
        this.nama=nama;
    }
    
    public Pengguna(Integer id, String nama, String email, String password) {
        this.id = id;
        this.nama = nama;
        this.email = email;
        this.password = password;
    }
    
    public Pengguna(String email, String password) {
        this.email = email;
        this.password = password;
    }
    
    public abstract void Register();
    
    public abstract Pengguna Login();
    
    public Integer getId() {         
        return this.id;     
    }     
    
    public String getNama() {         
        return this.nama;     
    }     
    
    public String getEmail() {        
        return this.email;     
    }     
    
    public String getPassword() {         
        return this.password;    
    }        
    
    public void setId(Integer id) {         
        this.id = id;     
    }    
    
    public void setNama(String nama) {        
        this.nama = nama;     
    }     
    
    public void setEmail(String email) {    
        this.email = email;     
    }     
    
    public void setPassword(String password) {   
        this.password = password;    
    } 
}
