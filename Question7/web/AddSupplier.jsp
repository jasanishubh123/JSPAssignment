<%-- 
    Document   : AddSupplier
    Created on : 3 Mar, 2020, 2:49:27 AM
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
       <jsp:useBean id="c" class="bean.SupplierBean" ></jsp:useBean>
        <jsp:setProperty  name="c" property="*" />
        <%
          int i = c.insert();
          if(i>0){
              response.sendRedirect("Supplier.jsp");
              
          }
          else{
             response.sendRedirect("AddSupplierForm.jsp");

          }
        %>
    </body>
</html>
