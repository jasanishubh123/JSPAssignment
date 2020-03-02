<%-- 
    Document   : Sales
    Created on : 2 Mar, 2020, 11:36:35 PM
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
          <body>
        <jsp:useBean id="empobj" class="bean.SalesBean" />
        <%
            ResultSet rs = empobj.getData();
        %>
        <div style="text-align: center">
            <h1>ABC Shop</h1>
        </div>
        
        <div>
            
            <center>
                <a href="AddSalesFrom.jsp">Add New Sales</a>
                <table border="1">
                    <thead>
                        <th>CustomerName</th><th>Employee</th><th>ItemName</th><th>Qty</th><th>Date</th>
                    </thead>
                    <tbody>
                        <%
                            while (rs.next())
                            {%>
                                <tr>
                                    <td><%= rs.getString(2) %></td>
                                    <td><%= rs.getString(4) %></td>
                                    <td><%= rs.getString(5) %></td>
                                    <td><%= rs.getString(6) %></td>
                                    <td><%= rs.getString(3) %></td>
                                </tr>
                            
                            <%}
                        %>
                    </tbody>
                </table>
            </center>
        </div>
    </body>
    </body>
</html>
