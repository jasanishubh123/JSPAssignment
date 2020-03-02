<%-- 
    Document   : test.jsp
    Created on : 3 Mar, 2020, 1:41:38 AM
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
        <jsp:useBean id="e" class="bean.Employee" />
        <jsp:setProperty name="e" property="ename" value="shubham"/>
        <jsp:getProperty name="e" property="ename"/>
            
            
    </body>
</html>
