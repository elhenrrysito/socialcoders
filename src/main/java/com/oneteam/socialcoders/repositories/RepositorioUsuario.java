package com.oneteam.socialcoders.repositories;

import com.oneteam.socialcoders.models.Usuario;

import org.springframework.stereotype.Repository;

@Repository
public interface RepositorioUsuario extends RepositorioBase<Usuario> {
    Usuario findByEmail(String email);
    boolean existsByEmail(String email);
}
