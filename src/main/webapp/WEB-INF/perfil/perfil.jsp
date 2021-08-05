<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/css/perfil.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="/css/navbar.css">
    <title>${username}</title>
</head>
<body>
    <!-- NAVBAR -->
   <div class="pb-5">
            <nav class="navegacion shadow d-flex justify-content-between">
                <a href="/">
                    <img style="width: 50px;" src="/images/logo/logo.png" alt="socialCodersLogo">
                </a>
                <div class="infoUsuario">
                    <c:if test="${usuarioSesion.id != null}">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            <img src="/images/iconImages/user_1.png" alt="">
                        </a>
                          <ul class="dropdown-menu dropdownColor" aria-labelledby="dropdownMenuButton1">
                            <li><a href="/socialcoders/perfil/${usuarioSesion.username}">Perfil</a></li>
                            <li><a href="/perfil/editarPerfil">Editar Perfil</a></li>
                            <li>
                                <form id="logoutForm" method="POST" action="/logout">
                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                    <input type="submit" value="Logout!"/>
                                </form>
                            </li>
                          </ul>
                    </c:if>
                    <c:if test="${usuarioSesion.id == null}">
                        <a href="/login">Logeate!</a>
                        <a href="/register">Registrate!</a>
                    </c:if>
                </div>
            </nav>
        </div>

    <!-- PERFIL -->
    <div class="container font-">
        <div class="row mt-4 mx-5">
            <div class="col-12 border shadow rounded-3 fondo">
                <div class="row mt-4">
                    <a href="/mensajes/${usuarioPerfil.username}" class=""><img src="/images/iconImages/message.png" alt="message"></a>
                    <div class="col rounded-circle  text-center">
                        <c:choose>
                            <c:when test="${usuarioSesion == usuarioPerfil}">
                                <a href="/cambiar/icono">
                                    <img class="imagen" src="/imagenes/iconosUser/${usuarioPerfil.imagen}" alt="foto" id="fotoperfil">
        
                                </a>
                            </c:when>
                            <c:otherwise>
                                <img class="imagen" src="/imagenes/iconosUser/${usuarioPerfil.imagen}" alt="foto" id="fotoperfil">
                            </c:otherwise>
                        </c:choose>
                        
                        <h2><c:out value="${usuarioPerfil.username}"/></h2>
                    </div>
                </div>
                <div class="row mx-2">
                    <div class="col text-center">
                        <div class="mt-3 mb-3">
                           <c:if test="${usuarioPerfil.seguidores.contains(usuarioSesion)}">
                                <a href="/perfil/unfollow/${usuarioPerfil.username}" class="text-decoration-none">
                                    <img src="/images/iconImages/followed.png" alt="follow" width="32" height="32">
                                </a>
                           </c:if> 

                           <c:if test="${!usuarioPerfil.seguidores.contains(usuarioSesion)}">
                                <a href="/perfil/follow/${usuarioPerfil.username}" class="text-decoration-none">
                                    <img src="/images/iconImages/followers.png" alt="follow" width="32" height="32">
                                </a>
                           </c:if> 
                            <span class="mx-5">Seguidores: <c:out value="${usuarioPerfil.seguidores.size()}"/></span>
                            <span class="mx-2">Seguidos <c:out value="${usuarioPerfil.seguidos.size()}"/></span>
                        </div>
                        <p><c:out value="${usuarioPerfil.descripcion}"/></p>
                    </div>
                </div>
            </div>
        </div>
        <div class="row mt-4 mx-5">
            <div class="col-7 border shadow rounded-3 fondo">
                <div class="col text-center mt-3">
                    <img src="/images/iconImages/post.png" alt="post" width="54" height="54">
                    <h2 class="col d-inline-block">Post</h2>
                </div>
                <ol class="list-group list-group-numbered mt-3 mb-3">
                    <c:forEach var="post" items="${postsUsuario}">
                        <li class="list-group-item list-group-item-action list-group-item-primary d-flex justify-content-between align-items-start bg-dark">
                            <div class="ms-2 me-auto">
                                <div class="fw-bold">
                                    <a href="/post/${post.id}"><c:out value="${post.titulo}"/></a>
                                </div>
                                Cras justo odio
                            </div>
                            <span class="badge bg-primary rounded-pill" ><c:out value="${post.reaccionesUsuarios.size()}"/></span>
                        </li>
                    </c:forEach>
                </ol>
            </div>
            <div class="col border shadow rounded-3 box fondo">
                <h2 class="text-center mt-3">Lenguajes</h2>
                <c:forEach var="lenguaje" items="${lenguajesUsuario}">
                    <img src="/images/lenguajesImages/${lenguaje.lenguaje}.png" alt="lenguaje" class="col-2 mb-3">
                </c:forEach>

            </div>
        </div>
    </div>
</body>
</html>