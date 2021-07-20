package com.oneteam.socialcoders.services;

import com.oneteam.socialcoders.models.Tag;
import com.oneteam.socialcoders.repositories.RepositorioBase;
import com.oneteam.socialcoders.repositories.RepositorioTag;

import org.springframework.stereotype.Service;

@Service
public class ServicioTag extends ServicioBase<Tag> {
    private final RepositorioTag repositorioTag;

    public ServicioTag(RepositorioTag repositorioTag) {
        super(repositorioTag);
        this.repositorioTag = repositorioTag;
    }

    
}
