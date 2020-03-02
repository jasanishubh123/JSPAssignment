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
public class CustomerBean {
    private String cname;
    private String location;
  private Connection con=null;
    private static String url="jdbc:mysql://localhost/Jwd_7";
    private static String uname="shubham1";
    private static String pass="shubham";

    public CustomerBean() {
      try{
           
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(url,uname,pass);
            
        }catch(Exception e){
            e.printStackTrace();
        }
    }
    
    
    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }
      public ResultSet getData(){
        
        String sql = "select * from CustomerTB";
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
            String sql = "insert into CustomerTB(CustomerName,Location)values(?,?)";

            PreparedStatement stmt=con.prepareStatement(sql);
            stmt.setString(1,getCname());
            stmt.setString(2,getLocation());

            int i = stmt.executeUpdate();
            return i;
        }catch(Exception o){
            o.printStackTrace();
        }
        return 0;
    }
}
