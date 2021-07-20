package com.oneteam.socialcoders.services;

import com.oneteam.socialcoders.models.Mensaje;
import com.oneteam.socialcoders.repositories.RepositorioBase;
import com.oneteam.socialcoders.repositories.RepositorioMensaje;

import org.springframework.stereotype.Service;

@Service
public class ServicioMensaje extends ServicioBase<Mensaje> {
    private final RepositorioMensaje repositorioMensaje;

    public ServicioMensaje(RepositorioMensaje repositorioMensaje) {
        super(repositorioMensaje);
        this.repositorioMensaje = repositorioMensaje;
    }

    
    
}
