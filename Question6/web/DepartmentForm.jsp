<%-- 
    Document   : DepartmentForm
    Created on : 2 Mar, 2020, 12:46:16 AM
    Author     : shubham
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <center>
        <%
            String id = request.getParameter("pid");
            String editdept="";
           
            

            if (id != null) {
                String URL = "jdbc:mysql://localhost/EmployeeProjectDB";
                String user = "shubham1";
                String pass = "shubham";
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection cn = DriverManager.getConnection(URL, user, pass);

                    String sql = "select * from DeptTB where DepartmentId=" + id;

                    Statement stmt = cn.createStatement();
                    ResultSet rs = stmt.executeQuery(sql);
                    rs.absolute(1);
                    editdept = rs.getString(2);
                    stmt.close();
                    cn.close();
                } catch (Exception ex) {
                    System.out.println(ex.getMessage());
                }

            }
            else{
                 id="0";
              }
        %>

        <h1>Add Department</h1>
           
                    <form method='post' action='addDept.jsp'>
                        <input type='hidden' name='txtEid' value="<%=id%>">
                        Department Name:<input type='text' name='txtname' value="<%=editdept%>"><br><br>
                                       
                    </select><br><br><input type='submit' name='btnsubmit' value='submit'>
                    </form>
    </center>
    </body>
</html>
