package com.oneteam.socialcoders.repositories;

import java.util.List;

import com.oneteam.socialcoders.models.Comentario;
import com.oneteam.socialcoders.models.Post;
import com.oneteam.socialcoders.models.Usuario;

import org.springframework.stereotype.Repository;

@Repository
public interface RepositorioComentario extends RepositorioBase<Comentario> {
    
    List<Comentario> findByPostIn(List<Post> p);
    List<Comentario> findByPost(Post post);
}
