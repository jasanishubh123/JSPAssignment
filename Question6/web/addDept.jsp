<%-- 
    Document   : addDept
    Created on : 2 Mar, 2020, 12:49:12 AM
    Author     : shubham
--%>

<%@page import="sun.security.krb5.internal.crypto.Des"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <%
            String eid=request.getParameter("txtEid");
            String name=request.getParameter("txtname");
           
            String URL="jdbc:mysql://localhost/EmployeeProjectDB";
            String user="shubham1";
            String pass="shubham";
            
            try{
                Class.forName("com.mysql.jdbc.Driver");
                Connection cn=DriverManager.getConnection(URL,user,pass);
                String sql="";
                    if(eid.equals("0")){
                       
                          sql="insert into DeptTB(DepartmentName)values(?)";
                    }
                    else{
                       
                          sql="Update DeptTB set DepartmentName=? where DepartmentId="+eid;
                    }
               
                PreparedStatement stmt=cn.prepareStatement(sql);
                stmt.setString(1,name);
                
               
                int row=stmt.executeUpdate();
                if(row>0){
                   response.sendRedirect("Home.jsp");
                    
                }
                
                stmt.close();
                cn.close();
                
            }
            catch(Exception ex){
                System.out.println(ex.getMessage());
            }
        %>
    </body>
</html>
