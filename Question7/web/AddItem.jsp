<%-- 
    Document   : AddItem
    Created on : 3 Mar, 2020, 2:39:35 AM
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
        <jsp:useBean id="c" class="bean.ItemBean" ></jsp:useBean>
        <jsp:setProperty  name="c" property="*" />
        <%
          int i = c.insert();
          if(i>0){
              response.sendRedirect("Items.jsp");
              
          }
          else{
             response.sendRedirect("AddItemForm.jsp");

          }
        %>
    </body>
</html>
