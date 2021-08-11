<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/mensajes.css">
    <link rel="stylesheet" href="/css/navbar.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="/js/chat.js"></script>
    <title>Chat</title>
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
        
        <div class="container d-flex justify-content-center p-3">
            <div class="row">
                <div class="col border rounded p-5 shadow fondo">
                    <h1 class="text-center">Chat</h1>
                    
                    <div class="border rounded p-4 mb-3 fondo" id="chat">
                        
                    </div>
                <form action="" method="post" modelAttribute="mensaje" cssClass="mt-3" id="formMensaje">
                    <input path="message" placeholder="Enviar mensaje"  name="inputMensaje" id="inputMensaje" />
                    <button type="button" id="submitMensaje" class="btn btn-dark border">Enviar</button>
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    <input type="hidden" value="${username}" id="username"/>
                </form>
                <div class="col text-center">
                    <button class="btn btn-danger mx-3 col-3 border mt-3" onclick="window.location.href='/'">Volver</button>
                </div>
            </div>
        </div>
    </div>
    <script src="/js/overflow.js"></script>
</body>
</html>