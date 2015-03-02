<%-- 
    Document   : homePage
    Created on : Sep 26, 2014, 9:24:44 PM
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
       
        <h3><c:out value="Welcome"></h3></c:out>
        <h3><c:out value="Would you like to:"></h3></c:out>
        
        <h4><a href="editRecords.jsp">Create a new Department Manager Record</a></h4>
        <h4><a href="editDeptRecords.jsp">Create a new Department Record</a></h4>
        <br/>
        <h4><a href="readRecords.jsp">Read all Department Manager Records</a></h4>
        <h4><a href="readDeptRecords.jsp">Read all Department Records</a></h4>
        
        
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

        <!-- Latest compiled and minified JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
        
        <c:import url="/reuse/footer.jsp"/>
    </body>
    
    
</html>
