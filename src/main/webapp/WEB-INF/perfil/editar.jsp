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
    <link rel="stylesheet" href="/css/perfil.css">
    <title>Editar perfil</title>
</head>
<body>
    <div class="container d-flex justify-content-center p-3">
        <div class="row">
            <div class="col-12 border rounded p-5 shadow fondo">
                <form:errors path="usuario.*"/>
                <h2 class="text-center">Configuración Usuario</h2>
                <form:form action="" method="post" modelAttribute="usuario">
                    <form:label path="nombre" cssClass="form-label">Nombre: </form:label>
                    <form:input path="nombre" value="${usuarioSesion.nombre}" cssClass="form-control"/>
                    <form:errors path="nombre"/>

                    <form:label path="apellido" cssClass="form-label">Apellido: </form:label>
                    <form:input path="apellido" value="${usuarioSesion.apellido}" cssClass="form-control"/>
                    <form:errors path="apellido"/>

                    <form:label path="email" cssClass="form-label">Email: </form:label>
                    <form:input path="email" value="${usuarioSesion.email}" cssClass="form-control"/>
                    <form:errors path="email"/>

                    <form:label path="username" cssClass="form-label">Username: </form:label>
                    <form:input path="username" value="${usuarioSesion.username}" cssClass="form-control"/>
                    <form:errors path="username"/>

                    <form:label path="descripcion" cssClass="form-label">Descripcion: </form:label>
                    <form:textarea cssClass="form-control textarea" rows="4" path="descripcion" value="${usuarioSesion.descripcion}"></form:textarea>

                    <div class="row d-flex justify-content-center mt-3">
                        <input type="submit" value="Guardar" class="col-3 btn btn-dark border"/>
                        <button class="btn btn-danger mx-3 col-3 border" onclick="window.location.href='/'">Volver</button>
                    </div>

                </form:form>
                <div class="col mt-4">
                    <h2 class="text-center">Añadir lenguajes</h2>
                    <table class="table">
                        <thead class="table-dark">
                            <th>Lenguaje</th>
                            <th>Añadir</th>
                        </thead>
                        <tbody>
                            <c:forEach var="lenguaje" items="${lenguajesNoUtilizados}">
                                <tr>
                                    <td><c:out value="${lenguaje.lenguaje}"/></td>
                                    <td><a href="/perfil/agregarLenguaje?lenguaje=${lenguaje.id}">Añadir</a></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                        </table>
                </div>
                <div class="col mt-4 text-center">
                    <h2 class="text-center">Foto</h2>
                    <a href="/cambiar/icono" class="btn btn-dark border mt-4">Cambiar Foto</a>
                </div>
            </div>
        </div>
        <div class="row">
           
        </div>

    </div>
</body>
</html>