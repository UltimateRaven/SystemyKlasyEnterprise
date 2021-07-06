<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Logowanie</title>
    <style>
        body {
            background: #08001b;
            color: white;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
            justify-content: left;
            height: 95%;
            width: 99%;
            margin-top: 2%;
        }

        .box {
            color: white;
            position: absolute;
            top: 40%;
            left: 50%;
            transform: translate(-50%, -50%);
            width: 400px;
            height: 50px;
            background: rgba(0, 0, 0, 0.76);
            box-sizing: border-box;
            box-shadow: 0px 130px 16px 180px rgba(0, 0, 0, 0.76);
            border-radius: 50px;
        }

        h1 {
            font-size: 40px;
            margin: 0 0 30px;
            padding: 0;
            text-align: center;
            border: none;
            color: #1779ff;
            position: relative;
            outline: none;
        }

        .box label
        {
            top: 10px;
            left: -100px;
            padding: 10px 0;
            font-size: 16px;
            color: #fff;
            pointer-events: auto;
            transition: .5s;
        }

        .box button[type="submit"]
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

        .box input
        {
            width: 100%;
            padding: 10px 0;
            font-size: 16px;
            color: #fff;
            margin-bottom: 30px;
            border: none;
            border-bottom: 1px solid #fff;
            outline: none;
            background: transparent;
        }

    </style>
</head>
<body>
<c:if test="${(param.error != null) && (not empty SPRING_SECURITY_LAST_EXCEPTION)}">
    <p class="text-danger"><c:out value="${SPRING_SECURITY_LAST_EXCEPTION.message eq 'Bad credentials' ?
     'Niepoprawne dane' : SPRING_SECURITY_LAST_EXCEPTION.message}"/></p>
</c:if>
<div class="box">
    <h1>Logowanie</h1>

    <form:form method="post">
        <table>
            <tbody>
            <tr>
                <td><label for="username">Nazwa:</label></td>
                <td><input type="text" id="username" name="username"/></td>
            </tr>
            <tr>
                <td><label for="password">Hasło:</label></td>
                <td><input type="password" id="password" name="password"/></td>
            </tr>
            <tr>
                <td>
                    <button type="submit">Zaloguj</button>
                </td>
            </tr>
            </tbody>
        </table>
    </form:form>
</div>
</body>
</html>
