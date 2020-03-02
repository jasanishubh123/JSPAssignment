/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author shubham
 */
public class SupplierBean {
     private Connection con=null;
    private static String url="jdbc:mysql://localhost/Jwd_7";
    private static String uname="shubham1";
    private static String pass="shubham";
    private String sname;
    private String gender;

    public String getSname() {
        return sname;
    }

    public void setSname(String sname) {
        this.sname = sname;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public SupplierBean() {
        
         try{
           
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(url,uname,pass);
            
        }catch(Exception e){
            e.printStackTrace();
        }
    }
    
          public ResultSet getData(){
        
        String sql = "select * from SupplierTB";
        try{
            Statement stmt = con.createStatement();
            ResultSet rs  = stmt.executeQuery(sql);
            return rs;

        }catch(Exception e)
        {
            e.printStackTrace();
        }
        return null;
        
        
    }
    public int insert(){
         try{
            String sql = "insert into SupplierTB(SupplierName,Gender)values(?,?)";

            PreparedStatement stmt=con.prepareStatement(sql);
            stmt.setString(1,getSname());
            stmt.setString(2,getGender());

            int i = stmt.executeUpdate();
            return i;
        }catch(Exception o){
            o.printStackTrace();
        }
        return 0;
    }
    
}
