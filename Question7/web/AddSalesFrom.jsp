<%-- 
    Document   : AddSalesFrom
    Created on : 3 Mar, 2020, 3:24:00 AM
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
         <jsp:useBean id="s" class="bean.SalesBean" />
        <%
            ResultSet rsd = s.getEmpData();
            ResultSet rs = s.getItemData();
            ResultSet rss = s.getCustData();

        %>
        
           <form action='AddSales.jsp' method='post'>

             Employee :<select name='empid'><option value='-1'>Select</option>
               <% while (rsd.next()) {%>

                    
               <option value="<%=rsd.getInt(1)%>"><%=rsd.getString(3    )%></option>
                   

                <%}%>
                
             </select><br>
          Item :<select name='iid'><option value='-1'>Select</option>
               <% while (rs.next()) {%>

                    
               <option value="<%=rs.getInt(1)%>"><%=rs.getString(2)%></option>
                   

                <%}%>
               </select><br>
                
               
           Customer :<select name='cid'><option value='-1'>Select</option>
                <%while (rss.next()) {%>

                    
                  <option value="<%=rss.getInt(1)%>"><%=rss.getString(2)%></option>
                   

                <%}%>
               </select><br> 
              Qty :<input type='number' name='qty'><br>
              <input type='submit' value='Add Sales'>
                

           </form>
    </body>
</html>
