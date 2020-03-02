<%-- 
    Document   : AddCustomer
    Created on : 3 Mar, 2020, 2:13:12 AM
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
        <jsp:useBean id="c" class="bean.CustomerBean" ></jsp:useBean>
        <jsp:setProperty  name="c" property="*" />
        <%
          int i = c.insert();
          if(i>0){
              response.sendRedirect("Customer.jsp");
              
          }
          else{
             response.sendRedirect("AddCustomerForm.jsp");

          }
        %>
    </body>
</html>
