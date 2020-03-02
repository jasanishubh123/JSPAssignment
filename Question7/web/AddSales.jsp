<%-- 
    Document   : AddSales
    Created on : 3 Mar, 2020, 3:30:19 AM
    Author     : shubham
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <jsp:useBean id="e" class="bean.SalesBean"/>
        <jsp:setProperty name="e" property="*"></jsp:setProperty>
       
        
       
                          
         <% 
            
             int i =e.insert();
            if(i==0){
                //out.print(i);
                response.sendRedirect("AddSalesForm.jsp");
            }
            else{
                response.sendRedirect("Sales.jsp");
            }
         %>
    </body>
</html>
