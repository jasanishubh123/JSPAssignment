<%-- 
    Document   : page3
    Created on : 1 Mar, 2020, 6:56:43 PM
    Author     : shubham
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
               <%
           String name = request.getParameter("name");
            System.out.println("name"+name);
            try{
                Class.forName("com.mysql.jdbc.Driver");
                Connection con= DriverManager.getConnection("jdbc:mysql://localhost/EmpDB","shubham1","shubham");
                String s = "select * from EmpTB where EmployeeName LIKE '"+name+"%'" ;
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery(s);
                out.print("<hr>");
                out.println("<table border=1><tr><td>Name</td><td>Salary</td></tr>");
                while (rs.next()) {
                       out.println("<tr>");
                            out.println("<td>"+rs.getString(2)+"</td>");
                            out.println("<td>"+rs.getString(5)+"</td>");
                       out.println("</tr>");
                    }
                
                out.println("</table>");
            }
            catch(Exception e){
                System.err.println(e);
            }
            
                
        %>
    </body>
</html>
