package com.oneteam.socialcoders.repositories;

import com.oneteam.socialcoders.models.Tag;

import org.springframework.stereotype.Repository;

@Repository
public interface RepositorioTag extends RepositorioBase<Tag> {
    
    boolean existsTagByTag(String etiqueta);

    Tag findByTag(String tag);
    
}
