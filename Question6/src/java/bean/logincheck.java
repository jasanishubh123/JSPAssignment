/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

import static java.lang.System.err;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.RequestDispatcher;

/**
 *
 * @author shubham
 */
public class logincheck {
    
    public String uname,pass;

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }
    
    public int check(String name,String password){
         try{
             Class.forName("com.mysql.jdbc.Driver");
                Connection con= DriverManager.getConnection("jdbc:mysql://localhost/EmployeeProjectDB","shubham1","shubham");
                String s = "select  EmpId,EmpName and Password from EmpTB where EmpName = ? and Password = ?";
                PreparedStatement stmt = con.prepareStatement(s);
                stmt.setString(1,name);
                stmt.setString(2, password);
                
                ResultSet rs= stmt.executeQuery();
                
                if(rs.next()){
                    
                    return rs.getInt(1);
                }
                else{
                  return 0;
                }
                
                
                
         }catch(Exception e){
             System.out.println(e);
         }
        return 0;
    }
    
}
