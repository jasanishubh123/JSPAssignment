<%-- 
    Document   : page2
    Created on : 1 Mar, 2020, 6:23:00 PM
    Author     : shubham
--%>

<%@page import="java.sql.ResultSet"%>
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
            int sid = Integer.parseInt(request.getParameter("stid"));
            System.out.println("SID"+sid);
            try{
                Class.forName("com.mysql.jdbc.Driver");
                Connection con= DriverManager.getConnection("jdbc:mysql://localhost/EmpDB","shubham1","shubham");
                String s = "select * from CityTB where StateId="+sid;
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery(s);
                out.print("<hr>");
                out.println("Select City : <select><option value='-1'>Select</option>");
                while (rs.next()) {
                       out.println("<option value='"+rs.getInt(1)+"'>"+rs.getString(3)+"</option>");
                        System.out.println(rs.getInt(1)+" "+rs.getString(3));
                    }
                out.println("</select>");
            }
            catch(Exception e){
                System.err.println(e);
            }
            
                
        %>
    </body>
</html>
