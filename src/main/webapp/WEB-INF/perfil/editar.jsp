<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <title>Editar perfil</title>
</head>
<body>
    <div class="container">
        <div class="row">
            <div class="col">
                <form:form action="" method="post" modelAttribute="usuario">
                    <form:label>Nombre: </form:label>
                    <form:input path="nombre" value="${usuarioSesion.nombre}" cssClass="form-control"/>
                    <form:errors path="nombre"/>

                    <form:label>Apellido: </form:label>
                    <form:input path="apellido" value="${usuarioSesion.apellido}" cssClass="form-control"/>
                    <form:errors path="apellido"/>


                    <form:label>Email: </form:label>
                    <form:input path="email" value="${usuarioSesion.email}" cssClass="form-control"/>
                    <form:errors path="email"/>

                    <form:textarea path="descripcion">${usuarioSesion.descripcion}</form:textarea>

                </form:form>
            </div>
        </div>

    </div>
</body>
</html>