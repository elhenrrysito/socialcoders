package com.oneteam.socialcoders.services;

import java.util.List;

import com.oneteam.socialcoders.models.Comentario;
import com.oneteam.socialcoders.models.Post;
import com.oneteam.socialcoders.models.Usuario;
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

    public List<Comentario> buscarPorListaPost(List<Post> p){
        return repositorioComentario.findByPostIn(p);
    }

    public List<Comentario> buscarPorPost(Post p){
        return repositorioComentario.findByPost(p);
    }
    
}
