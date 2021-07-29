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
	    
        <!-- Select  -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
        <script src="https://cdn.rawgit.com/harvesthq/chosen/gh-pages/chosen.jquery.min.js"></script>
        <link href="https://cdn.rawgit.com/harvesthq/chosen/gh-pages/chosen.min.css" rel="stylesheet"/>
</head>
<body>
	
        <div class="container">

            <div class="form border-bottom-0 mt-5 post rounded shadow-lg">
                    <h2 class="text-center">Cambia tu icono Siempre cuando quieras :)</h2>
                    
                    <p class="fs-3 text-warning"><form:errors path="post.*"/></p>

                    <form class="formRelleno" action="" method="POST" enctype="multipart/form-data">
                        <div class="row text-center mt-3">
                            <h3>Iconos</h3>
                            <div class="col ml-1 lenguaje d-inline-block ">
                                <div class="custom-control custom-radio image-checkbox">
                                    <input type="radio" class="custom-control-input" id="ck1d" name="icono" value="javaScript">
                                    <label class="custom-control-label" for="ck1d">
                                        <img src="/imagenes/lenguajes/icono1.jpg" alt="#" width="80" height="80" class="img-fluid">
                                    </label>
                                </div>
                            </div>
                            <div class="col ml-1 lenguaje d-inline-block">
                                <div class="custom-control custom-radio image-checkbox">
                                    <input type="radio" class="custom-control-input" id="ck2d" name="icono" value="python">
                                    <label class="custom-control-label" for="ck2d">
                                        <img src="/imagenes/lenguajes/icono2.png" alt="#" width="80" height="80" class="img-fluid">
                                    </label>
                                </div>
                            </div>
                            <div class="col ml-1 lenguaje d-inline-block">
                                <div class="custom-control custom-radio image-checkbox">
                                    <input type="radio" class="custom-control-input" id="ck3d" name="icono" value="java">
                                    <label class="custom-control-label aa" for="ck3d">
                                        <img src="/imagenes/lenguajes/icono3.png" alt="#" width="80" height="80" class="img-fluid">
                                    </label>
                                </div>
                            </div>
                            <div class="col ml-1 lenguaje d-inline-block">
                                <div class="custom-control custom-radio image-checkbox">
                                    <input type="radio" class="custom-control-input" id="ck4d" name="icono" value="c++">
                                    <label class="custom-control-label aa" for="ck4d">
                                        <img src="/imagenes/lenguajes/icono4.jpg" alt="#" width="80" height="80" class="img-fluid">
                                    </label>
                                </div>
                            </div>
                        </div>
                        <p class="mt-5 text-center">
                        
                            <input  class="btn btn-primary" type="submit" value="Cambiar"/>
                        </p>
                
                    
                    </form> 
                <button class="btn btn-warning" onclick="window.location.href='/socialcoders/perfil/${username}'">Volver</button>
                
                
            </div>
	    </div>	
        
</body>
</html>

