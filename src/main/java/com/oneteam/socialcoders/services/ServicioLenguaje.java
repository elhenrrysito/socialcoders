package com.oneteam.socialcoders.services;

import com.oneteam.socialcoders.models.Lenguaje;
import com.oneteam.socialcoders.repositories.RepositorioBase;
import com.oneteam.socialcoders.repositories.RepositorioLenguaje;

import org.springframework.stereotype.Service;

@Service
public class ServicioLenguaje extends ServicioBase<Lenguaje> {
    private final RepositorioLenguaje repositorioLenguaje;

    public ServicioLenguaje(RepositorioLenguaje repositorioLenguaje) {
        super(repositorioLenguaje);
        this.repositorioLenguaje = repositorioLenguaje;
    }
    
    
}
