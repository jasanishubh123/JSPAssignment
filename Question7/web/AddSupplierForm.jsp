<%-- 
    Document   : AddSupplierForm
    Created on : 3 Mar, 2020, 2:47:46 AM
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
        <form method="post" action="AddSupplier.jsp">
                Name : <input type="text" name="sname" /><br><br>
                Gender : <input type="radio" name="gender" value="Male">Male
                <input type="radio" name="gender" value="Female">Female
                <br><br>
                <input type="submit" value="submit">
                
                        
            </form>
    </body>
</html>
