package com.oneteam.socialcoders.services;

import java.util.List;

import com.oneteam.socialcoders.models.Mensaje;
import com.oneteam.socialcoders.models.Usuario;
import com.oneteam.socialcoders.repositories.RepositorioMensaje;

import org.springframework.stereotype.Service;

@Service
public class ServicioMensaje extends ServicioBase<Mensaje> {
    private final RepositorioMensaje repositorioMensaje;

    public ServicioMensaje(RepositorioMensaje repositorioMensaje) {
        super(repositorioMensaje);
        this.repositorioMensaje = repositorioMensaje;
    }

    public List<Mensaje> getChat(Usuario usuario1, Usuario usuario2) {
        return repositorioMensaje.chat(usuario1.getId(), usuario2.getId());
    }

    
    
}
