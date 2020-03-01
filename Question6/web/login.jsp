<%-- 
    Document   : login
    Created on : 1 Mar, 2020, 7:43:39 PM
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
        <%
                String err=(String)request.getAttribute("err");
                //out.print(err);
                if(err==null){
                    err="";
                }
                
            %>
    <center>
        <form method="post" action="auth.jsp"> 
            Username:  <input type="text" name="username"/><br>
            Password : <input type="password" name="password" /><br>
            
            <br><label style="color: red"><%=err%></label><br>
        <input type="submit" value="login">
        </form>
    </center>
    </body>
</html>
