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
    <title>${username}</title>
</head>
<body>
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

    <!-- PERFIL -->
    <div class="container font-">
        <div class="row mt-4 mx-5">
            <div class="col-12 border shadow rounded-3 fondo">
                <div class="row mt-4">
                    <div class="col rounded-circle  text-center">
                        <img src="/images/Black_Belt_in-game.png" alt="foto" id="fotoperfil">
                        <h2><c:out value="${usuario.username}"/></h2>
                    </div>
                </div>
                <div class="row mx-2">
                    <div class="col text-center">
                        <div class="mt-3 mb-3">
                            <a href="#" class="text-decoration-none">
                                <img src="/images/iconImages/followed.png" alt="follow" width="32" height="32">
                            </a>
                            <span class="mx-5">Seguidores: <c:out value="${usuario.seguidores.size()}"/></span>
                            <span class="mx-2">Seguidos <c:out value="${usuario.seguidos.size()}"/></span>
                        </div>
                        <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Odit dignissimos itaque quis, soluta atque dicta necessitatibus ab? Dolore rerum accusamus ea aperiam minus, quisquam perferendis voluptatibus veritatis, nemo minima numquam.</p>
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
                                    <a href="/socialcoders/post/${post.id}"><c:out value="${post.titulo}"/></a>
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
            </div>
        </div>
    </div>
</body>
</html>