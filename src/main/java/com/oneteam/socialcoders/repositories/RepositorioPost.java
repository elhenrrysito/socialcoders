package com.oneteam.socialcoders.repositories;

import java.util.List;

import com.oneteam.socialcoders.models.Categoria;
import com.oneteam.socialcoders.models.Lenguaje;
import com.oneteam.socialcoders.models.Post;
import com.oneteam.socialcoders.models.Usuario;

import org.springframework.stereotype.Repository;

@Repository
public interface RepositorioPost extends RepositorioBase<Post> {
    
    List<Post> findAll();
    boolean existsPostByTitulo(String titulo);
    List<Post> findAllByTituloContaining(String titulo);
    List<Post> findByCategoria(Categoria categoria);
    List<Post> findByCreadorIn(List<Usuario> seguidos);
    List<Post> findByLenguajePost(Lenguaje l);
}
