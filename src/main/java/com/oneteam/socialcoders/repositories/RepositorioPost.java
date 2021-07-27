package com.oneteam.socialcoders.repositories;

import java.util.List;

import com.oneteam.socialcoders.models.Post;

import org.springframework.stereotype.Repository;

@Repository
public interface RepositorioPost extends RepositorioBase<Post> {
    
    List<Post> findAll();
    boolean existsPostByTitulo(String titulo);
    List<Post> findAllByTituloContaining(String titulo);
}
