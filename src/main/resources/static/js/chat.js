let url = document.getElementById("url");
var autoScroll = document.getElementById('chat');

$(document).ready(function () {
    $("#submitMensaje").click(function () {
       leerMensajes();
    })

});
setInterval(leerMensajes, 1000);

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
function leerMensajes(){
    console.log("leerMensaje");
    $.ajax({
        type: "post",
        data: $("#formMensaje").serialize(),
        url: $(url).val(),
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