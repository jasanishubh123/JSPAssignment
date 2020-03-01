<%-- 
    Document   : EmployeeProfile
    Created on : 1 Mar, 2020, 8:06:47 PM
    Author     : shubham
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
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
           
            int id=(Integer) session.getAttribute("eid");
            String ename = (String)session.getAttribute("ename");
            
            try{
                Class.forName("com.mysql.jdbc.Driver");
                Connection con= DriverManager.getConnection("jdbc:mysql://localhost/EmployeeProjectDB","shubham1","shubham");
                String s = "select e.EmpId,e.EmpName,p.ProjectName,p.Description,p.ProjectId,p.Duration from ProjectTB p ,EmpTB e,Project_AssignTB a WHERE e.EmpId=a.EmpId and p.ProjectId=a.ProjectId and e.EmpId="+id;
                
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery(s);
                
            %>
            <center>
                <h1>Hello <%=ename%>  Project Assign to you</h1>
                <table border="1">
                    <thead>
                    <th>Project</th>
                    <th>Description</th>
                    <th>Duration</th>
                    </thead>
                    <tbody>
                        <%
                            while(rs.next()){%>
                            <tr>
                                <td><%= rs.getString(3) %></td>
                                 <td><%= rs.getString(4) %></td>
                                  <td><%= rs.getString(6) %></td>
                            </tr> 
                            <%}
                        %>
                    </tbody>
                </table>
            </center>
        <%}
            catch(Exception e){
            } 
            
        %>
    </body>
</html>
