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

        <!-- Select con imagen -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.5/css/select2.css" />

</head>
<body>
	
        <div class="container">

            <div class="form border-bottom-0 mt-5 post rounded shadow-lg">
                    <h1 class="text-center">Agregar un nuevo Post!</h1>
                    
                    <p class="fs-3 text-warning"><form:errors path="post.*"/></p>

                    <form:form class="formRelleno" action="/nuevo/post" method="POST" modelAttribute="post" enctype="multipart/form-data">
                        <input type="hidden" name="_method" value="${method}">	
                    <div class="row text-center">
                        <div>
                            <form:label class="h2" path="titulo">Titulo: </form:label>
                        </div>
                        <div>
                            <form:input id="texto" class="h3 aaa"  path="titulo"/>        
                        </div>
                    </div>
                    
                    <div class="file-field">
                        <div class="z-depth-1-half mb-4">
                          <img src="https://mdbootstrap.com/img/Photos/Others/placeholder.jpg" class="img-fluid"
                            alt="example placeholder">
                        </div>
                        <div class="mb-3">
                            <label for="file" class="form-label h5">Añadir imagen (Opcional)</label>
                            <input class="form-control"  type="file" id="file" name="file">
                        </div>
                    </div>
                    <div class="text-center">
                        <div>
                            <form:label class="h2" maxlength="4" path="cuerpo">Descripcion </form:label>
                        </div>
                        <div>
                            <form:textarea cols="70" row="40" placeholder="descripción"  path="cuerpo"/>
                        </div>
                    </div>
                    <div class="text-center mt-3">
                        <h3>Lenguajes</h3>
                        <div class="col-md-3 lenguaje d-inline-block mt-3">
                            <div class="custom-control custom-checkbox image-checkbox">
                                <input type="checkbox" class="custom-control-input" id="ck1d">
                                <label class="custom-control-label" for="ck1d">
                                    <img src="/imagenes/lenguajes/javaScript.png" alt="#" width="60" height="60" class="img-fluid">
                                </label>
                            </div>
                        </div>
                        <div class="col-md-3 lenguaje d-inline-block">
                            <div class="custom-control custom-checkbox image-checkbox">
                                <input type="checkbox" class="custom-control-input" id="ck2d">
                                <label class="custom-control-label" for="ck2d">
                                    <img src="/imagenes/lenguajes/pythonn.png" alt="#" width="60" height="60" class="img-fluid">
                                </label>
                            </div>
                        </div>
                        <div class="col-md-3 lenguaje d-inline-block">
                            <div class="custom-control custom-checkbox image-checkbox">
                                <input type="checkbox" class="custom-control-input" id="ck3d">
                                <label class="custom-control-label aa" for="ck3d">
                                    <img src="/imagenes/lenguajes/java.png" alt="#" width="60" height="60" class="img-fluid">
                                </label>
                            </div>
                        </div>
                        <select id="id_select2_example" data-placeholder="Begin typing a name to filter..." multiple class="chosen-select" name="test" >
                            <option value=""></option>
                            <option>American Black Bear</option>
                            <option>Asiatic Black Bear</option>
                            <option>Brown Bear</option>
                            <option>Giant Panda</option>
                            <option>Sloth Bear</option>
                            <option>Sun Bear</option>
                            <option>Polar Bear</option>
                            <option>Spectacled Bear</option>
                            <option data-img_src="https://data.world/api/datadotworld-apps/dataset/python/file/raw/logo.png">Python programming</option>
                            <option data-img_src="https://sdtimes.com/wp-content/uploads/2018/09/Java-logo-490x301.jpg">Java programming</option>
                            <option data-img_src="https://cmkt-image-prd.global.ssl.fastly.net/0.1.0/ps/783373/1160/772/m1/fpnw/wm0/letter-c-cm-.png?1447712834&s=c2ab07fcddfa8acf10c5a0c40f0578c2">C programming</option>
                          </select>
                    </div>
                    <p class="mt-5 text-center">
                        <input  class="btn btn-primary" type="submit" value="Crear Post"/>
                    </p>
                </form:form> 

                <!-- //Prueba form Normal -->
                <!-- <form action="http://httpbin.org/post" method="post">
                    <select data-placeholder="Begin typing a name to filter..." multiple class="chosen-select" name="test">
                      <option value=""></option>
                      <option>American Black Bear</option>
                      <option>Asiatic Black Bear</option>
                      <option>Brown Bear</option>
                      <option>Giant Panda</option>
                      <option>Sloth Bear</option>
                      <option>Sun Bear</option>
                      <option>Polar Bear</option>
                      <option>Spectacled Bear</option>
                    </select>
                    <input type="submit">
                  </form> -->
               
                
            </div>
	    </div>	
        <script>
            $(".chosen-select").chosen({
            no_results_text: "Oops, nothing found!"
            })
        </script>
        <!-- /content -->
        <!-- scripts -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.5/js/select2.js"></script>
        <script type="text/javascript">
            function custom_template(obj){
                    var data = $(obj.element).data();
                    var text = $(obj.element).text();
                    if(data && data['img_src']){
                        img_src = data['img_src'];
                        template = $("<div><img src=\"" + img_src + "\" style=\"width:50%;height:50px;\"/><p style=\"font-weight: 400;font-size:8pt;text-align:center;\">" + text + "</p></div>");
                        return template;
                    }
                }
            var options = {
                'templateSelection': custom_template,
                'templateResult': custom_template,
            }
            $('#id_select2_example').select2(options);
            $('.select2-container--default .select2-selection--single').css({'height': '220px'});

            $('textarea')
            .focus(function() { $(this).css("background", "none") })
            .blur(function() { if ($(this)[0].value == '') { $(this).css("background", "url(images/benice.png) center center no-repeat") } });

        </script>
        
</body>
</html>

