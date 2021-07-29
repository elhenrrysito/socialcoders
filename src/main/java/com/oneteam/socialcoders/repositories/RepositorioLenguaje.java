package com.oneteam.socialcoders.repositories;

import java.util.List;

import com.oneteam.socialcoders.models.Lenguaje;
import com.oneteam.socialcoders.models.Usuario;

import org.springframework.stereotype.Repository;

@Repository
public interface RepositorioLenguaje extends RepositorioBase<Lenguaje>{
    List<Lenguaje> findByUsuarioNotContaining(Usuario usuario);

    Lenguaje findByLenguajeContaining(String lenguaje);

    Lenguaje findLenguajeByLenguaje(String lenguaje);
}
