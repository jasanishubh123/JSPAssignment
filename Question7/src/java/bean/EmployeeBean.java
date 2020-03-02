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
public class EmployeeBean {
    
     private String ename;
    private int storeid;

    public String getEname() {
        return ename;
    }

    public void setEname(String ename) {
        this.ename = ename;
    }

    public int getStoreid() {
        return storeid;
    }

    public void setStoreid(int storeid) {
        this.storeid = storeid;
    }

    private Connection con=null;
    private static String url="jdbc:mysql://localhost/Jwd_7";
    private static String uname="shubham1";
    private static String pass="shubham";
    public EmployeeBean(){
        
        try{
           
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(url,uname,pass);
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
    }
    public ResultSet getData(){
        
        String sql = "select e.EmpId,e.EmpName,s.StoreName from EmpTB e,StoreTB s where e.StoreId=s.StoreId";
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
    public ResultSet getStoreData(){
        String sql = "select * from StoreTB";
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


    
        public  int insert(){
        try{
            String sql = "insert into EmpTB(EmpName,StoreId)values(?,?)";

            PreparedStatement stmt=con.prepareStatement(sql);
            stmt.setString(1,getEname());
            stmt.setInt(2,getStoreid());
            int i = stmt.executeUpdate();
            return i;
        }catch(Exception o){
            o.printStackTrace();
        }
        return 0;
    }

    
}
