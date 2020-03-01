<%-- 
    Document   : EmployeeForm
    Created on : 1 Mar, 2020, 11:49:06 PM
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
            String id = request.getParameter("eid");
            String editusername="";
            String editpass="";
            String editdept="";
            String editdesi="";

            if (id != null) {
                String URL = "jdbc:mysql://localhost/EmployeeProjectDB";
                String user = "shubham1";
                String pass = "shubham";
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection cn = DriverManager.getConnection(URL, user, pass);

                    String sql = "select * from EmpTB where EmpId=" + id;

                    Statement stmt = cn.createStatement();
                    ResultSet rs = stmt.executeQuery(sql);
                    rs.absolute(1);
                    editusername = rs.getString(2);
                    editpass = rs.getString(3);
                    editdesi=rs.getString(4);
                    editdept=rs.getString(5);
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
            <%
                try{
                  String URL = "jdbc:mysql://localhost/EmployeeProjectDB";
                String user = "shubham1";
                String pass = "shubham";
                
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection cn = DriverManager.getConnection(URL, user, pass);

                    String sql = "select * from DeptTB";

                    Statement stmt = cn.createStatement();
                   
                    ResultSet rsd =stmt.executeQuery(sql);
                    %> 
                    <form method='post' action='addEmployee.jsp'>
                        <input type='hidden' name='txtEid' value="<%=id%>">
                        Name:<input type='text' name='txtname' value="<%=editusername%>"><br><br>
                        Password:<input type='password' name='txtpass' value="<%=editpass%>"><br><br>
                        Designation:<input type="text" name="designation" value="<%=editdesi%>"/><br><br>
                    Department:<select name='txtdept'>
                    <%
                        if(id != null){
                         while(rsd.next()){
                             if(rsd.getString(1) == null ? editdept == null : rsd.getString(1).equals(editdept)){%>
                                 <option value="<%=rsd.getString(1)%>" selected ><%=rsd.getString(2)%></option>
                             <%}
                             
                             else{%>
                             <option value="<%=rsd.getString(1)%>" ><%=rsd.getString(2)%></option>
                             <%}
                        
                    }
                    }else{
                         while(rsd.next()){%>
                            <option value="<%=rsd.getString(1)%>"><%=rsd.getString(2)%></option>                    
                        <%}
                    }
                        stmt.close();
                        cn.close();
                    %>    
                                       
                    </select><br><br><input type='submit' name='btnsubmit' value='submit'>
                    </form>

                   
           
            
            <%}
                    
            catch(Exception e){
                e.printStackTrace();
            }%>


    </center>
    </body>
</html>
