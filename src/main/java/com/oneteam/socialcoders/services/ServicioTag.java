package com.oneteam.socialcoders.services;

import java.util.ArrayList;
import java.util.List;

import com.oneteam.socialcoders.models.Tag;
import com.oneteam.socialcoders.repositories.RepositorioTag;

import org.springframework.stereotype.Service;

@Service
public class ServicioTag extends ServicioBase<Tag> {
    private final RepositorioTag repositorioTag;

    public ServicioTag(RepositorioTag repositorioTag) {
        super(repositorioTag);
        this.repositorioTag = repositorioTag;
    }

    public List<Tag> buscarTags(){
        return repositorioTag.findAll();
    }

    public boolean validation(String etiqueta) {
		return repositorioTag.existsTagByTag(etiqueta);
	}

    public Tag createTag(String tag) {
		return repositorioTag.save(new Tag(tag));
	}

    public Tag buscarPorTag(String etiqueta) {
		return repositorioTag.findByTag(etiqueta);
	}

    public List<Tag> agregarTags(List<String> items) {
        ArrayList<Tag> tags = new ArrayList<Tag>();

        for(String tagTemporal : items) {
            if(this.validation(tagTemporal)) {
                Tag tag = this.buscarPorTag(tagTemporal);
                tags.add(tag);
            } else {
                tags.add(this.createTag(tagTemporal));
            }
        }
        return tags;
    } 
}
