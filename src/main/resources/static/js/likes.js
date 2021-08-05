function like(id, ruta) {
    url = `/${ruta}/${id}`;
    $.ajax({
        type: "get",
        url: url
    })
    .done(function(respuesta){
        let likes = document.getElementById(id);
        let contador = likes.querySelector("i");
        let boton = likes.querySelector("a");
        contador.innerHTML = respuesta;

        if(boton.classList.item(1) == "btn-outline-danger") {
            boton.classList.replace("btn-outline-danger", "btn-danger");
            boton.setAttribute("onClick", "like("+ id + ", 'dislike')");

        } else {
            boton.classList.replace("btn-danger", "btn-outline-danger");
            boton.setAttribute("onClick", "like("+ id + ", 'like')");
        }
    })
    .fail(function(respuesta){
        console.log(respuesta + "error");
    }) 
}