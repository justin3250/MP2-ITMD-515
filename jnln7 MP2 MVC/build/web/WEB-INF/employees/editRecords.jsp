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
        <link rel="stylesheet" type="text/css" href="css/styles.css">
        <!-- Optional theme -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">

        <c:import url="/reuse/header.jsp"/>
    </head>
    <body>

        <c:if test="${not empty requestScope.messages}">
            <div class="alert alert-warning alert-dismissible" role="alert">
                <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <ul>
                    <c:forEach items="${requestScope.messages}" var="msg">
                        <li>
                            <c:out value="${msg.key} ${msg.value}"/>
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </c:if>


        <c:if test="${not empty requestScope.violations}">
            <div class="alert alert-warning alert-dismissible" role="alert">
                <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <ul>
                    <c:forEach items="${requestScope.violations}" var="violation">
                        <li>
                            <c:out value="${violation.message}"/>
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </c:if>
        
        <c:choose>
            <c:when test="${(not empty requestScope.deptManager.deptNumber) || (not empty requestScope.deptManager.empNumber)
                    || (not empty requestScope.deptManager.fromDate) || (not empty requestScope.deptManager.toDate)}">
                <form class="col-md-3" role="form" method="post" action="${pageContext.request.contextPath}/update">
            </c:when>
                <c:otherwise>
                    <form class="col-md-3" role="form" method="post" action="${pageContext.request.contextPath}/newRecord">
                </c:otherwise>
                </c:choose>

                    <label for="deptNumber">Department Number:</label>
                    
                    <input class="form-control" id="deptNumber" name="deptNumber" type="text" value="${requestScope.deptManager.deptNumber}"/>
                        
                    
                    <label for="empNumber">Employee Number:</label>
                    <input class="form-control" id="empNumber" name="empNumber" type="text" value="${requestScope.deptManager.empNumber}"/>
                    
                    <label for="fromDate">From Date:</label>
                    
                    <input class="form-control" id="fromDate" name="fromDate" type="text" value="${requestScope.deptManager.fromDate}"/>
                    
                    <label for="toDate">To Date:</label>
                    
                    <input class="form-control" id="toDate" name="toDate" type="text" value="${requestScope.deptManager.toDate}"/>
                    <input type="submit" name="submit" id="submit"/>
                <%-- <form role="form" method="post" action="${pageContext.request.contextPath}/update">--%>
                
                
            </form>
        
            <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

            <!-- Latest compiled and minified JavaScript -->
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
            <c:import url="/reuse/footer.jsp"/>
    </body>
</html>
