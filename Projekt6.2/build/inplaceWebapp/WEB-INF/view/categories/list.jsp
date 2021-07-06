<%--
  Created by IntelliJ IDEA.
  User: Raven
  Date: 08.06.2021
  Time: 16:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <style>
        body {
            background: #08001b;
            color: #255784;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
            justify-content: left;
            height: 95%;
            width: 99%;
            margin-top: 2%;
        }
        a {
            padding: 15px 30px;
            letter-spacing: 4px;
            transition: 0.2s;
            top: 17%;
            font-size: 100%;
            color: #ffffff;
            z-index: 1;
            transition: 0.5s;
            margin: 1%;
            text-decoration: none;

        }

        button[type="submit"]
        {
            background: transparent;
            border: none;
            outline: none;
            color: #fff;
            background: #03a9f4;
            padding: 10px 20px;
            cursor: pointer;
            border-radius: 5px;
        }

        a:hover {
            color: #255784;
            background: #2196f3;
            box-shadow: 0 0 10px #2196f3, 0 0 40px #2196f3, 0 0 80px #2196f3;
            transition-delay: 1s;
            text-decoration: none;
            opacity: 1;
            transform: translateY(-70px);
        }
        table, td, th {
            border: 1px solid #255784;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th {
            background-color: #255784;
            color: white;
        }
        tr:nth-child(even){background-color: #f2f2f2}
        h1 {
            background: #08001b;
            padding: 10px 20px;
            border: 1px solid #FFFFFF;
            border-radius: 3%;
            color: #1779ff;
        }
    </style>
    <title>Kategorie</title>
</head>
<body>
<h1>Kategorie</h1>
<div>
    <table>
        <tr>
            <th>Id</th>
            <th>Nazwa</th>
        </tr>
        <c:forEach var="categories" items="${categories}">
            <tr>
                <td>${categories.id}</td>
                <td>${categories.name}</td>
            </tr>
        </c:forEach>
    </table>
</div>
<br>
<div>
    <sec:authorize access="hasRole('ADMIN')">
        <a href="${pageContext.request.contextPath}/categories/add">Dodaj kategorię</a>
        <a href="${pageContext.request.contextPath}/admin">Cofnij</a>
    </sec:authorize>
</div>
</body>
</html>
