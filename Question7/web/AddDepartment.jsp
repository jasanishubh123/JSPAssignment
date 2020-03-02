<%-- 
    Document   : AddDepartment
    Created on : 3 Mar, 2020, 2:31:21 AM
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
         <jsp:useBean id="c" class="bean.DepartmentBean" ></jsp:useBean>
        <jsp:setProperty  name="c" property="*" />
        <%
          int i = c.insert();
          if(i>0){
              response.sendRedirect("Department.jsp");
              
          }
          else{
             response.sendRedirect("AddDepartmentForm.jsp");

          }
        %>
    </body>
</html>
