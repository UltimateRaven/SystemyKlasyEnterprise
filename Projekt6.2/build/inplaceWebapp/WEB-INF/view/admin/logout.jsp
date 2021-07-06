<jsp:useBean id="_csrf" scope="request" type="org.springframework.web.bind.MissingServletRequestParameterException"/>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>Admin</title>
</head>
<body>
<h1>Witaj ADMIN</h1>
<form id="logout" action="${contextPath}/logout" method="post" >
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
    <input type="submit" value="Wyloguj się" />
</form>
</body>
</html>
