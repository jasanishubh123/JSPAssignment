<%-- 
    Document   : assignproject
    Created on : 1 Mar, 2020, 11:38:30 PM
    Author     : shubham
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            int pid =Integer.parseInt(request.getParameter("selectedpid"));
            int eid =Integer.parseInt(request.getParameter("selectedeid"));
//            out.print(pid);
//            out.print(eid);
            
            try{
                Class.forName("com.mysql.jdbc.Driver");
                Connection con= DriverManager.getConnection("jdbc:mysql://localhost/EmployeeProjectDB","shubham1","shubham");
                String sql = "insert into Project_AssignTB(EmpId,ProjectId)values(?,?)";
                PreparedStatement stmt = con.prepareStatement(sql);
                stmt.setInt(1,eid);
                stmt.setInt(2,pid);
                int i=stmt.executeUpdate();
                if(i>0){
                    response.sendRedirect("Home.jsp");
                }
                else{
                    out.print("Error in Assign Project to Employee");
                }
            }
            catch(Exception e)
            {
                e.printStackTrace();
            }
            
        %>
    </body>
</html>
