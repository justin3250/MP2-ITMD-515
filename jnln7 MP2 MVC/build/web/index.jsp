<%-- 
    Document   : index
    Created on : Sep 29, 2014, 5:17:23 PM
    Author     : Justin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
       <c:if test="${not empty messages}">
            <div class="alert alert-warning alert-dismissible" role="alert">
                <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <ul>
                    <c:forEach items="${messages}" var="msg">
                        <li>
                            <strong>Warning!</strong><c:out value="${msg.key} has an error of ${msg.value}"/>
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </c:if>
        
        <h3><c:out value="Welcome"></h3></c:out>
        <h3><c:out value="Would you like to:"></h3></c:out>
        
        <h4><a href="${pageContext.request.contextPath}/edit_create">Create a new Employee Department Record</a></h4>
        <h4><a href="${pageContext.request.contextPath}/edit_create_departments">Create a new Department Record</a></h4>
        <br/>
        <h4><a id="showRecord" href="${pageContext.request.contextPath}/readRecords">Show all Employee Department Records</a></h4>
        <h4><a id="showRecord" href="${pageContext.request.contextPath}/readRecordsDept">Show all Department Records</a></h4>
        <br/>
        <h4><a id="showRecord" href="${pageContext.request.contextPath}/javadoc">Javadoc</a></h4>
        
       
        
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

        <!-- Latest compiled and minified JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
        
        
    </body>
        <c:import url="/reuse/footer.jsp"/>
    
</html>
