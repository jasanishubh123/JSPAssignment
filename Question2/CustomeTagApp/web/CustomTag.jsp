<%-- 
    Document   : CustomTag
    Created on : 28 Jan, 2020, 8:28:22 PM
    Author     : snehal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="ct" uri="/WEB-INF/tlds/MyCustome_library" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <ct:MyFirstTag/> 
        <ct:printstring> hello world </ct:printstring>
        <ct:StringFormat msg="hello shubham" > </ct:StringFormat>
        <br>
        <h1> list of emp:</h1>
        <ct:EmpSalary  dbName="EmpDB" dbUser="shubham1" dbPassword="shubham" salary="10000" ></ct:EmpSalary>
        <br>
        <h1> Reverse of string is: <ct:StringCustomAttribute reversestr="hello"/> </h1>
        <h1> Toggle of string is: <ct:StringCustomAttribute togglestr="sHuBhAm"/> </h1>
    </body>
</html>
               