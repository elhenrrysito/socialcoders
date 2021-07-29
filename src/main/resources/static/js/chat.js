let url = document.getElementById("url");

$(document).ready(async function () {
    $("#submitMensaje").click(function () {
        $.ajax({
            type: "post",
            data: $("#formMensaje").serialize(),
            url: $(url).val(),
            dataType: "JSON"
        })
        .done(function(respuesta){
            cargarMensajes(respuesta)
            console.log(respuesta);
        })
        .fail(function(respuesta){
            console.log("Error ",  respuesta);
        })
    })
});

function cargarMensajes(respuesta) {
    let p = document.createElement("p");
    let d = document.getElementById("chat");
    d.innerHTML = "";
    let mensajes = respuesta["mensajes"];

    for(let mensaje of mensajes) {
        for(let i in mensaje) {
            
            p.innerText = i + ": " + mensaje[i];
            d.appendChild(p);
            p = document.createElement("p");
        }
    }

}
