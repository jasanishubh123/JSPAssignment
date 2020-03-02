<%-- 
    Document   : AddPurchaseForm
    Created on : 3 Mar, 2020, 3:04:42 AM
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
         <jsp:useBean id="p" class="bean.PurchaseBean" />
        <%
            ResultSet rs = p.getItemData();
            ResultSet rsd =p.getSupplierData();
        %>
          <form action='AddPurchase.jsp' method='post'>

            Supplier :<select name='sid'><option value='-1'>Select</option>
               <% while (rsd.next()) {%>

                    
                    <option value="<%=rsd.getInt(1)%>"><%=rsd.getString(2)%></option>
                   

                <%}%>
                
              </select><br>
       Item :<select name='iid'><option value='-1'>Select</option>
               <% while (rs.next()) {%>

                    
               <option value="<%=rs.getInt(1)%>"><%=rs.getString(2)%></option>
                   

                <%}%>
               </select><br>
              Qty :<input type='number' name='qty'><br>
              <input type='submit' value='Add Purchase'>
          </form>  

    </body>
</html>
