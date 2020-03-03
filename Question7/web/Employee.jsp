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
                        <th>See Sales</th>
                    </thead>
                    <tbody>
                        <%
                            while (rs.next())
                            {%>
                                <tr>
                                    <td><%= rs.getString(2) %></td>
                                    <td><%= rs.getString(3) %></td>
                                    <td><a href="Employee.jsp?id=<%= rs.getString(1) %>">See Sales</a></td>
                                </tr>
                            
                            <%}
                        %>
                    </tbody>
                </table>
                    <br>
                    <br>
                    <br>
                    <% String id=request.getParameter("id");
                        if(id!=null){
                            ResultSet rd = empobj.getEmployeeSalesData(id);
                    %>
                        <table border="1">
                    <thead>
                        <th>Customer</th><th>Item</th><th>Qty</th><th>Date</th>
                    </thead>
                    <tbody>
                        <%
                            while (rd.next())
                            {%>
                                <tr>
                                    <td><%= rd.getString(5) %></td>
                                    <td><%= rd.getString(4) %></td>
                                    <td><%= rd.getString(2) %></td>
                                    <td><%= rd.getString(3) %></td>
                                </tr>
                            
                            <%}
                        %>
                    </tbody>
                </table>
                        <%}
                    %>
            </center>
        </div>
    </body>
</html>
