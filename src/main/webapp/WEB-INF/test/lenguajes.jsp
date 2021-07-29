<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/lenguajes.css">
    <!-- Etiquetas meta de JavaScript Opcionales-->
    <!-- Primero jQuery, luego Popper.js, y por último Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>

    <title>Document</title>
</head>
<body>
    <nav class="navbar navbar-dark"><a href="#">Volver</a></nav>
    <h1 class="display-4">¿Con cual lenguaje te dominas mas?</h1>
    <div class="card" style="width: 18rem;">
        <img src="https://i.blogs.es/6091fa/java/450_1000.jpg" class="card-img-top" alt="java">
        <div class="d-grid mt-3">
            <a href="/java" class="btn btn-dark boton">Java</a>
        </div>
    </div>
    <div class="card" style="width: 18rem;">
        <img src="data:image/png;base64,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" class="card-img-top" alt="javascript">
        <div class="card-body">
            <div class="d-grid mt-3">
                <a href="/javascript" class="btn btn-dark boton">JavaScript</a>
            </div>
        </div>
    </div>
    <div class="card" style="width: 18rem;">
        <img src="https://cosasdedevs.com/media/sections/images/python.png" class="card-img-top" alt="python">
        <div class="d-grid mt-3">
            <a href="/python" class="btn btn-dark boton">Python</a>
        </div>
    </div>
    <div class="card" style="width: 18rem;">
        <img src="data:image/png;base64,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" class="card-img-top" alt="c++">
        <div class="d-grid mt-3">
            <a href="/c++" class="btn btn-dark boton">C++</a>
        </div>
    </div>
</body>
</html>