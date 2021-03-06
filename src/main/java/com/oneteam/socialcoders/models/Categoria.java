package com.oneteam.socialcoders.models;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name="categorias")
@Getter @Setter @NoArgsConstructor
public class Categoria extends ModeloBase {
    @NotBlank
    @NotNull
    private String categoria;
    
    //////////// Relaciones ////////////

    // Post //

    @OneToMany(mappedBy = "categoria", fetch = FetchType.LAZY)
    private List<Post> listaPost;
}
