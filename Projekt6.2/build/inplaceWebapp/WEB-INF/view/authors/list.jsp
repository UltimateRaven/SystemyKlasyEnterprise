<%--
  Created by IntelliJ IDEA.
  User: Raven
  Date: 08.06.2021
  Time: 16:58
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
    <title>Autorzy</title>
</head>
<body>
<h1>Autorzy</h1>
<div>
    <table>
        <tr>
            <th>ID</th>
            <th>Imię</th>
            <th>Nazwisko</th>
        </tr>
        <c:forEach var="authors" items="${authors}">
            <tr>
                <td>${authors.id}</td>
                <td>${authors.name}</td>
                <td>${authors.surname}</td>
            </tr>
        </c:forEach>
    </table>
    <br>
    <div>
        <a href="${pageContext.request.contextPath}/author/add">Dodaj autora</a>
        <a href="${pageContext.request.contextPath}/admin">Cofnij</a>
    </div>
</div>
</body>
</html>
