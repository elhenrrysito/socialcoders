package com.oneteam.socialcoders.models;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "tags")
@Getter @Setter @NoArgsConstructor
public class Tag extends ModeloBase {
    @NotBlank
    @NotNull
    @Size(min = 3, message = "Tag debe tener más de 3 caracteres")
    private String tag;

    //////////// Relaciones ////////////
    
    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(
    name = "posts_tags", 
    joinColumns = @JoinColumn(name = "tag_id"), 
    inverseJoinColumns = @JoinColumn(name = "post_id")
    )
    private List<Post> posts;
}
