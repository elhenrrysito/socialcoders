package com.oneteam.socialcoders.models;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "lenguajes")
@Getter @Setter @NoArgsConstructor
public class Lenguaje extends ModeloBase {
    @NotBlank
    @Size(min = 2)
    private String lenguaje;

    //////////// Relaciones ////////////
    
    // Usuarios //

    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(
        name = "lenguajes_usuarios",
        joinColumns = @JoinColumn(name = "lenguaje_id"),
        inverseJoinColumns = @JoinColumn(name = "usuario_id")
    )
    private List<Usuario> usuario;

    // Lenguajes //

    @OneToMany(mappedBy = "lenguaje", fetch = FetchType.LAZY)
    private List<Post> posts;
}
