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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="/css/resultadoBusqueda.css">
    <link rel="stylesheet" href="/css/navbar.css">
    <title>${busqueda}</title>
</head>
<body>
    <div class="pb-5">
        <nav class="navegacion shadow d-flex justify-content-between">
            <a href="/">
                <img src="/images/logo/logo.png" alt="socialCodersLogo">
            </a>
            <div class="infoUsuario">
                <c:if test="${usuario.id != null}">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        <img src="/images/iconImages/user_1.png" alt="">
                    </a>
                    <table>
                        <form action="/search" method="get">
                            <tr>
                                <td>
                                    <input type="text" name="q" class="form-control" placeholder="Buscar...">
                                </td>
                                <td>
                                    <input type="submit" value="Enviar" class="btn btn-primary">
                                </td>    
                            </tr>
                        </form>
                    </table>
                    <ul class="dropdown-menu dropdownColor" aria-labelledby="dropdownMenuButton1">
                        <li><a href="/socialcoders/perfil/${usuario.username}">Perfil</a></li>
                        <li><a href="/perfil/editarPerfil">Editar Perfil</a></li>
                        <li>
                            <form id="logoutForm" method="POST" action="/logout">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                <input type="submit" value="Salir" class="linksito"/>
                            </form>
                        </li>
                    </ul>
                </c:if>
                <c:if test="${usuario.id == null}">
                    <a href="/login">Logeate!</a>
                    <a href="/register">Registrate!</a>
                </c:if>
            </div>
        </nav>
    </div>
    <div class="d-flex justify-content-center">
        <div class="row mt-3">
            <div class="col-8 border shadow rounded fondo p-3">
                <a href="/search/posts?q=${busqueda}" class="text-decoration-none">Filtrar por posts</a>
                <a href="/search/usuarios?q=${busqueda}" class="text-decoration-none">Filtrar por usuarios</a>
                <a href="/search?q=${busqueda}">Todo</a>
            </div>
        </div>
        <div class="miyerly col-5">
            <c:if test="${filtro.equals('todo') || filtro.equals('post')}">
                <c:forEach var="post" items="${posts}">
                    <div class="row mt-3">
                        <div class="col border rounded shadow fondo">
                            <ul class="list-group mt-3 mb-3">
                                <li class="list-group-item list-group-item-action list-group-item-primary d-flex justify-content-between align-items-start bg-dark">
                                    <div class="ms-2 me-auto">
                                        <div class="fw-bold">
                                            <i class="bi bi-tag"></i>
                                            <a href="/post/${post.id}"><c:out value="${post.titulo}"/></a>
                                        </div>
                                        Creado por: <a href="/socialcoders/perfil/${post.creador.username}"><c:out value="${post.creador.username}"/></a> 
                                    </div>
                                    <i class="bi bi-heart"><c:out value="${post.reaccionesUsuarios.size()}"/></i>
                                    <!-- <span class="badge bg-primary rounded-pill" ><c:out value="${post.reaccionesUsuarios.size()}"/></span> -->
                                </li>
                            </ul>
                        </div>
                    </div>
                </c:forEach>
            </c:if>
            <c:if test="${filtro.equals('todo') || filtro.equals('usuario')}">
                <c:forEach var="usuario" items="${usuarios}">
                    <div class="row mt-3">
                        <div class="col border rounded shadow fondo">
                            <ul class="list-group mt-3 mb-3">

                                <li class="list-group-item list-group-item-action list-group-item-primary d-flex justify-content-between align-items-start bg-dark">
                                    <div class="ms-2 me-auto">
                                        <div class="fw-bold">
                                            <i class="bi bi-person-circle"></i>
                                            <a href="/socialcoders/perfil/${usuario.username}" class="text-decoration-none"><c:out value="${usuario.username}"/></a>
                                        </div>
                                    </div>
                                    <i class="bi bi-person-badge" width="32" height="32"><c:out value="${usuario.seguidores.size()}"/></i>
                                    <!-- <span class="badge bg-primary rounded-pill" ><c:out value="${post.reaccionesUsuarios.size()}"/></span> -->
                                </li>
                            </ul>
                        </div>
                    </div>
                </c:forEach>
            </c:if>
        </div>
    </div>
</body>
</html>