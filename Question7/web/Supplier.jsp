<%-- 
    Document   : Supplier
    Created on : 2 Mar, 2020, 11:35:51 PM
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
          <jsp:useBean id="c" class="bean.SupplierBean" />
        <%
            ResultSet rs = c.getData();
        %>
        <div style="text-align: center">
            <h1>ABC Shop</h1>
        </div>
        
        <div>
            
            <center>
                 <a href="AddSupplierForm.jsp">Add New Supplier</a>
                <table border="1">
                    <thead>
                        <th>Name</th>
                        <th>Gender</th>
                        <th>See Sales</th>
                    </thead>
                    <tbody>
                        <%
                            while (rs.next())
                            {%>
                                <tr>
                                    <td><%= rs.getString(2) %></td>
                                    <td><%= rs.getString(3) %></td>
                                    <td><a href="Supplier.jsp?id=<%= rs.getString(1) %>">See Sales</a></td>

                                </tr>
                            
                            <%}
                        %>
                    </tbody>
                </table>
                    <br><br><br>
                        <% String id = request.getParameter("id");
                            if(id!=null){
                             ResultSet r= c.getSupplierwiseSales(id);
                             %>
                             <table border="1">
                                <thead>
                                   <th>Item Name</th><th>Supplier Name</th><th>Qty</th><th>Date</th>
                                </thead>
                                <tbody>
                                    <%
                                        while (r.next())
                                        {%>
                                            <tr>
                                                <td><%= r.getString(4) %></td>
                                                <td><%= r.getString(5) %></td>
                                                 <td><%= r.getString(3) %></td>
                                                <td><%= r.getString(1) %></td>
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
