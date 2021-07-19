package com.oneteam.socialcoders.models;

import javax.persistence.Entity;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "comentarios")
@Getter @Setter @NoArgsConstructor
public class Comentario extends ModeloBase {
    @NotBlank
    private String comentario;

    // relaciones
    
}
