<%-- 
    Document   : AddProcess
    Created on : 3 Mar, 2020, 12:53:32 AM
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
       
        <jsp:useBean id="e" class="bean.EmployeeBean"/>
        <jsp:setProperty name="e" property="ename"></jsp:setProperty>
        <jsp:setProperty name="e" property="storeid"></jsp:setProperty>
        
       
                          
         <% 
            
             int i =e.insert();
            if(i==0){
                //out.print(i);
                response.sendRedirect("AddEmployee.jsp");
            }
            else{
                response.sendRedirect("Employee.jsp");
            }
         %>
    </body>
</html>
