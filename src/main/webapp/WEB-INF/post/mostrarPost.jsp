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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="/css/mostrarPost.css"> 
    <!-- NavBar -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <!-- Bootstrap  -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="/css/navbar.css">
    <title>Post</title>
</head>
<body>
   
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

    <!-- ------post-------- -->

    <!-- -----------foto y nombre de perfil-------------- -->
        <div class="post mt-5 rounded shadow-lg">
            <div class="row">
                <div class="col-2 usuario">
                    <a href="/socialcoders/perfil/${post.creador.username}">
                        <img src="/imagenes/iconosUser/${post.creador.imagen}" alt="imagenUsuario">
                    </a>
                </div>

                <!-- ----------titulo del post----------- -->
                <div class="col contenido mt-4">
                 <h4><c:out value="${post.titulo}"/></h4>
                </div>
                <!-- ---------lenguaje--------- -->
                <div class="col-2"> 
                    <a href="" class="lenguaje">
                        <img src='/images/lenguajesImages/${post.lenguajePost.lenguaje}.png' alt="lenguaje">
                    </a>
                </div>
            </div>
            <!-- ----------descripcion------------ -->
            
            <div class="mt-3 text-center">
                <img id="imagenPost"  src="/imagenes/post/${post.titulo}/${post.imagenPost}" alt="imagenPost">
            </div>

            <div class="row">
                <div class="col mt-4 pb-3">
                    <c:out value="${post.cuerpo}"/>
                </div>
            </div>

            <!-- -----------likes-------------- -->
            <div class="row border-bottom border-light pb-3">
                <div class="col">
                </div>
                <div class="col-1 mt-2 ">
                    <c:if test="${!p.reaccionesUsuarios.contains(usuario)}">
                        <a href="/like/${post.id}"><img src="/images/iconImages/favouritewhite.png" alt="like"></a>
                    </c:if>
                    <c:if test="${p.reaccionesUsuarios.contains(usuario)}">
                        <a href=""><img src="/images/iconImages/likeado.png" alt="like"></a>
                    </c:if>
                </div>
            </div>
            <!-- ----------comentarios----------- -->
            <div class="mt-4 comentarioOverflow">
                <c:forEach items="${post.listaComentarios}" var="c"> 
                    <div class="col-12 mt-3 border-bottom border-light px-3 pe-3">
                        <img src="/images/Black_Belt_in-game.png" alt="imagenUsuario">
                        <a href="/socialcoders/perfil/${c.usuario.username}" class="nombreUsuarioComentario">
                            <c:out value="${c.usuario.username}"/>:
                        </a>
                        <div class="px-3 pb-2">
                            <c:out value="${c.comentario}"/>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <div class="mt-4">
                <form:form method="POST" modelAttribute="comentario" action="/comentario/${post.id}">
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

    
</body>
</html>