

  //Eliminar post
  let idEliminar = -1;
  let usuarioPerfil = "w";
function colocarId(id, usernmae){
    idEliminar = id;
    usuarioPerfil = usernmae;
}
function colocarPerfil(username){
  usuarioPerfil = username;
}
function eliminar(){
    let url="/eliminar/post/"+idEliminar;
    let redirect="/socialcoders/perfil/"+usuarioPerfil;
    $.ajax({
        type:"get",
        url: url,

        success: function(datos){
            window.location.href = redirect;
        },
        error: function(response){
            alert("Error en la ruta.")
        },
    });
}