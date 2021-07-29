package com.oneteam.socialcoders.repositories;

import java.util.List;

import com.oneteam.socialcoders.models.Lenguaje;

import org.springframework.stereotype.Repository;

@Repository
public interface RepositorioLenguaje extends RepositorioBase<Lenguaje>{

    Lenguaje findByLenguaje(String lenguaje);
    List<Lenguaje> findByLenguajeIn(List<String> lenguaje);
    
}
