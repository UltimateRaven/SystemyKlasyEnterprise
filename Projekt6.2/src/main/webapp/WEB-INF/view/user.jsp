<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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

        a {
            padding: 15px 30px;
            letter-spacing: 4px;
            transition: 0.2s;
            top: 17%;
            font-size: 100%;
            color: white;
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

        a span {
            display: block;
            position: relative;
            opacity: 0;
        }

        a span:nth-child(1) {
            top: -15px;
            left: 0;
            width: 100%;
            height: 2px;
            background: linear-gradient(90deg, transparent, #2196f3);
            animation: animate1 2s linear infinite;
        }

        a:hover span:nth-child(1) {
            left: 100%;
            transition: 1s;
            transition-delay: 0.5s;
        }

        @keyframes animate1 {
            0% {
                transform: translateX(-100%);
            }
            100% {
                transform: translateX(100%);
            }
        }

        h3 {
            background: #08001b;
            padding: 10px 20px;
            border: 1px solid #FFFFFF;
            border-radius: 3%;
            color: #1779ff;
        }

        button[type="submit"] {
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
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Strona usera</title>
</head>
<body>
<h1>Witaj User</h1>
<p>
    <sec:authorize access="hasRole('USER')">
    <a href="${pageContext.request.contextPath}/books/list">Lista ksiazek</a>
    </sec:authorize>
    <sec:authorize access="hasRole('USER')">
    <a href="${pageContext.request.contextPath}/cart/list">Koszyk</a>
    </sec:authorize>
<form id="logout" action="${contextPath}/logout" method="post">
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    <input type="submit" value="Wyloguj się"/>
</form>
</p>
</body>
</html>
