<%-- 
    Document   : AddEmployee
    Created on : 3 Mar, 2020, 12:15:36 AM
    Author     : shubham
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:useBean id="empobj" class="bean.EmployeeBean" />
        <%
            ResultSet rs = empobj.getStoreData();
        %>
       
            <form method="post" action="AddProcess.jsp">
                Name : <input type="text" name="ename" /><br><br>
                Store: <select name="storeid">
                            <option value="-1" >Select</option>
                            <% while(rs.next()){%>
                            <option value="<%= rs.getString(1) %>" ><%= rs.getString(2) %></option>
                            <%} %>
                        </select><br><br>
                        <input type="submit" value="insert">
                        
            </form>
                            
        
    </body>
</html>
