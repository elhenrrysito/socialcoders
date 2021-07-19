package com.oneteam.socialcoders.models;


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
import javax.validation.constraints.Size;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name="usuarios",
       uniqueConstraints = { @UniqueConstraint(columnNames = { "email", "nombreUsuario" }) })
@Getter @Setter @NoArgsConstructor
public class Usuario extends ModeloBase {
    
    @NotBlank
    @Size(min = 3, message = "Nombre debe tener más de 3 caracteres")
    private String nombre;
    @NotBlank
    @Size(min = 3, message = "Apellido debe tener más de 3 caracteres")
    private String apellido;
    @NotBlank
    private String alias;
    
    @NotBlank
    @Email
    private String email;    

    private String imagen;

    @Size(min = 8, message = "Contraseña debe tener más de 8 caracteres")
    private String password;

    @Transient
    private String passwordConfirmation;

    // relaciones

    // -- Mensajes
    @OneToMany(mappedBy = "remitente", fetch = FetchType.LAZY)
    private List<Mensaje> mensajesEnviados;

    @OneToMany(mappedBy = "destinatario", fetch = FetchType.LAZY)
    private List<Mensaje> mensajesRecibidos;

    // -- Amigos

    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(
    name = "seguidores", 
    joinColumns = @JoinColumn(name = "usuario_id"), 
    inverseJoinColumns = @JoinColumn(name = "seguidor_id")
    )
    private List<Usuario> amigos;
    
    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(
    name = "seguidores", 
    joinColumns = @JoinColumn(name = "seguidor_id"), 
    inverseJoinColumns = @JoinColumn(name = "usuario_id")
    )
    private List<Usuario> amigosUsuario;

    // -- Posts

    @OneToMany(mappedBy = "creador", fetch = FetchType.LAZY)
    private List<Post> postRealizados ;
    
    // -- Likes

    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(
        name = "likes",
        joinColumns = @JoinColumn(name = "usuario_id"),
        inverseJoinColumns = @JoinColumn(name = "post_id")
    )
    private List<Post> reaccion;



}
