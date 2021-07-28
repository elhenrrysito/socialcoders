package com.oneteam.socialcoders.services;

import java.util.List;

import com.oneteam.socialcoders.models.Post;
import com.oneteam.socialcoders.repositories.RepositorioBase;
import com.oneteam.socialcoders.repositories.RepositorioPost;

import org.springframework.stereotype.Service;

@Service
public class ServicioPost extends ServicioBase<Post> {
    private final RepositorioPost repositorioPost;

    public ServicioPost(RepositorioPost repositorioPost) {
        super(repositorioPost);
        this.repositorioPost = repositorioPost;
    }
    
    public List<Post> buscarPosts(){
        return repositorioPost.findAll();
    }

    public boolean verificador(Post p){
        return repositorioPost.existsPostByTitulo(p.getTitulo());
    }
  
    public List<Post> allByTitulo(String titulo) {
        return repositorioPost.findAllByTituloContaining(titulo);
    }
}
