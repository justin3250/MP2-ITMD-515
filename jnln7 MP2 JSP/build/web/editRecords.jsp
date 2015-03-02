<%-- 
    Document   : editRecords
    Created on : Sep 27, 2014, 12:32:49 AM
    Author     : Justin
--%>

<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Employee Management System</title>

        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">

        <!-- Optional theme -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">

       <c:import url="/reuse/header.jsp"/>
    </head>
    <body>
       
        <c:if test="${not empty param.insertException}">
            <div class="alert alert-warning alert-dismissible" role="alert">
                <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <ul>
                    
                        <li>
                            <c:out value="Error:: "/>
                            <c:out value="${param.insertException} "/>
                        </li>
                    
                </ul>
            </div>
        </c:if>
        
        <c:if test="${not empty param.exception}">
            <div class="alert alert-warning alert-dismissible" role="alert">
                <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <ul>
                    
                        <li>
                            <c:out value="Error:: "/>
                            <c:out value="${param.exception} "/>
                        </li>
                    
                </ul>
            </div>
        </c:if>
        
        <c:set var="insertOrUpdate"/>
        <c:choose>
            <c:when test="${not empty param.deptNo}">
                <c:if test="${not empty param.insertException}">
                     <c:set var="insertOrUpdate" value="insertRecord.jsp"/>
                 </c:if>
                <c:if test="${not empty param.exception}">
                     <c:set var="insertOrUpdate" value="updateRecords.jsp"/>
                 </c:if>
                <c:if test="${empty param.insertException}">
                    <c:set var="insertOrUpdate" value="updateRecords.jsp"/>
                </c:if>
                 
                 <%-- 
                <sql:query dataSource="jdbc/mp2DS" var="result">
                        select * from dept_manager
                        where dept_no = ? and emp_no = ?
                    <sql:param value="${param.deptNo}" />
                    <sql:param value="${param.empNo}" />
                </sql:query>
                 --%>

                <c:set var="records" value="${result.rows[0]}" /> 
                
                
                <%--<c:out value="${result.rows[0]}"></c:out>--%>
            </c:when>
            <c:otherwise>
                <c:set var="insertOrUpdate" value="insertRecord.jsp"/>
            </c:otherwise>
        </c:choose>

        <%--<form role="form" method="post" action="updateRecords.jsp">--%>
        <form role="form" method="post" action="${insertOrUpdate}">
            <div class="form-group">
                <label for="deptNo">Department Number</label>
                <%--<input class="form-control" id="deptNo" name="deptNo" type="text" value="${records.dept_no}"/>--%>
                <input class="form-control" id="deptNo" name="deptNo" type="text" value="${param.deptNo}"/>
                <input class="form-control" id="deptOldNo" name="deptOldNo" type="hidden" value="${param.deptNo}"/>
            </div>
            <div class="form-group">
                <label for="empNo">Employee Number</label>
                <%--<input class="form-control" id="empNo" name="empNo" type="text" value="${records.emp_no}"/>--%>
                <input class="form-control" id="empNo" name="empNo" type="text" value="${param.empNo}"/>
                <input class="form-control" id="empOldNo" name="empOldNo" type="hidden" value="${param.empNo}"/>
            </div>
            <div class="form-group">
                <label for="fromDate">From Date</label>
                <%--<input class="form-control" id="fromDate" name="fromDate" type="text" value="${records.from_date}"/>--%>
                <input class="form-control" id="fromDate" name="fromDate" type="text" value="${param.fromDate}"/>
            </div>
            <div class="form-group">
                <label for="toDate">To Date</label>
                <%--<input class="form-control" id="toDate" name="toDate" type="text" value="${records.to_date}"/>--%>
                <input class="form-control" id="toDate" name="toDate" type="text" value="${param.toDate}"/>
            </div>
            <input type="submit" name="submit" id="submit"/>
        </form>

        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

        <!-- Latest compiled and minified JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
        <c:import url="/reuse/footer.jsp"/>
    </body>
</html>
