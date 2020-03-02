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
public class PurchaseBean {
    
    private int sid;
    private int iid;
    private int qty;
 private Connection con=null;
    private static String url="jdbc:mysql://localhost/Jwd_7";
    private static String uname="shubham1";
    private static String pass="shubham";

    public PurchaseBean() {
        
        try{
           
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(url,uname,pass);
            
        }catch(Exception e){
            e.printStackTrace();
        }
    }
    
    
    
    public int getSid() {
        return sid;
    }

    public void setSid(int sid) {
        this.sid = sid;
    }

    public int getIid() {
        return iid;
    }

    public void setIid(int iid) {
        this.iid = iid;
    }

    public int getQty() {
        return qty;
    }

    public void setQty(int qty) {
        this.qty = qty;
    }
    
     public ResultSet getData(){
        
        String sql = "select p.Date, p.PurchaseId,p.Qty,i.ItemName,i.Price,s.SupplierName from PurchaseTB p,ItemTB i,SupplierTB s where p.SupplierId=s.SupplierId and p.ItemId=i.ItemId";
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
            String sql = "insert into PurchaseTB(CustomerName,Location)values(?,?)";

            PreparedStatement stmt = con.prepareStatement("insert into PurchaseTB(ItemId,SupplierId,Qty)values(?,?,?)");
                  stmt.setInt(1,getIid());
                  stmt.setInt(2,getSid());
                  stmt.setInt(3,getQty());

            int i = stmt.executeUpdate();
            return i;
        }catch(Exception o){
            o.printStackTrace();
        }
        return 0;
    }
     public ResultSet getItemData(){
        
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
      public ResultSet getSupplierData(){
        
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
    
}
