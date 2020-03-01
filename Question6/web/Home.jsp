<%-- 
    Document   : Home
    Created on : 1 Mar, 2020, 9:13:30 PM
    Author     : shubham
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
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
           
          
            try{
                Class.forName("com.mysql.jdbc.Driver");
                Connection con= DriverManager.getConnection("jdbc:mysql://localhost/EmployeeProjectDB","shubham1","shubham");
                  String sql="select e.EmpID, e.EmpName,d.DepartmentName,e.Designation  from EmpTB e,DeptTB d where e.DepartmentId=d.DepartmentId";
                
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery(sql);
                //re=rs;
            %>
            <center>
                <h1>Employees</h1><br>
                
                <div style="text-align: left"><a href="EmployeeForm.jsp">Add new Employee</a></div>
                <table border="1">
                    <thead>
                    <th>EmpName</th>
                    
                    <th>Department</th>
                    <th>Designation</th>
                    <th>Update</th>
                    <th>Delete</th>
                    </thead>
                    <tbody>
                        <%
                            while(rs.next()){%>
                            <tr>
                                <td><%= rs.getString(2) %></td>
                                 <td><%= rs.getString(3) %></td>
                                  <td><%= rs.getString(4) %></td>
                                 <td><a href="EmployeeForm.jsp?eid=<%= rs.getInt(1) %>">Update</a></td>

                                   <td><a href="DeleteEmployee.jsp?eid=<%= rs.getString(1) %>">Delete</a></td>


                            </tr> 
                            <%}
                        %>
                    </tbody>
                </table>
            
        <%}
            catch(Exception e){
            } 
            
        %>
        <hr>
        <%
          
            try{
                Class.forName("com.mysql.jdbc.Driver");
                Connection con= DriverManager.getConnection("jdbc:mysql://localhost/EmployeeProjectDB","shubham1","shubham");
                  String sql="select * from ProjectTB";
                
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery(sql);
               // rp=rs;
                
            %>
         
                <h1>Projects</h1><br>
                
                <div style="text-align: left"><a href="ProjectForm.jsp">Add new Project</a></div>
                <table border="1">
                    <thead>
                    <th>Project</th>
                    
                    <th>Description</th>
                    <th>Duration</th>
                    <th>Update</th>
                    <th>Delete</th>
                    </thead>
                    <tbody>
                        <%
                            while(rs.next()){%>
                            <tr>
                                <td><%= rs.getString(2) %></td>
                                 <td><%= rs.getString(3) %></td>
                                  <td><%= rs.getString(4) %></td>
                                  <td><a href="ProjectForm.jsp?pid=<%= rs.getInt(1) %>">Update</a></td>
                                   <td><a href="DeleteProject.jsp?pid=<%= rs.getString(1) %>">Delete</a></td>


                            </tr> 
                            <%}
                        %>
                    </tbody>
                </table>
                   
            
        <%}
            catch(Exception e){
                e.printStackTrace();
            } 
            
        %>
            
        <hr>
        <%
          
            try{
                Class.forName("com.mysql.jdbc.Driver");
                Connection con= DriverManager.getConnection("jdbc:mysql://localhost/EmployeeProjectDB","shubham1","shubham");
                  String sql="select * from DeptTB";
                
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery(sql);
               // rp=rs;
                
            %>
         
                <h1>Departments</h1><br>
                
                <div style="text-align: left"><a href="DepartmentForm.jsp">Add new Departments</a></div>
                <table border="1">
                    <thead>
                    <th>Departments</th>
                    <th>Update</th>
                    <th>Delete</th>
                    </thead>
                    <tbody>
                        <%
                            while(rs.next()){%>
                            <tr>
                                <td><%= rs.getString(2) %></td>
                                 
                                  <td><a href="DepartmentForm.jsp?pid=<%= rs.getInt(1) %>">Update</a></td>
                                   <td><a href="DeleteDepartment.jsp?pid=<%= rs.getString(1) %>">Delete</a></td>


                            </tr> 
                            <%}
                        %>
                    </tbody>
                </table>
                   
            
        <%}
            catch(Exception e){
                e.printStackTrace();
            } 
            
        %>
        <hr>
        <%
            try{
                Class.forName("com.mysql.jdbc.Driver");
                Connection con= DriverManager.getConnection("jdbc:mysql://localhost/EmployeeProjectDB","shubham1","shubham");
                  String sql="select * from EmpTB";
                  String sql1="select * from ProjectTB";
                  
                Statement st = con.createStatement();
                ResultSet re = st.executeQuery(sql);
                Statement st1 = con.createStatement();
                ResultSet rp = st1.executeQuery(sql1);
         %>
         <form method="post" action="assignproject.jsp">
                <h1>Assign Project To Employee</h1>
              Select Project:
              <select name="selectedpid">
                  <option value="-1">Select</option>
                  <%while(rp.next()){%>
                  <option value="<%=rp.getInt(1) %>"><%=rp.getString(2) %></option> 
                  <%}%>
              </select>

              <br><br>
              Select Employee:
              <select name="selectedeid">
                  <option value="-1">Select</option>
                  <%while(re.next()){%>
                  <option value="<%=re.getInt(1) %>"><%=re.getString(2) %></option> 
                  <%}%>
              </select>
              <br><br>
              <input type="submit" value="Assign">

         </form>
           <% }catch(Exception e){
                e.printStackTrace();
            }
        %>
     
         </center>
    </body>
</html>
