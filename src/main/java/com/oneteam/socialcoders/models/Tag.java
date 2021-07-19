package com.oneteam.socialcoders.models;

import javax.persistence.Entity;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "tags")
@Getter @Setter @NoArgsConstructor
public class Tag extends ModeloBase {
    @NotBlank
    @Size(min = 3, message = "Tag debe tener más de 3 caracteres")
    private String tag;


    // relaciones
    
}
