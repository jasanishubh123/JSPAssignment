/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Tags;


import java.io.StringWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.JspFragment;
import javax.servlet.jsp.tagext.SimpleTagSupport;

/**
 *
 * @author snehal
 */
public class ConnectionEstablishHandler extends SimpleTagSupport {

    String dbName="";
    String dbUser="";
    String dbPassword="";
    String sql="";
    double salary=0;

    public double getSalary() {
        return salary;
    }

    public void setSalary(double salary) {
        this.salary = salary;
    }

    public String getDbName() {
        return dbName;
    }

    public void setDbName(String dbName) {
        this.dbName = dbName;
    }

    public String getDbUser() {
        return dbUser;
    }

    public void setDbUser(String dbUser) {
        this.dbUser = dbUser;
    }

    public String getDbPassword() {
        return dbPassword;
    }

    public void setDbPassword(String dbPassword) {
        this.dbPassword = dbPassword;
    }

    public String getSql() {
        return sql;
    }

    public void setSql(String sql) {
        this.sql = sql;
    }
    StringWriter s = new StringWriter();
    /**
     * Called by the container to invoke this tag. The implementation of this
     * method is provided by the tag library developer, and handles all tag
     * processing, body iteration, etc.
     */
    @Override
    public void doTag() throws JspException {
        JspWriter out = getJspContext().getOut();
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String dbUrl="jdbc:mysql://localhost/"+dbName;
            Connection con=DriverManager.getConnection(dbUrl,dbUser,dbPassword);
            Statement stmt;
            ResultSet rs;
            sql="select * from EmployeeCustomTag";
            stmt=con.createStatement();
            rs=stmt.executeQuery(sql);
            int i=0;
            while(rs.next())
            {
                ///out.println("Hello");
                
                int eid=rs.getInt(1);
                String ename=rs.getString(2);
                double esal=rs.getDouble(3);
                if(esal>salary)
                {
                    i++;
                    out.println(i+" ");
//                    out.println("<br>");
                    out.println(" "+"EID is:"+eid);
                    out.println("<br>");
                    out.println("ENAME is:"+ename);
                    out.println("<br>");
                    out.println("ESalary is:"+esal);
                    out.println("<br>");
                    out.println("<br>");
                }
            }
            
            
            
            
        } catch (Exception ex) {
            throw new JspException("Error in ConnectionEstablishHandler tag", ex);
        }
    }
    
}
