<%-- 
    Document   : updateRecords
    Created on : Sep 27, 2014, 2:21:51 AM
    Author     : Justin
--%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <c:choose>
        <c:when test='${(not empty param.deptNo) && (not empty param.deptName)}'>
        <h1>Updating Country ${param.deptNo}</h1>
        <c:catch var='exception'>
            <sql:update dataSource="jdbc/mp2DS" var="result">
                update departments set
                dept_no = ?,
                dept_name = ?
                where dept_no = ?
                <sql:param value="${param.deptNo}" />
                <sql:param value="${param.deptName}" />
                <sql:param value="${param.deptOldNo}" />
            </sql:update>
        </c:catch>
        </c:when>
         <c:otherwise>
                    <c:set var="message" value="Department name or deptartment number cannot be null"/>
                    <c:set var="deptOldNo" value="${param.deptOldNo}"/>
        </c:otherwise>
                </c:choose>
        <c:if test="${result==0}">

            <c:set var="message" value="Department did not get updated as no corresponding department number was found in the 
                   Departments table"/>
            <h4>${message}</h4>
        </c:if>

        <c:if test='${not empty message}'>

            <c:url value="editDeptRecords.jsp" var="failURL">
                <c:param name="exception" value="${message}"/>
                <c:param name="deptName" value="${param.deptName}"/>
                <c:param name="deptNo" value="${param.deptNo}"/>
            </c:url>
            <c:redirect url="${failURL}"/> 
        </c:if>
        <c:if test='${not empty exception}'>

            <c:url value="editDeptRecords.jsp" var="failURL">
                <c:param name="exception" value="${exception.message}"/>
                <c:param name="deptName" value="${param.deptName}"/>
                <c:param name="deptNo" value="${param.deptNo}"/>
            </c:url>
            <c:redirect url="${failURL}"/> 
        </c:if>

        <c:if test='${empty exception}'>
            <c:redirect url="readDeptRecords.jsp"/>
        </c:if>

    </body>
</html>

