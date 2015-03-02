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
        <title>Deleting Record ${param.deptNo} and ${param.empNo}</title>
    </head>
    <body>
        <h1>Deleting Country ${param.deptNo} and ${param.empNo}</h1>
        
        <c:out value="${param.emp_no}"/>
        
        <sql:update dataSource="jdbc/mp2DS">
            delete from dept_manager
            where dept_no = ? and emp_no = ?
            <sql:param value="${param.deptNo}" />
            <sql:param value="${param.empNo}" />
        </sql:update>

        <c:redirect url="readRecords.jsp"/>

    </body>
</html>
