<%--
  Created by IntelliJ IDEA.
  User: Raven
  Date: 08.06.2021
  Time: 17:03
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
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
            text-decoration: none;
            font-size: 100%;
            text-align: center;
        }

        div a {
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

        input[type="submit"] {
            background: transparent;
            border: none;
            outline: none;
            color: #fff;
            background: #03a9f4;
            padding: 10px 20px;
            cursor: pointer;
            border-radius: 5px;
        }

        div a:hover {
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

        tr:nth-child(even) {
            background-color: #f2f2f2
        }

        h1 {
            background: #08001b;
            padding: 10px 20px;
            border: 1px solid #FFFFFF;
            border-radius: 3%;
            color: #1779ff;
        }
    </style>
    <title>Lista książek</title>
</head>
<body>
<h1>Książki</h1>
<table>
    <tr>
        <th>Nazwa</th>
        <th>Wydawnictwo</th>
        <th>Cena</th>
        <th>Kategoria</th>
        <sec:authorize access="hasRole('ADMIN')">
            <th>Edytuj</th>
            <th>Usuń</th>
        </sec:authorize>
        <sec:authorize access="hasRole('USER')">
            <th>Dodaj do koszyka</th>
        </sec:authorize>
    </tr>
    <c:forEach var="books" items="${books}">
        <sec:authorize access="hasRole('ADMIN')">

            <c:url var="edit" value="/books/edit">
                <c:param name="bookId" value="${books.id}"/>
            </c:url>
            <c:url var="delete" value="/books/delete">
                <c:param name="bookId" value="${books.id}"/>
            </c:url>
        </sec:authorize>

        <sec:authorize access="hasRole('USER')">
            <c:url var="addToCart" value="/books/addToCart">
                <c:param name="bookId" value="${books.id}"/>
            </c:url>
        </sec:authorize>
        <tr>
            <td>${books.name}</td>
            <td>${books.publisher}</td>
            <td>${books.price}</td>
            <td>${books.category.name}</td>
            <sec:authorize access="hasRole('ADMIN')">
                <td><a href="${edit}">Edytuj</a></td>
                <td><a href="${delete}">Usuń</a></td>
            </sec:authorize>
                <td><a href="${addToCart}">Dodaj do kosza</a></td>
        </tr>
    </c:forEach>
</table>
<br>
<div>
    <sec:authorize access="hasRole('ADMIN')">
        <a href="${pageContext.request.contextPath}/books/add" methods="get">Dodaj książkę</a>
    </sec:authorize>
    <sec:authorize access="hasAnyRole('ADMIN', 'USER')">
        <a href="${pageContext.request.contextPath}/">Cofnij</a>
    </sec:authorize>
</div>
</body>
</html>
