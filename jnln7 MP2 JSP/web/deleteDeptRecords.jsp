<%-- 
    Document   : deleteRecords
    Created on : Sep 26, 2014, 11:42:24 PM
    Author     : Justin
--%>

<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Deleting Record ${param.deptNo}</title>
    </head>
    <body>
        <h1>Deleting Country ${param.deptNo} </h1>
        
        <c:out value="${param.dept_name}"/>
        
        <sql:update dataSource="jdbc/mp2DS">
            delete from departments
            where dept_no = ?
            <sql:param value="${param.deptNo}" />
        </sql:update>

        <c:redirect url="readDeptRecords.jsp"/>

    </body>
</html>
