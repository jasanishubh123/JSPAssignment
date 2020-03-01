<%-- 
    Document   : addProject
    Created on : 2 Mar, 2020, 12:28:15 AM
    Author     : shubham
--%>

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
            String Des=request.getParameter("txtdescription");
            String Du=request.getParameter("duration");
            
            

            String URL="jdbc:mysql://localhost/EmployeeProjectDB";
            String user="shubham1";
            String pass="shubham";
            
            try{
                Class.forName("com.mysql.jdbc.Driver");
                Connection cn=DriverManager.getConnection(URL,user,pass);
                String sql="";
                    if(eid.equals("0")){
                       
                          sql="insert into ProjectTB(ProjectName,Description,Duration)values(?,?,?)";
                    }
                    else{
                       
                          sql="Update ProjectTB set ProjectName=?,Description=?,Duration=? where ProjectId="+eid;
                    }
                
                
                
                PreparedStatement stmt=cn.prepareStatement(sql);
                stmt.setString(1,name );
                stmt.setString(2,Des);
               
                stmt.setString(3, Du);
                
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
