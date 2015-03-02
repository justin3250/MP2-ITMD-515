<%-- 
    Document   : readRecords
    Created on : Sep 26, 2014, 9:54:35 PM
    Author     : Justin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <h1>Inserting Record</h1>

        <c:choose>
            <c:when test='${(not empty param.deptNo) && (not empty param.deptName)}'>
                    <c:catch var='insertException'>
                    <sql:update dataSource="jdbc/mp2DS">
                        insert into departments(dept_name, dept_no )
                        values (? , ? )
                        <sql:param value="${param.deptName}" />
                        <sql:param value="${param.deptNo}" />
                    </sql:update>
                </c:catch>
            </c:when>
            <c:otherwise>
                <c:set var="message" value="Department name or deptartment number cannot be null"/>
            </c:otherwise>
        </c:choose>


        <c:if test='${not empty insertException}'>
            <%-- Display the error message --%>
            <c:url value="editDeptRecords.jsp" var="failURL">
                <c:param name="insertException" value="${insertException.message}"/>
                <c:param name="deptName" value="${param.deptName}"/>
                <c:param name="deptNo" value="${param.deptNo}"/>
            </c:url>
            <c:redirect url="${failURL}"/> 
        </c:if>

        <c:if test='${not empty message}'>
            <%-- Display the error message --%>
            <c:url value="editDeptRecords.jsp" var="failURL">
                <c:param name="insertException" value="${message}"/>
                <c:param name="deptName" value="${param.deptName}"/>
                <c:param name="deptNo" value="${param.deptNo}"/>
            </c:url>
            <c:redirect url="${failURL}"/> 
        </c:if>

        <c:if test='${(empty insertException) && (empty exception)}'>
            <c:redirect url="readDeptRecords.jsp"/> 
        </c:if>

        <c:redirect url="readDeptRecords.jsp"/> 

    </body>
</html>
