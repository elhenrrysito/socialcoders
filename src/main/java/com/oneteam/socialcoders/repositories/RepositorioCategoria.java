package com.oneteam.socialcoders.repositories;

import com.oneteam.socialcoders.models.Categoria;

import org.springframework.stereotype.Repository;

@Repository
public interface RepositorioCategoria extends RepositorioBase<Categoria> {
    

    Categoria findByCategoria(String categoria);

    Categoria findCategoriaByCategoria(String c);

}
