package com.oneteam.socialcoders.models;


import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.persistence.UniqueConstraint;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name="usuarios",
       uniqueConstraints = { @UniqueConstraint(columnNames = { "email"}),@UniqueConstraint(columnNames = {"username"}) })
@Getter @Setter @NoArgsConstructor
public class Usuario extends ModeloBase {
    
    @NotBlank
    @NotNull
    @Size(min = 3, message = "Nombre debe tener más de 3 caracteres")
    private String nombre;
    @NotNull
    @NotBlank
    @Size(min = 3, message = "Apellido debe tener más de 3 caracteres")
    private String apellido;
    @NotBlank
    @NotNull
    @Size(min=3, message = "Nombre de usuario debe tener más de 3 caracteres")
    private String username;
    
    @NotBlank
    @NotNull
    @Email
    private String email;    

    private String descripcion;

    private String imagen;

    @Size(min = 8, message = "Contraseña debe tener más de 8 caracteres")
    private String password;

    @Transient
    private String passwordConfirmation;

    //////////// Relaciones ////////////

    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(
        name = "users_roles", 
        joinColumns = @JoinColumn(name = "user_id"), 
        inverseJoinColumns = @JoinColumn(name = "role_id"))
    private List<Role> roles;

    // Mensajes //
    @OneToMany(mappedBy = "remitente", fetch = FetchType.LAZY)
    private List<Mensaje> mensajesEnviados;

    @OneToMany(mappedBy = "destinatario", fetch = FetchType.LAZY)
    private List<Mensaje> mensajesRecibidos;

    // Seguidores //

    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(
    name = "seguidores", 
    joinColumns = @JoinColumn(name = "usuario_id"), 
    inverseJoinColumns = @JoinColumn(name = "seguidor_id")
    )
    private List<Usuario> seguidores; // lista de seguidores que tiene el usuario
    
    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(
    name = "seguidores", 
    joinColumns = @JoinColumn(name = "seguidor_id"), 
    inverseJoinColumns = @JoinColumn(name = "usuario_id")
    )
    private List<Usuario> seguidos; // lista a las que sigue el usuario

    // Posts //

    @OneToMany(mappedBy = "creador", fetch = FetchType.LAZY)
    private List<Post> postRealizados ;
    
    // Likes //

    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(
        name = "likes",
        joinColumns = @JoinColumn(name = "usuario_id"),
        inverseJoinColumns = @JoinColumn(name = "post_id")
    )
    private List<Post> reaccion;

    // Lenguaje //

    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(
        name = "lenguajes_usuarios",
        joinColumns = @JoinColumn(name = "usuario_id"),
        inverseJoinColumns = @JoinColumn(name = "lenguaje_id")
    )

    private List<Lenguaje> lenguajesUsuario;

    // Comentarios //

    @OneToMany(mappedBy = "usuario", fetch = FetchType.LAZY)
    private List<Comentario> comentarios;

    // Eliminar reaccion de usuario en un post 
    // "Puede ser implementada para que el usuario pueda eliminar su reaccion independiente del post" // 
    public void eliminarLikePost(Post post){
        reaccion.remove(post);
    }

    public void setPost(Post post){
        this.reaccion.add(post);
    }


    public List<Mensaje> getChat(Usuario destinatario) {
        List<Mensaje> chat = new ArrayList<>();

        for(Mensaje mensaje : this.getMensajesEnviados()) {
            if(mensaje.getDestinatario().getUsername().equals(destinatario.getUsername())) {
                chat.add(mensaje);
            }
        }

        for(Mensaje mensaje : this.getMensajesRecibidos()) {
            if(mensaje.getDestinatario().getUsername().equals(destinatario.getUsername())) {
                chat.add(mensaje);
            }
        }

        return chat;
    }

}