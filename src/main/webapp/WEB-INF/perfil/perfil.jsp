<%@ page isErrorPage="true" %> 
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>

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
    <script src="/js/postEliminar.js"></script>

        <!-- CSS only -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <!-- Etiquetas meta de JavaScript Opcionales-->
        <!-- Primero jQuery, luego Popper.js, y por último Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.3.1.js"></script>

        <!-- Bootstrap  -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
	    
    <title><c:out value="${username}"/> </title>
</head>
<body>
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
    aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title " id="exampleModalLabel">Eliminar</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"
                    aria-label="Close"></button>
            </div>
            <div class="modal-body">
                ¿Seguro?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                <button type="button" class="btn btn-danger" onclick="eliminar();">Eliminar</button>
            </div>
        </div>
    </div>
</div>
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
    <div class="container">
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
                                    <!-- Modal -->
                            <div id="modal">       
                                <c:if test="${usuarioSesion == post.creador}">   
                                    <button type="button" class="btn btn-danger mx-2" onclick="colocarId(${post.id},  '${usuarioPerfil.username}')"   data-bs-toggle="modal" data-bs-target="#exampleModal">
                                        Eliminar
                                    </button>     
                                    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
                                        aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title " id="exampleModalLabel">Eliminar</h5>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                        aria-label="Close"></button>
                                                </div>
                                                <div class="modal-body">
                                                    ¿Seguro?
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                                                    <button type="button" class="btn btn-danger" onclick="eliminar();">Eliminar</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:if>
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