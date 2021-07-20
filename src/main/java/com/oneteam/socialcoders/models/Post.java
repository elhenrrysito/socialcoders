package com.oneteam.socialcoders.models;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "posts")
@Getter @Setter @NoArgsConstructor
public class Post extends ModeloBase {
    @NotBlank
    @Size(min = 4, message = "Post debe tener más de 4 caracteres")
    private String cuerpo;

    //////////// Relaciones ////////////

    // Usuarios //
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "usuario_id")
    private Usuario creador;

    // Likes //

    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(
        name = "likes",
        joinColumns = @JoinColumn(name = "post_id"),
        inverseJoinColumns = @JoinColumn(name = "usuario_id")
    )
    private List<Usuario> reaccionesUsuarios;

    // Lenguajes //

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "lenguaje_id")
    private Lenguaje lenguajePost; 

    // Comentarios //

    @OneToMany(mappedBy = "post", fetch = FetchType.LAZY)
    private List<Comentario> listaComentarios;

    // Categorias //

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "categoria_id")
    private Categoria categoria;

    // Tags //

    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(
    name = "posts_tags", 
    joinColumns = @JoinColumn(name = "post_id"), 
    inverseJoinColumns = @JoinColumn(name = "tag_id")
    )
    private List<Tag> tags;
}
