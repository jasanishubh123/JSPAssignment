<%-- 
    Document   : Items
    Created on : 2 Mar, 2020, 11:35:08 PM
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
         <jsp:useBean id="c" class="bean.ItemBean" />
        <%
            ResultSet rs = c.getData();
        %>
        <div style="text-align: center">
            <h1>ABC Shop</h1>
        </div>
        
        <div>
            
            <center>
                 <a href="AddItemForm.jsp">Add New Item</a>
                <table border="1">
                    <thead>
                        <th>Name</th>
                        <th>Qty</th>
                        <th>Price</th>
                    </thead>
                    <tbody>
                        <%
                            while (rs.next())
                            {%>
                                <tr>
                                    <td><%= rs.getString(2) %></td>
                                    <td><%= rs.getInt(3) %></td>
                                    <td><%= rs.getInt(4) %></td>
                                    
                                </tr>
                            
                            <%}
                        %>
                    </tbody>
                </table>
            </center>
        </div>
    </body>
</html>
