<%-- 
    Document   : DeleteProject
    Created on : 2 Mar, 2020, 12:22:07 AM
    Author     : shubham
--%>

<%@page import="java.sql.Statement"%>
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
            String id = request.getParameter("pid");
           
            if (id != null) {
                String URL = "jdbc:mysql://localhost/EmployeeProjectDB";
                String user = "shubham1";
                String pass = "shubham";
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection cn = DriverManager.getConnection(URL, user, pass);

                    String sql = "delete from ProjectTB where ProjectId=" + id;

                    Statement stmt = cn.createStatement();
                    int deleterow=stmt.executeUpdate(sql);
                    if(deleterow>0){
                        response.sendRedirect("Home.jsp");
                    }
                    else{
                        out.println("Something went Wrong");
                     
                    }
                   
                   

                    stmt.close();
                    cn.close();
                } catch (Exception ex) {
                    System.out.println(ex.getMessage());
                }

            }
       %>
    </body>
</html>
