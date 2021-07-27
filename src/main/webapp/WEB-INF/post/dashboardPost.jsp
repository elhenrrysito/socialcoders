<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://kit.fontawesome.com/b78efd6fc3.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" type="text/css" href="/css/postDashboard.css">
    <title>Document</title>
</head>
<body>
    <div>
        <div class="container">
            <c:forEach items="${posts}" var="p"> 
                <div class=" border-bottom-0 mt-5 post rounded shadow-lg">
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
                    <div class="row border-bottom border-dark pb-3">
                        <div class="col">
                        </div>
                        <div class="col-1 mt-2 ">
                            <a href=""><img src="/images/iconImages/Icon 3.svg" alt="like"></a>
                        </div>
                        <div class="col-1 mt-2">
                            <a href=""><img src="/images/iconImages/Icon 6.svg" alt="commentario"></a>
                        </div>
                    </div>
                    <div class="mt-4">
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
                </div>
            </c:forEach>
        </div>  
    </div>
</body>
</html>