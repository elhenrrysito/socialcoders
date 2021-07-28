<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 
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
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">Navbar</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="#">Home</a>
                    </li>
                    <li class="nav-item">
                    <a class="nav-link" href="#">Link</a>
                    </li>
                    <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        Dropdown
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="#">Action</a></li>
                        <li><a class="dropdown-item" href="#">Another action</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item" href="#">Something else here</a></li>
                    </ul>
                    </li>
                    <li class="nav-item">
                    <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a>
                    </li>
                </ul>
                <form class="d-flex">
                    <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                    <button class="btn btn-outline-success" type="submit">Search</button>
                </form>
                </div>
            </div>
        </nav>

        <!-- POSTS -->

        <div class="container">
            <c:forEach items="${posts}" var="p"> 
                <div class="mt-5 post rounded shadow-lg">
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
                        <div class="col-1 mt-2">
                            <button type="button" class="comentar" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@mdo"></button>
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

        <!-- COMENTARIO -->

        <div class="modal fade modalComentario" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Comentar</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form:form modelAttribute="nuevoComentario" method="POST" action="/comentario/">
                            <p><form:input type="text" path="comentario" placeholder="Escribe un comentario..."/></p>
                        </form:form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <input type="submit" class="btn btn-primary" name="Comentar"/>
                    </div>
                </div>
            </div>
        </div>

    </div>
</body>
</html>