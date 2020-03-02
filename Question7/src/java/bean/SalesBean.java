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
public class SalesBean {
    
    private int empid;
    private int iid;
    private int cid;
    private int qty;
     private Connection con=null;
    private static String url="jdbc:mysql://localhost/Jwd_7";
    private static String uname="shubham1";
    private static String pass="shubham";

    public int getEmpid() {
        return empid;
    }

    public void setEmpid(int empid) {
        this.empid = empid;
    }

    public int getIid() {
        return iid;
    }

    public void setIid(int iid) {
        this.iid = iid;
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public int getQty() {
        return qty;
    }

    public void setQty(int qty) {
        this.qty = qty;
    }

    public SalesBean() {
        try{
           
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(url,uname,pass);
            
        }catch(Exception e){
            e.printStackTrace();
        }
    }
    
      public ResultSet getData(){
        
        String sql = "select s.SalesId,c.CustomerName,s.Date,e.EmpName,i.ItemName,s.Qty from CustomerTB c, SalesTB s,EmpTB e ,ItemTB i where i.ItemId=s.ItemId and s.EmpId=e.EmpId and s.CustomerId=c.CustomerId";
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

           
                  PreparedStatement stmt = con.prepareStatement("insert into SalesTB(EmpId,ItemId,CustomerId,Qty)values(?,?,?,?)");
                 stmt.setInt(1,getEmpid());
                  stmt.setInt(2,getIid());
                  stmt.setInt(3,getCid());
                  stmt.setInt(4,getQty());

            int i = stmt.executeUpdate();
            return i;
        }catch(Exception o){
            o.printStackTrace();
        }
        return 0;
    }
    
    
     public ResultSet getEmpData(){
        
        String sql = "select * from EmpTB";
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
     public ResultSet getCustData(){
        
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
    
}
