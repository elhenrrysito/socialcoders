package com.oneteam.socialcoders.services;

import com.oneteam.socialcoders.models.Categoria;
import com.oneteam.socialcoders.repositories.RepositorioBase;
import com.oneteam.socialcoders.repositories.RepositorioCategoria;

import org.springframework.stereotype.Service;

@Service
public class ServicioCategoria extends ServicioBase<Categoria> {
    private final RepositorioCategoria repositorioCategoria;

    public ServicioCategoria(RepositorioCategoria repositorioCategoria) {
        super(repositorioCategoria);
        this.repositorioCategoria = repositorioCategoria;
    }

    public Categoria findByCategoria(String categoria){
        return repositorioCategoria.findByCategoria(categoria);
    }
    
}
