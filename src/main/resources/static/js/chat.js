let autoscroll;

$(document).ready(function () {
    autoScroll = document.getElementById('chat');
    let username = document.getElementById('username');
    autoScroll.scrollTop = autoScroll.scrollHeight;
    $("#submitMensaje").click(function () {
       enviarMensaje();
    })

});

function cargarMensajes(respuesta) {
    let p = document.createElement("p");
    let d = document.getElementById("chat");
    let mensajes = respuesta["mensajes"];

    for(let mensaje of mensajes) {
        for(let i in mensaje) {
            
            p.innerText = i + ": " + mensaje[i];
            d.appendChild(p);
            p = document.createElement("p");
        }
    }

}
function enviarMensaje(){
    console.log("leerMensaje");
    $.ajax({
        type: "post",
        data: $("#formMensaje").serialize(),
        url: "/mensajes/" + $(username).val(),
        dataType: "JSON"
    })
    .done(function(respuesta){
        cargarMensajes(respuesta);
        document.getElementById("inputMensaje").value = " ";
        autoScroll.scrollTop = autoScroll.scrollHeight;

        console.log(respuesta);

    })
    .fail(function(respuesta){
        console.log("Error ",  respuesta);
    })
}

function leerMensajes() {
    $.ajax({
        type: "get",
        url: "/mensajes/leer/" + $(username).val(),
        dataType: "JSON"
    })
    .done(function(respuesta){
        cargarMensajes(respuesta);
        autoScroll.scrollTop = autoScroll.scrollHeight;
    })
    .fail(function(respuesta){
        console.log("Error GET", respuesta);
    })
}

setInterval(leerMensajes, 2000);