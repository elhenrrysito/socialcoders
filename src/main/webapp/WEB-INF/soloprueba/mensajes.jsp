<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chat</title>
</head>
<body>
    <div class="container">
        <div class="row">
            <h1>Chat</h1>
            <c:forEach var="message" items="${chat}">
                <p><fmt:formatDate pattern="HH:mm" value="${message.createdAt}"/><c:out value=" ${message.remitente.username}: ${message.message}"/> </p>
            </c:forEach>
            <form:form action="" method="post" modelAttribute="mensaje">
                <form:input path="message" placeholder="Enviar mensaje"/>
                <input type="submit" value="Enviar"j>
            </form:form>
        </div>
    </div>
</body>
</html>