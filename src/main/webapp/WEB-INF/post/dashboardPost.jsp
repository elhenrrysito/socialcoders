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
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <link rel="stylesheet" type="text/css" href="/css/postDashboard.css">
    <title>Document</title>
</head>
<body>
    <div>
        <!-- NAVBAR -->
      
        <div class="pb-5">
            <nav class="navegacion">
                <img src="/images/logo/logo.png" alt="">
            </nav>
        </div>
        
        <!-- BUSCADOR -->

        <div class="contenedor">
        
            <aside class="col-3 mt-5 navegador">
                <h2>Categorías</h2>
                <ul class="mt-4">
                    <li><a href="/" class="btn btn-primary">Posts</a></li>
                    <li><a href="/socialCoders/memes" class="btn btn-primary">Memes</a></li>
                    <li><a href="/socialCoders/seguidos" class="btn btn-primary">Seguidos</a></li>
                    <li><a href="/socialCoders/preguntas" class="btn btn-primary">Preguntas</a></li>
                </ul>
                <div class="dropdown">
                    <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
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
                <div class="post mt-5 rounded shadow-lg">
                    <div class="row">
                        <div class="col-2 usuario">
                            <a href="">
                                <img src="/images/Black_Belt_in-game.png" alt="imagenUsuario">
                            </a>
                            <a href="" class="nombreUsuario">
                                <c:out value="${p.creador.username}"/>
                            </a>
                        </div>
                        <div class="col titulo mt-4">
                            <h4><c:out value="${p.titulo}"/></h4>
                        </div>
                        <div class="col-2"> 
                            <a href="" class="lenguaje">
                                <img src='/images/lenguajesImages/${p.lenguajePost.lenguaje}.png' alt="lenguaje">
                            </a>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col mt-4 pb-3">
                            <c:out value="${p.cuerpo}"/>
                        </div>
                    </div>
                    <div class="row border-bottom border-light pb-3">
                        <div class="col">
                        </div>
                        <div class="col-1 mt-2 ">
                            <a href=""><img src="/images/iconImages/Icon 3.svg" alt="like"></a>
                        </div>
                    </div>
                    <div class="mt-4 comentarioOverflow">
                        <c:forEach items="${p.listaComentarios}" var="c"> 
                            <div class="col-12 mt-3 border-bottom border-light px-3 pe-3">
                                <img src="/images/Black_Belt_in-game.png" alt="imagenUsuario">
                                <a href="" class="nombreUsuarioComentario">
                                    <c:out value="${c.usuario.username}"/>:
                                </a>
                                <div class="px-3 pb-2">
                                    <c:out value="${c.comentario}"/>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
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

        <!-- COMENTARIO -->

    </div>
</body>
</html>