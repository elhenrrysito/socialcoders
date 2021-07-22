package com.oneteam.socialcoders.repositories;

import com.oneteam.socialcoders.models.Usuario;

import org.springframework.stereotype.Repository;

@Repository
public interface RepositorioUsuario extends RepositorioBase<Usuario> {
    Usuario findByEmail(String email);
    Usuario findByUsername(String username);
    boolean existsByEmail(String email);
    boolean existsByUsername(String username);
}
