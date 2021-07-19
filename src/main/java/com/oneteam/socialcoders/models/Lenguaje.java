package com.oneteam.socialcoders.models;

import javax.persistence.Entity;
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

    // relaciones
}
