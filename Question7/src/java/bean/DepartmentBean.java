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
public class DepartmentBean {
    
     private Connection con=null;
    private static String url="jdbc:mysql://localhost/Jwd_7";
    private static String uname="shubham1";
    private static String pass="shubham";

    public DepartmentBean() {
      try{
           
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(url,uname,pass);
            
        }catch(Exception e){
            e.printStackTrace();
        }
    }

    public String getDname() {
        return dname;
    }

    public void setDname(String dname) {
        this.dname = dname;
    }
    
   private String dname;
   
      public ResultSet getData(){
        
        String sql = "select * from DepartmentTB";
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
            String sql = "insert into DepartmentTB(DepartmentName)values(?)";

            PreparedStatement stmt=con.prepareStatement(sql);
            stmt.setString(1,getDname());
           

            int i = stmt.executeUpdate();
            return i;
        }catch(Exception o){
            o.printStackTrace();
        }
        return 0;
    }
    
}
