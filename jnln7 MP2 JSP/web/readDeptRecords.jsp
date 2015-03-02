<%-- 
    Document   : readRecords
    Created on : Sep 26, 2014, 9:54:35 PM
    Author     : Justin
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Employee Management System</title>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">

        <link rel="stylesheet" type="text/css" href="css/styles.css">
        <c:import url="/reuse/header.jsp"/>
    </head>
    <body>

        <sql:query dataSource="jdbc/mp2DS" var="result">
            select * from departments order by dept_no
        </sql:query>

        <table class="recordTable">
            <thead>
                <tr>
                    <th></th>
                    <th>Department Number</th>
                    <th>Department Name</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${result.rows}" var="row">
                    <tr>
                         <c:url value="editDeptRecords.jsp" var="editURL">
                            <c:param name="deptNo" value="${row.dept_no}"/>
                            <c:param name="deptName" value="${row.dept_name}"/>
                        </c:url>
                        
                        <c:url value="deleteDeptRecords.jsp" var="delURL">
                            <c:param name="deptNo" value="${row.dept_no}"/>
                            <c:param name="deptName" value="${row.dept_name}"/>
                        </c:url>
                        
                        <td><a href="${editURL}">EDIT</a></td>
                        <td><c:out value="${row.dept_no}"/></td>
                        <td><c:out value="${row.dept_name}"/></td>
                        <td><a href="${delURL}">Delete</a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

        <!-- Latest compiled and minified JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
        <c:import url="/reuse/footer.jsp"/>
    </body>
</html>
