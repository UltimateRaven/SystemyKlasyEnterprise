<%--
  Created by IntelliJ IDEA.
  User: Raven
  Date: 08.06.2021
  Time: 16:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

        a:hover {
            color: #255784;
            background: #2196f3;
            box-shadow: 0 0 10px #2196f3, 0 0 40px #2196f3, 0 0 80px #2196f3;
            transition-delay: 1s;
            text-decoration: none;
            opacity: 1;
            transform: translateY(-70px);
        }
        h1 {
            background: #08001b;
            padding: 10px 20px;
            border: 1px solid #FFFFFF;
            border-radius: 3%;
            color: #1779ff;
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
    </style>
    <title>Dodawanie kategorii</title>
</head>
<body>
<h1>Dodawanie kategorii</h1>
<form:form action="add" modelAttribute="categories" method="POST">
    <table>
        <tbody>
        <tr>
            <td><label for="name">nazwa: </label></td>
            <td><form:input path="name" id="name"/></td>
        </tr>
        <tr>
            <td>
                <button type="submit">Zapisz</button>
            </td>
        </tr>
        </tbody>
    </table>
</form:form>
<p>
    <a href="${pageContext.request.contextPath}/categories/list">Cofnij do listy kategorii</a>
</p>
</body>
</html>
