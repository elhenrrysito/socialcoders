<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="/css/postDashboard.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <script src="/js/likes.js"></script>
        <title>Document</title>
</head>
<body>
    <div>
        <!-- NAVBAR -->
      
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
        
        <!-- BUSCADOR -->

        <div class="contenedor">
        
            <aside class="col-3 mt-5 navegador">
                <h2>Categorías</h2>
                <ul class="mt-4">
                    <a href="/" class="btnc btn-primary">Posts</a>
                    <a href="/socialCoders/memes" class="btnc btn-primary">Memes</a>
                    <a href="/socialCoders/seguidos" class="btnc btn-primary">Seguidos</a>
                    <a href="/socialCoders/preguntas" class="btna btn-primary">Preguntas</a>
                    <a href="/nuevo/post" class="btna btn-primary">Crear Post</a>
                </ul>
                <div class="dropdown">
                    <button class="btn2 btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
                      Lenguajes
                    </button>
                    <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                        <c:forEach items="${lenguajes}" var="l">
                            <li><a class="dropdown-item" href="/socialCoders/${l.lenguaje}">${l.lenguaje}</a></li>
                        </c:forEach>
                    </ul>
                  </div>
            </aside>

        <!-- POSTS -->

            <c:forEach items="${posts}" var="p"> 
                <div class="post mt-4 rounded shadow-lg">
                    <div class="row">
                        <div class="col-4 usuario">
                            <a href="/socialcoders/perfil/${p.creador.username}">
                                <img src="/imagenes/iconosUser/${p.creador.imagen}" alt="imagenUsuario">
                            </a>
                            <a href="/socialcoders/perfil/${p.creador.username}" class="nombreUsuario">
                                <c:out value="${p.creador.username}"/>
                            </a>
                        </div>
                        <div class="col titulo mt-4">
                       <a href="/post/${p.id}" class="titulo1"> <h4><c:out value="${p.titulo}"/></h4></a>
                        </div>
                        <div class="col-2">
                            <a href="/socialCoders/${p.lenguajePost.lenguaje}" class="lenguaje">
                                <img src='/images/lenguajesImages/${p.lenguajePost.lenguaje}.png' alt="lenguaje">
                            </a>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col mt-4 pb-3">
                            <c:out value="${p.cuerpo}"/>
                        </div>
                    </div>
                    <div class="row border-bottom border-light pb-3" >
                        <div class="col">
                        </div>
                        <div class="col-3 mt-2 d-flex justify-content-end" id=${p.id}>
                            <c:if test="${!p.reaccionesUsuarios.contains(usuario)}">
                                <a href="#a" class="btn btn-outline-danger" onclick="like(${p.id}, 'like')"><i class="bi bi-heart"> <c:out value="${p.reaccionesUsuarios.size()}"/></i></a>
                            </c:if>
                            <c:if test="${p.reaccionesUsuarios.contains(usuario)}">
                                <a href="#a" class="btn btn-danger"  onclick="like(${p.id}, 'dislike')"><i class="bi bi-heart-fill"> <c:out value="${p.reaccionesUsuarios.size()}"/> </i></a>
                            </c:if> 
                        </div>
                    </div>
                    <div class="text-center mt-4">
                        <c:if test="${!empty p.imagenPost}">
                            <img src="/imagenes/post/${p.titulo}/${p.imagenPost}" alt="imagen"  id="imagenPost">
                        </c:if>
                        <img src="${p.imagenPost}" alt="imagen"  id="imagenPost">
                    </div>
                    <div class="mt-4 comentarioOverflow">
                        <c:forEach items="${p.listaComentarios}" var="c"> 
                            <div class="col-12 mt-3 border-bottom border-light px-3 pe-3">
                                <a href="/socialcoders/perfil/${c.usuario.username}" class="nombreUsuarioComentario">
                                    <img src="/imagenes/iconosUser/${c.usuario.imagen}" alt="imagenUsuario">
                                    <c:out value="${c.usuario.username}"/>:
                                </a>
                                <div class="px-3 pb-2">
                                    <c:out value="${c.comentario}"/>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                   
                    <!-- COMENTARIO -->
                   
                    <div class="mt-4">
                        <form:form method="POST" modelAttribute="nuevoComentario" action="/comentario/${p.id}">
                            <table class="comentarDiv">
                                <tr>
                                    <td>
                                        <form:input type="text" path="comentario" class="form-control" placeholder="Escriba un comentario..."/>
                                    </td>
                                    <td>
                                        <input type="submit" value="" class="btn btn-primary comentar col"/>
                                    </td>
                                </tr>     
                            </table>
                        </form:form>
                    </div>
                </div>
            </c:forEach>
        
        <!-- AMIGOS -->

            <aside class="col-2">
                <h5></h5>
                <ul>
                    <li></li>
                </ul>
            </aside>

    </div>
</body>
</html>