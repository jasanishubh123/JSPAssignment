<%-- 
    Document   : index
    Created on : 1 Mar, 2020, 5:45:19 PM
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
    <script>
        function statechange(s){
            //alert(s);
           var request =  new XMLHttpRequest();
           
          
           
           try{
               request.onreadystatechange = function (){
                   if(request.readyState == 4 && request.status == 200){
                      var res = request.responseText;
                      //alert(res);
                      document.getElementById("citycombo").innerHTML=res;
                    }
               };
                request.open("GET","page2.jsp?stid="+s,true);
                request.send();
           }catch(e){
               alert(e);
           }
        }
        
        function findemps(name){
            //alert(name)
            var request =  new XMLHttpRequest();
           
          
           
           try{
               request.onreadystatechange = function (){
                   if(request.readyState == 4 && request.status == 200){
                      var res = request.responseText;
                      //alert(res);
                      document.getElementById("emps").innerHTML=res;
                    }
               };
                request.open("GET","page3.jsp?name="+name,true);
                request.send();
           }catch(e){
               alert(e);
           }
        }
    </script>
    <body>
       <center>
        <h1>Dependent Combo Demo</h1>
        <%
            try{
                
                Class.forName("com.mysql.jdbc.Driver");
                Connection con= DriverManager.getConnection("jdbc:mysql://localhost/EmpDB","shubham1","shubham");
                String s = "select * from StateTB";
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery(s);
            %>
            <form>
                Select State:
                <select id="selectedstate" onchange="statechange(this.value)">
                    <option value="-1">Select</option>
                        <%
                          while(rs.next()){%>
                             
                          <option value="<%= rs.getInt(1) %>"><%= rs.getString(2) %></option>
                          
                          <%} 
                        %>
                        <br/>
                        
                </select>
                        <br/>
                        
                        <div id="citycombo">
                            
                        </div>
            </form>
            <%}
            catch(Exception e){
                System.out.println(e);
            }%>
        
            <hr>
            Name:
            <input type="text" name="ename" placeholder="EmployeeName" onkeyup="findemps(this.value)"/>
            <br>
            <div id="emps"></div>
            
    </center>
    </body>
</html>
