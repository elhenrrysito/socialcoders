<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/loginregister.css">
    <title>Login Page</title>
</head>
<body>
    <div class="container w-75 bg-primary mt-5 rounded shadow-lg">
        <div class="row align-items-stretch">
            <div class="col bg d-none d-lg-block col-md-5 col-lg-5 col-xl-6 rounded">

            </div>
            <div class="col p-5 rounded-end fondo">
                <div class="text-end">
                    <img src="/img/key.png" alt="key" width="48">
                </div>
                <h2 class="fw-bold text-center py-5 letra">Bienvenido</h2>
                <!-- LOGIN -->

                <c:if test="${logoutMessage != null}">
                    <p><c:out value="${logoutMessage}"/></p>
                </c:if>
                <c:if test="${errorMessage != null}">
                    <p class="text-danger"><c:out value="${errorMessage}"/></p>
                </c:if>
                <form action="/login" method="POST">
                    <div class="mb-4">
                        <input type="text" class="form-control" name="username" id="" placeholder="Usuario">
                    </div>
                    <div class="mb-4">
                        <input type="password" class="form-control" name="password" id="" placeholder="Contraseña">
                    </div>
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    <div class="d-grid">
                        <button type="submit" class="btn btn-dark boton" name="opcion">Iniciar Sesión</button>
                    </div>
                    <div class="d-grid mt-3">
                        <a href="/test/seleccionarLenguaje" class="btn btn-dark boton">Registrarse</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>