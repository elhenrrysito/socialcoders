<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/todosLosLenguajes.css">
    <!-- Etiquetas meta de JavaScript Opcionales-->
    <!-- Primero jQuery, luego Popper.js, y por último Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
    <title>Test JavaScript</title>
</head>
<body>
    <div class="container">
        <a href="/">Volver</a>
        <form action="/javascript" method="post">
            <c:forEach var="preguntas" items="${preguntaYrespuesta}">

            <div class="display-4 pregunta"><c:out value="${preguntas.key}"/></div>
            <div class="form-check respuestas">
               
                <c:forEach var="respuesta" items="${preguntas.value}">
                   <input type="radio"  name="${preguntas.key}" value="${respuesta.value}">
                    
                    <label for="flexRadioDefault1" id="correct">${respuesta.value}</label><br>
                </c:forEach>
    
            </div>
        </c:forEach>
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <input type="submit" class="boton1" value="siguiente">
        </form>
    </div>
    <script  type="text/javascript" src="/js/alert.js"></script>
</body>
</html>