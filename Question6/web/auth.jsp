<%-- 
    Document   : auth
    Created on : 1 Mar, 2020, 10:38:05 PM
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
             int eid= (Integer)request.getAttribute("eid");
            String ename= (String)request.getAttribute("ename");
            session.setAttribute("eid",eid);
            session.setAttribute("ename", ename);
            if(ename.equals("admin")){
                response.sendRedirect("Home.jsp");
            }
            else{
                response.sendRedirect("EmployeeProfile.jsp");
            }
        %>
    </body>
</html>
