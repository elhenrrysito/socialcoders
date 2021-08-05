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
       <!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<!-- Etiquetas meta de JavaScript Opcionales-->
<!-- Primero jQuery, luego Popper.js, y por último Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script type="text/javascript" src="js/d3.v3.min.js"></script>
<script type="text/javascript" src="js/utilities.js"></script>

<!-- imagenes -->
<link rel="stylesheet" href="css/bootstrap-select.css">
<link href="https://www.cssscript.com/wp-includes/css/sticky.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link href="dist/css/bootstrap-image-checkbox.css" rel="stylesheet">
<link rel="stylesheet" href="css/bootstrap-select.css">
<!-- Bootstrap  -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
<link rel="stylesheet" href="/css/navbar.css">
<!-- Select  -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdn.rawgit.com/harvesthq/chosen/gh-pages/chosen.jquery.min.js"></script>
<link href="https://cdn.rawgit.com/harvesthq/chosen/gh-pages/chosen.min.css" rel="stylesheet"/>
    <title>Post</title>
</head>
<body>
    <!-- ------NAV------ -->
    <div class="pb-5">
        <nav class="navegacion shadow d-flex justify-content-between">
            <a href="/">
                <img src="/images/logo/logo.png" alt="socialCodersLogo">
            </a>
        </nav>
    </div>

    <!-- ------post-------- -->

    <!-- -----------foto y nombre de perfil-------------- -->
        <div class="post mt-5 rounded shadow-lg">
            <div class="row">
                <div class="col-2 usuario">
                    <a href="/socialcoders/perfil/${p.creador.username}">
                        <img src="/images/Black_Belt_in-game.png" alt="imagenUsuario">
                    </a>
                </div>

                <!-- ----------titulo del post----------- -->
                <div class="col contenido mt-4">
                 <h4><c:out value="${post.titulo}"/></h4>
                </div>
                <!-- ---------lenguaje--------- -->
                <div class="col-2"> 
                    <a href="" class="lenguaje">
                        <img src='/images/lenguajesImages/${p.lenguajePost.lenguaje}.png' alt="lenguaje">
                    </a>
                </div>
            </div>
            <!-- ----------descripcion------------ -->
            
            <div>
                <img src="/imagenes/post/${post.titulo}/${post.imagenPost}" alt="imagenPost">
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