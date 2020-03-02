<%-- 
    Document   : Employee
    Created on : 2 Mar, 2020, 11:34:31 PM
    Author     : shubham
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:useBean id="empobj" class="bean.EmployeeBean" />
        <%
            ResultSet rs = empobj.getData();
        %>
        <div style="text-align: center">
            <h1>ABC Shop</h1>
        </div>
        
        <div>
            
            <center>
                <a href="AddEmployee.jsp">Add New Employee</a>
                <table border="1">
                    <thead>
                        <th>Name</th>
                        <th>Store</th>
                    </thead>
                    <tbody>
                        <%
                            while (rs.next())
                            {%>
                                <tr>
                                    <td><%= rs.getString(2) %></td>
                                    <td><%= rs.getString(3) %></td>
                                </tr>
                            
                            <%}
                        %>
                    </tbody>
                </table>
            </center>
        </div>
    </body>
</html>
