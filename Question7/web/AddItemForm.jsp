<%-- 
    Document   : AddItemForm
    Created on : 3 Mar, 2020, 2:38:19 AM
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
      <form method="post" action="AddItem.jsp">
                Item Name : <input type="text" name="iname" /><br><br>
                Qty : <input type="text" name="qty"/><br><br>
                Price :<input type="text" name="price"/><br><br>
                <input type="submit" value="submit">
                
                        
            </form>
    </body>
</html>
