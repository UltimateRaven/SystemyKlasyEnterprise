<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <title>Rejestracja</title>
</head>
<body>
<nav>
    <div>
        <a href="${pageContext.request.contextPath}">Strona główna</a>
    </div>
</nav>
<h3>Rejestracja</h3>
<c:if test="${not empty info}">
    <p class="text-danger">
        <c:out value="${info}"/>
    </p>
</c:if>
<form:form method="post" modelAttribute="user">
    <table>
        <tbody>
        <tr>
            <td><label for="username">Nazwa:</label></td>
            <td><form:input path="username" id="username"/></td>
        </tr>
        <tr>
            <td><label for="password">Hasło:</label></td>
            <td><form:password path="password" id="password"/></td>
        </tr>
        <tr>
            <td>
                <button type="submit">Zarejestruj</button>
            </td>
        </tr>
        </tbody>
    </table>
</form:form>
</body>
</html>
