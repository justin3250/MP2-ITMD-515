<%-- 
    Document   : readRecords
    Created on : Sep 26, 2014, 9:54:35 PM
    Author     : Justin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <c:import url="/reuse/header.jsp"/>
    </head>
    <body>
        <h1>Inserting Record</h1>

        <c:choose>
            <c:when test='${(not empty param.deptNo) && (not empty param.empNo)}'>

                <c:catch var='insertException'>
                    <sql:update dataSource="jdbc/mp2DS">
                        insert into dept_manager(emp_no, dept_no, from_date ,  to_date  )
                        values (? , ? , ? , ?)
                        <sql:param value="${param.empNo}" />
                        <sql:param value="${param.deptNo}" />
                        <sql:param value="${param.fromDate}" />
                        <sql:param value="${param.toDate}" />            
                    </sql:update>
                </c:catch>
            </c:when>
            <c:otherwise>
                <c:set var="message" value="Department number or Employee number cannot be null"/>
            </c:otherwise>
        </c:choose>

        <c:if test='${not empty insertException}'>
            <%-- Display the error message --%>
            <c:url value="editRecords.jsp" var="failURL">
                <c:param name="insertException" value="${insertException.message}"/>
                <c:param name="empNo" value="${param.empNo}"/>
                <c:param name="deptNo" value="${param.deptNo}"/>
                <c:param name="fromDate" value="${param.fromDate}"/>
                <c:param name="toDate" value="${param.toDate}"/>
            </c:url>
            <c:redirect url="${failURL}"/> 
        </c:if>


        <c:if test='${not empty message}'>
            <%-- Display the error message --%>
            <c:url value="editRecords.jsp" var="failURL">
                <c:param name="insertException" value="${message}"/>
                <c:param name="empNo" value="${param.empNo}"/>
                <c:param name="deptNo" value="${param.deptNo}"/>
                <c:param name="fromDate" value="${param.fromDate}"/>
                <c:param name="toDate" value="${param.toDate}"/>
            </c:url>
            <c:redirect url="${failURL}"/> 
        </c:if>

        <c:if test='${(empty insertException) && (empty exception)}'>
            <c:redirect url="readRecords.jsp"/> 
        </c:if>


        <c:import url="/reuse/footer.jsp"/>
    </body>
</html>
