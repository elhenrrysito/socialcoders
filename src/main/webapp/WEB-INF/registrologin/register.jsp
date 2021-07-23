<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/loginregister.css">
    <title>Registration Page</title>
</head>
<body>
    <div class="container w-75 bg-primary mt-5 mb-5 rounded shadow-lg">

        <div class="row align-items-stretch">
            <div class="col bg d-none d-lg-block col-md-5 col-lg-5 col-xl-6 rounded p-3">
            </div>
            <div class="col p-5 rounded-end fondo">
                <div class="d-flex justify-content-end">
                    <img src="/css/img/register.png" alt="key" width="48">
                </div>
                <h2 class="fw-bold text-center py-5 letra">Registrarse</h2>
                <!-- Register -->

                <form:form action="/registration" method="POST" modelAttribute="user">
                    <div class="mb-4">
                        <form:errors path="nombre" class="text-danger"/>
                        <form:input path="nombre" class="form-control" placeholder="Nombre"/>
                    </div>
                    <div class="mb-4">
                        <form:errors path="apellido" class="text-danger"/>
                        <form:input path="apellido" class="form-control" placeholder="Apellido"/>
                    </div>
                    <div class="mb-4">
                        <form:errors path="email" class="text-danger"/>
                        <form:input type="email" path="email" class="form-control" placeholder="Email"/>
                    </div>
                    <div class="mb-4">
                        <form:errors path="username" class="text-danger"/>
                        <form:input path="username" class="form-control" placeholder="Usuario"/>
                    </div>
                    <div class="mb-4">
                        <form:errors path="password" class="text-danger"/>
                        <form:input type="password" path="password" class="form-control" placeholder="Contraseña"/>
                    </div>
                    <div class="mb-4">
                        <form:errors path="passwordConfirmation" class="text-danger"/>
                        <form:input type="password" path="passwordConfirmation" class="form-control" placeholder="Confirmar Contraseña"/>
                    </div>
                    <div class="d-grid">
                        <button type="submit" class="btn btn-dark boton">Registrarse</button>
                    </div>
                    <div class="d-grid mt-3">
                        <a href="/login" class="btn btn-dark boton">Login</a>
                    </div>
                </form:form>
            </div>
        </div>
    </div>
</body>
</html>