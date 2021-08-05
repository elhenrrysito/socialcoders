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
    <link rel="stylesheet" href="/css/resultadoBusqueda.css">
    <title>${busqueda}</title>
</head>
<body>
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
                                            <a href="/socialcoders/post/${post.id}"><c:out value="${post.titulo}"/></a>
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