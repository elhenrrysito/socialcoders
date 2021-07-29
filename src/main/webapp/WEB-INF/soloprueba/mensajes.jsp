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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="/js/chat.js"></script>
    <title>Chat</title>
</head>
<body>
    <div class="container d-flex justify-content-center">
        <div class="row">
            <div class="col">
                <h1>Chat</h1>
                <div class="border rounded p-3" id="chat">
                    <c:forEach var="message" items="${chat}">
                        <p><fmt:formatDate pattern="HH:mm" value="${message.createdAt}"/><c:out value=" ${message.remitente.username}: ${message.message}"/> </p>
                    </c:forEach>
                </div>
                <form action="" method="post" modelAttribute="mensaje" cssClass="mt-3" id="formMensaje">
                    <input path="message" placeholder="Enviar mensaje" name="inputMensaje" id="inputMensaje"/>
                    <button type="button" id="submitMensaje">Enviar</button>
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    <input type="hidden" value="${url}" id="url"/>
                </form>
            </div>
        </div>
    </div>
</body>
</html>