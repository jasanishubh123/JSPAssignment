<%-- 
    Document   : sqlJstl
    Created on : 3 Feb, 2020, 2:15:11 PM
    Author     : root
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <sql:setDataSource driver="com.mysql.jdbc.Driver" user="shubham1" password="shubham" var="db" url="jdbc:mysql://localhost/EmpDB"/>
        <c:set var="ename" value=""></c:set>
        <c:set var="epass" value=""></c:set>
        <c:set var="eid" value="0"></c:set>
        <c:if test="${param.did!=null}">
            
            <sql:query dataSource="${db}" var="drs">
              select * from EmpTB where EmpID=?
                
                <sql:param value="${param.did}"></sql:param>
               
               
            </sql:query> 
               <c:forEach var="item" items="${drs.rows}">
                     <c:set var="eid" value="${item.EmpID}"></c:set>
                     <c:set var="ename" value="${item.EmployeeName}"></c:set>
                     <c:set var="epass" value="${item.Password}"></c:set>
                </c:forEach>
           
        </c:if>
        <form method="post" action="sqlJstl.jsp">
            <input type="hidden" name="upid" value="${eid}">
            Username:<input type="text" name="uname" value="${ename}">
            <br>
            Password: <input type="password" name="pass" value="${epass}">
            <br>
            <input type="submit" value="Submit"/>
        </form>
            
         
        
       
           
        
            
        
            <c:if test="${param.id!=null}">
                            <sql:update dataSource="${db}">
                                delete from EmpTB where EmpID=?
                                <sql:param value="${param.id}"/>
                            </sql:update>
                        </c:if>
       
            
           
                  
                  <c:choose>
                      <c:when test="${param.upid!=0}">
                         
                            <sql:update dataSource="${db}">
                                update EmpTB set EmployeeName=?,Password=? where EmpID=?
                                
                                 <sql:param value="${param.uname}"></sql:param>
                                 <sql:param value="${param.pass}"></sql:param>
                                 <sql:param value="${param.upid}"></sql:param>

                             </sql:update> 
                      </c:when>
                      <c:when test="${param.uname!=null && param.pass!=null && param.upid==0}">
                           <sql:update dataSource="${db}" var="rs">
                                insert into EmpTB(EmployeeName,Password,DepartmentID)values(?,?,1)
                                <sql:param value="${param.uname}"></sql:param>
                                <sql:param value="${param.pass}"></sql:param>

                            </sql:update>      
                      </c:when>
                  </c:choose>
                
                
                 <sql:query dataSource="${db}" var="rs">
            select * from EmpTB 
        </sql:query>
            
            <table border="2">
                <thead>
                    <tr>
                        <th>
                            Name
                        </th>
                        <th>
                            Password
                        </th>
                        <th>
                            Delete
                        </th>
                         <th>
                            Edit
                        </th>
                    </tr>
                    
                </thead>
                
                    <c:forEach var="item" items="${rs.rows}">
                        <tr>
                            <td>
                               <c:out value="${item.EmployeeName}"></c:out>
                             </td>
                              <td>
                                <c:out value="${item.Password}"></c:out>

                             </td>
                             <td>
                                 <a href="sqlJstl.jsp?id=${item.EmpId}">Delete</a>

                             </td>
                             <td>
                                 <a href="sqlJstl.jsp?did=${item.EmpId}">Edit</a>

                             </td>
                            
                        </tr>

                    </c:forEach>
        
            </table>    
    </body>
</html>
