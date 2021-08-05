<%@ page isErrorPage="true" %> 
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
        <title>Cambiar icono</title>
  	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <meta charset="utf-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	    <link rel="stylesheet" href="/css/cambiarIcono.css">
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
        <!-- NAVBAR -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
   

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
	    
        <!-- Select  -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
        <script src="https://cdn.rawgit.com/harvesthq/chosen/gh-pages/chosen.jquery.min.js"></script>
        <link href="https://cdn.rawgit.com/harvesthq/chosen/gh-pages/chosen.min.css" rel="stylesheet"/>
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
	
        <div class="container">
        

            <div class="form border-bottom-0 mt-5 post rounded shadow-lg">
                    <h2 class="text-center">Cambia tu icono Siempre cuando quieras :)</h2>
                    
                    <form class="formRelleno" action="" method="POST" enctype="multipart/form-data">
                        <div class="row text-center mt-3 iconos">
                            <h3>Iconos</h3>
                            <div class="col ml-1 lenguaje d-inline-block ">
                                <div class="custom-control custom-radio image-checkbox ">
                                    <input type="radio" class="custom-control-input " id="ck1d" name="iconon" value="1.jpg">
                                    <label class="custom-control-label " for="ck1d">
                                        <img src="/imagenes/iconosUser/1.jpg" alt="#" width="80" height="80" class="img-fluid">
                                    </label>
                                </div>
                            </div>
                            <div class="col ml-1 lenguaje d-inline-block">
                                <div class="custom-control custom-radio image-checkbox">
                                    <input type="radio" class="custom-control-input" id="ck2d" name="iconon" value="2.png">
                                    <label class="custom-control-label" for="ck2d">
                                        <img src="/imagenes/iconosUser/2.png" alt="#" width="80" height="80" class="img-fluid">
                                    </label>
                                </div>
                            </div>
                            <div class="col ml-1 lenguaje d-inline-block">
                                <div class="custom-control custom-radio image-checkbox">
                                    <input type="radio" class="custom-control-input" id="ck3d" name="iconon" value="3.png">
                                    <label class="custom-control-label aa" for="ck3d">
                                        <img src="/imagenes/iconosUser/3.png" alt="#" width="80" height="80" class="img-fluid">
                                    </label>
                                </div>
                            </div>
                            <div class="col ml-1 lenguaje d-inline-block">
                                <div class="custom-control custom-radio image-checkbox">
                                    <input type="radio" class="custom-control-input" id="ck4d" name="iconon" value="4.png">
                                    <label class="custom-control-label aa" for="ck4d">
                                        <img src="/imagenes/iconosUser/4.png" alt="#" width="80" height="80" class="img-fluid">
                                    </label>
                                </div>
                            </div>
                            <div class="col ml-1 lenguaje d-inline-block">
                                <div class="custom-control custom-radio image-checkbox">
                                    <input type="radio" class="custom-control-input" id="ck5d" name="iconon" value="5.png">
                                    <label class="custom-control-label aa" for="ck5d">
                                        <img src="/imagenes/iconosUser/5.png" alt="#" width="80" height="80" class="img-fluid">
                                    </label>
                                </div>
                            </div>
                            <div class="col ml-1 lenguaje d-inline-block">
                                <div class="custom-control custom-radio image-checkbox">
                                    <input type="radio" class="custom-control-input" id="ck6d" name="iconon" value="6.jpg">
                                    <label class="custom-control-label aa" for="ck6d">
                                        <img src="/imagenes/iconosUser/6.jpg" alt="#" width="80" height="80" class="img-fluid">
                                    </label>
                                </div>
                            </div>
                            <div class="col ml-1 lenguaje d-inline-block">
                                <div class="custom-control custom-radio image-checkbox">
                                    <input type="radio" class="custom-control-input" id="ck7d" name="iconon" value="7.png">
                                    <label class="custom-control-label aa" for="ck7d">
                                        <img src="/imagenes/iconosUser/7.png" alt="#" width="80" height="80" class="img-fluid">
                                    </label>
                                </div>
                            </div>
                            <div class="col ml-1 lenguaje d-inline-block">
                                <div class="custom-control custom-radio image-checkbox">
                                    <input type="radio" class="custom-control-input" id="ck8d" name="iconon" value="8.jpg">
                                    <label class="custom-control-label aa" for="ck8d">
                                        <img src="/imagenes/iconosUser/8.jpg" alt="#" width="80" height="80" class="img-fluid">
                                    </label>
                                </div>
                            </div>
                            <div class="col ml-1 lenguaje d-inline-block">
                                <div class="custom-control custom-radio image-checkbox">
                                    <input type="radio" class="custom-control-input" id="ck9d" name="iconon" value="9.png">
                                    <label class="custom-control-label aa" for="ck9d">
                                        <img src="/imagenes/iconosUser/9.png" alt="#" width="80" height="80" class="img-fluid">
                                    </label>
                                </div>
                            </div>
                            <div class="col ml-1 lenguaje d-inline-block">
                                <div class="custom-control custom-radio image-checkbox">
                                    <input type="radio" class="custom-control-input" id="ck10d" name="iconon" value="10.jpg">
                                    <label class="custom-control-label aa" for="ck10d">
                                        <img src="/imagenes/iconosUser/10.jpg" alt="#" width="80" height="80" class="img-fluid">
                                    </label>
                                </div>
                            </div>
                            <div class="col ml-1 lenguaje d-inline-block">
                                <div class="custom-control custom-radio image-checkbox">
                                    <input type="radio" class="custom-control-input" id="ck11d" name="iconon" value="11.jpg">
                                    <label class="custom-control-label aa" for="ck11d">
                                        <img src="/imagenes/iconosUser/11.jpg" alt="#" width="80" height="80" class="img-fluid">
                                    </label>
                                </div>
                            </div>
                            <div class="col ml-1 lenguaje d-inline-block">
                                <div class="custom-control custom-radio image-checkbox">
                                    <input type="radio" class="custom-control-input" id="ck12d" name="iconon" value="12.png">
                                    <label class="custom-control-label aa" for="ck12d">
                                        <img src="/imagenes/iconosUser/12.png" alt="#" width="80" height="80" class="img-fluid">
                                    </label>
                                </div>
                            </div>
                            <div class="col ml-1 lenguaje d-inline-block">
                                <div class="custom-control custom-radio image-checkbox">
                                    <input type="radio" class="custom-control-input" id="ck13d" name="iconon" value="13.png">
                                    <label class="custom-control-label aa" for="ck13d">
                                        <img src="/imagenes/iconosUser/13.png" alt="#" width="80" height="80" class="img-fluid">
                                    </label>
                                </div>
                            </div>
                            <div class="col ml-1 lenguaje d-inline-block">
                                <div class="custom-control custom-radio image-checkbox">
                                    <input type="radio" class="custom-control-input" id="ck14d" name="iconon" value="14.png">
                                    <label class="custom-control-label aa" for="ck14d">
                                        <img src="/imagenes/iconosUser/14.png" alt="#" width="80" height="80" class="img-fluid">
                                    </label>
                                </div>
                            </div>
                            <div class="col ml-1 lenguaje d-inline-block">
                                <div class="custom-control custom-radio image-checkbox">
                                    <input type="radio" class="custom-control-input" id="ck15d" name="iconon" value="15.jpg">
                                    <label class="custom-control-label aa" for="ck15d">
                                        <img src="/imagenes/iconosUser/15.jpg" alt="#" width="80" height="80" class="img-fluid">
                                    </label>
                                </div>
                            </div>
                            <div class="col ml-1 lenguaje d-inline-block">
                                <div class="custom-control custom-radio image-checkbox">
                                    <input type="radio" class="custom-control-input" id="ck16d" name="iconon" value="16.png">
                                    <label class="custom-control-label aa" for="ck16d">
                                        <img src="/imagenes/iconosUser/16.png" alt="#" width="80" height="80" class="img-fluid">
                                    </label>
                                </div>
                            </div>
                            <div class="col ml-1 lenguaje d-inline-block">
                                <div class="custom-control custom-radio image-checkbox">
                                    <input type="radio" class="custom-control-input" id="ck17d" name="iconon" value="17.png">
                                    <label class="custom-control-label aa" for="ck17d">
                                        <img src="/imagenes/iconosUser/17.png" alt="#" width="80" height="80" class="img-fluid">
                                    </label>
                                </div>
                            </div>
                            <div class="col ml-1 lenguaje d-inline-block">
                                <div class="custom-control custom-radio image-checkbox">
                                    <input type="radio" class="custom-control-input" id="ck18d" name="iconon" value="18.jpg">
                                    <label class="custom-control-label aa" for="ck18d">
                                        <img src="/imagenes/iconosUser/18.jpg" alt="#" width="80" height="80" class="img-fluid">
                                    </label>
                                </div>
                            </div>
                            <div class="col ml-1 lenguaje d-inline-block">
                                <div class="custom-control custom-radio image-checkbox">
                                    <input type="radio" class="custom-control-input" id="ck19d" name="iconon" value="19.gif">
                                    <label class="custom-control-label aa" for="ck19d">
                                        <img src="/imagenes/iconosUser/19.gif" alt="#" width="80" height="80" class="img-fluid">
                                    </label>
                                </div>
                            </div>
                            <div class="col ml-1 lenguaje d-inline-block">
                                <div class="custom-control custom-radio image-checkbox">
                                    <input type="radio" class="custom-control-input" id="ck20d" name="iconon" value="20.jpg">
                                    <label class="custom-control-label aa" for="ck20d">
                                        <img src="/imagenes/iconosUser/20.jpg" alt="#" width="80" height="80" class="img-fluid">
                                    </label>
                                </div>
                            </div>
                            <div class="col ml-1 lenguaje d-inline-block ">
                                <div class="custom-control custom-radio image-checkbox">
                                    <input type="radio" class="custom-control-input" id="ck21d" name="iconon" value="pinguino.gif">
                                    <label class="custom-control-label aa" for="ck21d">
                                        <img src="/imagenes/iconosUser/pinguino.gif" alt="#" width="80" height="80" class="img-fluid">
                                    </label>
                                </div>
                            </div>
                        </div>
                        <p class="mt-5 text-center">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                        
                            <button  class="btn btn-primary cambiar" >Cambiar</button>
                        </p>
                
                    
                    </form> 
                <button class="btn btn-warning" onclick="window.location.href='/socialcoders/perfil/${username}'">Volver</button>
                
                
            </div>
	    </div>	
        
</body>
</html>

