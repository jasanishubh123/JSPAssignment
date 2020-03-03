<%-- 
    Document   : display
    Created on : 3 Mar, 2020, 1:54:58 AM
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
        <jsp:useBean id="u" class="bean.ttpbean" />
        <jsp:setProperty name="u" property="*"/>
        <jsp:getProperty name="u" property="name" />
    </body>
</html>
