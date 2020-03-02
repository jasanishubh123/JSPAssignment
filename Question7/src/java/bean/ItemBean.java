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
public class ItemBean {
     private Connection con=null;
    private static String url="jdbc:mysql://localhost/Jwd_7";
    private static String uname="shubham1";
    private static String pass="shubham";
    private String iname;
    private int qty;
    private int price;

    public String getIname() {
        return iname;
    }

    public void setIname(String iname) {
        this.iname = iname;
    }

    public int getQty() {
        return qty;
    }

    public void setQty(int qty) {
        this.qty = qty;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public ItemBean() {
         try{
           
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(url,uname,pass);
            
        }catch(Exception e){
            e.printStackTrace();
        }
    }
          public ResultSet getData(){
        
        String sql = "select * from ItemTB";
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
            String sql = "insert into ItemTB(ItemName,Qty,Price)values(?,?,?)";

            PreparedStatement stmt=con.prepareStatement(sql);
            stmt.setString(1,getIname());
            stmt.setInt(2,getQty());
            stmt.setInt(3,getPrice());

            int i = stmt.executeUpdate();
            return i;
        }catch(Exception o){
            o.printStackTrace();
        }
        return 0;
    }
    
}
