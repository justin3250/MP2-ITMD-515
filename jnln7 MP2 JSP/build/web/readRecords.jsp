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
        <title>Bootstrap 101 Template</title>

        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">

        <!-- Optional theme -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">

        <link rel="stylesheet" type="text/css" href="css/styles.css">
        <c:import url="/reuse/header.jsp"/>
    </head>
    <body>

        <sql:query dataSource="jdbc/mp2DS" var="result">
            select * from dept_manager order by dept_no
        </sql:query>

        <table class="recordTable">
            <thead>
                <tr>
                    <th></th>
                    <th>Department Number</th>
                    <th>Employee Number</th>
                    <th>From Date</th>
                    <th>To Date</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${result.rows}" var="row">
                    <tr>
                         <c:url value="editRecords.jsp" var="editURL">
                            <c:param name="deptNo" value="${row.dept_no}"/>
                            <c:param name="empNo" value="${row.emp_no}"/>
                            <c:param name="fromDate" value="${row.from_date}"/>
                            <c:param name="toDate" value="${row.to_date}"/>
                        </c:url>
                        
                        <c:url value="deleteRecords.jsp" var="delURL">
                            <c:param name="deptNo" value="${row.dept_no}"/>
                            <c:param name="empNo" value="${row.emp_no}"/>
                        </c:url>
                        
                        <td><a href="${editURL}">EDIT</a></td>
                        <td><c:out value="${row.dept_no}"/></td>
                        <td><c:out value="${row.emp_no}"/></td>
                        <td><c:out value="${row.from_date}"/></td>
                        <td><c:out value="${row.to_date}"/></td>
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
