<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Comentario</title>
</head>
<body>
    <form:form action="" method="post" modelAttribute="modificarComentario">
        <input type="hidden" name="_method" value="put"/>
        <form:label path="comentario">Comentario: </form:label>
        <form:input path="comentario" value="${comentario.comentario}"/>
        <input type="submit" value="Enviar">
    </form:form>
    
</body>
</html>