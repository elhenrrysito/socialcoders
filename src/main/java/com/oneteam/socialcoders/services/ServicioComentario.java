package com.oneteam.socialcoders.services;

import java.util.List;

import com.oneteam.socialcoders.models.Comentario;
import com.oneteam.socialcoders.repositories.RepositorioBase;
import com.oneteam.socialcoders.repositories.RepositorioComentario;

import org.springframework.stereotype.Service;

@Service
public class ServicioComentario extends ServicioBase<Comentario> {
    private final RepositorioComentario repositorioComentario;

    public ServicioComentario(RepositorioComentario repositorioComentario) {
        super(repositorioComentario);
        this.repositorioComentario = repositorioComentario;
    }

    public List<Comentario> buscarComentarios(){
        return repositorioComentario.findAll();
    }
    
}
