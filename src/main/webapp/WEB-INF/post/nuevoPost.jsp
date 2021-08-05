<%@ page isErrorPage="true" %> 
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>

    
        <title>Crear Post</title>
  	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <meta charset="utf-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	    <link rel="stylesheet" href="/css/crearPost.css">
        <script src="/js/post.js"></script>

	    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
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
</head>
<body>

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
                                <input type="submit" value="Logout!"/>
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
	
        <div class="container">

            <div class="form border-bottom-0 mt-5 post rounded shadow-lg">
                    <h1 class="text-center">Agregar un nuevo Post!</h1>
                    
                    <p class="fs-3 text-warning"><form:errors path="post.*"/></p>

                    <form:form class="formRelleno" action="" method="POST" modelAttribute="post" enctype="multipart/form-data">
                        <input type="hidden" name="_method" value="${method}">	
                    <div class="row text-center">
                        <div>
                            <form:label class="h2" path="titulo">Titulo: </form:label>
                        </div>
                        <div>
                            <form:input id="texto" class="h3 aaa"  path="titulo"/>        
                        </div>
                        <div class="text-left">
                            <h4 class="d-inline-block">Tags</h4>
                            <c:if test="${numero == 1}">
                                <input class="d-inline-block" type="text" name="tagsP" value="${post.getTagString()}">(Cada Tag Debe ir separado por "," Maximo 3 Tags)
                                <c:forEach items="${errors}" var="error">
        					        <p class="text-danger"> <c:out value="${error}"></c:out> </p> 
                                </c:forEach>

                            </c:if>
                            <c:if test="${numero == null}">
                                <input class="d-inline-block form-control mb-3" style="width: 200px;" type="text" name="tagsP">(Cada Tag Debe ir separado por "," Maximo 3 Tags)
                                <c:forEach items="${errors}" var="error">
        					        <p class="text-danger"> <c:out value="${error}"></c:out> </p> 
                                </c:forEach>

                            </c:if>
                            <div> 
                                <h4 class="d-inline-block">Cateogrias</h4>
                                <select class="form-select d-inline-block col-3 " id="id_select2_example" data-placeholder="Begin typing a name to filter..." name="test" >
                                    <option value="memes" >Memes</option>
                                    <option value="pregunta" >Preguntas</option>
                                    
                              </select>
                            </div>        
                            
					    </div>

                    </div>
                    
                    <div class="file-field">
                        <div class="z-depth-1-half mb-4">
                            <c:choose>
                                <c:when test="${post.imagenPost != null}">
                                    <img src="/imagenes/post/${post.titulo}/${post.imagenPost}" class="img-fluid"
                                    alt="imagen Post">
                                    <div class="mb-3">
                                        <label for="file" class="form-label h5">Añadir imagen (Opcional)</label>
                                        <input class="form-control"  type="file" id="file" name="file">
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <img src="https://mdbootstrap.com/img/Photos/Others/placeholder.jpg" class="img-fluid"
                                    alt="example placeholder">
                                    <div class="mb-3">
                                        <label for="file" class="form-label h5">Añadir imagen (Opcional)</label>
                                        <input class="form-control"  type="file" id="file" name="file">
                                    </div>
                                </c:otherwise>
                            </c:choose>
                          
                        </div>
                        
                    </div>
                    <div class="text-center">
                        <div>
                            <form:label  class="h2" maxlength="4" path="cuerpo">Descripcion </form:label>
                        </div>
                        <div>
                            <form:textarea cols="70" row="40" placeholder=""  path="cuerpo"/>
                        </div>
                    </div>
                    <div class="row text-center mt-3">
                        <h3>Lenguajes</h3>
                        <div class="col ml-1 lenguaje d-inline-block ">
                            <div class="custom-control custom-radio image-checkbox">
                                <input type="radio" class="custom-control-input" id="ck1d" name="lenguajeP" value="javaScript">
                                <label class="custom-control-label" for="ck1d">
                                    <img src="/imagenes/lenguajes/javaScript.png" alt="#" width="60" height="60" class="img-fluid">
                                </label>
                            </div>
                        </div>
                        <div class="col ml-1 lenguaje d-inline-block">
                            <div class="custom-control custom-radio image-checkbox">
                                <input type="radio" class="custom-control-input" id="ck2d" name="lenguajeP" value="python">
                                <label class="custom-control-label" for="ck2d">
                                    <img src="/imagenes/lenguajes/pythonn.png" alt="#" width="60" height="60" class="img-fluid">
                                </label>
                            </div>
                        </div>
                        <div class="col ml-1 lenguaje d-inline-block">
                            <div class="custom-control custom-radio image-checkbox">
                                <input type="radio" class="custom-control-input" id="ck3d" name="lenguajeP" value="java">
                                <label class="custom-control-label aa" for="ck3d">
                                    <img src="/imagenes/lenguajes/java.png" alt="#" width="60" height="60" class="img-fluid">
                                </label>
                            </div>
                        </div>
                        <div class="col ml-1 lenguaje d-inline-block">
                            <div class="custom-control custom-radio image-checkbox">
                                <input type="radio" class="custom-control-input" id="ck4d" name="lenguajeP" value="c++">
                                <label class="custom-control-label aa" for="ck4d">
                                    <img src="/imagenes/lenguajes/c++.png" alt="#" width="60" height="60" class="img-fluid">
                                </label>
                            </div>
                        </div>
                    </div>
                    <p class="mt-5 text-center">
                       
                        <input  class="btn btn-primary" type="submit" value="Crear Post"/>
                    </p>
                
                    
                </form:form> 
                <button class="btn btn-warning" onclick="window.location.href='/'">Volver</button>
                
                
            </div>
	    </div>	
        
</body>
</html>

