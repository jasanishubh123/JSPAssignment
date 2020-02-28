<%-- 
    Document   : Emp
    Created on : 3 Feb, 2020, 1:18:27 PM
    Author     : root
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/xml" prefix="x" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <c:import url="employee.xml" var="output"/>
        <x:parse var="res" xml="${output}"/>
        <form method="post" action="Emp.jsp">
            <select name="drop" onchange="this.form.submit()">
                <option>--Select--</option>
                <option>HR</option>
                <option>Manager</option>
                <option>Sales</option>
        </select>
            <br>
            <!--<input type="submit"  value="submit">-->
        </form>
        
       
                <x:forEach  var="item" select="$res/employees/employee">
                    <x:set var="dp" select="string($item/dept)"/>
                    <c:if test="${dp == param.drop}">
                        <x:out select="$item"/><br>
                    </c:if>
                </x:forEach>
           
    </body>
</html>
