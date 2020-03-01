<%-- 
    Document   : ProjectForm
    Created on : 2 Mar, 2020, 12:22:57 AM
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
        <center>
        <%
            String id = request.getParameter("pid");
            String editprojectname="";
            String editdescription="";
            String editduration="";
            

            if (id != null) {
                String URL = "jdbc:mysql://localhost/EmployeeProjectDB";
                String user = "shubham1";
                String pass = "shubham";
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection cn = DriverManager.getConnection(URL, user, pass);

                    String sql = "select * from ProjectTB where ProjectId=" + id;

                    Statement stmt = cn.createStatement();
                    ResultSet rs = stmt.executeQuery(sql);
                    rs.absolute(1);
                    editprojectname = rs.getString(2);
                    editdescription = rs.getString(3);
                    editduration=rs.getString(4);
                   
                    stmt.close();
                    cn.close();
                } catch (Exception ex) {
                    System.out.println(ex.getMessage());
                }

            }
            else{
                 id="0";
              }
        %>

        <h1>Add Employee</h1>
           
                    <form method='post' action='addProject.jsp'>
                        <input type='hidden' name='txtEid' value="<%=id%>">
                        Project Name:<input type='text' name='txtname' value="<%=editprojectname%>"><br><br>
                        Description: <input type='text' name='txtdescription' value="<%=editdescription%>"><br><br>
                        Duration: <input type="text" name="duration" value="<%=editduration%>"/><br><br>
                  
                       
                      
                                       
                    </select><br><br><input type='submit' name='btnsubmit' value='submit'>
                    </form>

                   
           
            
           

    </center>
    </body>
</html>
