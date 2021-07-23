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
    <link rel="stylesheet" type="text/css" href="/css/estiloPost.css">
    <title>Document</title>
</head>
<body>
    <div>
        <c:forEach items="${posts}" var="p">
            <div class="container border mt-5 post">
                <div class="row">
                    <div class="col-3 usuario">
                        <img src="Black_Belt_in-game.png" alt="imagenUsuario">
                        <h5 class="border nombreUsuario"><c:out value="${p.creador.username}"/></h5>
                    </div>
                    <div class="col titulo mt-4 titulo">
                        <h3><c:out value="${p.titulo}"/></h3>
                    </div>
                </div>
                <div class="row">
                    <div class="col contenido border">
                        <c:out value="${p.cuerpo}"/>
                    </div>
                </div>
                <div class="row">
                    <div class="col-4 border nombre">
                        Like
                    </div>
                    <div class="col-8 border nombre">
    
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</body>
</html>