<%-- 
    Document   : Purchase
    Created on : 2 Mar, 2020, 11:36:48 PM
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
       
         <jsp:useBean id="c" class="bean.PurchaseBean" />
        <%
            ResultSet rs = c.getData();
        %>
        <div style="text-align: center">
            <h1>ABC Shop</h1>
        </div>
        
        <div>
            
            <center>
                 <a href="AddPurchaseForm.jsp">Add New Purchase</a>
                <table border="1">
                    <thead>
                        <th>Item Name</th><th>Price</th><th>Supplier Name</th><th>Qty</th><th>Date</th>
                    </thead>
                    <tbody>
                        <%
                            while (rs.next())
                            {%>
                                <tr>
                                    <td><%= rs.getString(4) %></td>
                                    <td><%= rs.getString(5) %></td>
                                    <td><%= rs.getString(6) %></td>
                                    <td><%= rs.getString(3) %></td>
                                    <td><%= rs.getString(1) %></td>
                                   
                                </tr>
                            
                            <%}
                        %>
                    </tbody>
                </table>
            </center>
        </div>
    </body>
</html>
