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
        <title>Display Records</title>

        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">

        <!-- Optional theme -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">

        <link rel="stylesheet" type="text/css" href="css/styles.css">
        <link rel="stylesheet" type="text/css" href="css/TableCSSCode.css">
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
                    <c:forEach items="${requestScope.violations}" var="msg">
                        <li>
                            <c:out value="${violation.message} ${msg.value}"/>
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </c:if>

        <table class="recordTable" id="recordTable">
            <%--<table class="CSSTableGenerator" >--%>
            <thead>
                <tr>
                    <c:if test="${not empty requestScope.readDeptMngr}">
                        <th></th>
                        <th>Department Number</th>
                        <th>Employee Number</th>
                        <th>From Date</th>
                        <th>To Date</th>
                        <th></th>
                     </c:if>
                     <c:if test="${not empty requestScope.readRecordsDept}">
                        <th></th>
                        <th>Department Number</th>
                        <th>Department Name</th>
                        <th></th>
                     </c:if>
                </tr>
            </thead>
            <tbody>
            <ul>
                
                <%-- Reading department manager records --%>
                <c:if test="${not empty requestScope.readDeptMngr}">
                <c:forEach items="${requestScope.readDeptMngr}" var="row">
                    <tr>

                        <c:url value="/edit_create" var="editURL">
                            <c:param name="deptNumber" value="${row.deptNumber}"/>
                            <c:param name="empNumber" value="${row.empNumber}"/>
                            <c:param name="fromDate" value="${row.fromDate}"/>
                            <c:param name="toDate" value="${row.toDate}"/>
                        </c:url>


                        <c:url value="/deleteRecords" var="delURL">
                            <c:param name="deptNumber" value="${row.deptNumber}"/>
                            <c:param name="empNumber" value="${row.empNumber}"/>
                        </c:url>


                        <td><a href="${editURL}">EDIT</a></td>
                        <td><c:out value="${row.deptNumber}"/></td>
                        <td><c:out value="${row.empNumber}"/></td>
                        <td><c:out value="${row.fromDate}"/></td>
                        <td><c:out value="${row.toDate}"/></td>
                        <td><a href="${delURL}">Delete</a></td>
                    </tr>
                </c:forEach> 
                </c:if>
                    
                 
                <%-- ------------------------ --%>        
                <%-- Reading Department records --%>    
                 <c:if test="${not empty requestScope.readRecordsDept}">
                <c:forEach items="${requestScope.readRecordsDept}" var="row">
                    <tr>

                        <c:url value="/edit_create_departments" var="editURL">
                            <c:param name="deptNumber" value="${row.deptNumber}"/>
                            <c:param name="deptName" value="${row.deptName}"/>
                        </c:url>


                        <c:url value="/deleteRecords_departments" var="delURL">
                            <c:param name="deptNumber" value="${row.deptNumber}"/>
                            <c:param name="deptName" value="${row.deptName}"/>
                        </c:url>


                        <td><a href="${editURL}">EDIT</a></td>
                        <td><c:out value="${row.deptNumber}"/></td>
                        <td><c:out value="${row.deptName}"/></td>
                        <td><a href="${delURL}">Delete</a></td>
                    </tr>
                </c:forEach> 
                </c:if>
            </ul>
        </tbody>
    </table>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    <c:import url="/reuse/footer.jsp"/>
</body>
</html>
